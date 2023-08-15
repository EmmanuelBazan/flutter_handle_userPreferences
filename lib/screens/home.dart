import 'package:flutter/material.dart';
import 'package:flutter_handle_user_preferences/shared_preferences/preferences.dart';
import 'package:flutter_handle_user_preferences/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('is darkmode: ${Preferences.isDarkMode}'),
            Divider(),
            Text('Genero: ${Preferences.gender}'),
            Divider(),
            Text('Nombre de usuario: ${Preferences.name}')
          ],
        ),
      ),
    );
  }
}
