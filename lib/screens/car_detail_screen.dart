import 'package:flutter/material.dart';
import '../models/carro.dart';

class CarDetailScreen extends StatefulWidget {
  final Carro carro;
  const CarDetailScreen({super.key, required this.carro});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  List<Map<String, dynamic>> _reviews = [];

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  Future<void> _loadReviews() async {
    final reviews = await DBHelper().getReviews(widget.carro.id);
    setState(() => _reviews = reviews);
  }

  void _addReviewDialog() {
    final comentarioController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Avaliar Carro'),
        content: TextField(
          controller: comentarioController,
          decoration: const InputDecoration(hintText: 'Digite seu comentário...'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          FilledButton(
            onPressed: () async {
              await DBHelper().insertReview(widget.carro.id, 5, comentarioController.text);
              _loadReviews(); // Recarrega a lista
              if (mounted) Navigator.pop(ctx);
            },
            child: const Text('Avaliar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.carro.modelo)),
      body: Column(
        children: [
          // Cabeçalho do Carro
          Container(
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Column(
              children: [
                const Icon(Icons.directions_car, size: 80),
                Text(widget.carro.marca, style: Theme.of(context).textTheme.headlineSmall),
                Text('Ano: ${widget.carro.ano} • Placa: ${widget.carro.placa}'),
              ],
            ),
          ),
          
          // Lista de Reviews
          Expanded(
            child: _reviews.isEmpty
                ? const Center(child: Text('Nenhuma avaliação ainda.'))
                : ListView.builder(
                    itemCount: _reviews.length,
                    itemBuilder: (ctx, i) {
                      final r = _reviews[i];
                      return ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.star, size: 16)),
                        title: Text(r['comentario']),
                        subtitle: Text('Nota: ${r['nota']}'),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addReviewDialog,
        label: const Text('Avaliar'),
        icon: const Icon(Icons.rate_review),
      ),
    );
  }
}