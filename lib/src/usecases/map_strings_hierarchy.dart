import 'package:gobabel_string_extractor/src/entities/hardcoded_string_dynamic_value_entity.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_entity.dart';
import 'package:gobabel_string_extractor/src/entities/labels_entity.dart';

abstract class IMapStringsHierarchyUsecase {
  Future<List<LabelsEntityRootLabel>> call({
    required List<HardcodedString> strings,
  });
}

class MapStringsHierarchyUsecase implements IMapStringsHierarchyUsecase {
  @override
  Future<List<LabelsEntityRootLabel>> call({
    required List<HardcodedString> strings,
  }) async {
    // First, separate root strings (those without parent) from child strings
    final rootStrings = strings.where((s) => s.parentStartIndex == null && s.parentEndIndex == null).toList();
    final childStrings = strings.where((s) => s.parentStartIndex != null && s.parentEndIndex != null).toList();
    
    // Create root labels from root strings
    final rootLabels = rootStrings.map((rootString) {
      // Find children for this root string
      final children = _buildChildren(rootString, childStrings, rootString.dynamicFields);
      
      // Create a root label with its children
      return LabelsEntity.rootLabel(
        l10nKey: rootString.value, // L10nKey is a typedef for String
        l10nValue: rootString.value, // L10nValue is a typedef for String
        fileStartIndex: rootString.fileStartIndex,
        fileEndIndex: rootString.fileEndIndex,
        filePath: rootString.filePath, // FilePath is a typedef for String
        children: children,
      ) as LabelsEntityRootLabel;
    }).toList();
    
    return rootLabels;
  }
  
  // Build children for a parent string (either root or child)
  List<LabelsEntity> _buildChildren(
    HardcodedString parent,
    List<HardcodedString> allChildStrings,
    List<HardcodedStringDynamicValue> dynamicValues,
  ) {
    final List<LabelsEntity> children = [];
    
    // Find child strings that are inside this parent's range
    final directChildStrings = allChildStrings.where((child) {
      return child.parentStartIndex != null &&
             child.parentEndIndex != null &&
             child.parentStartIndex! >= parent.fileStartIndex &&
             child.parentEndIndex! <= parent.fileEndIndex;
    }).toList();
    
    // Create child labels for each direct child string
    for (final childString in directChildStrings) {
      // Find children for this child string
      final grandchildren = _buildChildren(
        childString, 
        allChildStrings, 
        childString.dynamicFields,
      );
      
      children.add(LabelsEntity.childLabel(
        l10nKey: childString.value, // L10nKey is a typedef for String
        l10nValue: childString.value, // L10nValue is a typedef for String
        parentStartIndex: childString.parentStartIndex!,
        parentEndIndex: childString.parentEndIndex!,
        filePath: childString.filePath, // FilePath is a typedef for String
        children: grandchildren,
      ));
    }
    
    // Add dynamic values as children
    for (final dynamicValue in dynamicValues) {
      // Find any child strings that are inside this dynamic value's range
      final dynamicValueChildren = _buildDynamicValueChildren(
        dynamicValue,
        allChildStrings,
      );
      
      children.add(LabelsEntity.labelDynamicValue(
        content: dynamicValue.value,
        parentStartIndex: dynamicValue.parentStartIndex,
        parentEndIndex: dynamicValue.parentEndIndex,
        filePath: parent.filePath, // FilePath is a typedef for String
        children: dynamicValueChildren,
      ));
    }
    
    // Sort children by parentStartIndex
    children.sort((a, b) {
      int aIndex = 0;
      int bIndex = 0;
      
      if (a is LabelsEntityChildLabel) {
        aIndex = a.parentStartIndex;
      } else if (a is LabelsEntityLabelDynamicValue) {
        aIndex = a.parentStartIndex;
      }
      
      if (b is LabelsEntityChildLabel) {
        bIndex = b.parentStartIndex;
      } else if (b is LabelsEntityLabelDynamicValue) {
        bIndex = b.parentStartIndex;
      }
      
      return aIndex.compareTo(bIndex);
    });
    
    return children;
  }
  
  // Build children for a dynamic value
  List<LabelsEntity> _buildDynamicValueChildren(
    HardcodedStringDynamicValue dynamicValue,
    List<HardcodedString> allChildStrings,
  ) {
    final List<LabelsEntity> children = [];
    
    // Find child strings that are inside this dynamic value's range
    final directChildStrings = allChildStrings.where((child) {
      return child.parentStartIndex != null &&
             child.parentEndIndex != null &&
             child.parentStartIndex! >= dynamicValue.fileStartIndex &&
             child.parentEndIndex! <= dynamicValue.fileEndIndex;
    }).toList();
    
    // Create child labels for each direct child string
    for (final childString in directChildStrings) {
      // Find children for this child string
      final grandchildren = _buildChildren(
        childString, 
        allChildStrings, 
        childString.dynamicFields,
      );
      
      children.add(LabelsEntity.childLabel(
        l10nKey: childString.value, // L10nKey is a typedef for String
        l10nValue: childString.value, // L10nValue is a typedef for String
        parentStartIndex: childString.parentStartIndex!,
        parentEndIndex: childString.parentEndIndex!,
        filePath: childString.filePath, // FilePath is a typedef for String
        children: grandchildren,
      ));
    }
    
    // Sort children by parentStartIndex
    children.sort((a, b) {
      int aIndex = 0;
      int bIndex = 0;
      
      if (a is LabelsEntityChildLabel) {
        aIndex = a.parentStartIndex;
      } else if (a is LabelsEntityLabelDynamicValue) {
        aIndex = a.parentStartIndex;
      }
      
      if (b is LabelsEntityChildLabel) {
        bIndex = b.parentStartIndex;
      } else if (b is LabelsEntityLabelDynamicValue) {
        bIndex = b.parentStartIndex;
      }
      
      return aIndex.compareTo(bIndex);
    });
    
    return children;
  }
}
