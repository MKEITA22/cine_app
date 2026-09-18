import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),

      child: TextField(
        onChanged: onChanged,

        decoration: InputDecoration(
          labelText: 'Rechercher un film',

          hintText: 'Exemple : Inception',

          prefixIcon: const Icon(
            Icons.search,
          ),

          suffixIcon: const Icon(
            Icons.movie,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}