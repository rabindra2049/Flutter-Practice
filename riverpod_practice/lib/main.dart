import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/api_service.dart';
import 'package:riverpod_practice/counter_demo.dart';
import 'package:riverpod_practice/state_provider_example.dart';
import 'package:riverpod_practice/stream_provider_example.dart';

import 'future_provider_example.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final nameProvider = Provider((ref) => 'Hello!!!');

final counterProvider = StateProvider<int>((ref) => 0);

final countStateProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

final apiProvider = Provider<ApiService>((ref) => ApiService());

final userDataProvider =
    FutureProvider<List<UserModel>>((ref) => ref.read(apiProvider).getUser());

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(Duration(seconds: 2), ((count) => count));
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StreamProviderExample(),
    );
  }
}

class MyHomePageWithStateFulWidget extends ConsumerStatefulWidget {
  const MyHomePageWithStateFulWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePageWithStateFulWidget> createState() =>
      _MyHomePageWithStateFulWidgetState();
}

class _MyHomePageWithStateFulWidgetState
    extends ConsumerState<MyHomePageWithStateFulWidget> {
  @override
  void initState() {
    super.initState();
    final name = ref.read(nameProvider);
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod"),
      ),
      body: Center(child: Text(name)),
    );
  }
}

class MyHomePageWithOutConsumerWidget extends StatelessWidget {
  const MyHomePageWithOutConsumerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final name = ref.watch(nameProvider);
            return Text(name);
          },
        ),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod"),
      ),
      body: Center(child: Text(name)),
    );
  }
}
