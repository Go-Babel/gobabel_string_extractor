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
    if (entity is LabelsEntityRootLabel) {
      final processedChildren = _processChildren(entity.children);
      String processedL10nValue = entity.l10nValue;
      
      // Sort children by parentStartIndex in descending order (biggest first, smallest last)
      processedChildren.sort((a, b) {
        final aIndex = _getStartIndex(a);
        final bIndex = _getStartIndex(b);
        return bIndex.compareTo(aIndex); // Descending order
      });
      
      // Replace l10nValue with the children's implementation
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
      
      // Create babel function declaration
      final babelFunctionDeclaration = _createBabelFunctionDeclaration(
        l10nKey: entity.l10nKey,
        l10nValue: processedL10nValue,
      );
      
      // Create babel function implementation
      final babelFunctionImplementation = _createBabelFunctionImplementation(
        l10nKey: entity.l10nKey,
      );
      
      return BabelLabelEntity.rootLabel(
        l10nKey: entity.l10nKey,
        l10nValue: processedL10nValue,
        babelFunctionDeclaration: babelFunctionDeclaration,
        babelFunctionImplementation: babelFunctionImplementation,
        fileStartIndex: entity.fileStartIndex,
        fileEndIndex: entity.fileEndIndex,
        filePath: entity.filePath,
        children: processedChildren,
      );
    } else if (entity is LabelsEntityChildLabel) {
      final processedChildren = _processChildren(entity.children);
      String processedL10nValue = entity.l10nValue;
      
      // Sort children by parentStartIndex in descending order (biggest first, smallest last)
      processedChildren.sort((a, b) {
        final aIndex = _getStartIndex(a);
        final bIndex = _getStartIndex(b);
        return bIndex.compareTo(aIndex); // Descending order
      });
      
      // Replace l10nValue with the children's implementation
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
      
      // Create babel function declaration
      final babelFunctionDeclaration = _createBabelFunctionDeclaration(
        l10nKey: entity.l10nKey,
        l10nValue: processedL10nValue,
      );
      
      // Create babel function implementation
      final babelFunctionImplementation = _createBabelFunctionImplementation(
        l10nKey: entity.l10nKey,
      );
      
      return BabelLabelEntity.childLabel(
        l10nKey: entity.l10nKey,
        l10nValue: processedL10nValue,
        babelFunctionDeclaration: babelFunctionDeclaration,
        babelFunctionImplementation: babelFunctionImplementation,
        parentStartIndex: entity.parentStartIndex,
        parentEndIndex: entity.parentEndIndex,
        filePath: entity.filePath,
        children: processedChildren,
      );
    } else if (entity is LabelsEntityLabelDynamicValue) {
      final processedChildren = _processChildren(entity.children);
      
      return BabelLabelEntity.labelDynamicValue(
        content: entity.content,
        parentStartIndex: entity.parentStartIndex,
        parentEndIndex: entity.parentEndIndex,
        filePath: entity.filePath,
        children: processedChildren,
      );
    } else {
      throw ArgumentError('Unknown entity type: ${entity.runtimeType}');
    }
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
  
  String _createBabelFunctionImplementation({
    required String l10nKey,
  }) {
    return 'BabelText.$l10nKey';
  }
}
