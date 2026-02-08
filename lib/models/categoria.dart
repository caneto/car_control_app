import 'package:isar_community/isar.dart';
part 'categoria.g.dart';

@collection
class Categoria {
  Id id = Isar.autoIncrement;

  late String nome; // Ex: SUV, Sedan, Hatch
  String? descricao;
  List<String>? imagensExemplo;

  Categoria({
    required this.nome,
    this.descricao,
    this.imagensExemplo,
  });
}