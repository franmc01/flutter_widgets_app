import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final int counterValue = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
      ),
      body: Center(
        child: Text('Value: $counterValue', style: textStyle.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // counterValue++;
      }, child: Icon(Icons.add)),
    );
  }
}