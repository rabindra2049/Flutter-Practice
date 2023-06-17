import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/main.dart';

class StateNotifierProviderExample extends ConsumerWidget {
  const StateNotifierProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod"),
      ),
      body: Center(child: Text('$count')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(countStateProvider.notifier).increment();
          // one of way
          //   ref.read(counterProvider.notifier).state++;
          //next way
          //ref.read(countStateProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
