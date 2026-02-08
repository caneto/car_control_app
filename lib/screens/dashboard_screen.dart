import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/dashboard/dashboard_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Dispara o evento de carregar dados assim que a tela abre
    context.read<DashboardBloc>().add(LoadDashboardData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CarControl Dashboard')),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DashboardError) {
            return Center(child: Text(state.message));
          } else if (state is DashboardLoaded) {
            return RefreshIndicator(
              onRefresh: () async => context.read<DashboardBloc>().add(LoadDashboardData()),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Área de Categorias
                    _buildSectionTitle('Categorias'),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categorias.length,
                        itemBuilder: (ctx, i) => Card(
                          color: Colors.blue.shade100,
                          child: Container(
                            width: 100,
                            alignment: Alignment.center,
                            child: Text(state.categorias[i].nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 2. Área de Destaques (Miniaturas)
                    _buildSectionTitle('Destaques do Mês'),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.carrosDestaque.take(5).length,
                        itemBuilder: (ctx, i) {
                          final carro = state.carrosDestaque[i];
                          return Card(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 140,
                                    color: Colors.grey.shade300,
                                    child: const Icon(Icons.car_rental, size: 50),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(carro.modelo),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 3. Lista de Marcas e Quantidades
                    _buildSectionTitle('Marcas Parceiras'),
                    ...state.marcas.map((marca) => ListTile(
                      leading: CircleAvatar(child: Text(marca.nome[0])),
                      title: Text(marca.nome),
                      trailing: Chip(label: Text('${marca.quantidadeVeiculos} un.')),
                    )),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Navegação via GoRouter
        onPressed: () => context.go('/dashboard/add-carro'), 
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}