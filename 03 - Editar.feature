#language: pt
#encoding: utf-8


Funcionalidade: 03 - Editar
  Como usuário que possui permissão, quero editar uma requisição de despesa para atualização.

  Contexto
    Dado que exista os dados de Requisição de Despesas:
      | Tipo | Fornecedor | Detalhamento | Valor | Data de Vencimento | Requisitante | Demais Requisinates | Classificação de Despesas | Centro de Custo | Data de Emissão do Documento | Projeto | Método de Pagamento | Tipo de Intervalo | Quantas vezes Gerar | Referência do Documento | Justificativa |

  Cenário: Codificação de campos

    Quando o usuário solicita editar <Editar> uma nova requisição de despesas
    Então com base no código <Código> o sistema apresenta os campos e exibe sua descrição <Descrição>

      #Exemplos:

      | Código | Descrição                   |
      | 1.1    | Tipo                        |
      | 1.2    | Fornecedor                  |
      | 1.3    | Detalhamento                |
      | 1.4    | Valor                       |
      | 1.5    | Data de vencimento          |
      | 1.6    | Requisitante                |
      | 1.7    | Demais Requisitnates        |
      | 1.8    | Classificação da Despesa    |
      | 1.9    | Centro de Custo             |
      | 1.10   | Data de Emissão do Documento|
      | 1.11   | Projeto                     |
      | 1.12   | Método de Pagamento         |
      | 1.13   | Gerar Quantas Vezes         |
      | 1.14   | Tipo de Intervalo           |
      | 1.15   | Anexo do Documento          |
      | 1.16   | Referência do Documento     |
      | 1.17   | Justificativa               |
      | 1.18   | Rateio entre Classificações |
      | 1.19   | Rateio entre Requisitantes  |
      | 1.20   | Rateio entre Centro de Custo|

  Cenário: Verificar Tipo do Dado, tamanho, máscara e obrigatoriedade.
    Quando o usuário solicita editar <Editar> nova requisição de despesas
    E informa o valor <Valor Informado> para o campo <Código do Campo>
    Então o sistema verifica o tipo do dado informado <Tipo do dado>, tamanho <Tamanho>, máscara de edição <Máscara de Edição> e a obrigatoriedade <Obrigatório>
    E apresenta o resultado <Resultado>

      #Exemplos:
      | Valor Informado  | Código do Campo | Tipo do dado | Tamanho | Máscara de Edição |	Resultado       | Obrigatório   |
      | -  -             | 1.1             | Seleção      | -     - | -  -              | -  -            | Sim           |
      | EMAGE SOLUÇÕES   | 1.2             | Seleção      | -   - | -  -              | EMAGE SOLUÇÕES  | Sim           |
      | -  -             | 1.3             | Texto        | 3000    | -  -              | -  -            | Sim           |
      | 53063,29         | 1.4             | Monetário    | 19,2    | R$ 9.999,99       | -  -            | Sim           |
      | 30042023         | 1.5             | Data         | -  -    | 99/99/9999        | 30/04/2023      | Sim           |
      | André Souza      | 1.6             | Seleção      | -  -    | -  -              | André Souza     | Sim           |
      | -  -             | 1.7             | Seleção      | -  -    | -  -              | -  -            | Não           |
      | -  -             | 1.8             | Seleção      | -  -    | -  -              | -  -            | Sim           |
      | -  -             | 1.9             | Seleção      | -  -    | -  -              | -  -            | Sim           |
      | 15032023         | 1.10            | Data         | -  -    | 99/99/9999        | 15/03/2023      | Sim           |
      | LB20220053       | 1.11            | Seleção      | -  -    | -  -              | LB20220053      | Não           |
      | Recorrente       | 1.12            | Radio button | -  -    | -  -              | Recorrente      | Sim           |
      | 2 vezes ao todo  | 1.13            | Seleção      | -  -    | -  -              | 2 vezes ao todo | Não           |
      | Meses            | 1.14            | Seleção      | -  -    | -  -              | Meses           | Não           |
      | arquivo.pdf      | 1.15            | arquivo      | -  -    | -  -              | arquivo.pdf     | Não           |
      | NFN002023051     | 1.16            | Texto        | 100     | -  -              | NFN002023051    | Não           |
      | -  -             | 1.17            | Texto        | 5000    | -  -              | -  -            | Não           |
      | Percentual       | 1.18            | Radio button | -  -    | -  -              | Percentual      | Não           |
      | Percentual       | 1.19            | Radio button | -  -    | -  -              | Percentual      | Não           |
      | Percentual       | 1.20            | Radio button | -  -    | -  -              | Percentual      | Não           |


  Cenário: Valores padrões para campos de seleção
    Quando o usuário solicita editar <Editar> uma nova requisição de respesas
    E seleciona um campo <Campo> com a função seletor (drop down) a partir da descrição <Descrição> desejada
    Então o sistema exibe as opções de seleção
    E apresenta o valor padrão <Valor Padrão>

      #Exemplos:
      | Campo | Valor Padrão | Descrição                     |
      | 1.1   | 1            | Pagamento                     |
      | 1.2   | 2            | Adiantamento                  |
      | 1.3   | 3            | Reembolso                     |
      | 2.1   | 1            | EMAGE SOLUÇÕES                |
      | 6.1   | 1            | André Souza                   |
      | 7.1   | 1            | Magno Duarte                  |
      | 7.2   | 2            | Miguel Costa                  |
      | 7.3   | 3            | Marcelo Oliveira              |
      | 8.1   | 1            | Compra de Licança de Software |
      | 8.2   | 2            | Aluguel de Equipamentos       |
      | 8.3   | 3            | Compra de Equipamentos        |
      | 9.1   | 1            | projetos                      |
      | 9.2   | 2            | Administração                 |
      | 9.3   | 3            | RH                            |
      | 11.1  | 1            | LB20220053                    |
      | 13.1  | 1            | 2 vezes ao todo               |
      | 13.2  | 2            | 3 vezes ao todo               |
      | 13.3  | 3            | 4 vezes ao todo               |
      | 14.1  | 1            | Semanas                       |
      | 14.2  | 2            | Meses                         |


  Cenário:Campos de seleção multiplas
    Quando o usuário solicita editar <Editar> uma nova requisição de despesas
    E selecionar o Campo <Campo> a partir da Descrição <Descrição> desejada
    Então o sistema exibe as opções de seleção
    E o usuário seleciona uma opção
    E depois pode selecionar outra opção
      |Cód. Campo |Valor do Campo  |
      |1.7        |Projetos        |
      |1.7        |RH

  Cenário: Rateio entre Classificações
    Quando o usuário clicar em editar nova requisição
    Então o sistema apresenta as informações do Rateio entre Classificações

      |Requisitante                   |Percentual |Valor  |Ações          |
      |Compra de Licença de Software  |50%        |30,00  |Editar Excluir |
      |Compra de Equipamentos         |50%        |30,00  |Editar Excluir |

  Cenário: Exclusão no Rateio entre Classificações
    Quando o usuário clicar em excluir no Rateio
    Então o sistema Exclui as informações do registro selecionado em Rateio entre Classificações

      |Requisitante                   |Percentual |Valor  |Ações          |
      |Compra de Licença de Software  |50%        |30,00  |Editar Excluir |
      |Compra de Equipamentos         |50%        |30,00  |Editar Excluir |

  Cenário: Rateio entre Requisitantes
    Quando o usuário clicar em editar nova requisição
    Então o sistema apresenta as informações do Rateio entre Requisitantes

      |Requisitante            |Percentual |Valor  |Ações          |
      |André Souza             |30%        |30,00  |Editar Excluir |
      |Magno Duarte            |30%        |30,00  |Editar Excluir |
      |Miguel Costa            |20%        |20,00  |Editar Excluir |
      |Marcelo Oliveira        |20%        |20,00  |Editar Excluir |

  Cenário: Exclusão Rateio entre Requisitantes
    Quando o usuário clicar em excluir no Rateio
    Então o sistema Exclui as informações do registro selecionado em Rateio entre Requisitantes

      |Requisitante            |Percentual |Valor  |Ações          |
      |André Souza             |30%        |30,00  |Editar Excluir |
      |Magno Duarte            |30%        |30,00  |Editar Excluir |
      |Miguel Costa            |20%        |20,00  |Editar Excluir |
      |Marcelo Oliveira        |20%        |20,00  |Editar Excluir |

  Cenário: Rateio entre Centro de custos
    Quando o usuário clicar em editar nova requisição
    Então o sistema apresenta as informações do Rateio entre Centro de Custos

      |Requisitante          |Percentual |Valor  |Ações          |
      |Projetos              |30%        |30,00  |Editar Excluir |
      |Administrativo        |30%        |30,00  |Editar Excluir |
      |RH                    |20%        |20,00  |Editar Excluir |

  Cenário: Excluir Rateio entre Centro de custos
    Quando o usuário clicar em excluir no Rateio
    Então o sistema Exclui as informações do registro selecionado em Rateio entre Centro de custos

      |Requisitante          |Percentual |Valor  |Ações          |
      |Projetos              |30%        |30,00  |Editar Excluir |
      |Administrativo        |30%        |30,00  |Editar Excluir |
      |RH                    |20%        |20,00  |Editar Excluir |

  Cenário: Salvar Nova Requisição de Despesas
    Quando o usuário solicita editar <Editar> uma nova requisição de despesas
    E preenche com, no mínimo, os dados obrigatórios
    E salva <Salvar> a nova requisição de despesas
    Então o sistema apresenta a mensagem: "Nova requisição salva com sucesso!" e permanece na tela de edição

  Cenário: Salvar faltando campos obrigatório
    Dado que usuário tentar salvar uma requisição.
    E estiver faltando campos obrigatórios.
    E o usuário irá receber a mensagem "Campo Obrigatório vazio".
    E ele ficará impossibilitado de salvar até preencher tudo.
    Quando ele voltar e preencher todas as informações orbigatórias.
    E tentar salvar novamente.
    Então o usuário recebe a mensagem "Requisição Salva".


  Cenário: Cancelar criação de Nova Requisição de Despesas
    Quando o usuário cancela <Cancelar> a nova requisição de despesas
    Então o sistema apresenta a mensagem: " Os dados inseridos não serão salvos, deseja cancelar ?"
    E apresenta opções de botões <Sim> e <Não>

  Cenário: Efetivando o cancelamento
    Dado que o usuário seleciona a opção sim <Sim>
    Então o sistema limpa todos os campos preenchidos
    E volta para a tela requisição de despesas <Requisição de Despesas>

  Cenário: Não efetivando o cancelamento
    Dado que o usuário seleciona a opção não <Não>
    Então a mensagem fecha
    E o sistema permanece na tela de editar <Editar>

  Cenário: Recarregar ou voltar para página anterior
    Dado que no processo de preenchimento de requisitos, o usuário tenta recarregar a página ou voltar.
    Quando o usuário clica em salvar <Salvar>.
    Então o sistema apresenta uma mensagem "Tem certeza que deseja sair da pagina? Os dados serão perdidos!".
    E um campo para para cliclar se deseja ou não sair do preenchimento.



  Cenário: Protótipo
  ![image](Editar.png)


