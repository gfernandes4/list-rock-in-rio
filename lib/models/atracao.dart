class Atracao {
  final String nome;
  final int dia;
  final List<String> tags;

  const Atracao(this.nome, this.dia, this.tags);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Atracao && other.nome == nome && other.dia == dia;
  }

  @override
  int get hashCode => nome.hashCode ^ dia.hashCode;
}
