#language: pt
#encoding: utf-8

Funcionalidade: 01 - Listar
  Como usuário do sistema que possui permissão de acesso a funcionalidade para Pesquisar requisição de despesas, quero
  listar as requisições existentes:

  Contexto:
    Dado que exista os dados de requisições cadastradas:

      |Código|Fornecedor     |Tipo         |Classificação                |Centro de Custo|Data de Vencimento|valor     |status      |Ações                                          |
      |1     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |2     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |3     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Desabilitado|Visualizar Habilitar/Desabilitar Editar Excluir|
      |4     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|

  Cenário: Listar Requisições
    Quando o usuário solicita a página de requisições
    Então o sistema apresenta os dados:
      |Código|Fornecedor     |Tipo         |Classificação                |Centro de Custo|Data de Vencimento|valor     |status      |Ações                                          |
      |1     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |2     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |01/05/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |3     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |20/06/2023        |R$5.250,60|Desabilitado|Visualizar Habilitar/Desabilitar Editar Excluir|
      |4     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |22/07/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|

  Cenario: Requisição não Encontrada
    Dado que o usuário solicita a listagem
    E E preenche os filtros com, no mínimo, uma das informações
      | Tipo | Fornecedor | Centro de Custo | Recorrente | Projeto | Requisitante (Múltiplos) | Data de Documento Inicial | Data de Documento Final | Data de Vencimento Inicial | Data de Vencimento Final | Parcelada | Classificação da Despesa
    E o sistema verifica que não existem requisições correspondentes
      |Código | Fornecedor     | Tipo      | Classificação                 | Centro de Custo | Data de Vencimento | Valor       | Status         | Ações                                          |
    Então o sistema retorno a mensagem: "Nenhuma requisição encontrada!"

  Cenário: Pesquisar
    Quando o usuário informar os dados de requisição que quer filtrar
      |Fornecedor     |Tipo         |Classificação                |Centro de Custo|Data de Vencimento|
      |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |
    Então o sistema apresenta os dados:
      |Código|Fornecedor     |Tipo         |Classificação                |Centro de Custo|Data de Vencimento|valor     |status      |Ações                                          |
      |1     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|


  Cenário: Pesquisa com campo Vazio
    Quando uma pesquisa for iniciada sem nenhum campo preenchido:
      | Tipo                      | Fornecedor              | Centro de Custo            | Recorrente               | Projeto | Requisitante (Múltiplos)
      | Data de Documento Inicial | Data de Documento FInal | Data de Vencimento Inicial | Data de Vencimento Final | Parcela | Classofocação da Despesa
    Então o sistema apresenta uma mensagem de "Nenhum campo foi selecionado"
    E não aparecerá nada


  Cenário: Ordenação de tabela
    Quando o usuário solicita na tabela de requisição para ordenar
    E o sistema permite ao usuário ordenar os registros de forma ascendente/descendete ao clicar na respeciva coluna, no cabeçalho da tabela
    E permite essa ação nas colunas CODIGO, FORNECEDOR, TIPO, CLASSIFICAÇÃO, CENTRO DE CUSTO, DATA DE VENCIMENTO, VALOR e STATUS
    Então o sitema exibe a tabela ordenada de acordo com a seleção
      |Código|Fornecedor     |Tipo         |Classificação                |Centro de Custo|Data de Vencimento|valor     |status      |Ações                                          |
      |1     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |2     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |01/05/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |3     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |20/06/2023        |R$5.250,60|Desabilitado|Visualizar Habilitar/Desabilitar Editar Excluir|
      |4     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |22/07/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|


  Cenário: Ajustar tabela
    Dado que o usuário tenha permissão para alterar o tamanho padrão da tabela
    Quando o usuário tentar "alterar o tamanho ca coluna" arrastando as linhas da coluna.
      |Código | Fornecedor     | Tipo      | Classificação                 | Centro de Custo   | Data de Vencimento | Valor       | Status      | Ações
    Então o sistema apresenta alterações em tempo real.

  Cenário: Resetar Tabela padrão
    Dado que o usuário tenha alterado o tamanho padrão da tabela
    E tenha alterado qualquer elemento das colunas
      |Código | Fornecedor     | Tipo      | Classificação                 | Centro de Custo   | Data de Vencimento | Valor       | Status      | Ações
    Quando o usuário solicita "Resetar Tabela"
    Então o sistema reseta o layout da tabela para as configurações iniciais




  Cenário: Protótipo
  ![image](Listar.png)