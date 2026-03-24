import 'package:car_control_app/repositories/isar_repository.dart';
import 'package:flutter/material.dart';

import '../models/carro.dart';
import '../screens/car_detail_screen.dart';

class CarroSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Carro>>(
      future: IsarRepository.searchCarros(query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        final results = snapshot.data!;
        
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (ctx, i) {
            final carro = results[i];
            return ListTile(
              title: Text(carro.modelo),
              subtitle: Text(carro.marca),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => CarDetailScreen(carro: carro),
                ));
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => const Center(child: Text('Digite para buscar...'));
}