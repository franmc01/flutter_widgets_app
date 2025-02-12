import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final counterValue = ref.watch(counterProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
          )
        ],
      ),
      body: Center(
        child: Text('Value: $counterValue', style: textStyle.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // ref.read(counterProvider.notifier).state++;
            ref.read(counterProvider.notifier).update((state) => state + 1);
          },
          child: Icon(Icons.add)),
    );
  }
}
