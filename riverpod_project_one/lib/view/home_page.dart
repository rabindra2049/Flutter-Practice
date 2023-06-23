import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      ),
      body: Column(),
    );
  }
}
