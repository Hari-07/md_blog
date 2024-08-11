import 'dart:io';

class MdFile {
  File file;
  String path;

  MdFile(this.path, this.file);

  @override
  String toString() {
    return path;
  }

  String get htmlPath {
    final formattedSubPath = path.toLowerCase().replaceAll(' ', '-');
    return formattedSubPath.replaceAll('.md', '.html');
  }

  String get title => path.split('/').last.replaceAll('.md', '');
}
