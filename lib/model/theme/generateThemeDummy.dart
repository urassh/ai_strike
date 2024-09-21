import 'package:ai_strike/datamodel/theme.dart';

import 'generateTheme.dart';

class GenerateThemeDummy implements GenerateTheme {
  @override
  Future<Theme> generalTheme() {
    return Future.value(Theme(title: 'Dummy Theme', contents: 'Dummy Contents'));
  }
}