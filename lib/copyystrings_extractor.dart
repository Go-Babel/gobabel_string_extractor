import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as p;
import 'package:analyzer/dart/analysis/utilities.dart';

import 'dart:convert';

/// Visitor that collects string literals and interpolated values.
class _StringExtractor extends RecursiveAstVisitor<void> {
  final String filePath;
  final String fileContent;
  final List<Map<String, dynamic>> strings;

  _StringExtractor(this.filePath, this.fileContent, this.strings);

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    // Skip strings in annotations:
    if (node.thisOrAncestorOfType<Annotation>() != null) return;

    // Extract the raw text (excluding quotes) from file content:
    int contentStart = node.contentsOffset;
    int contentEnd = node.contentsEnd;
    String text = fileContent.substring(contentStart, contentEnd);

    strings.add({
      'text': text,
      'file': filePath,
      'start': node.offset,
      'end': node.end,
      'dynamicValues': <Map<String, dynamic>>[], // no interpolation here
    });
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    // This covers strings with interpolation (e.g. "Hello $name")
    if (node.thisOrAncestorOfType<Annotation>() != null) return;

    int contentStart = node.contentsOffset;
    int contentEnd = node.contentsEnd;
    String text = fileContent.substring(contentStart, contentEnd);

    // Collect dynamic values within this interpolation:
    List<Map<String, dynamic>> dynamics = [];
    for (var element in node.elements) {
      if (element is InterpolationExpression) {
        int exprStart = element.offset;
        int exprEnd = element.end;
        String placeholder = fileContent.substring(exprStart, exprEnd);
        dynamics.add({
          'value': placeholder,
          'parentStartIndex': exprStart - contentStart,
          'parentEndIndex': exprEnd - contentStart,
          'fileStartIndex': exprStart,
          'fileEndIndex': exprEnd,
        });
      }
    }

    strings.add({
      'text': text,
      'file': filePath,
      'start': node.offset,
      'end': node.end,
      'dynamicValues': dynamics,
    });
  }
}

void main(List<String> args) async {
  // Set up CLI argument parser for --path option.
  var parser =
      ArgParser()..addOption(
        'path',
        abbr: 'p',
        defaultsTo: 'lib',
        help: 'Directory to scan for Dart files.',
      );
  ArgResults res;
  try {
    res = parser.parse(args);
  } catch (e) {
    print('Error: ${e.toString()}');
    print('Usage: dart extract_strings.dart [--path <directory>]');
    exit(1);
  }
  String dirPath = res['path'];
  if (dirPath.isEmpty) {
    dirPath = 'lib';
  }

  var directory = Directory(dirPath);
  if (!directory.existsSync()) {
    stderr.writeln('Directory does not exist: $dirPath');
    exit(1);
  }

  List<Map<String, dynamic>> allStrings = [];

  // Recursively scan for .dart files.
  for (var entity in directory.listSync(recursive: true)) {
    if (entity is File &&
        entity.path.endsWith('.dart') &&
        entity.path.contains('${directory.path}/lib/') &&
        entity.path.contains('example.dart')) {
      String content = entity.readAsStringSync();
      try {
        // Parse the file into an AST.
        var parseResult = parseString(content: content, path: entity.path);
        CompilationUnit unit = parseResult.unit;

        // Visit the AST to collect strings.
        var extractor = _StringExtractor(entity.path, content, allStrings);
        unit.accept(extractor);
      } catch (e) {
        stderr.writeln('Failed to parse ${entity.path}: $e');
      }
    }
  }

  // Write results to strings.json.
  var encoder = JsonEncoder.withIndent('  ');
  String jsonOutput = encoder.convert(allStrings);
  final outputFile = await File(
    p.join(Directory.current.path, 'strings.json'),
  ).writeAsString(jsonOutput);
  print('Extracted ${allStrings.length} strings to ${outputFile.path}');
}
