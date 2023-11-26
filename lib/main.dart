import 'package:eventos/minhascores.dart';
import 'package:flutter/material.dart';
import './evento_card.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(EventosApp());
}

class EventosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventos App',
      theme: ThemeData(
        fontFamily: "Roboto",
      ),
      home: EventosHomePage(),
    );
  }
}

class Evento {
  final String imagem;
  final String nome;
  final String descricao;
  final String tipo;
  final DateTime data;
  final String local;
  final bool online;

  Evento({
    required this.imagem,
    required this.nome,
    required this.descricao,
    required this.tipo,
    required this.data,
    required this.local,
    required this.online,
  });
}

int paginaAtual = 0;

class EventosHomePage extends StatefulWidget {
  @override
  _EventosHomePageState createState() => _EventosHomePageState();
}

class _EventosHomePageState extends State<EventosHomePage> {
  List<Evento> eventos = [
    Evento(
      imagem: 'images/rock.jpg',
      nome: 'SHOW DE ROCK',
      descricao: 'É O ROCK PARCERO',
      tipo: 'Festa',
      data: DateTime(2023, 11, 20, 18, 0),
      local: 'BAR DO SEU ZÉ',
      online: false,
    ),
    Evento(
      imagem: 'images/pokemon.jpg',
      nome: 'Encontrão: Pokemon GO',
      descricao: 'Venha participar da maior rinha de pokemons!',
      tipo: 'Reunião',
      data: DateTime(2023, 11, 25, 20, 0),
      local: 'Gonzaga, Santos',
      online: false,
    ),
    Evento(
      imagem: 'images/artificial.jpg',
      nome: 'INTELIGÊNCIA ARTIFICIAL E O NOVO CONTEXTO DA CULTURA DIGITAL',
      descricao: 'Conheça e aprenda conceitos da INTELIGÊNCIA ARTIFICIAL ',
      tipo: 'Aula',
      data: DateTime(2023, 11, 25, 20, 0),
      local: 'Youtube',
      online: true,
    ),
    Evento(
      imagem: 'images/geek.jpg',
      nome: 'Festival Geek Santos 2023',
      descricao: 'Venha participar do maior evento geek da baixada santista!',
      tipo: 'Festa',
      data: DateTime(2023, 11, 01, 9, 0),
      local: 'Praça Mauá - Santos',
      online: false,
    ),
    Evento(
      imagem: 'images/santos.jpeg',
      nome: 'CONVOCAÇÃO DE TODO SANTISTA',
      descricao:
          'Chamando todos os santista da baixada, reunião com o rei e oração ao Pelé',
      tipo: 'Reunião',
      data: DateTime(2024, 03, 15, 14, 0),
      local: 'Estádio Urbano Caldeira - Vila Belmiro, Santos',
      online: false,
    ),
    Evento(
      imagem: 'images/xp.jpg',
      nome: 'FORTNITE: NOVO GLITCH DE XP',
      descricao:
          'Quer subir de nivel rapido? Aprenda a como fazer esse glitch!',
      tipo: 'Aula',
      data: DateTime(2023, 12, 16, 22, 0),
      local: 'Youtube',
      online: true,
    ),
  ];

  String filtroTipo = 'Todos';
  bool exibirListView =
      true; // Adicionando uma flag para alternar entre ListView e PageView
  PageController pageController =
      PageController(); // Controlador para a PageView

  bool mostrarTextoDesenvolvedores =
      false; //Para mostrar o nome dos desenvolvedores

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            mostrarTextoDesenvolvedores = !mostrarTextoDesenvolvedores;
          });
        },
        child: Icon(Icons.info),
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        backgroundColor: MinhasCores.azulEscuro,
        elevation: 0,
        title: Text(
          'Próximos Eventos',
          style: TextStyle(
            color: Color.fromARGB(255, 233, 233, 233),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          DropdownButton<String>(
            value: filtroTipo,
            onChanged: (String? newValue) {
              setState(() {
                filtroTipo = newValue!;
              });
            },
            items: [
              for (var item in [
                'Todos',
                'Aula',
                'Reunião',
                'Festa',
                'Curso',
                'Webinar',
                'Workshop'
              ])
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
            ],
          ),
          IconButton(
            icon: Icon(
              exibirListView ? Icons.view_list : Icons.view_carousel,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              setState(() {
                exibirListView = !exibirListView;
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MinhasCores.AzulTopoGradiente,
              MinhasCores.AzulBaixoGradiente,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            exibirListView
                ? ListView.builder(
                    itemCount: eventos.length,
                    itemBuilder: (context, index) {
                      Evento evento = eventos[index];
                      if (filtroTipo == 'Todos' || filtroTipo == evento.tipo) {
                        return EventoCard(
                          imagem: evento.imagem,
                          nome: evento.nome,
                          tipo: evento.tipo,
                          data: evento.data,
                          local: evento.local,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetalhesEventoPage(evento: evento),
                              ),
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
                : Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: eventos
                              .where((evento) =>
                                  filtroTipo == 'Todos' ||
                                  filtroTipo == evento.tipo)
                              .length,
                          itemBuilder: (context, index) {
                            List<Evento> eventosFiltrados = eventos
                                .where((evento) =>
                                    filtroTipo == 'Todos' ||
                                    filtroTipo == evento.tipo)
                                .toList();
                            if (index < eventosFiltrados.length) {
                              Evento evento = eventosFiltrados[index];
                              return EventoCard(
                                imagem: evento.imagem,
                                nome: evento.nome,
                                tipo: evento.tipo,
                                data: evento.data,
                                local: evento.local,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetalhesEventoPage(evento: evento),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container(); // Retornar uma visualização vazia se não houver evento correspondente
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              if (pageController.page != 0) {
                                pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              if (pageController.page! < eventos.length - 1) {
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
            mostrarTextoDesenvolvedores
                ? Positioned(
                    bottom: 80.0,
                    right: 16.0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Desenvolvedores:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'André Luiz F. Martins',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Victor Vicente',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Pedro Estevam',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Diego Sampaio',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class DetalhesEventoPage extends StatelessWidget {
  final Evento evento;

  DetalhesEventoPage({required this.evento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MinhasCores.azulEscuro,
        title: Text(
          'Detalhes do Evento',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MinhasCores.AzulTopoGradiente,
              MinhasCores.AzulBaixoGradiente,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/${evento.imagem}',
                width: 470,
                height: 470,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  evento.nome,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Tipo: ${evento.tipo}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Data: ${DateFormat('dd/MM/yyyy HH:mm').format(evento.data)}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Local: ${evento.local}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Online: ${evento.online ? 'Sim' : 'Não'}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Descrição:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                evento.descricao,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
