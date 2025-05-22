class HardcodedStringDynamicValue {
  final String value;
  final int parentStartIndex;
  final int parentEndIndex;
  final int fileStartIndex;
  final int fileEndIndex;

  const HardcodedStringDynamicValue({
    required this.value,
    required this.parentStartIndex,
    required this.parentEndIndex,
    required this.fileStartIndex,
    required this.fileEndIndex,
  });

  Map<String, dynamic> toMap() => {
    'value': value,
    'parentStartIndex': parentStartIndex,
    'parentEndIndex': parentEndIndex,
    'fileStartIndex': fileStartIndex,
    'fileEndIndex': fileEndIndex,
  };
}
