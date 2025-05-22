import 'dart:convert';
import 'dart:io';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_dynamic_value_entity.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_entity.dart';
import 'package:path/path.dart' as p;
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:args/args.dart';

/// Temporary record for raw string nodes.
class _RawString {
  final int start;
  final int end;
  final String? stringValue;
  final String filePath;

  final List<HardcodedStringDynamicValue> dynamics;

  _RawString({
    required this.start,
    required this.end,
    required this.stringValue,
    required this.filePath,
    required this.dynamics,
  });
}

/// AST visitor that collects raw string literals and their interpolations.
class _RawStringScanner extends RecursiveAstVisitor<void> {
  final String filePath;
  final String content;
  final List<_RawString> rawList;

  _RawStringScanner(this.filePath, this.content, this.rawList);

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    if (node.thisOrAncestorOfType<Annotation>() != null) return;
    _addRaw(node);
    super.visitSimpleStringLiteral(node);
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    if (node.thisOrAncestorOfType<Annotation>() != null) return;
    _addRaw(node);
    super.visitStringInterpolation(node);
  }

  void _addRaw(StringLiteral node) {
    // collect dynamic fields if interpolation
    final dyn = <HardcodedStringDynamicValue>[];
    if (node is StringInterpolation) {
      for (var element in node.elements) {
        if (element is InterpolationExpression) {
          final start = element.offset;
          final end = element.end;
          final placeholder = content.substring(start, end);
          dyn.add(
            HardcodedStringDynamicValue(
              value: placeholder,
              parentStartIndex: start - node.offset,
              parentEndIndex: end - node.offset,
              fileStartIndex: start,
              fileEndIndex: end,
            ),
          );
        }
      }
    }

    // snippet: full literal including quotes
    final snippet = content.substring(node.offset, node.end);

    rawList.add(
      _RawString(
        start: node.offset,
        end: node.end,
        stringValue: snippet,
        filePath: filePath,
        dynamics: dyn,
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
        help: 'Directory to scan',
      );
  ArgResults res;
  try {
    res = parser.parse(args);
  } catch (e) {
    stderr.writeln('Error parsing args: $e');
    exit(1);
  }
  final target = res['path'] as String;
  final dir = Directory(target);
  if (!dir.existsSync()) {
    stderr.writeln('Directory not found: $target');
    exit(1);
  }

  final List<HardcodedString> all = [];

  for (var entity in dir.listSync(recursive: true)) {
    if (entity is File &&
        entity.path.endsWith('.dart') &&
        entity.path.contains('${dir.path}/lib/') &&
        entity.path.contains('example.dart')) {
      final content = entity.readAsStringSync();
      final rawList = <_RawString>[];
      try {
        final unit = parseString(content: content, path: entity.path).unit;
        unit.accept(_RawStringScanner(entity.path, content, rawList));
      } catch (_) {
        continue;
      }
      // sort rawList by start ascending
      rawList.sort((a, b) => a.start.compareTo(b.start));
      // for each raw, find parent raw if any
      for (var raw in rawList) {
        _RawString? parent;
        for (var cand in rawList) {
          if (cand == raw) break;
          if (cand.start <= raw.start && cand.end >= raw.end) {
            if (parent == null ||
                (cand.end - cand.start) < (parent.end - parent.start)) {
              parent = cand;
            }
          }
        }
        final parentStart = parent != null ? raw.start - parent.start : null;
        final parentEnd = parent != null ? raw.end - parent.start : null;
        all.add(
          HardcodedString(
            value: raw.stringValue ?? '',
            filePath: raw.filePath,
            parentStartIndex: parentStart,
            parentEndIndex: parentEnd,
            fileStartIndex: raw.start,
            fileEndIndex: raw.end,
            dynamicFields: raw.dynamics,
          ),
        );
      }
    }
  }

  // final out = File('strings.json');
  // out.writeAsStringSync(
  //   JsonEncoder.withIndent('  ').convert(all.map((s) => s.toMap()).toList()),
  // );
  // print('Extracted ${all.length} strings to ${out.path}');
  // Output to strings.json
  final jsonList = all.map((s) => s.toMap()).toList();
  final outFile = File(p.join(Directory.current.path, 'strings.json'));
  outFile.writeAsStringSync(JsonEncoder.withIndent('  ').convert(jsonList));
  print('Extracted ${all.length} strings to ${outFile.path}');
}
