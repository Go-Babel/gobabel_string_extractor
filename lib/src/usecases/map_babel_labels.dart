import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/core/extensions/string_extension.dart';
import 'package:gobabel_string_extractor/src/entities/babel_label_entity.dart';
import 'package:gobabel_string_extractor/src/entities/labels_entity.dart';

abstract class IMapBabelLabelsUsecase {
  List<BabelLabelEntity> call({required List<LabelsEntityRootLabel> strings});
}

class MapBabelLabelsUsecaseImpl implements IMapBabelLabelsUsecase {
  final InferDeclarationFunctionByArbValueUsecase _inferDeclaration;
  const MapBabelLabelsUsecaseImpl({
    required InferDeclarationFunctionByArbValueUsecase inferDeclaration,
  }) : _inferDeclaration = inferDeclaration;
  @override
  List<BabelLabelEntityRootLabel> call({
    required List<LabelsEntityRootLabel> strings,
  }) {
    final List<BabelLabelEntityRootLabel> result = [];

    for (final rootLabel in strings) {
      result.add(_handleRootLabel(rootLabel));
    }

    return result;
  }

  BabelLabelEntity _processBabelLabel(LabelsEntity entity) {
    return switch (entity) {
      LabelsEntityRootLabel() => _handleRootLabel(entity),
      LabelsEntityChildLabel() => _handleChildLabel(entity),
      LabelsEntityLabelDynamicValue() => _handleDynamicValue(entity),
    };
  }

  BabelLabelEntityRootLabel _handleRootLabel(LabelsEntityRootLabel entity) {
    final L10nKey l10nKey = entity.l10nKey;
    final FilePath filePath = entity.filePath;
    final int fileStartIndex = entity.fileStartIndex;
    final int fileEndIndex = entity.fileEndIndex;
    final List<BabelLabelEntity> children = _processChildren(entity.children);
    L10nValue l10nValue = entity.hardcodedString;

    final Set<VariableName> variableNames = {};
    final Set<String> implementationParameters = {};

    // Sort children by parentStartIndex in descending order (biggest first, smallest last)
    children.sort((a, b) => _getStartIndex(b).compareTo(_getStartIndex(a)));

    int index = 0;
    for (final child in children.reversed) {
      index++;
      child.mapOrNull(
        labelDynamicValue: (value) {
          variableNames.add('arg$index');
          implementationParameters.add(value.content);
        },
        childLabel: (value) {
          variableNames.add(value.l10nKey);
          implementationParameters.add(value.l10nValue);
        },
      );
    }

    // Sort children by parentStartIndex in descending order (biggest first, smallest last)
    index = children.length + 1;
    final startListOrder = <int>[];
    final endListOrder = <int>[];
    for (final child in children) {
      startListOrder.add(_getStartIndex(child));
      endListOrder.add(_getEndIndex(child));
    }
    for (final child in children) {
      index--;
      child.mapOrNull(
        labelDynamicValue: (value) {
          final startIndex = value.parentStartIndex;
          final endIndex = value.parentEndIndex;
          l10nValue = l10nValue.replaceRange(
            startIndex,
            endIndex,
            '{arg$index}',
          );
        },
        childLabel: (value) {
          final startIndex = value.parentStartIndex;
          final endIndex = value.parentEndIndex;
          l10nValue = l10nValue.replaceRange(
            startIndex,
            endIndex,
            '{${value.l10nKey}}',
          );
        },
      );
    }

    BabelFunctionDeclaration gobabelFunctionDeclarationString =
        _inferDeclaration(key: l10nKey, value: l10nValue);

    BabelFunctionImplementation gobabelFunctionImplementationString =
        '$kBabelClass.$l10nKey(${implementationParameters.map((e) => e.cleanHardcoded).join(', ')})';

    return BabelLabelEntityRootLabel(
      l10nKey: l10nKey,
      filePath: filePath,
      children: children,
      l10nValue: l10nValue.trimHardcodedString,
      fileEndIndex: fileEndIndex,
      fileStartIndex: fileStartIndex,
      babelFunctionDeclaration: gobabelFunctionDeclarationString,
      babelFunctionImplementation: gobabelFunctionImplementationString,
    );
  }

  BabelLabelEntityChildLabel _handleChildLabel(LabelsEntityChildLabel entity) {
    final L10nKey l10nKey = entity.l10nKey;
    final HardcodedStringLabel hardcodedString = entity.hardcodedString;
    final int parentStartIndex = entity.parentStartIndex;
    final int parentEndIndex = entity.parentEndIndex;
    final List<BabelLabelEntity> children = _processChildren(entity.children);
    L10nValue l10nValue = entity.hardcodedString;

    final Set<VariableName> variableNames = {};
    final Set<String> implementationParameters = {};

    // Sort children by parentStartIndex in descending order (biggest first, smallest last)
    children.sort((a, b) => _getStartIndex(b).compareTo(_getStartIndex(a)));

    int index = 0;
    for (final child in children) {
      index++;
      child.mapOrNull(
        labelDynamicValue: (value) {
          variableNames.add('arg$index');
          implementationParameters.add(value.content);
        },
        childLabel: (value) {
          variableNames.add(value.l10nKey);
          implementationParameters.add(value.l10nValue);
        },
      );
    }

    // Sort children by parentStartIndex in descending order (biggest first, smallest last)
    index = children.reversed.length + 1;
    for (final child in children.reversed) {
      index--;
      child.mapOrNull(
        labelDynamicValue: (value) {
          final startIndex = value.parentStartIndex;
          final endIndex = value.parentEndIndex;
          l10nValue = l10nValue.replaceRange(
            startIndex,
            endIndex,
            '{arg$index}',
          );
        },
        childLabel: (value) {
          final startIndex = value.parentStartIndex;
          final endIndex = value.parentEndIndex;
          l10nValue = l10nValue.replaceRange(
            startIndex,
            endIndex,
            '{${value.l10nKey}}',
          );
        },
      );
    }

    BabelFunctionDeclaration gobabelFunctionDeclarationString =
        '''${hardcodedString.formatToComment}
  static String $l10nKey(${variableNames.map((e) => 'Object? $e').join(', ')}) {
    return _getByKey('$l10nKey')${variableNames.map((e) => '.replaceAll(\'{$e}\', $e.toString())').join()};
  }''';

    BabelFunctionImplementation gobabelFunctionImplementationString =
        '$kBabelClass.$l10nKey(${implementationParameters.map((e) => e.cleanHardcoded).join(', ')})';

    return BabelLabelEntityChildLabel(
      l10nKey: l10nKey,
      l10nValue: l10nValue.trimHardcodedString,
      parentStartIndex: parentStartIndex,
      parentEndIndex: parentEndIndex,
      babelFunctionImplementation: gobabelFunctionImplementationString,
      babelFunctionDeclaration: gobabelFunctionDeclarationString,
      children: children,
    );
  }

  BabelLabelEntityLabelDynamicValue _handleDynamicValue(
    LabelsEntityLabelDynamicValue entity,
  ) {
    final int parentStartIndex = entity.parentStartIndex;
    final int parentEndIndex = entity.parentEndIndex;
    final List<BabelLabelEntity> processedChildren = _processChildren(
      entity.children,
    );
    String content = entity.content;

    // Sort children by parentStartIndex in descending order (biggest first, smallest last)
    processedChildren.sort(
      (a, b) => _getStartIndex(b).compareTo(_getStartIndex(a)),
    );

    for (final child in processedChildren) {
      child.mapOrNull(
        childLabel: (value) {
          content = content.replaceRange(
            value.parentStartIndex,
            value.parentEndIndex,
            value.babelFunctionImplementation,
          );
        },
        labelDynamicValue: (value) {
          content = content.replaceRange(
            value.parentStartIndex,
            value.parentEndIndex,
            value.content,
          );
        },
      );
    }

    return BabelLabelEntityLabelDynamicValue(
      content: content,
      parentStartIndex: parentStartIndex,
      parentEndIndex: parentEndIndex,
      children: processedChildren,
    );
  }

  List<BabelLabelEntity> _processChildren(List<LabelsEntity> children) {
    final List<BabelLabelEntity> result = [];

    for (final child in children) {
      result.add(_processBabelLabel(child));
    }

    return result;
  }

  int _getStartIndex(BabelLabelEntity entity) {
    return entity.map(
      rootLabel: (value) => value.fileStartIndex,
      childLabel: (value) => value.parentStartIndex,
      labelDynamicValue: (value) => value.parentStartIndex,
    );
  }

  int _getEndIndex(BabelLabelEntity entity) {
    return entity.map(
      rootLabel: (value) => value.fileEndIndex,
      childLabel: (value) => value.parentEndIndex,
      labelDynamicValue: (value) => value.parentEndIndex,
    );
  }
}
