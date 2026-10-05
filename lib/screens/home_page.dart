import 'package:flutter/material.dart';
import 'eventos_page.dart';
import 'olimpiadas_page.dart';
import 'perfil_page.dart';

/// Tela principal com BottomNavigationBar - StatefulWidget
/// Controla o índice da aba selecionada e a troca de conteúdo.
class HomePage extends StatefulWidget {
  final String emailUsuario;

  const HomePage({super.key, required this.emailUsuario});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;

  late final List<Widget> _telas;

  @override
  void initState() {
    super.initState();
    _telas = [
      const EventosPage(),
      const OlimpiadasPage(),
      PerfilPage(emailUsuario: widget.emailUsuario),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indiceAtual,
        onDestinationSelected: (index) {
          setState(() => _indiceAtual = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.event_outlined),
            selectedIcon: Icon(Icons.event),
            label: 'Eventos',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events_outlined),
            selectedIcon: Icon(Icons.emoji_events),
            label: 'Olimpíadas',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
