import 'dart:io';

import 'models/md_file.dart';

class Utils {
  static List<MdFile> extractMDFiles(String rootPath) {
    final rootDir = Directory(rootPath);

    List<Directory> dirs = [rootDir];
    List<File> files = [];

    while (dirs.isNotEmpty) {
      final dir = dirs.first;
      dirs.removeAt(0);
      final members = dir.listSync();

      for (final member in members) {
        if (member is File && member.path.endsWith('.md')) {
          files.add(member);
        } else if (member is Directory) {
          dirs.add(member);
        }
      }
    }

    return files.map(
      (file) {
        final subPath = file.path.replaceAll(rootPath, '');
        return MdFile(subPath, file);
      },
    ).toList();
  }
}
