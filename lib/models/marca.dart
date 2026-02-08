import 'package:isar_community/isar.dart';
part 'marca.g.dart';

@collection
class Marca {
  Id id = Isar.autoIncrement;

  late String nome;
  String? descricao;
  String? logoPath; // Caminho da imagem do logo
  int quantidadeVeiculos; // Campo calculado ou estático
  List<String>? imagensLoja; // Lista de caminhos de imagens

  Marca({
    required this.nome,
    this.descricao,
    this.logoPath,
    this.quantidadeVeiculos = 0,
    this.imagensLoja,
  });
}