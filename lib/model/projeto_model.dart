class ProjetoModel {
  final String tipo;
  final String titulo;
  final String descricao;
  final List<String> tags;
  final List<String> images;

  const ProjetoModel({
    required this.tipo,
    required this.titulo,
    required this.descricao,
    required this.tags,
    required this.images,
  });
}
