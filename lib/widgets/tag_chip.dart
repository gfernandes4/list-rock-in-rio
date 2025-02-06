import 'package:flutter/material.dart';

// Definindo um widget customizado para o Chip com borda
class TagChip extends StatelessWidget {
  final String tag;

  const TagChip({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        '#$tag',
        style: TextStyle(color: Colors.grey),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
