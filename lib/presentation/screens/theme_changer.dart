import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChanger extends StatelessWidget {
  static const name = 'theme_changer';

  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // final isDarkMode = ref.watch(isDarkModeProvider);
        final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

        return Scaffold(
          appBar: AppBar(
            title: Text('Theme Changer'),
            actions: [
              IconButton(
                onPressed: (){
                  // ref.read(isDarkModeProvider.notifier).update((state) => !state);
                  ref.read(themeNotifierProvider.notifier).toggleDarkMode();
                },
                icon: Icon(
                  isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                ),
              )
            ],
          ),
          body: _ThemeChangerView(),
        );
      },
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          title: Text('This color', style: TextStyle(color: colors[index])),
          value: index, 
          groupValue: selectedColor,
          activeColor: colors[index], 
          onChanged: (value){
            // ref.read(selectedColorProvider.notifier).update((state) => index);
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          }
        );
      }
    );
  }
}
