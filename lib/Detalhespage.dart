import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  const DetalhesPage({super.key, required this.atleta});
  final Map<String, dynamic> atleta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        title: Text("Detalhes do Atleta", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [


        
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(45),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("imagens/kimono.png", height: 60),
                  SizedBox(height: 20),
                  _linha("Nome", atleta['nome']),
                  _linha("Equipe", atleta['equipe']),
                  _linha("Idade", atleta['idade']),
                  _linha("Peso", atleta['peso']),
                  _linha("Faixa", atleta['faixa']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _linha(String label, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(valor, style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 126, 125, 122))),
        ],
      ),
    );
  }
}
