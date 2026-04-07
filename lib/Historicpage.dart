import 'package:flutter/material.dart';
import 'package:flutter_application_1/Detalhespage.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({
    super.key,
    required this.historic,
    required this.atletas,
    required this.onUpdate,
    required this.onDelete,
  });

  final List<String> historic;
  final List<Map<String, dynamic>> atletas;
  final Function(int, Map<String, dynamic>) onUpdate;
  final Function(int) onDelete;

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {

  void editarAtleta(int index) {
    final atleta = widget.atletas[index];
    final nomeController = TextEditingController(text: atleta['nome']);
    final equipeController = TextEditingController(text: atleta['equipe']);
    final idadeController = TextEditingController(text: atleta['idade']);
    final pesoController = TextEditingController(text: atleta['peso']);
    final faixaController = TextEditingController(text: atleta['faixa']);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 192, 192, 192),
          title: Text("Editar Atleta", style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nomeController, decoration: InputDecoration(labelText: "Nome", labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)))),
            TextField(controller: equipeController, decoration: InputDecoration(labelText: "Equipe", labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)))),
            TextField(controller: idadeController, decoration: InputDecoration(labelText: "Idade", labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)))),
            TextField(controller: pesoController, decoration: InputDecoration(labelText: "Peso", labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)))),
            TextField(controller: faixaController, decoration: InputDecoration(labelText: "Faixa", labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)))),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              final novoAtleta = {
                'nome': nomeController.text,
                'equipe': equipeController.text,
                'idade': idadeController.text,
                'peso': pesoController.text,
                'faixa': faixaController.text,
              };
              widget.onUpdate(index, novoAtleta);
              setState(() {});
              Navigator.pop(context);
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico", style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
        centerTitle: true,
      ),
      body: widget.atletas.isEmpty
          ? Center(child: Text("Nenhum histórico ainda."))
          : ListView.builder(
              itemCount: widget.atletas.length,
              itemBuilder: (context, index) {
                final atleta = widget.atletas[index];
                return Card(
                  color: const Color.fromARGB(255, 126, 125, 122),
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetalhesPage(atleta: atleta),
                        ),
                      );
                    },
                    leading: Image.asset("imagens/kimono.png", height: 50, color: const Color.fromARGB(255, 255, 255, 255),),
                    title: Text("Nome: ${atleta['nome']}", style: TextStyle(color: Colors.white)),
                    subtitle: Text("Equipe: ${atleta['equipe']} | Idade: ${atleta['idade']} | Peso: ${atleta['peso']} | Faixa: ${atleta['faixa']}", style: TextStyle(color: Colors.white)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () => editarAtleta(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.white),
                          onPressed: () {
                            widget.onDelete(index);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }