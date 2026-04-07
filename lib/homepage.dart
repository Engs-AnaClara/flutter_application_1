import 'package:flutter/material.dart';
import 'package:flutter_application_1/Competicao_TC.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 192, 192),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("imagens/logo.png"),
            SizedBox(height: 20),
            Text(
              "Training & Combat",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Gerenciamento de atletas",
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 37, 37, 37),
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Competicao_TC()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 115, 113, 116),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text("Entrar", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}