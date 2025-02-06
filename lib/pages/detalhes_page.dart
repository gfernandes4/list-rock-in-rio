import 'package:flutter/material.dart';
import '../models/atracao.dart';

class DetalhesPage extends StatelessWidget {
  final Atracao atracao;
  final bool isFavorito;
  final ValueChanged<bool> onFavoritoChanged;

  const DetalhesPage({
    Key? key,
    required this.atracao,
    required this.isFavorito,
    required this.onFavoritoChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(atracao.nome, style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 0,
              child: Container(
                child: Center(
                  child: Wrap(
                    spacing: 10, // Espaço entre os Chips
                    runSpacing: 2, // Espaço entre as linhas
                    children: [
                      for (var tag in atracao.tags)
                        Chip(
                          label: Text(
                            '#$tag',
                            style: TextStyle(color: Colors.grey),
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text("Voltar", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
