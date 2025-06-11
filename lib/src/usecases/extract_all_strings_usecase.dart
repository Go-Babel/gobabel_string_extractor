import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_dynamic_value_entity.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_entity.dart';
import 'package:gobabel_string_extractor/src/usecases/validate_candidate_string.dart';

abstract class IExtractAllStringsUsecase {
  /// Extracts all hardcoded strings from a given list of files
  Future<List<HardcodedStringEntity>> call({required List<File> files});
}

/// Implementation of IExtractAllStringsUsecase that extracts strings from Dart files
class ExtractAllStringsInDartUsecaseImpl implements IExtractAllStringsUsecase {
  final ValidateCandidateStringUsecase validateCandidateStringUsecase;

  ExtractAllStringsInDartUsecaseImpl({
    required this.validateCandidateStringUsecase,
  });

  @override
  Future<List<HardcodedStringEntity>> call({required List<File> files}) async {
    final List<HardcodedStringEntity> allStrings = [];

    for (final file in files) {
      if (!file.path.endsWith('.dart')) continue;

      final content = await file.readAsString();
      final rawList = <_RawString>[];

      try {
        final unit = parseString(content: content, path: file.path).unit;
        unit.accept(_RawStringScanner(file.path, content, rawList));
      } catch (e) {
        // Skip files that can't be parsed
        continue;
      }

      // Sort rawList by start position ascending
      rawList.sort((a, b) => a.start.compareTo(b.start));

      // For each raw string, find parent raw if any
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

        final isValid = validateCandidateStringUsecase.call(
          content: raw.stringValue?.trimHardcodedString ?? '',
        );
        if (!isValid) continue;

        allStrings.add(
          HardcodedStringEntity(
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

    return allStrings;
  }
}

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
    // Collect dynamic fields if interpolation
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

    // Snippet: full literal including quotes
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
