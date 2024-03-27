#language: pt
#encoding: utf-8


Funcionalidade: 04 - Visualizar
  Como usuário que possui permissão, quero visualizar uma requisição de despesa para validação de dados.

  Contexto:
    Dado que exista requisição na lista de requisições:
      |Código|Fornecedor     |Tipo         |Classificação                |Centro de Custo|Data de Vencimento|valor     |status      |Ações                                          |
      |1     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |2     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |3     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Desabilitado|Visualizar Habilitar/Desabilitar Editar Excluir|
      |4     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
  Cenario: Visualizar Projeto
    Quando o usuário clicar em visualizar projeto
      |Código|Fornecedor     |Tipo         |Classificação                |Centro de Custo|Data de Vencimento|valor     |status      |Ações                                          |
      |1     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
    Então Então o sistema apresenta os dados de forma desabitlitada.
  Cenário: Voltar
    Quando o usuário solicita voltar "Voltar"
    Então redireciona para a tela "Requisição de Despesas"

  Cenário: Protótipo
  ![image](Visualizar.png)

