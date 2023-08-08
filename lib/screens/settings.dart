import 'package:flutter/material.dart';
import 'package:flutter_handle_user_preferences/widgets/side_menu.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: const Center(
        child: Text('SettingsScreen'),
      ),
    );
  }
}
