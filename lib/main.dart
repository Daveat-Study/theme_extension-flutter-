import 'package:flutter/material.dart';
import 'package:theme_extension_flutter/my_theme_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLightTheme = true;

  void toggleTheme() {
    setState(() => isLightTheme = !isLightTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(extensions: <ThemeExtension<dynamic>>[
        const MyThemeColor(
          brandColor: Color(0xFF1E88E5),
          danger: Color(0xFFE53935),
        )
      ]),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          const MyThemeColor(
            brandColor: Color(0xFF90CAF9),
            danger: Color(0xFFEF9A9A),
          ),
        ],
      ),
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      home: Home(
        isLightTheme: isLightTheme,
        toggleTheme: toggleTheme,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.isLightTheme,
    required this.toggleTheme,
  });

  final bool isLightTheme;

  final void Function() toggleTheme;

  @override
  Widget build(BuildContext context) {
    final MyThemeColor myColors = Theme.of(context).extension<MyThemeColor>()!;
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: 100, height: 100, color: myColors.brandColor),
            const SizedBox(width: 10),
            Container(width: 100, height: 100, color: myColors.danger),
            const SizedBox(width: 50),
            IconButton(
              icon: Icon(isLightTheme ? Icons.nightlight : Icons.wb_sunny),
              onPressed: toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}
