import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ThemeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ThemeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey.withOpacity(0.01),
      leading: IconButton(
        icon: const Icon(IconlyLight.category),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(IconlyLight.notification),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(IconlyLight.search),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
