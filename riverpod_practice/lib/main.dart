import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/stream_provider_example.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final nameProvider = Provider((ref) => 'Hello!!!');

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
