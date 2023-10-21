import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) => const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Search a plant ...',
          prefixIcon: Icon(
            Icons.search,
            size: 24.0,
            color: AppColors.grey6,
          ),
        ),
      );
}
