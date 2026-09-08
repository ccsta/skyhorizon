# ✈️ SkyHorizon Airlines - Core System

Núcleo operacional do sistema de emissão de passagens aéreas e atendimento ao cliente da SkyHorizon Airlines. Desenvolvido inteiramente em Dart com foco em Orientação a Objetos e segurança de dados utilizando o recurso de Null-Safety.

Projeto construído como requisito da Avaliação Formativa I da disciplina de Programação para Dispositivos Móveis da Universidade Municipal de São Caetano do Sul (USCS).

**Professor:** Prof. Ms. Raphael Lopes de Souza
**Desenvolvedor:** Cauê Costa Cardoso

---

## 🚀 Tecnologias e Conceitos Aplicados

Este sistema servirá de base para o desenvolvimento de futuros aplicativos móveis. O código foi estruturado de forma incremental, aplicando os seguintes pilares da POO:

*   **Abstração e Agregação:** Modelagem de entidades de apoio (Passageiro, Plataforma de Venda e Atendente) agregadas à classe principal de controle de passagens.
*   **Null-Safety:** Uso do operador `?` para inicialização segura de variáveis sem valores definidos.
*   **Construtores Nomeados:** Implementação de Named Constructors flexíveis (`somenteCodigo`, `completa`, `all`) utilizando a keyword `required` para parâmetros obrigatórios.
*   **Encapsulamento:** Proteção do código localizador da passagem com métodos Getters e Setters nativos da linguagem Dart (operador `=>`) e lógicas de validação contra strings vazias e nulas.
*   **Herança e Polimorfismo:** Criação da subclasse especializada para o serviço exclusivo de luxo SkyHorizon First Class, com sobrescrita de comportamentos via `@override`.
*   **Mixins:** Injeção de funções independentes de registro de log e auditoria de segurança na classe de Primeira Classe utilizando a palavra-chave `with` para contornar a ausência de herança múltipla no Dart.

---

## ⚙️ Como Executar

Certifique-se de ter o Dart SDK instalado.

1. Clone este repositório:
```bash
git clone https://github.com/ccsta/skyhorizon.git 
