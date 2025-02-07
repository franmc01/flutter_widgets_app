import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: Text('Hi, there'),
      action: SnackBarAction(label: 'Close', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Hello World'),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Cancel')),
                FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Acept')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbars and dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  showAboutDialog(
                      context: context, children: [Text('Lorem ipsum')]);
                },
                child: Text('Licencias usadas')),
            FilledButton(
                onPressed: () => openDialog(context),
                child: Text('Mostrar dialogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnackbar(context),
          label: Text('Show snackar'),
          icon: Icon(Icons.remember_me)),
    );
  }
}
