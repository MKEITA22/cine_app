import 'package:flutter/material.dart';

class GenreChip extends StatelessWidget {
  final String genre;
  final bool selected;
  final VoidCallback onSelected;

  const GenreChip({
    super.key,
    required this.genre,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(genre),
      selected: selected,
      onSelected: (_) => onSelected(),
    );
  }
}