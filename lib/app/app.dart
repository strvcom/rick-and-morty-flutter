import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/app_theme.dart';
import 'package:rick_and_morty/features/characters_list/characters_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getLightTheme(),
      darkTheme: AppTheme.getDarkTheme(),
      themeMode: ThemeMode.system,
      home: const CharactersListPage(),
    );
  }
}
