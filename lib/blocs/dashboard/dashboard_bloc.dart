import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/isar_repository.dart'; // Seu repositório
import '../../models/marca.dart';
import '../../models/categoria.dart';
import '../../models/carro.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final IsarRepository repository;

  DashboardBloc(this.repository) : super(DashboardLoading()) {
    on<LoadDashboardData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadDashboardData event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    try {
      // Simulando busca em repositório (Você deve implementar esses métodos no IsarRepository)
      // final marcas = await repository.getMarcas(); 
      // final categorias = await repository.getCategorias();
      final carros = await repository.getCarros(); 
      
      // Mockando dados de Marcas/Categorias para o exemplo funcionar imediatamente
      final marcasMock = [Marca(nome: 'Toyota', quantidadeVeiculos: 12)];
      final categoriasMock = [Categoria(nome: 'SUV')];

      emit(DashboardLoaded(
        marcas: marcasMock,
        categorias: categoriasMock,
        carrosDestaque: carros,
      ));
    } catch (e) {
      emit(DashboardError("Erro ao carregar dashboard: $e"));
    }
  }
}