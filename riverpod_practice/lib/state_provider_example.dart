import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final count = ref.watch(counterProvider);
    ref.listen(counterProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("The value is $next")));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('State Provider'),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(counterProvider);
                // print(ref.refresh(counterProvider));
                //ref.refresh(counterProvider);
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text(count.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // one of way
          //   ref.read(counterProvider.notifier).state++;
          //next way
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
