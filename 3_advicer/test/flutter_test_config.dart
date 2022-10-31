import 'dart:async';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform/platform.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // ASSET FONTS
    // loads a font that is bundled in your package (Open Sans for example)
    // final fontVariable = rootBundle.load('lib/fonts/Open_Sans/OpenSans-VariableFont.ttf');
    // final fontItalic = rootBundle.load('lib/fonts/Open_Sans/OpenSans-Italic-VariableFont.ttf');

    // here you maybe need to load more types, when you have a specific bold style as well
    // final fontLoader = FontLoader('OpenSans')
    //   ..addFont(fontVariable)
    //   ..addFont(fontItalic);

    // await fontLoader.load();

    // PACKAGE FONTS
    // loads a font that is bundled in a different package, here for example from the fluent icons package (https://pub.dev/packages/fluentui_system_icons)
    // final fluentRegularIcon = rootBundle.load('packages/fluentui_system_icons/fonts/FluentSystemIcons-Regular.ttf');
    // final fluentFilledIcon = rootBundle.load('packages/fluentui_system_icons/fonts/FluentSystemIcons-Filled.ttf');

    // there is no need to write extension methods or create specific themes, you only need to add the packages/package_name to the font name.
    // final fluentRegularLoader = FontLoader('packages/fluentui_system_icons/FluentSystemIcons-Regular')
    //   ..addFont(fluentRegularIcon);
    // final fluentFilledLoader = FontLoader('packages/fluentui_system_icons/FluentSystemIcons-Filled')
    //   ..addFont(fluentFilledIcon);

    // await fluentRegularLoader.load();
    // await fluentFilledLoader.load();

    // MATERIAL FONTS
    // loads the material icon font and roboto font
    final materialIconFont = _loadMaterialFont('MaterialIcons-Regular.otf');
    final materialRobotoFont = _loadMaterialFont('Roboto-Regular.ttf');

    // Name of the FontLoaded needs to be the name of the used font!
    final materialLoader = FontLoader('MaterialIcons')..addFont(materialIconFont);
    final materialFontLoader = FontLoader('Roboto')..addFont(materialRobotoFont);

    await materialLoader.load();
    await materialFontLoader.load();
  });

  // runs your golden tests
  await testMain();
}

// see https://github.com/flutter/flutter/pull/74131/files
// Loads the cached material icon font.
// Only necessary for golden tests. Relies on the tool updating cached assets before
// running tests.
Future<ByteData> _loadMaterialFont(String fontName) async {
  const FileSystem fs = LocalFileSystem();
  const Platform platform = LocalPlatform();
  final Directory flutterRoot = fs.directory(platform.environment['FLUTTER_ROOT']);

  final File font = flutterRoot.childFile(
    fs.path.join(
      'bin',
      'cache',
      'artifacts',
      'material_fonts',
      fontName,
    ),
  );

  final Future<ByteData> bytes = Future<ByteData>.value(
    font.readAsBytesSync().buffer.asByteData(),
  );

  return bytes;
}
