import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project_one/service/provider.dart';
import 'package:riverpod_project_one/view/widgets/cast_list_widget.dart';

class CastList extends ConsumerWidget {
  const CastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casts = ref.watch(castProvider);
    return casts.when(
        data: (data) => CastListWidget(data: data),
        error: ((error, stackTrace) => Text(
            key:ValueKey("errorKey"),
            error.toString())),
        loading: (() {
          return const CircularProgressIndicator();
        }));
  }
}
