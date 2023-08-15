import 'package:flutter/material.dart';
import 'package:flutter_handle_user_preferences/providers/theme_provider.dart';
import 'package:flutter_handle_user_preferences/screens/home.dart';
import 'package:flutter_handle_user_preferences/screens/images.dart';
import 'package:flutter_handle_user_preferences/screens/settings.dart';
import 'package:flutter_handle_user_preferences/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        ImagesScreen.routeName: (_) => const ImagesScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
