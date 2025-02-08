// import 'package:flutter/material.dart' show IconData;

import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(title: 'Botones', subTitle: 'Varios botones en flutter', link: '/buttons', icon: Icons.smart_button_outlined),
  MenuItems(title: 'Tarjetas', subTitle: 'Un contenedor estilizado', link: '/cards', icon: Icons.credit_card), 
  MenuItems(title: 'Progress Indicators', subTitle: 'Generales y controlados', link: '/progress', icon: Icons.refresh_rounded), 
  MenuItems(title: 'Snackbars and Dialogs', subTitle: 'Indicadores en pantalla', link: '/snackbars', icon: Icons.dialer_sip), 
  MenuItems(title: 'Animated', subTitle: 'Ejercicios de animaciones', link: '/animated', icon: Icons.animation), 
  MenuItems(title: 'UI Controls', subTitle: 'Ejercicios de  ui controls', link: '/ui-controls', icon: Icons.control_point), 
  MenuItems(title: 'Tutorial', subTitle: 'Ejercicios de onboarding', link: '/tutorial', icon: Icons.slideshow), 
];
