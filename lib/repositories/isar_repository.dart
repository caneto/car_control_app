import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/carro.dart';
import '../models/marca.dart'; // Crie este model similar ao Carro

class IsarRepository {
  late Future<Isar> db;

  IsarRepository() {
    db = _initDB();
  }

  Future<Isar> _initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CarroSchema], // Adicione MarcaSchema se criou
        directory: dir.path,
      );
    }
    return Isar.getInstance()!;
  }

  Future<void> addCarro(Carro carro) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.carros.put(carro);
    });
  }

  Future<List<Carro>> getCarros() async {
    final isar = await db;
    return await isar.carros.where().findAll();
  }

  @override
  Future<void> removeCarro(String id) async {
    // Nota: O Isar usa Int para ID, aqui faríamos a conversão se necessário.
    // Para simplificar, assumiremos conversão de int no provider ou mudança da interface.
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.carros.delete(int.parse(id)); 
    });
  }
}