import 'dart:convert';
import 'dart:io';
import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:args/args.dart';

/// Represents a dynamic interpolation inside a string literal.
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

  Map<String, dynamic> toMap() => {
    'value': value,
    'parentStartIndex': parentStartIndex,
    'parentEndIndex': parentEndIndex,
    'fileStartIndex': fileStartIndex,
    'fileEndIndex': fileEndIndex,
  };
}

/// Represents a hardcoded string literal in source code.
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

  Map<String, dynamic> toMap() => {
    'value': value,
    'filePath': filePath,
    'parentStartIndex': parentStartIndex,
    'parentEndIndex': parentEndIndex,
    'fileStartIndex': fileStartIndex,
    'fileEndIndex': fileEndIndex,
    'dynamicFields': dynamicFields.map((d) => d.toMap()).toList(),
  };
}

/// AST visitor that collects all string literals and their interpolations.
class _StringScanner extends RecursiveAstVisitor<void> {
  final String filePath;
  final String content;
  final List<HardcodedString> results;

  _StringScanner(this.filePath, this.content, this.results);

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    if (node.thisOrAncestorOfType<Annotation>() != null) return;

    _collectLiteral(node, dynamicElements: []);
    super.visitSimpleStringLiteral(node);
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    if (node.thisOrAncestorOfType<Annotation>() != null) return;

    // Gather interpolation expressions
    final dynList = <HardcodedStringDynamicValue>[];
    final parentContentOffset = node.contentsOffset;

    for (var element in node.elements) {
      if (element is InterpolationExpression) {
        final start = element.offset;
        final end = element.end;
        final placeholder = content.substring(start, end);
        dynList.add(
          HardcodedStringDynamicValue(
            value: placeholder,
            parentStartIndex: start - parentContentOffset,
            parentEndIndex: end - parentContentOffset,
            fileStartIndex: start,
            fileEndIndex: end,
          ),
        );
      }
    }

    _collectLiteral(node, dynamicElements: dynList);
    super.visitStringInterpolation(node);
  }

  void _collectLiteral(
    StringLiteral node, {
    required List<HardcodedStringDynamicValue> dynamicElements,
  }) {
    // Determine nesting: find nearest ancestor StringLiteral that's not this node
    StringLiteral? parentLit;
    AstNode? p = node.parent;
    while (p != null) {
      if (p is StringLiteral) {
        parentLit = p;
        break;
      }
      p = p.parent;
    }

    int? parentStart;
    int? parentEnd;
    if (parentLit != null) {
      // Compute content offset of parent literal
      final pOffset = parentLit.contentsOffset;
      parentStart = node.offset - pOffset;
      parentEnd = node.end - pOffset;
    }

    // Extract text content (without quotes)
    final text = content.substring(node.contentsOffset, node.contentsEnd);

    results.add(
      HardcodedString(
        value: text,
        filePath: filePath,
        parentStartIndex: parentStart,
        parentEndIndex: parentEnd,
        fileStartIndex: node.offset,
        fileEndIndex: node.end,
        dynamicFields: dynamicElements,
      ),
    );
  }
}

void main(List<String> args) {
  final parser =
      ArgParser()..addOption(
        'path',
        abbr: 'p',
        defaultsTo: 'lib',
        help: 'Directory to scan for Dart files',
      );
  ArgResults res;
  try {
    res = parser.parse(args);
  } catch (e) {
    stderr.writeln('Error parsing arguments: $e');
    exit(1);
  }

  final targetDir = res['path'] as String;
  final dir = Directory(targetDir);
  if (!dir.existsSync()) {
    stderr.writeln('Directory not found: $targetDir');
    exit(1);
  }

  final List<HardcodedString> allStrings = [];

  for (var entity in dir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final content = entity.readAsStringSync();
      try {
        final parseResult = parseString(
          content: content,
          path: entity.path,
          featureSet: FeatureSet.latestLanguageVersion(),
        );
        parseResult.unit.accept(
          _StringScanner(entity.path, content, allStrings),
        );
      } catch (e) {
        stderr.writeln('Failed to parse ${entity.path}: $e');
      }
    }
  }

  // Output to strings.json
  final jsonList = allStrings.map((s) => s.toMap()).toList();
  final outFile = File('strings.json');
  outFile.writeAsStringSync(JsonEncoder.withIndent('  ').convert(jsonList));
  print('Extracted ${allStrings.length} strings to ${outFile.path}');
}
