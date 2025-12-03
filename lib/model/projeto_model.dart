class ProjetoModel {
  final String tipo;
  final String titulo;
  final String descricao;
  final List<String> images;
  final List<String> tags;
  final String url;

  const ProjetoModel({
    required this.tipo,
    required this.titulo,
    required this.descricao,
    required this.images,
    this.tags = const [],
    this.url = '',
  });
}
