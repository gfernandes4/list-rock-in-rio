import 'package:flutter/material.dart';
import 'package:rock_in_rio/widgets/tag_chip.dart';
import '../models/atracao.dart';

class FavoritosPage extends StatelessWidget {
  final List<Atracao> favoritos;

  const FavoritosPage({Key? key, required this.favoritos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoritos.isEmpty
          ? const Center(child: Text("Nenhuma atração favorita."))
          : ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoritos[index].nome),
                  subtitle: Wrap(
                    spacing: 8,
                    runSpacing: 2,
                    children: favoritos[index]
                        .tags
                        .take(3)
                        .map((tag) => TagChip(tag: tag,))
                        .toList(),


                  ),
                );
              },
            ),
    );
  }
}
