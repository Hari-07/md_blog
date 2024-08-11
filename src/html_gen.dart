import 'dart:io';

import 'package:markdown/markdown.dart';

import 'models/md_file.dart';

class HtmlGen {
  final List<MdFile> _mdFiles;

  HtmlGen(this._mdFiles);

  void generate(String outputDir) {
    for (final file in _mdFiles) {
      _generateHTML(file, outputDir);
    }
  }

  void _generateHTML(MdFile file, String outputDir) {
    final markdownString = file.file.readAsStringSync();

    final markdownWithHeader = '# ${file.title}\n\n$markdownString';
    final mdHtml = markdownToHtml(markdownWithHeader);

    final cssOuputFile = File('$outputDir/styles.css');
    cssOuputFile.createSync(recursive: true);

    File('./src/templates/styles.css').copySync(cssOuputFile.path);

    final templateHtml = File('./src/templates/index.html').readAsStringSync();

    final injectedHtml = templateHtml.replaceFirst('<body>', '<body>\n$mdHtml');

    final outputFile = File('$outputDir/${file.htmlPath}');
    outputFile.createSync(recursive: true);
    outputFile.writeAsStringSync(injectedHtml);
  }
}
