import 'package:test/test.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_dynamic_value_entity.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_entity.dart';
import 'package:gobabel_string_extractor/src/entities/labels_entity.dart';
import 'package:gobabel_string_extractor/src/usecases/map_strings_hierarchy.dart';

void main() {
  group('MapStringsHierarchyUsecase', () {
    late MapStringsHierarchyUsecase usecase;

    setUp(() {
      usecase = MapStringsHierarchyUsecase();
    });

    test('should return empty list when no strings are provided', () async {
      // Arrange
      final List<HardcodedString> strings = [];

      // Act
      final result = await usecase(strings: strings);

      // Assert
      expect(result, isEmpty);
    });

    test('should identify root labels correctly', () async {
      // Arrange
      final List<HardcodedString> strings = [
        HardcodedString(
          value: 'Hello World',
          filePath: 'test_file.dart',
          fileStartIndex: 10,
          fileEndIndex: 21,
          dynamicFields: [],
        ),
        HardcodedString(
          value: 'Another root string',
          filePath: 'test_file.dart',
          fileStartIndex: 30,
          fileEndIndex: 49,
          dynamicFields: [],
        ),
      ];

      // Act
      final result = await usecase(strings: strings);

      // Assert
      expect(result.length, 2);
      expect(result[0].l10nKey, 'Hello World');
      expect(result[1].l10nKey, 'Another root string');
    });

    test('should build hierarchy with child labels correctly', () async {
      // Arrange
      final List<HardcodedString> strings = [
        // Root string
        HardcodedString(
          value: 'Parent string',
          filePath: 'test_file.dart',
          fileStartIndex: 10,
          fileEndIndex: 50,
          dynamicFields: [],
        ),
        // Child string inside parent
        HardcodedString(
          value: 'Child string',
          filePath: 'test_file.dart',
          parentStartIndex: 20,
          parentEndIndex: 32,
          fileStartIndex: 20,
          fileEndIndex: 32,
          dynamicFields: [],
        ),
      ];

      // Act
      final result = await usecase(strings: strings);

      // Assert
      expect(result.length, 1);
      expect(result[0].l10nKey, 'Parent string');
      expect(result[0].children.length, 1);
      expect(result[0].children[0], isA<LabelsEntityChildLabel>());
      
      final childLabel = result[0].children[0] as LabelsEntityChildLabel;
      expect(childLabel.l10nKey, 'Child string');
      expect(childLabel.parentStartIndex, 20);
      expect(childLabel.parentEndIndex, 32);
    });

    test('should handle dynamic values correctly', () async {
      // Arrange
      final List<HardcodedString> strings = [
        // Root string with dynamic values
        HardcodedString(
          value: 'Hello \$name, you are \$age years old',
          filePath: 'test_file.dart',
          fileStartIndex: 10,
          fileEndIndex: 45,
          dynamicFields: [
            HardcodedStringDynamicValue(
              value: 'name',
              parentStartIndex: 16,
              parentEndIndex: 21,
              fileStartIndex: 16,
              fileEndIndex: 21,
            ),
            HardcodedStringDynamicValue(
              value: 'age',
              parentStartIndex: 33,
              parentEndIndex: 37,
              fileStartIndex: 33,
              fileEndIndex: 37,
            ),
          ],
        ),
      ];

      // Act
      final result = await usecase(strings: strings);

      // Assert
      expect(result.length, 1);
      expect(result[0].l10nKey, 'Hello \$name, you are \$age years old');
      expect(result[0].children.length, 2);
      expect(result[0].children[0], isA<LabelsEntityLabelDynamicValue>());
      expect(result[0].children[1], isA<LabelsEntityLabelDynamicValue>());
      
      final nameValue = result[0].children[0] as LabelsEntityLabelDynamicValue;
      final ageValue = result[0].children[1] as LabelsEntityLabelDynamicValue;
      expect(nameValue.content, 'name');
      expect(ageValue.content, 'age');
      expect(nameValue.parentStartIndex, 16);
      expect(ageValue.parentStartIndex, 33);
    });

    test('should sort children by parentStartIndex', () async {
      // Arrange
      final List<HardcodedString> strings = [
        // Root string with dynamic values in reverse order
        HardcodedString(
          value: 'You are \$age years old, \$name',
          filePath: 'test_file.dart',
          fileStartIndex: 10,
          fileEndIndex: 45,
          dynamicFields: [
            // Adding in reverse order to test sorting
            HardcodedStringDynamicValue(
              value: 'name',
              parentStartIndex: 35,
              parentEndIndex: 40,
              fileStartIndex: 35,
              fileEndIndex: 40,
            ),
            HardcodedStringDynamicValue(
              value: 'age',
              parentStartIndex: 18,
              parentEndIndex: 22,
              fileStartIndex: 18,
              fileEndIndex: 22,
            ),
          ],
        ),
      ];

      // Act
      final result = await usecase(strings: strings);

      // Assert
      expect(result.length, 1);
      expect(result[0].children.length, 2);
      
      // Verify sorting - age should be first (index 18), then name (index 35)
      final firstChild = result[0].children[0] as LabelsEntityLabelDynamicValue;
      final secondChild = result[0].children[1] as LabelsEntityLabelDynamicValue;
      expect(firstChild.content, 'age');
      expect(secondChild.content, 'name');
    });

    test('should handle multi-level nesting correctly', () async {
      // Arrange
      final List<HardcodedString> strings = [
        // Root string
        HardcodedString(
          value: 'Grandparent string',
          filePath: 'test_file.dart',
          fileStartIndex: 10,
          fileEndIndex: 100,
          dynamicFields: [],
        ),
        // Child of root
        HardcodedString(
          value: 'Parent string',
          filePath: 'test_file.dart',
          parentStartIndex: 20,
          parentEndIndex: 70,
          fileStartIndex: 20,
          fileEndIndex: 70,
          dynamicFields: [],
        ),
        // Grandchild (child of 'Parent string')
        HardcodedString(
          value: 'Child string',
          filePath: 'test_file.dart',
          parentStartIndex: 30,
          parentEndIndex: 42,
          fileStartIndex: 30,
          fileEndIndex: 42,
          dynamicFields: [],
        ),
      ];

      // Act
      final result = await usecase(strings: strings);

      // Assert
      expect(result.length, 1);
      expect(result[0].l10nKey, 'Grandparent string');
      expect(result[0].children.length, 1);
      
      final parentLabel = result[0].children[0] as LabelsEntityChildLabel;
      expect(parentLabel.l10nKey, 'Parent string');
      expect(parentLabel.children.length, 1);
      
      final childLabel = parentLabel.children[0] as LabelsEntityChildLabel;
      expect(childLabel.l10nKey, 'Child string');
    });
    
    test('should handle child strings inside dynamic values', () async {
      // Arrange
      final List<HardcodedString> strings = [
        // Root string with a dynamic value
        HardcodedString(
          value: 'Hello \$name',
          filePath: 'test_file.dart',
          fileStartIndex: 10,
          fileEndIndex: 30,
          dynamicFields: [
            HardcodedStringDynamicValue(
              value: 'name',
              parentStartIndex: 16,
              parentEndIndex: 21,
              fileStartIndex: 16,
              fileEndIndex: 21,
            ),
          ],
        ),
        // Child string inside the dynamic value
        HardcodedString(
          value: 'Inside dynamic',
          filePath: 'test_file.dart',
          parentStartIndex: 17,
          parentEndIndex: 20,
          fileStartIndex: 17,
          fileEndIndex: 20,
          dynamicFields: [],
        ),
      ];

      // Act
      final result = await usecase(strings: strings);

      // Assert
      expect(result.length, 1);
      expect(result[0].children.length, 1);
      
      final dynamicValue = result[0].children[0] as LabelsEntityLabelDynamicValue;
      expect(dynamicValue.content, 'name');
      expect(dynamicValue.children.length, 1);
      
      final insideDynamicLabel = dynamicValue.children[0] as LabelsEntityChildLabel;
      expect(insideDynamicLabel.l10nKey, 'Inside dynamic');
    });
  });
}
