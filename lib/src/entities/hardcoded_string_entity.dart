import 'package:gobabel_string_extractor/src/entities/hardcoded_string_dynamic_value_entity.dart';

class HardcodedStringEntity {
  final String value;
  final String filePath;
  final int? parentStartIndex;
  final int? parentEndIndex;
  final int fileStartIndex;
  final int fileEndIndex;
  final List<HardcodedStringDynamicValue> dynamicFields;

  const HardcodedStringEntity({
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
