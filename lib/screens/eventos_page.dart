import 'package:flutter/material.dart';
import '../models/evento.dart';
import 'detalhe_evento_page.dart';

/// Lista de eventos (não-olimpiadas) - pode ser Stateless se os dados forem fixos
class EventosPage extends StatelessWidget {
  const EventosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final eventos = eventosExemplo.where((e) => e.tipo == 'evento').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos do Campus'),
        automaticallyImplyLeading: false,
      ),
      body: eventos.isEmpty
          ? const Center(child: Text('Nenhum evento no momento.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: eventos.length,
              itemBuilder: (context, index) {
                final evento = eventos[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: const Icon(Icons.event, color: Colors.white),
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
                      // Navegação com passagem de dados (migração de dados)
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
