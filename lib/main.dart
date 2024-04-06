import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';

import 'package:open_game_ceramic/themeConfig.dart';
import 'package:open_game_ceramic/elements/customNavButton.dart';
import 'package:open_game_ceramic/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemTheme.accentColor.load();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
      size: Size(800, 600),
      minimumSize: Size(800, 600),
      center: true,
      windowButtonVisibility: true,
      title: "Open Game Ceramic",
      titleBarStyle: TitleBarStyle.hidden);
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeConfig(context).loadTheme()),
      child: const MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeChanger>(context);
    SystemTheme.onChange.listen((event) {
      _theme.setTheme(ThemeConfig(context).loadTheme(event.accent));
    });
    return MaterialApp(
        theme: _theme.getTheme(),
        darkTheme: _theme.getTheme(),
        home: Scaffold(
            body: Stack(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            end: BorderSide(
                                width: 1,
                                color: _theme
                                    .getTheme()
                                    .colorScheme
                                    .onBackground
                                    .withAlpha(40)))),
                    padding: EdgeInsets.all(4),
                    child: Column(
                      children: [
                        CustomNavbutton(
                          icons: Icons.home,
                          onPressed: () {},
                          active: true,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        CustomNavbutton(
                          icons: Icons.settings,
                          onPressed: () {},
                          active: false,
                        )
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        DragToMoveArea(
                            child: Container(
                          decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: _theme
                                          .getTheme()
                                          .colorScheme
                                          .onBackground
                                          .withAlpha(40)))),
                          height: 40,
                        )),
                        Flexible(flex: 1, child: a3pages(context)[0])
                      ],
                    ))
              ],
            ),
          ],
        )));
  }
}
