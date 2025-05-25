import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/core/extensions/string_extension.dart';
import 'package:gobabel_string_extractor/src/entities/babel_label_entity.dart';
import 'package:gobabel_string_extractor/src/entities/labels_entity.dart';
import 'package:gobabel_string_extractor/src/usecases/map_babel_labels.dart';

class MapBabelLabelsUsecase implements IMapBabelLabelsUsecase {
  final String babelClassName;

  MapBabelLabelsUsecase({this.babelClassName = 'BabelText'});

  @override
  List<BabelLabelEntity> call({required List<LabelsEntityRootLabel> strings}) {
    return strings.map((rootLabel) => _mapRootLabel(rootLabel)).toList();
  }

  BabelLabelEntity _mapRootLabel(LabelsEntityRootLabel rootLabel) {
    // Get dynamic values as parameter names
    final Set<String> parameterNames = _extractParameterNames(
      rootLabel.l10nValue,
    );

    // Generate the function declaration and implementation
    final babelFunctionDeclaration = _generateFunctionDeclaration(
      l10nKey: rootLabel.l10nKey,
      l10nValue: rootLabel.l10nValue,
      parameterNames: parameterNames,
    );

    final babelFunctionImplementation = _generateFunctionImplementation(
      l10nKey: rootLabel.l10nKey,
      parameterNames: parameterNames,
    );

    // Process children
    final List<BabelLabelEntity> processedChildren = _processChildren(
      rootLabel.children,
    );

    return BabelLabelEntity.rootLabel(
      l10nKey: rootLabel.l10nKey,
      l10nValue: rootLabel.l10nValue,
      babelFunctionDeclaration: babelFunctionDeclaration,
      babelFunctionImplementation: babelFunctionImplementation,
      fileStartIndex: rootLabel.fileStartIndex,
      fileEndIndex: rootLabel.fileEndIndex,
      filePath: rootLabel.filePath,
      children: processedChildren,
    );
  }

  List<BabelLabelEntity> _processChildren(List<LabelsEntity> children) {
    final processedChildren = <BabelLabelEntity>[];

    for (final child in children) {
      if (child is LabelsEntityChildLabel) {
        // Process child label
        final Set<String> parameterNames = _extractParameterNames(
          child.l10nValue,
        );

        final babelFunctionDeclaration = _generateFunctionDeclaration(
          l10nKey: child.l10nKey,
          l10nValue: child.l10nValue,
          parameterNames: parameterNames,
        );

        final babelFunctionImplementation = _generateFunctionImplementation(
          l10nKey: child.l10nKey,
          parameterNames: parameterNames,
        );

        final childChildren = _processChildren(child.children);

        processedChildren.add(
          BabelLabelEntity.childLabel(
            l10nKey: child.l10nKey,
            l10nValue: child.l10nValue,
            babelFunctionDeclaration: babelFunctionDeclaration,
            babelFunctionImplementation: babelFunctionImplementation,
            parentStartIndex: child.parentStartIndex,
            parentEndIndex: child.parentEndIndex,
            filePath: child.filePath,
            children: childChildren,
          ),
        );
      } else if (child is LabelsEntityLabelDynamicValue) {
        // Process dynamic value
        processedChildren.add(
          BabelLabelEntity.labelDynamicValue(
            content: child.content,
            parentStartIndex: child.parentStartIndex,
            parentEndIndex: child.parentEndIndex,
            filePath: child.filePath,
            children: _processChildren(child.children),
          ),
        );
      }
    }

    return processedChildren;
  }

  Set<String> _extractParameterNames(String value) {
    // Extract parameter names from the string (format {paramName})
    final Set<String> parameterNames = {};
    final RegExp paramRegex = RegExp(r'\{([^\}]+)\}');
    final matches = paramRegex.allMatches(value);

    for (final match in matches) {
      if (match.groupCount >= 1) {
        parameterNames.add(match.group(1)!);
      }
    }

    return parameterNames;
  }

  BabelFunctionDeclaration _generateFunctionDeclaration({
    required L10nKey l10nKey,
    required L10nValue l10nValue,
    required Set<String> parameterNames,
  }) {
    final paramDeclaration = parameterNames.isEmpty
        ? ''
        : parameterNames.map((name) => 'Object? $name').join(', ');

    final replaceStatements = parameterNames.isEmpty
        ? ''
        : parameterNames
              .map((name) => '.replaceAll(\'{$name}\', $name.toString())')
              .join();

    return '''${l10nValue.formatToComment}
  static String $l10nKey($paramDeclaration) {
    return _getByKey('$l10nKey')$replaceStatements;
  }''';
  }

  BabelFunctionImplementation _generateFunctionImplementation({
    required L10nKey l10nKey,
    required Set<String> parameterNames,
  }) {
    final paramImplementation = parameterNames.isEmpty
        ? ''
        : parameterNames.join(', ');

    return '$babelClassName.$l10nKey($paramImplementation)';
  }
}
