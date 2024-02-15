// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aka_chat/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              DrawerHeader(
                child: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ),
              ),

              //home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              //settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 25),
                child: ListTile(
                    title: Text("S E T T I N G S"),
                    leading: Icon(Icons.settings),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsPage(),
                          ));
                    }),
              ),
            ],
          ),

          //logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
