import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_dynamic_value_entity.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_entity.dart';
import 'package:gobabel_string_extractor/src/entities/labels_entity.dart';

abstract class IMapStringsHierarchyUsecase {
  List<LabelsEntityRootLabel> call({
    required Map<TranslationKey, HardcodedStringEntity> strings,
  });
}

class MapStringsHierarchyUsecaseImpl implements IMapStringsHierarchyUsecase {
  const MapStringsHierarchyUsecaseImpl();
  @override
  List<LabelsEntityRootLabel> call({
    required Map<TranslationKey, HardcodedStringEntity> strings,
  }) {
    // First, separate root strings (those without parent) from child strings
    final rootStrings = strings.entries
        .where(
          (e) =>
              e.value.parentStartIndex == null &&
              e.value.parentEndIndex == null,
        )
        .toList();
    final childStrings = strings.entries
        .where(
          (e) =>
              e.value.parentStartIndex != null &&
              e.value.parentEndIndex != null,
        )
        .toList();

    // Create root labels from root strings
    final rootLabels = rootStrings.map((rootEntry) {
      // Find children for this root string
      final children = _buildChildren(
        rootEntry.value,
        childStrings,
        rootEntry.value.dynamicFields,
        strings,
      );

      // Create a root label with its children
      return LabelsEntity.rootLabel(
            l10nKey: rootEntry.key, // TranslationKey
            hardcodedString: rootEntry.value.value, // Original string value
            fileStartIndex: rootEntry.value.fileStartIndex,
            fileEndIndex: rootEntry.value.fileEndIndex,
            filePath:
                rootEntry.value.filePath, // FilePath is a typedef for String
            children: children,
          )
          as LabelsEntityRootLabel;
    }).toList();

    return rootLabels;
  }

  // Build children for a parent string (either root or child)
  List<LabelsEntity> _buildChildren(
    HardcodedStringEntity parent,
    List<MapEntry<TranslationKey, HardcodedStringEntity>> allChildStrings,
    List<HardcodedStringDynamicValue> dynamicValues,
    Map<TranslationKey, HardcodedStringEntity> strings,
  ) {
    final List<LabelsEntity> children = [];

    // Find child strings that are inside this parent's range
    final directChildStrings = allChildStrings.where((entry) {
      return entry.value.parentStartIndex != null &&
          entry.value.parentEndIndex != null &&
          entry.value.parentStartIndex! >= parent.fileStartIndex &&
          entry.value.parentEndIndex! <= parent.fileEndIndex;
    }).toList();

    // Create child labels for each direct child string
    for (final childEntry in directChildStrings) {
      // Find children for this child string
      final grandchildren = _buildChildren(
        childEntry.value,
        allChildStrings,
        childEntry.value.dynamicFields,
        strings,
      );

      children.add(
        LabelsEntity.childLabel(
          l10nKey: childEntry.key, // TranslationKey
          hardcodedString: childEntry.value.value, // Original string value
          parentStartIndex: childEntry.value.parentStartIndex!,
          parentEndIndex: childEntry.value.parentEndIndex!,
          children: grandchildren,
        ),
      );
    }

    // Add dynamic values as children
    for (final dynamicValue in dynamicValues) {
      // Find any child strings that are inside this dynamic value's range
      final dynamicValueChildren = _buildDynamicValueChildren(
        dynamicValue,
        allChildStrings,
      );

      children.add(
        LabelsEntity.labelDynamicValue(
          content: dynamicValue.value,
          parentStartIndex: dynamicValue.parentStartIndex,
          parentEndIndex: dynamicValue.parentEndIndex,
          children: dynamicValueChildren,
        ),
      );
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
    List<MapEntry<TranslationKey, HardcodedStringEntity>> allChildStrings,
  ) {
    final List<LabelsEntity> children = [];

    // Find child strings that are inside this dynamic value's range
    final directChildStrings = allChildStrings.where((entry) {
      return entry.value.parentStartIndex != null &&
          entry.value.parentEndIndex != null &&
          entry.value.parentStartIndex! >= dynamicValue.fileStartIndex &&
          entry.value.parentEndIndex! <= dynamicValue.fileEndIndex;
    }).toList();

    // Create child labels for each direct child string
    for (final childEntry in directChildStrings) {
      // Find children for this child string
      final grandchildren = _buildChildren(
        childEntry.value,
        allChildStrings,
        childEntry.value.dynamicFields,
        allChildStrings.fold(
          {},
          (map, entry) => map..[entry.key] = entry.value,
        ),
      );

      children.add(
        LabelsEntity.childLabel(
          l10nKey: childEntry.key, // TranslationKey
          hardcodedString: childEntry.value.value, // Original string value
          parentStartIndex: childEntry.value.parentStartIndex!,
          parentEndIndex: childEntry.value.parentEndIndex!,
          children: grandchildren,
        ),
      );
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
