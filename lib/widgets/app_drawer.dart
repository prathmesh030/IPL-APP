import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Widget drawerMenuItems(
      BuildContext context, String title, IconData iconName, Function navFun) {
    return ListTile(
        leading: Icon(
          iconName,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        onTap: navFun);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.4)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 200,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/country_flags/IPL-logo.png",
                  height: 100,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "IPL 2021",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
          drawerMenuItems(context, "Teams", Icons.group, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          drawerMenuItems(context, "Settings", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed('/settings');
          }),
        ],
      ),
    );
  }
}
