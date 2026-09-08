// ==========================================
// EXERCÍCIO 1: Abstração e Classes de Apoio
// ==========================================

class Passageiro {
  String? nome;
  String? cpf;
  String? rg;
  String? email;
  String? celular;
}

class PlataformaVenda {
  int? codigoCanal;
  String? nomeCanal;
}

class Atendente {
  String? nome;
  String? matricula;
  String? cargo;
  String? email;
  String? celular;
  double? salario;
}

// ==========================================
// EXERCÍCIO 2: Agregação e Construtor Não Nomeado
// ==========================================

class Passagem {
  // Atributo privado encapsulado (iniciado com string vazia)
  String? _codigoLocalizador = "";

  // Atributos agregados das classes de apoio
  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  // Construtor Não Nomeado (padrão)
  Passagem();
  // ==========================================
  // EXERCÍCIO 3: Flexibilização com Construtores Nomeados
  // ==========================================

  // Inicializa apenas o código localizador
  Passagem.somenteCodigo(String codigoLocalizador) {
    this._codigoLocalizador = codigoLocalizador;
  }

  // Recebe todos os atributos como parâmetros posicionais
  Passagem.completa(
    String codigoLocalizador,
    this.passageiro,
    this.plataforma,
    this.atendente,
    this.observacoes,
  ) {
    this._codigoLocalizador = codigoLocalizador;
  }

  // ==========================================
  // EXERCÍCIO 4: Parâmetros Nomeados e Clareza
  // ==========================================

  // Parâmetros nomeados (entre chaves) e opcionais
  Passagem.codigoEPassageiro({String? codigoLocalizador, this.passageiro}) {
    if (codigoLocalizador != null) {
      this._codigoLocalizador = codigoLocalizador;
    }
  }

  // Parâmetro posicional obrigatório + nomeados (com uso do required)
  Passagem.all(
    String codigoLocalizador, {
    required this.passageiro,
    required this.plataforma,
    required this.atendente,
    this.observacoes,
  }) {
    this._codigoLocalizador = codigoLocalizador;
  }
  // ==========================================
  // EXERCÍCIO 5 e 6: Encapsulamento (Getters e Setters)
  // ==========================================

  // Getter tradicional (Ex. 5)
  String? getCodigoLocalizador() {
    return _codigoLocalizador;
  }

  // Setter tradicional com validação (Ex. 5)
  void setCodigoLocalizador(String? codigo) {
    if (codigo == null || codigo.isEmpty) {
      print("Código localizador de passagem inválido!");
      return; // Interrompe a execução
    }
    _codigoLocalizador = codigo;
  }

  // Getter nativo do Dart usando Arrow Function (Ex. 6)
  String? get codigoLocalizador => _codigoLocalizador;

  // Setter nativo do Dart com validação (Ex. 6)
  set codigoLocalizador(String? codigo) {
    if (codigo == null || codigo.isEmpty) {
      print("Código localizador de passagem inválido!");
      return;
    }
    _codigoLocalizador = codigo;
  }

  // ==========================================
  // EXERCÍCIO 7: Comportamentos e Métodos de Negócio
  // ==========================================

  void EmitirPassagem() {
    print("Passagem emitida com sucesso!");
  }

  bool CancelarPassagem() {
    print("Passagem cancelada com sucesso!");
    return true;
  }

  void AtualizarPassagem() {
    print("Passagem atualizada com sucesso!");
  }

  Passagem ConsultarPassagem(String codigo) {
    print("Passagem consultada com sucesso!");
    return Passagem(); // Retorna uma nova instância vazia
  }
}
// ==========================================
// EXERCÍCIO 9: Reutilização de Código com Mixins
// ==========================================

mixin Logger {
  void log(String mensagem) {
    print(mensagem);
  }
}

mixin Auditoria {
  void auditar(String mensagem) {
    print("[Auditoria]: $mensagem");
  }
}

// ==========================================
// EXERCÍCIO 8 e 10: Herança e Sobrescrita
// ==========================================

class PassagemPrimeiraClasse extends Passagem with Logger, Auditoria {
  // Atributo específico da classe filha (Ex. 8)
  String? loungeAcesso;

  // Construtor herdando de super.all com required (Ex. 8)
  PassagemPrimeiraClasse(
    String codigoLocalizador, {
    required Passageiro? passageiro,
    required PlataformaVenda? plataforma,
    required Atendente? atendente,
    String? observacoes,
    required this.loungeAcesso,
  }) : super.all(
         codigoLocalizador,
         passageiro: passageiro,
         plataforma: plataforma,
         atendente: atendente,
         observacoes: observacoes,
       );

  // Sobrescrita Polimórfica executando Mixins (Ex. 10)
  @override
  void AtualizarPassagem() {
    print("Passagem de Primeira Classe atualizada com sucesso!");
    log(
      "Alteração realizada pelo atendente: ${atendente?.nome ?? 'Desconhecido'}",
    );
    auditar("Verificação de segurança realizada para a Primeira Classe.");
  }
}

// ==========================================
// EXERCÍCIO 10: Execução Geral
// ==========================================

void main() {
  // 1. Criando entidades de apoio para testar
  var passageiro1 = Passageiro()..nome = "Cauê Cardoso";
  var passageiro2 = Passageiro()..nome = "Sarah";
  var atendente = Atendente()..nome = "Raphael";
  var plataforma = PlataformaVenda()..nomeCanal = "App Mobile";

  print("--- TESTANDO PASSAGEM PADRÃO ---");
  var passagemComum = Passagem();
  passagemComum.codigoLocalizador = "LOC123"; // Testando o setter
  passagemComum.EmitirPassagem();

  print("\n--- TESTANDO PASSAGEM COMPLETA ---");
  var passagemAll = Passagem.all(
    "LOC456",
    passageiro: passageiro1,
    plataforma: plataforma,
    atendente: atendente,
  );
  passagemAll.AtualizarPassagem();

  print("\n--- TESTANDO PRIMEIRA CLASSE (HERANÇA E MIXINS) ---");
  var passagemVip = PassagemPrimeiraClasse(
    "VIP789",
    passageiro: passageiro2,
    plataforma: plataforma,
    atendente: atendente,
    loungeAcesso: "Sala VIP Internacional",
  );
  passagemVip.AtualizarPassagem();
}
