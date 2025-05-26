import 'dart:io';
import 'package:path/path.dart' as p;

/// List of folders to exclude from scanning
const List<String> excludedFolders = [
  'android',
  'ios',
  'linux',
  'macos',
  'build',
  'web',
  'windows',
  'test',
];

/// Gets eligible files for string extraction from the directory
List<File> getEligibleFiles(Directory dir) {
  Directory lib;
  if (dir.path.endsWith('lib')) {
    lib = dir;
  } else {
    lib = Directory('${dir.path}/lib');
  }
  return lib.listSync(recursive: true).whereType<File>().where((file) {
    // Normalize path separators for consistent splitting, then split into segments
    final pathSegments = p.split(file.path.replaceAll(r'\', '/'));
    for (final segment in pathSegments) {
      final segmentContainExcludeFolder = excludedFolders.any(
        (folder) => segment.contains(folder),
      );

      // ex: .dart_tool
      final segmentContainPrivateFolder =
          segment.contains('/.') || segment.startsWith('.');

      final isFreezedFile = file.path.endsWith('.freezed.dart');
      final isPartFile = file.path.endsWith('.part.dart');
      final isGeneratedFile = file.path.endsWith('.g.dart');
      if (segmentContainExcludeFolder ||
          segmentContainPrivateFolder ||
          isFreezedFile ||
          isPartFile ||
          isGeneratedFile) {
        return false; // Exclude this file
      }
    }

    // Only include Dart files
    return file.path.endsWith('.dart');
  }).toList();
}
