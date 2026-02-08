part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
  @override
  List<Object> get props => [];
}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<Marca> marcas;
  final List<Categoria> categorias;
  final List<Carro> carrosDestaque;

  const DashboardLoaded({
    this.marcas = const [],
    this.categorias = const [],
    this.carrosDestaque = const [],
  });

  @override
  List<Object> get props => [marcas, categorias, carrosDestaque];
}

class DashboardError extends DashboardState {
  final String message;
  const DashboardError(this.message);
}