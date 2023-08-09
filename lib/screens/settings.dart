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
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Ajustes',
              style: TextStyle(fontSize: 30),
            ),
            const Divider(),
            SwitchListTile(
              value: true,
              onChanged: (value) {},
              title: const Text('Darkmode'),
            ),
            const Divider(),
            RadioListTile(
              value: 1,
              groupValue: 1,
              onChanged: (value) {},
              title: const Text('Masculino'),
            ),
            const Divider(),
            RadioListTile(
              value: 1,
              groupValue: 1,
              onChanged: (value) {},
              title: const Text('Femenino'),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: TextFormField(
                initialValue: 'Emmanuel',
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
