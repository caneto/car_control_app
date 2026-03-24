import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../delegates/carro_search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Acessando o estado
    final carroProvider = Provider.of<CarroProvider>(context);
    final carros = carroProvider.carros;

    return Scaffold(
      appBar: AppBar(title: const Text('Meus Veículos'),actions: [
  IconButton(
    icon: const Icon(Icons.search),
    onPressed: () => showSearch(context: context, delegate: CarroSearchDelegate()),
  )
],),
      body: carros.isEmpty
          ? const Center(child: Text('Nenhum carro cadastrado.'))
          : ListView.builder(
              itemCount: carros.length,
              itemBuilder: (ctx, i) {
                final carro = carros[i];
                return ListTile(
                  leading: const Icon(Icons.directions_car),
                  title: Text(carro.modelo),
                  subtitle: Text('${carro.marca} - ${carro.placa}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Removendo item via Provider
                      carroProvider.removeCarro(carro.id);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add'), // Navegação simples com GoRouter
        child: const Icon(Icons.add),
      ),
    );
  }
}