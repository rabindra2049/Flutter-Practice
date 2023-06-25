import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MovieFilterSection extends StatelessWidget {
  const MovieFilterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search movies, series...',
                filled: true,
                fillColor: Colors.grey.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                isDense: true,
                prefixIcon: const Icon(IconlyLight.search),
              ),
              style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.8)),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade50,
            ),
            child: IconButton(
              icon: const Icon(IconlyLight.filter),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
