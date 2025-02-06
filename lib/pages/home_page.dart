import 'package:flutter/material.dart';
import '../models/atracao.dart';
import 'favoritos_page.dart';
import '../widgets/atracao_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  final List<Atracao> _listaFavoritos = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atrações', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Lista", icon: Icon(Icons.list)),
            Tab(text: "Favoritos", icon: Icon(Icons.favorite)),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.5),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: listaAtracao.length,
            itemBuilder: (context, index) {
              return AtracaoTile(
                atracao: listaAtracao[index],
                isFavorito: _listaFavoritos.contains(listaAtracao[index]),
                onFavoritoChanged: (bool value) {
                  setState(() {
                    if (value) {
                      _listaFavoritos.add(listaAtracao[index]);
                    } else {
                      _listaFavoritos.remove(listaAtracao[index]);
                    }
                  });
                },
              );
            },
          ),
          FavoritosPage(favoritos: _listaFavoritos),
        ],
      ),
    );
  }
}

const listaAtracao = [
  Atracao("Iron Maiden", 4, ["Rock", "Metal", "Novo Álbum", "The best", "Top 10"]),
  Atracao("Foo Fighters", 5, ["Rock", "Alternativo", "Sucesso"]),
  Atracao("Anitta", 6, ["Pop", "Funk"]),
  Atracao("Justin Bieber", 7, ["Pop", "Romântico", "Reconhecimento"]),
  Atracao("Dua Lipa", 8, ["Pop", "Eletrônico", "Sucesso"]),
  Atracao("Ivete Sangalo", 9, ["Axé", "Brasil", "Carnaval"]),
  Atracao("Alok", 10, ["Eletrônico", "DJ", "Sucesso"]),
  Atracao("Marília Mendonça", 11, ["Sertanejo", "Brasil", "Sucesso"]),
  Atracao("Roupa Nova", 12, ["MPB", "Romântico", "Top 100"]),
  Atracao("Guns N' Roses", 13, ["Rock", "Metal", "Sucesso"]),
  Atracao("Queen", 14, ["Rock", "Clássico", "Top 10"]),
  Atracao("The Weeknd", 15, ["Pop", "R&B"]),
  Atracao("Coldplay", 16, ["Rock", "Alternativo", "Sucesso"]),
  Atracao("Ariana Grande", 17, ["Pop", "Romântico", "Sucesso"]),
  Atracao("Wesley Safadão", 18, ["Forró", "Brasil", ]),
  Atracao("Jorge & Mateus", 19, ["Sertanejo", "Brasil", ]),
  Atracao("Luan Santana", 20, ["Sertanejo", "Brasil", "Novo Álbum"]),
  Atracao("Gusttavo Lima", 21, ["Sertanejo", "Brasil", ]),
  Atracao("Ferrugem", 22, ["Pagode", "Brasil", ]),

];