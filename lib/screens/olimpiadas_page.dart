import 'package:flutter/material.dart';
import '../models/evento.dart';
import 'detalhe_evento_page.dart';

/// Lista de olimpíadas - StatelessWidget (apenas exibe dados)
class OlimpiadasPage extends StatelessWidget {
  const OlimpiadasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final olimpiadas =
        eventosExemplo.where((e) => e.tipo == 'olimpiada').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Olimpíadas'),
        automaticallyImplyLeading: false,
      ),
      body: olimpiadas.isEmpty
          ? const Center(child: Text('Nenhuma olimpíada no momento.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: olimpiadas.length,
              itemBuilder: (context, index) {
                final evento = olimpiadas[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber[700],
                      child: const Icon(Icons.emoji_events, color: Colors.white),
                    ),
                    title: Text(
                      evento.titulo,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('📅 ${evento.data}'),
                          Text('📍 ${evento.local}'),
                          Text('🏫 ${evento.campus}'),
                        ],
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Passagem do objeto Evento para a tela de detalhes
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetalheEventoPage(evento: evento),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
