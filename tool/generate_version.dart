import 'dart:io';

void main() async {
  try {
    final pubspecFile = File('pubspec.yaml');
    if (!await pubspecFile.exists()) {
      print('Error: pubspec.yaml not found');
      exit(1);
    }

    final pubspecContent = await pubspecFile.readAsString();
    if (pubspecContent.isEmpty) {
      print('Error: pubspec.yaml is empty');
      exit(1);
    }

    final versionLine = pubspecContent
        .split('\n')
        .firstWhere(
          (line) => line.trim().startsWith('version:'),
          orElse: () {
            print(
              'Warning: version not found in pubspec.yaml, using default 1.0.0+1',
            );
            return 'version: 1.0.0+1';
          },
        );

    final versionParts = versionLine.split(':')[1].trim().split('+');
    final appVersion = versionParts[0].trim();
    final buildNumber = versionParts.length > 1 ? versionParts[1].trim() : '1';

    if (!RegExp(r'^\d+\.\d+\.\d+$').hasMatch(appVersion)) {
      print('Warning: Invalid version format "$appVersion", expected X.Y.Z');
    }

    const outputFile = 'lib/config/app_version.dart';
    final content =
        '''
// Generated file - do not edit manually
class AppVersion {
  static const String appVersion = '$appVersion';
  static const String buildNumber = '$buildNumber';
}
''';

    await Directory('lib/config').create(recursive: true);
    await File(outputFile).writeAsString(content);
    print(
      'Generated $outputFile with appVersion: $appVersion, buildNumber: $buildNumber',
    );
  } catch (e, stackTrace) {
    print('Error generating version: $e\n$stackTrace');
    exit(1);
  }
}