import 'package:flutter/material.dart';
import '../models/evento.dart';

/// Tela de detalhes - recebe dados via construtor (migração de dados)
/// StatelessWidget: os dados já chegaram e não mudam nesta tela.
class DetalheEventoPage extends StatelessWidget {
  final Evento evento;

  const DetalheEventoPage({super.key, required this.evento});

  @override
  Widget build(BuildContext context) {
    final isOlimpiada = evento.tipo == 'olimpiada';

    return Scaffold(
      appBar: AppBar(
        title: Text(isOlimpiada ? 'Detalhe da Olimpíada' : 'Detalhe do Evento'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: isOlimpiada
                    ? Colors.amber[700]
                    : Theme.of(context).colorScheme.primary,
                child: Icon(
                  isOlimpiada ? Icons.emoji_events : Icons.event,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              evento.titulo,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),

            // Informações
            _InfoRow(icon: Icons.calendar_today, label: 'Data', valor: evento.data),
            const SizedBox(height: 12),
            _InfoRow(icon: Icons.location_on, label: 'Local', valor: evento.local),
            const SizedBox(height: 12),
            _InfoRow(icon: Icons.school, label: 'Campus', valor: evento.campus),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.category,
              label: 'Tipo',
              valor: isOlimpiada ? 'Olimpíada' : 'Evento',
            ),
            const SizedBox(height: 28),

            Text(
              'Descrição',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              evento.descricao,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 32),

            // Botão de interesse (exemplo)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Interesse registrado em "${evento.titulo}"!',
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_border),
                label: const Text('Tenho interesse'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget auxiliar reutilizável (Stateless)
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String valor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                valor,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
