import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/main.dart';

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod"),
      ),
      body: userData.when(
          data: (data) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
              return ListTile(
                title: Text("${data[index].firstName}"),
                subtitle: Text("${data[index].email}"),
                leading: CircleAvatar(
                  child: Image.network(data[index].avatar!!),
                ),
              );
            });
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () {
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
