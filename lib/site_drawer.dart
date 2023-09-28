// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personalapp/side_nav_model.dart';
// import 'side_nav_model.dart';

class site_drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // UserAccountsDrawerHeader(
          //     accountName: Text("Suchak ko Project"),
          //     accountEmail: Text("suchak@god.com"),),

          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Image(
                image: Image.asset('assets/images/download2.jpg').image,
                fit: BoxFit.fill,
              )),
          ...sideNavList.map((element) => ListTile(
                leading: Icon(element.iconData),
                title: Text(element.title ?? 'Home'),
                subtitle: Text(element.subtitle ?? 'Subtitle'),
              )),
        ],
      ),
    );
  }
}
