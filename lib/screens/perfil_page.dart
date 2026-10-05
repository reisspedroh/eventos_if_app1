import 'package:flutter/material.dart';
import 'login_page.dart';

/// Tela de Perfil - recebe o e-mail do usuário logado (migração de dados)
class PerfilPage extends StatelessWidget {
  final String emailUsuario;

  const PerfilPage({super.key, required this.emailUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 48,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                emailUsuario.isNotEmpty
                    ? emailUsuario[0].toUpperCase()
                    : 'U',
                style: const TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Usuário logado',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              emailUsuario,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Sobre o aplicativo'),
              subtitle: const Text(
                'Centraliza olimpíadas e eventos do IFSULDEMINAS',
              ),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Eventos & Olimpíadas IF',
                  applicationVersion: '1.0.0',
                  applicationLegalese:
                      'Hands-on 1 – LP3\nIFSULDEMINAS – Campus Muzambinho – 2026',
                );
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Sai da conta e volta ao Login (limpa a pilha de navegação)
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  'Sair da conta',
                  style: TextStyle(color: Colors.red),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
