import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';


class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      body: const _HomeView()
    );
  }
}


class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      }
      ,
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    
    return ListTile(
      title: Text(menuItem.title),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      subtitle: Text(menuItem.subTitle),
      onTap: (){
        context.push(menuItem.link);
        // context.go(menuItem.link);
        // context.pushNamed(CardsScreen.name);
      },
      leading: Icon(menuItem.icon, color: colors.primary),
    
    );
  }
}

