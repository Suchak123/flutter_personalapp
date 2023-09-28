import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personalapp/Home.dart';
import 'package:personalapp/aboutus.dart';
import 'package:personalapp/common/routeconstants.dart';
import 'package:personalapp/contact.dart';
import 'site_drawer.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'BebasNeue',
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
    ),
    initialRoute: RouteConstants.initialRoute,
    routes: {
      RouteConstants.initialRoute: (context) => MyApp(),
      RouteConstants.contactRoute: (context) => Contact(),
      RouteConstants.aboutUsRoute: (context) => Aboutus(),
    },
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> screens = [Home(), Aboutus(), Contact()];

  int currentIndex = 0;
  int? selectedIndex;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Title',
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.logout),
          )
        ],
      ),
      //

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (selectedIndex)=>{
      //
      //     setState(() {
      //       currentIndex = selectedIndex;
      //   }),
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: GestureDetector(
      //             onTap: () =>
      //                 Navigator.pushNamed(context, RouteConstants.initialRoute),
      //             child: Icon(FontAwesomeIcons.houseMedical)),
      //         label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: GestureDetector(
      //             onTap: () =>
      //                 Navigator.pushNamed(context, RouteConstants.aboutUsRoute),
      //             child: Icon(Icons.account_box)),
      //         label: 'AboutUs'),
      //
      //     BottomNavigationBarItem(
      //         icon: GestureDetector(
      //             onTap: () =>
      //                 Navigator.pushNamed(context, RouteConstants.contactRoute),
      //             child: Icon(FontAwesomeIcons.youtube)),
      //         label: 'Contact'),
      //   ],
      //   selectedItemColor: Colors.purple,
      //   unselectedItemColor: Colors.black,
      // ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int selectedIndex) => {
            // print('Current Index ${currentIndex}'),
            // print('Selected Index ${selectedIndex}'),
            setState(() {
              currentIndex = selectedIndex;
            }),
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc_outlined),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              label: 'Contact',
            ),
          ],
        ),


      drawer: site_drawer(),
      body: screens.elementAt(currentIndex)
    );
  }
}



