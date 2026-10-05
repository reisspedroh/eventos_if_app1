class Evento {
  final String id;
  final String titulo;
  final String descricao;
  final String data;
  final String local;
  final String tipo; // 'olimpiada' ou 'evento'
  final String campus;

  const Evento({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.data,
    required this.local,
    required this.tipo,
    required this.campus,
  });
}

/// Dados de exemplo baseados em eventos reais do IFSULDEMINAS
final List<Evento> eventosExemplo = [
  const Evento(
    id: '1',
    titulo: '15ª OLIP - Olimpíada Interna de Programação',
    descricao:
        'Competição de resolução de problemas algorítmicos nos moldes da Maratona de Programação. '
        'Podem participar alunos de cursos de Informática de todos os campi, individualmente ou em equipes de até 3 pessoas. '
        'Linguagens: C, C++, Java ou Python.',
    data: '20/06/2026',
    local: 'Laboratórios de Informática - Campus Muzambinho',
    tipo: 'olimpiada',
    campus: 'Muzambinho',
  ),
  const Evento(
    id: '2',
    titulo: 'OMIF - Olimpíada de Matemática das Instituições Federais',
    descricao:
        'Olimpíada de Matemática idealizada pelo IFSULDEMINAS. '
        'Estudantes de todos os campi participam das fases regional e nacional. '
        'Em 2025 o Campus Poços de Caldas conquistou medalha de ouro.',
    data: 'Novembro 2026',
    local: 'A definir (fase nacional)',
    tipo: 'olimpiada',
    campus: 'Todos os campi',
  ),
  const Evento(
    id: '3',
    titulo: 'JIFs - Jogos das Instituições Federais (fase local)',
    descricao:
        'Competições esportivas em 11 modalidades: futsal, vôlei, handebol, basquete, '
        'tênis de mesa, atletismo, judô, natação, futebol, xadrez e vôlei de areia. '
        'Mais de 800 estudantes de todos os campi participam.',
    data: 'Agosto 2026',
    local: 'Campus sede (a definir)',
    tipo: 'evento',
    campus: 'Todos os campi',
  ),
  const Evento(
    id: '4',
    titulo: 'OBMEP - Olimpíada Brasileira de Matemática das Escolas Públicas',
    descricao:
        'Olimpíada nacional de Matemática para estudantes de escolas públicas. '
        'O Campus Muzambinho tem histórico de várias medalhas de bronze e regionais.',
    data: '1ª fase: maio | 2ª fase: setembro',
    local: 'Provas aplicadas no próprio campus',
    tipo: 'olimpiada',
    campus: 'Todos os campi',
  ),
  const Evento(
    id: '5',
    titulo: 'ONHB - Olimpíada Nacional em História do Brasil',
    descricao:
        'Competição organizada pela Unicamp que estimula o estudo crítico da História do Brasil '
        'por meio de análise de documentos e resolução de problemas históricos.',
    data: 'Inscrições em 2026 (a confirmar)',
    local: 'Online / fases presenciais',
    tipo: 'olimpiada',
    campus: 'Todos os campi',
  ),
  const Evento(
    id: '6',
    titulo: 'Projeto Formação para Olimpíadas do Conhecimento',
    descricao:
        'Seleção de estudantes dos cursos técnicos integrados para preparação em Matemática, '
        'Física e Astronomia. Ajuda de custo de R\$ 150,00 mensais por até 10 meses.',
    data: 'Inscrições conforme edital do campus',
    local: 'Campus Poços de Caldas (e outros)',
    tipo: 'evento',
    campus: 'Poços de Caldas',
  ),
];
