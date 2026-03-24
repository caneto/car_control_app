import 'package:isar_community/isar.dart';

part 'carro.g.dart';

@collection
class Carro {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value) // Adiciona índice para buscas rápidas
  late String modelo;
  @Index(type: IndexType.value) 
  late String marca;
  late int ano;
  late String placa;
  String? imagemPath;

  Carro({
    required this.modelo,
    required this.marca,
    required this.ano,
    required this.placa,
    this.imagemPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'modelo': modelo,
      'marca': marca,
      'ano': ano,
      'placa': placa,
    };
  }

  factory Carro.fromMap(Map<String, dynamic> map) {
    return Carro(
      modelo: map['modelo'],
      marca: map['marca'],
      ano: map['ano'],
      placa: map['placa'],
    );
  }
}