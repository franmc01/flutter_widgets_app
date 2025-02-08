import 'package:flutter/material.dart';

class UiControls extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ui Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
            title: Text('Developer mode'),
            subtitle: Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) {
              setState(() {
                isDeveloper = !isDeveloper;
              });
            }),
        ExpansionTile(
          title: Text('Vehicule selected'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: Text('By car'),
                subtitle: Text('Travel by car'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.car;
                  });
                }),
            RadioListTile(
                title: Text('By boat'),
                subtitle: Text('Travel by boat'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.boat;
                  });
                }),
            RadioListTile(
                title: Text('By plane'),
                subtitle: Text('Travel by plane'),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.plane;
                  });
                }),
            RadioListTile(
                title: Text('By submarine'),
                subtitle: Text('Travel by submarine'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.submarine;
                  });
                }),
          ],
        ),
        CheckboxListTile(
            title: Text('wantsBreakfast?'),
            value: wantsBreakfast,
            onChanged: (value) {
              setState(() {
                wantsBreakfast = !wantsBreakfast;
              });
            }),
        CheckboxListTile(
            title: Text('wantsLunch?'),
            value: wantsLunch,
            onChanged: (value) {
              setState(() {
                wantsLunch = !wantsLunch;
              });
            }),
        CheckboxListTile(
            title: Text('wantsDinner?'),
            value: wantsDinner,
            onChanged: (value) {
              setState(() {
                wantsDinner = !wantsDinner;
              });
            }),
      ],
    );
  }
}
