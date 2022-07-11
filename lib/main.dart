import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/theme/theme.model.dart';
import 'services/theme/theme.data.dart' as themes;
import 'screens/calculator.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
          builder: (context, themeNotifier, child) => MaterialApp(
                title: 'Calculator',
                debugShowCheckedModeBanner: false,
                theme: themeNotifier.isDark ? themes.dark : themes.light,
                home: const Calculator(),
              )),
    );
  }
}
