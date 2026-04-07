import 'package:flutter/material.dart';
import 'package:flutter_application_1/Historicpage.dart';

class Competicao_TC extends StatefulWidget {
  const Competicao_TC({super.key});

  @override
  State<Competicao_TC> createState() => _Competicao_TCPageState();
}

class _Competicao_TCPageState extends State<Competicao_TC>{
    late List<String> historic;

  List<Map<String, dynamic>> atletas = [];

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController equipeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController faixaController = TextEditingController();

  @override
  void initState() {
    historic = [];
    super.initState();

  }

    void adicionarAtleta(){
    setState((){
        atletas.add({
            'nome': nomeController.text,
            'equipe': equipeController.text,
            'idade': idadeController.text,
            'peso': pesoController.text,
            'faixa': faixaController.text,
    });

  historic.add(
      "Nome: ${nomeController.text} | Equipe: ${equipeController.text} | Idade: ${idadeController.text} | Peso: ${pesoController.text} | Faixa: ${faixaController.text}"
    );
      });

  nomeController.clear();
  equipeController.clear();
  idadeController.clear();
  pesoController.clear();
  faixaController.clear();
}

@override

Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
            title: Text("Inscrição de Atleta", style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
            backgroundColor:  const Color.fromARGB(255, 0, 0, 0),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            ),

        body: Container(
          
          child: Stack(
            children: [
              // Xadrez
              Positioned.fill(
                child: CustomPaint(
                  painter: XadrezBordaPainter(),
                ),
              ),     
            Container(

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                
              ),
              
              margin: EdgeInsets.all(45),
              child: Padding(
                padding: const EdgeInsets.all(20.0),

                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

              children: [

                SizedBox(height: 10),
                TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: "Nome")
                ),

                SizedBox(height: 10),
                TextField( 
                controller: equipeController,
                decoration: InputDecoration(labelText: "Equipe")                
                ),

                SizedBox(height: 10),
                TextField(
                controller: idadeController,
                decoration: InputDecoration(labelText: "Idade")                
                ),

                SizedBox(height: 10),
                TextField(
                controller: pesoController,
                decoration: InputDecoration(labelText: "Peso")                
                ),

                SizedBox(height: 10),
                TextField(
                controller: faixaController,
                decoration: InputDecoration(labelText: "Faixa")
                ),

                SizedBox(height: 30),

          ElevatedButton(
            onPressed: adicionarAtleta,
            child: Text("Adicionar Atleta"),
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 126, 125, 122),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HistoricPage(
                      historic: historic,
                      atletas: atletas,
                      onUpdate: (index, atleta) {
                        setState(() {
                          atletas[index] = atleta;
                          historic[index] = "Nome: ${atleta['nome']} | Equipe: ${atleta['equipe']} | Idade: ${atleta['idade']} | Peso: ${atleta['peso']} | Faixa: ${atleta['faixa']}";
                        });
                      },
                      onDelete: (index) {
                        setState(() {
                          atletas.removeAt(index);
                          historic.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 126, 125, 122),
                foregroundColor: Colors.white,
              ),
              child: Text("Visualizar Histórico"),
            ),
          ],
        ),
        ),
            ),
      ],
      ),
      ),
    );
  }
}

class XadrezBordaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const squareSize = 20.0;
    const borderWidth = 40.0;

    final paintPreto = Paint()..color = Colors.black.withOpacity(0.5);
    final paintBranco = Paint()..color = Colors.white.withOpacity(0.5);

    void drawFaixa(double x, double y, double w, double h) {
      for (double dy = y; dy < y + h; dy += squareSize) {
        for (double dx = x; dx < x + w; dx += squareSize) {
          final isPreto = ((dx / squareSize).floor() + (dy / squareSize).floor()) % 2 == 0;
          canvas.drawRect(
            Rect.fromLTWH(dx, dy, squareSize, squareSize),
            isPreto ? paintPreto : paintBranco,
          );
        }
      }
    }

    drawFaixa(0, 0, size.width, borderWidth);
    drawFaixa(0, size.height - borderWidth, size.width, borderWidth);
    drawFaixa(0, borderWidth, borderWidth, size.height - borderWidth * 2);
    drawFaixa(size.width - borderWidth, borderWidth, borderWidth, size.height - borderWidth * 2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}