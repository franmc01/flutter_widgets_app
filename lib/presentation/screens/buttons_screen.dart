import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons Screen"),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: Icon(Icons.arrow_outward_outlined)),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            ElevatedButton(
                onPressed: null, child: const Text('Elevated disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                label: Text('Elevated icon'),
                icon: Icon(Icons.usb_rounded)),
            FilledButton.icon(
                onPressed: () {},
                label: Text('Elevated icon'),
                icon: Icon(Icons.account_balance_wallet_outlined)),
            FilledButton(onPressed: () {}, child: const Text("Filled")),
            OutlinedButton(onPressed: () {}, child: const Text("Outlined")),
            OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.terminal),
                label: const Text("Bash ")),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.link_outlined),
                label: const Text("Linux ")),
            TextButton(onPressed: () {}, child: const Text("TextButton")),
            IconButton(onPressed: () {}, icon: Icon(Icons.macro_off)),
            CustomButton()
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Material(
          color: colors.primary,
          child: InkWell(
            onTap: () {
              
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Text(
                  "Custom Button", 
                  style: TextStyle(color: Colors.white)
                )
              ),
          )),
    );
  }
}
