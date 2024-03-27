#language: pt
#encoding: utf-8

Funcionalidade:  06-Excluir
  Como usuário do sistema que possui permissão de acesso a funcionalidade para Manter Requisições de despesas,
  quero Excluir uma requisição.

  Contexto:
    Dado que exista requisição na lista de requisições:
      |Código|Fornecedor     |Tipo         |Classificação                |Centro de Custo|Data de Vencimento|valor     |status      |Ações                                          |
      |1     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |2     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |3     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Desabilitado|Visualizar Habilitar/Desabilitar Editar Excluir|
      |4     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|

  Cenário: Excluir Requisição
    Quando o usuário clica em Excluir requisição
    E o sistema apresenta a mensagem: "Deseja realmente Excluir a requisição selecionada ?"
    E o usuário confirma
    Então o sistema apresenta a mensagem "Requisição Excluir com sucesso!" e Exclui a requisição



  Cenário: Protótipo
  ![image](Excluir.png)