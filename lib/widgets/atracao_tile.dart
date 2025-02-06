import 'package:flutter/material.dart';
import 'package:rock_in_rio/widgets/tag_chip.dart';
import '../models/atracao.dart';
import '../pages/detalhes_page.dart';

class AtracaoTile extends StatelessWidget {
  final Atracao atracao;
  final bool isFavorito;
  final ValueChanged<bool> onFavoritoChanged;

  const AtracaoTile({
    Key? key,
    required this.atracao,
    required this.isFavorito,
    required this.onFavoritoChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesPage(
              atracao: atracao,
              isFavorito: isFavorito,
              onFavoritoChanged: onFavoritoChanged,
            ),
          ),
        );
      },
      title: Text(
        atracao.nome,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Wrap(
        spacing: 8,
        runSpacing: 2,
        children: [
          ...atracao.tags.map((tag) => TagChip(tag: tag)).toList(),
        ],
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.indigo,
        child: Text(
          atracao.dia.toString(),
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          onFavoritoChanged(!isFavorito);
        },
        icon: isFavorito
            ? const Icon(Icons.favorite, color: Colors.red)
            : const Icon(Icons.favorite_border),
      ),
    );
  }
}
