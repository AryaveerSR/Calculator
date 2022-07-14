import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import 'services/theme.data.dart' as themes;
import 'services/calc.model.dart';
import 'screens/calculator.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalcProvider(),
      child: ThemeProvider(
          themes: [themes.lightTheme, themes.darkTheme],
          saveThemesOnChange: true,
          defaultThemeId: "dark",
          loadThemeOnInit: true,
          child: ThemeConsumer(
            child: Builder(
                builder: (themeContext) => MaterialApp(
                      title: 'Calculator',
                      debugShowCheckedModeBanner: false,
                      theme: ThemeProvider.themeOf(themeContext).data,
                      home: const Calculator(),
                    )),
          )),
    );
  }
}
