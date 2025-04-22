import 'package:flutter/material.dart';
import 'package:navigation/auth/auth_services.dart';
import 'package:navigation/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    //get auth service
    // ignore: no_leading_underscores_for_local_identifiers
    final _auth = AuthServices();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              DrawerHeader(
                child: Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profilLogo.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                  //color: Theme.of(context).colorScheme.primary,
                ),
              ),

              // home list tile
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    //pop the drawer
                    Navigator.pop(context);
                  },
                ),
              ),

              // settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ListTile(
                  title: Text("S E T T I N G S"),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    //pop the drawer
                    Navigator.pop(context);

                    // navigate to settings page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ),
            ],
          ),

          // Logout list tile#
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 25),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
