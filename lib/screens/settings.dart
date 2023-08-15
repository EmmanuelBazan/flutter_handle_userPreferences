import 'package:flutter/material.dart';
import 'package:flutter_handle_user_preferences/providers/theme_provider.dart';
import 'package:flutter_handle_user_preferences/shared_preferences/preferences.dart';
import 'package:flutter_handle_user_preferences/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkmode = false;
  // int gender = 1;
  // String name = 'Emmanuel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        drawer: const SideMenu(),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Ajustes',
              style: TextStyle(fontSize: 30),
            ),
            const Divider(),
            SwitchListTile(
              value: Preferences.isDarkMode,
              onChanged: (value) {
                Preferences.isDarkMode = value;
                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);

                value
                    ? themeProvider.setDarkMode()
                    : themeProvider.setLightMode();

                setState(() {});
              },
              title: const Text('Darkmode'),
            ),
            const Divider(),
            RadioListTile(
              value: 1,
              groupValue: Preferences.gender,
              onChanged: (value) {
                Preferences.gender = value!;
                setState(() {});
              },
              title: const Text('Masculino'),
            ),
            const Divider(),
            RadioListTile(
              value: 2,
              groupValue: Preferences.gender,
              onChanged: (value) {
                Preferences.gender = value!;
                setState(() {});
              },
              title: const Text('Femenino'),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: TextFormField(
                initialValue: Preferences.name,
                onChanged: (value) {
                  Preferences.name = value;
                  setState(() {});
                },
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuario',
                ),
              ),
            )
          ]),
        ));
  }
}
