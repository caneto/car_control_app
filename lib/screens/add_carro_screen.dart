import 'dart:io'; // Para lidar com arquivos de imagem
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import 'scanner_screen.dart';

class AddCarroScreen extends StatefulWidget {
  const AddCarroScreen({super.key});

  @override
  State<AddCarroScreen> createState() => _AddCarroScreenState();
}

class _AddCarroScreenState extends State<AddCarroScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _modeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _anoController = TextEditingController();
  
  final _placaController = TextEditingController(); // Certifique-se de ter este controller
  File? _imagemSelecionada;

  // Função para tirar foto
  Future<void> _tirarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imagemSelecionada = File(pickedFile.path);
      });
    }
  }

  // Função para abrir o scanner
  Future<void> _escanearPlaca() async {
    // Navega para a tela de scanner e aguarda o resultado
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (resultado != null) {
      setState(() {
        _placaController.text = resultado; // Preenche o campo automaticamente
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Veículo Premium')),
      body: SingleChildScrollView( // Importante para telas com teclado
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Use a key definida anteriormente
          child: Column(
            children: [
              // --- ÁREA DA FOTO ---
              GestureDetector(
                onTap: _tirarFoto,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                    image: _imagemSelecionada != null
                        ? DecorationImage(
                            image: FileImage(_imagemSelecionada!),
                            fit: BoxFit.cover,
                          )
                        : null,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: _imagemSelecionada == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                            Text('Toque para tirar foto'),
                          ],
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 20),
Row(
                children: [
                  Expanded(
                    child: _buildInput(
                      controller: _anoController,
                      label: 'Ano',
                      icon: Icons.calendar_today,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return 'Informe o ano';
                        if (int.tryParse(value) == null) return 'Inválido';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildInput(
                      controller: _placaController,
                      label: 'Placa',
                      icon: Icons.tag,
                      validator: (value) => value!.length < 7 ? 'Placa incompleta' : null,
                    ),
                  ),
                ],
              ),
              // ... Inputs de Modelo, Marca, Ano ...

              // --- INPUT DE PLACA COM SCANNER ---
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _placaController,
                      decoration: const InputDecoration(
                        labelText: 'Placa ou Código',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton.filledTonal(
                    onPressed: _escanearPlaca,
                    icon: const Icon(Icons.qr_code_scanner),
                    iconSize: 30,
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Botão Salvar
              FilledButton(
                onPressed: () {
                   // Ao salvar, passe _imagemSelecionada?.path para o Provider/Model
                   // Lembre-se de atualizar seu método addCarro para aceitar String? imagePath
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.save), SizedBox(width: 8), Text('SALVAR')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Método auxiliar para criar inputs bonitos
  Widget _buildInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  void _saveCarro() {
    if (_formKey.currentState!.validate()) {
      Provider.of<CarroProvider>(context, listen: false).addCarro(
        _modeloController.text,
        _marcaController.text,
        int.parse(_anoController.text),
        _placaController.text,
      );
      context.pop(); // Volta para a Home
    }
  }
}