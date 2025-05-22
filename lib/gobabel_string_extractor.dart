// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:args/args.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart' as p;

class StringExtractor extends RecursiveAstVisitor<void> {
  final String filePath;
  final List<Map<String, dynamic>> results = [];

  StringExtractor(this.filePath);

  bool _isInAnnotation(AstNode node) {
    AstNode? parent = node.parent;
    while (parent != null) {
      if (parent is Annotation) return true;
      parent = parent.parent;
    }
    return false;
  }

  void _addResult(String value, int offset, int length) {
    results.add({
      'value': value,
      'file': filePath,
      'start': offset,
      'end': offset + length,
    });
  }

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    if (!_isInAnnotation(node)) {
      _addResult(node.value, node.offset, node.length);
    }
    super.visitSimpleStringLiteral(node);
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    if (!_isInAnnotation(node)) {
      _addResult(node.toSource(), node.offset, node.length);
    }
    super.visitStringInterpolation(node);
  }
}

Future<void> main(List<String> args) async {
  final parser =
      ArgParser()..addOption(
        'path',
        abbr: 'p',
        help: 'Target directory (default: ./lib)',
        defaultsTo: 'lib',
      );

  final argResults = parser.parse(args);
  final targetDir = argResults['path'];

  if (!Directory(targetDir).existsSync()) {
    print('Error: Directory "$targetDir" does not exist.');
    exit(1);
  }

  final results = <Map<String, dynamic>>[];

  final dartFiles = Directory(targetDir)
      .listSync(recursive: true)
      .whereType<File>()
      .where(
        (f) =>
            f.path.endsWith('.dart') &&
            f.path.contains('$targetDir/lib/') &&
            f.path.contains('example.dart'),
      );

  for (final file in dartFiles) {
    try {
      final parseResult = parseFile(
        path: file.path,
        featureSet: FeatureSet.latestLanguageVersion(),
      );
      final unit = parseResult.unit;
      final visitor = StringExtractor(p.normalize(file.path));
      unit.accept(visitor);
      results.addAll(visitor.results);
    } catch (e) {
      stderr.writeln('Failed to parse ${file.path}: $e');
    }
  }

  final outputFile = File(p.join(Directory.current.path, 'strings.json'));

  final output = JsonEncoder.withIndent('  ').convert(results);
  await outputFile.writeAsString(output);
  // print(output);
}

// dart run strings_extractor/bin/strings_extractor.dart --path=go_babel_app/gobabel_flutter

class HardcodedString {
  final String value;
  final String filePath;
  final int? parentStartIndex;
  final int? parentEndIndex;
  final int fileStartIndex;
  final int fileEndIndex;
  final List<HardcodedStringDynamicValue> dynamicFields;
  const HardcodedString({
    required this.value,
    required this.filePath,
    this.parentStartIndex,
    this.parentEndIndex,
    required this.fileStartIndex,
    required this.fileEndIndex,
    required this.dynamicFields,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'filePath': filePath,
      'parentStartIndex': parentStartIndex,
      'parentEndIndex': parentEndIndex,
      'fileStartIndex': fileStartIndex,
      'fileEndIndex': fileEndIndex,
      'dynamicFields': dynamicFields.map((x) => x.toMap()).toList(),
    };
  }
}

class HardcodedStringDynamicValue {
  final String value;
  final int parentStartIndex;
  final int parentEndIndex;
  final int fileStartIndex;
  final int fileEndIndex;
  const HardcodedStringDynamicValue({
    required this.value,
    required this.parentStartIndex,
    required this.parentEndIndex,
    required this.fileStartIndex,
    required this.fileEndIndex,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'parentStartIndex': parentStartIndex,
      'parentEndIndex': parentEndIndex,
      'fileStartIndex': fileStartIndex,
      'fileEndIndex': fileEndIndex,
    };
  }
}
