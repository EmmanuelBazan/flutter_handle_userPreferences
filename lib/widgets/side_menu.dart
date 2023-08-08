import 'package:flutter/material.dart';
import 'package:flutter_handle_user_preferences/screens/home.dart';
import 'package:flutter_handle_user_preferences/screens/images.dart';
import 'package:flutter_handle_user_preferences/screens/settings.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _menuHeader(),
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle_outlined),
            title: const Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Images'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, ImagesScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            },
          )
        ],
      ),
    );
  }

  DrawerHeader _menuHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
      child: Container(),
    );
  }
}
