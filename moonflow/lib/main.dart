import 'package:firebase_core/firebase_core.dart';
import 'package:navigation/auth/auth_gate.dart';
import 'package:navigation/firebase_options.dart';

import 'package:flutter/material.dart';

import 'package:navigation/pages/welcome_page.dart';
import 'package:navigation/pages/messages_page.dart';
import 'package:navigation/pages/forum_page.dart';
import 'package:navigation/pages/partner_page.dart';
import 'package:navigation/pages/today_page.dart';
import 'package:navigation/components/my_drawer.dart';
import 'components/CustomApp_Bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Color.fromARGB(200, 207, 144, 246),
          labelTextStyle: WidgetStateProperty.all(
            TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          iconTheme: WidgetStateProperty.all(IconThemeData(size: 22)),
        ),

        colorSchemeSeed: Color.fromRGBO(90, 52, 116, 1),
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false, //enlever la barre rouge

      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/auth': (context) => const AuthGate(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final pages = [
    //liste de Widget( MessagesPage, Forum...,...)/ final pou declarer Pages
    TodayPage(),
    MessagesPage(),
    ForumPage(),
    PartnerPage(),
  ];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //var appBar = CustomAppBar();
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: NavigationBar(
          selectedIndex:
              pageIndex, //indique la destination actuelle, si c'est a 1 ca veut dire que nous sommes a Today et today est colorié
          onDestinationSelected: (int index) {
            setState(() {
              pageIndex = index;
            });
          },
          backgroundColor: Color.fromRGBO(220, 200, 250, 0.7),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: "Today",
            ),
            NavigationDestination(icon: Icon(Icons.message), label: "Messages"),
            NavigationDestination(icon: Icon(Icons.masks), label: "Forum"),
            NavigationDestination(icon: Icon(Icons.people), label: "Partner"),
          ],
        ),
      ),

      drawer: MyDrawer(),
      appBar: CustomAppBar(),
    );
  }
}
