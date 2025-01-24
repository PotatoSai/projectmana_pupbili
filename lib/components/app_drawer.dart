import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/app_drawer_tile.dart';
import 'package:projectmana_pupbili/pages/map_page.dart';
import 'package:projectmana_pupbili/pages/settings_page.dart';
import 'package:projectmana_pupbili/services/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list tile

          MyDrawerTile(
              text: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
          ),


          //setting list title
          MyDrawerTile(
              text: "M A P",
              icon: Icons.map_rounded,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  MyMap(),),
                );
              }
          ),

          MyDrawerTile(
              text: "S E T T I N G",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage(),),
                );
              }
          ),

          Spacer(),

          //Logout
          MyDrawerTile(
              text: "L O G O U T",
              icon: Icons.logout,
              onTap: logout
          ),

          const SizedBox(height: 25,),
        ],
      ),
    );
  }
}
