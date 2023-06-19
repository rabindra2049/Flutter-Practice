import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(Duration(seconds: 2), ((count) => count));
});

class StreamProviderExample extends ConsumerWidget {
  const StreamProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod"),
      ),
      body: streamData.when(
          data: (data) {
            return Text(data.toString());
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () {
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
