import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/entities/babel_label_entity.dart';
import 'package:gobabel_string_extractor/src/entities/labels_entity.dart';
import 'package:gobabel_string_extractor/src/core/extensions/string_extension.dart';

abstract class IMapBabelLabelsUsecase {
  List<BabelLabelEntity> call({required List<LabelsEntityRootLabel> strings});
}

class MapBabelLabelsUsecaseImpl implements IMapBabelLabelsUsecase {
  @override
  List<BabelLabelEntity> call({required List<LabelsEntityRootLabel> strings}) {
    final List<BabelLabelEntity> result = [];

    for (final rootLabel in strings) {
      result.add(_processBabelLabel(rootLabel));
    }

    return result;
  }

  BabelLabelEntity _processBabelLabel(LabelsEntity entity) {
    return switch (entity) {
      LabelsEntityRootLabel() => _handleRootLabel(entity),
      LabelsEntityChildLabel() => throw UnimplementedError(),
      LabelsEntityLabelDynamicValue() => _handleDynamicValue(entity),
    };
  }

  BabelLabelEntityChildLabel _handleChildLabel(LabelsEntityChildLabel entity) {
    final L10nKey l10nKey = entity.l10nKey;
    final int parentStartIndex = entity.parentStartIndex;
    final int parentEndIndex = entity.parentEndIndex;
    return BabelLabelEntityChildLabel(
      l10nKey: l10nKey,
      parentStartIndex: parentStartIndex,
      parentEndIndex: parentEndIndex,
    );
  }

  BabelLabelEntityRootLabel _handleRootLabel(LabelsEntityRootLabel entity) {
    final L10nKey l10nKey = entity.l10nKey;
    final L10nValue l10nValue = entity.l10nValue;
    final processedChildren = _processChildren(entity.children);
    String processedL10nValue = entity.l10nValue;
    String content = entity.l10nValue;

    // Sort children by parentStartIndex in increment order (smallest first, biggest last)
    processedChildren.sort((a, b) {
      final aIndex = _getStartIndex(a);
      final bIndex = _getStartIndex(b);
      return aIndex.compareTo(bIndex); // Descending order
    });

    final Set<VariableName> variableNames = {};
    final Set<String> implementationParameters = {};

    for (final child in processedChildren) {
      child.whenOrNull(
        childLabel:
            (
              l10nKey,
              l10nValue,
              babelFunctionDeclaration,
              babelFunctionImplementation,
              parentStartIndex,
              parentEndIndex,
              filePath,
              children,
            ) {
              variableNames.add(l10nKey);
              implementationParameters.add(l10nKey);
            },
        labelDynamicValue:
            (
              content,
              parentStartIndex,
              parentEndIndex,
              filePath,
              children, //
            ) {
              implementationParameters.add(content);
            },
      );
    }

    BabelFunctionImplementation gobabelFunctionImplementationString =
        '$kBabelClass.$l10nKey(${implementationParameters.map((e) => e).join(', ')})';

    BabelFunctionDeclaration gobabelFunctionDeclarationString =
        '''${l10nValue.formatToComment}
  static String $l10nKey(${variableNames.map((e) => 'Object? $e').join(', ')}) {
    return _getByKey('$l10nKey')${variableNames.map((e) => '.replaceAll(\'{$e}\', $e.toString())').join()};
  }''';

    // Sort children by parentStartIndex in descending order (biggest first, smallest last)
    processedChildren.sort((a, b) {
      final aIndex = _getStartIndex(a);
      final bIndex = _getStartIndex(b);
      return bIndex.compareTo(aIndex); // Descending order
    });

    // Create babel function declaration
  }

  BabelLabelEntityLabelDynamicValue _handleDynamicValue(
    LabelsEntityLabelDynamicValue entity,
  ) {
    final processedChildren = _processChildren(entity.children);

    // Sort children by parentStartIndex in descending order (biggest first, smallest last)
    processedChildren.sort((a, b) {
      final aIndex = _getStartIndex(a);
      final bIndex = _getStartIndex(b);
      return bIndex.compareTo(aIndex); // Descending order
    });

    String processedL10nValue = entity.content;

    for (final child in processedChildren) {
      final startIndex = _getStartIndex(child);
      final endIndex = _getEndIndex(child);

      final implementation = _getBabelImplementation(child);
      processedL10nValue = processedL10nValue.replaceRange(
        startIndex,
        endIndex,
        implementation,
      );
    }

    return BabelLabelEntityLabelDynamicValue(
      content: processedL10nValue,
      parentStartIndex: entity.parentStartIndex,
      parentEndIndex: entity.parentEndIndex,
      filePath: entity.filePath,
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
    if (entity is BabelLabelEntityRootLabel) {
      return entity.fileStartIndex;
    } else if (entity is BabelLabelEntityChildLabel) {
      return entity.parentStartIndex;
    } else if (entity is BabelLabelEntityLabelDynamicValue) {
      return entity.parentStartIndex;
    } else {
      throw ArgumentError('Unknown entity type: ${entity.runtimeType}');
    }
  }

  int _getEndIndex(BabelLabelEntity entity) {
    if (entity is BabelLabelEntityRootLabel) {
      return entity.fileEndIndex;
    } else if (entity is BabelLabelEntityChildLabel) {
      return entity.parentEndIndex;
    } else if (entity is BabelLabelEntityLabelDynamicValue) {
      return entity.parentEndIndex;
    } else {
      throw ArgumentError('Unknown entity type: ${entity.runtimeType}');
    }
  }

  String _getVarName(BabelLabelEntity entity, int index) {
    return switch (entity) {
      BabelLabelEntityRootLabel() => entity.l10nValue,
      BabelLabelEntityChildLabel() => entity.l10nValue,
      BabelLabelEntityLabelDynamicValue() => 'var$index',
    };
  }

  bool isDynamic(BabelLabelEntity entity) {
    return switch (entity) {
      BabelLabelEntityRootLabel() => false,
      BabelLabelEntityChildLabel() => false,
      BabelLabelEntityLabelDynamicValue() => true,
    };
  }

  String _getKey(BabelLabelEntity entity) {
    return switch (entity) {
      BabelLabelEntityRootLabel() => entity.l10nValue,
      BabelLabelEntityChildLabel() => entity.l10nValue,
      BabelLabelEntityLabelDynamicValue() => entity.content,
    };
  }

  String _getBabelImplementation(BabelLabelEntity entity) {
    if (entity is BabelLabelEntityRootLabel) {
      return entity.babelFunctionImplementation;
    } else if (entity is BabelLabelEntityChildLabel) {
      return entity.babelFunctionImplementation;
    } else if (entity is BabelLabelEntityLabelDynamicValue) {
      return entity.content;
    } else {
      throw ArgumentError('Unknown entity type: ${entity.runtimeType}');
    }
  }

  String _createBabelFunctionDeclaration({
    required String l10nKey,
    required String l10nValue,
  }) {
    // Extract dynamic parameters if any (format: {paramName})
    final paramRegex = RegExp(r'\{([^{}]+)\}');
    final matches = paramRegex.allMatches(l10nValue);
    final parameters = matches.map((m) => m.group(1)!).toSet();

    // Generate function comment from l10nValue
    final comment = l10nValue.formatToComment;

    // Generate function parameters
    final params = parameters.isEmpty
        ? ''
        : parameters.map((param) => 'Object? $param').join(', ');

    // Generate parameter replacement code
    final replacements = parameters.isEmpty
        ? ''
        : parameters
              .map((param) => ".replaceAll('{$param}', $param.toString())")
              .join();

    // Create the function declaration
    return '''$comment
  static String $l10nKey($params) {
    return _getByKey('$l10nKey')$replacements;
  }''';
  }

  String _createBabelFunctionImplementation({required String l10nKey}) {
    return 'BabelText.$l10nKey';
  }
}
