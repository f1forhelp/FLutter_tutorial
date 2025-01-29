import 'dart:io';

import 'package:mason/mason.dart';
import 'package:package_config/package_config.dart';
import 'package:yaml/yaml.dart';

void run(HookContext context) async {
  int codegenOpion =
      int.tryParse(context.vars["codegenOption"].toString()) ?? 0;
  List<int> codegenOptions = [1, 2];
  bool genFeature = false;
  bool genUtils = false;
  String featureName = "";
  String packageName = "";

  packageName = await _getPackageName();

  context.vars["packageName"] = packageName;

  if (!codegenOptions.contains(codegenOpion)) {
    return;
  }

  if (codegenOpion == 1) {
    featureName =
        context.logger.prompt("Enter feature name:", defaultValue: "");
    if (featureName == "") {
      genFeature = false;
      context.logger.err("Please re-run and enter feature name");
      throw "Invalid selection";
    }
    genFeature = true;
  } else {
    genUtils = true;
  }

  context.vars["genFeature"] = genFeature;
  context.vars["genUtils"] = genUtils;
  context.vars["featureName"] = featureName;
}

Future<String> _getPackageName() async {
  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    throw Exception('No pubspec.yaml found in the current directory.');
  }

  final yamlDoc = loadYaml(await pubspecFile.readAsString());
  if (yamlDoc is! YamlMap || yamlDoc['name'] == null) {
    throw Exception('Could not find a "name" field in the pubspec.yaml.');
  }

  return yamlDoc['name'] as String;
}
