import 'dart:io';

import 'package:markdown/markdown.dart';

import 'html_gen.dart';
import 'utils.dart';

void main() {
  final rootPath = '';

  final files = Utils.extractMDFiles(rootPath);

  final htmlGen = HtmlGen(files);
  htmlGen.generate('./output');
}
