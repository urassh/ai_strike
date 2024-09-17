import 'package:ai_strike/datamodel/theme.dart';

import 'generateTheme.dart';

class GenerateThemeDummy implements GenerateTheme {
  @override
  Theme generalTheme() {
    return const Theme(
      title: 'Flutter Demo',
      contents: 'This is a dummy theme.',
    );
  }
}