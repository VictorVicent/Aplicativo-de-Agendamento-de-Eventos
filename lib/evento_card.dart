import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class EventoCard extends StatelessWidget {
  final String imagem;
  final String nome;
  final String tipo;
  final DateTime data;
  final String local;
  final Function onTap;

  EventoCard({
    required this.imagem,
    required this.nome,
    required this.tipo,
    required this.data,
    required this.local,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage('assets/$imagem'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tipo: $tipo',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Data: ${DateFormat('dd/MM/yyyy HH:mm').format(data)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Local: $local',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
