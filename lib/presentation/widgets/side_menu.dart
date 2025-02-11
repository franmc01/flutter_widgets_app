import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (value) => setState(() {
        navDrawerIndex = value;
        Navigator.of(context).pop();
        context.push(appMenuItems[value].link);
      }),
      selectedIndex: navDrawerIndex, 
      children: [
        ...appMenuItems.map((item) => (
          NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          )
        )
      )]
    );
  }
}
