#language: pt
#encoding: utf-8


Funcionalidade: 03 - Editar
  Como usuário que possui permissão, quero editar uma requisição de despesa para atualização.


  Contexto
    Dado que exista os dados de Requisição de Despesas:
      |Código|Fornecedor     |Tipo         |Classificação                |Centro de Custo|Data de Vencimento|valor     |status      |Ações                                          |
      |1     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |2     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |3     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Desabilitado|Visualizar Habilitar/Desabilitar Editar Excluir|
      |4     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|

  Cenário: Salvar Nova Requisição de Despesas
    Quando o usuário solicita editar uma nova requisição de despesas
    E preenche com, no mínimo, os dados obrigatórios
    E salva a nova requisição de despesas
    Então o sistema apresenta a mensagem: "Nova requisição salva com sucesso!" e permanece na tela de edição

  Cenário: Salvar faltando campos obrigatório
    Quando que usuário tentar salvar uma requisição.
    E estiver faltando campos obrigatórios.
    E o usuário irá receber a mensagem "Campo Obrigatório vazio".
    Então ele ficará impossibilitado de salvar até preencher tudo.


  Esquema do Cenário: Codificação de Campos
    Quando o usuário clicar em editar <Editar> nova requisição
    Então o sistema apresenta campos codificados <Código> e exibe sua descrição <Descrição>

    Exemplos:
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

  Esquema do Cenario: : Verificar Tipo do Dado, tamanho, máscara e obrigatoriedade
    Quando o usuário clicar em editar <Editar> nova requisição
    E informar o valor <Valor Informado> para o campo <Código do Campo>
    Então o sistema verifica o tipo de dado informado <Tipo do dado>, tamanho <Tamanho>, máscara de Edição <Máscara de Edição> e a obrigatoriedade <Obrigatório>
    E apresenta o resultado <Resultado>

    Exemplos:
      | Valor Informado  | Código do Campo | Tipo do dado | Tamanho | Máscara de Edição |	Resultado     | Obrigatório   |
      | -  -             | 1.1             | Seleção      | -     - | -  -              | -  -            | Sim           |
      | EMAGE SOLUÇÕES   | 1.2             | Seleção      | -   -   | -  -              | EMAGE SOLUÇÕES  | Sim           |
      | -  -             | 1.3             | Texto        | 300     | -  -              | -  -            | Sim           |
      | 5306329          | 1.4             | Monetário    | 30      | R$ 9.999,99       | R$ 53.063,29    | Sim           |
      | 30042023         | 1.5             | Data         | -  -    | DD/MM/AAAA        | 30/04/2023      | Sim           |
      | André Souza      | 1.6             | Seleção      | -  -    | -  -              | André Souza     | Sim           |
      | -  -             | 1.7             | Seleção      | -  -    | -  -              | -  -            | Não           |
      | -  -             | 1.8             | Seleção      | -  -    | -  -              | -  -            | Sim           |
      | -  -             | 1.9             | Seleção      | -  -    | -  -              | -  -            | Sim           |
      | 15032023         | 1.10            | Data         | 30      | DD/MM/AAAA        | 15/03/2023      | Sim           |
      | LB20220053       | 1.11            | Seleção      | -  -    | -  -              | LB20220053      | Não           |
      | Recorrente       | 1.12            | Seleção      | -  -    | -  -              | Recorrente      | Sim           |
      | 2 vezes ao todo  | 1.13            | Seleção      | -  -    | -  -              | 2 vezes ao todo | Não           |
      | Meses            | 1.14            | Seleção      | -  -    | -  -              | Meses           | Não           |
      | arquivo.pdf      | 1.15            | arquivo      | -  -    | -  -              | arquivo.pdf     | Não           |
      | NFN002023051     | 1.16            | Texto        | 300     | -  -              | NFN002023051    | Não           |
      | -  -             | 1.17            | TextArea     | 4000    | -  -              | -  -            | Não           |
      | Percentual       | 1.18            | Seleção      | -  -    | -  -              | Percentual      | Não           |
      | Percentual       | 1.19            | Seleção      | -  -    | -  -              | Percentual      | Não           |
      | Percentual       | 1.20            | Seleção      | -  -    | -  -              | Percentual      | Não           |

  Esquema do Cenário: : Valores padrões para campos de seleção
    Quando o usuário solicita editar uma nova requisição de respesas
    E seleciona um campo <Código> com a função seletor drop down a partir da descrição <Descrição> desejada
    Então o sistema exibe as opções de seleção
    E apresenta o valor padrão <Valor Padrão>

    Exemplos:
      | Código | Valor Padrão| Descrição                     |
      | 1.1    | 1           | Pagamento                     |
      | 1.1    | 2           | Adiantamento                  |
      | 1.1    | 3           | Reembolso                     |
      | 1.2    | 1           | Emage Aoluções                |
      | 1.6    | 1           | André Souza                   |
      | 1.7    | 1           | Magno Duarte                  |
      | 1.7    | 2           | Miguel Costa                  |
      | 1.7    | 3           | Marcelo Oliveira              |
      | 1.8    | 1           | Compra de Licença de Software |
      | 1.8    | 2           | Compra de Equipamentos        |
      | 1.9    | 1           | Projetos                      |
      | 1.9    | 2           | Administrativo                |
      | 1.9    | 3           | RH                            |
      | 1.11   | 1           | LB20220053                    |
      | 1.13   | 2           | 2 vezes ao todo               |
      | 1.13   | 3           | 6 vezes ao todo               |
      | 1.14   | 1           | Meses                         |
      | 1.14   | 2           | Anos                          |


  Cenário: 1.6 Requisitante
    Dado que o usuário seleciona uma opção de requisitante
    Quando a opção é selecionado
    Então o requisitante não pode ser mostrado no campo 1.7
    E a opção selecionada tem que ser listada na tabela de rateio entre requisitantes
    E o usuário tem a permissão de editar e excluir as informações.

      |Requisitante            |Percentual |Valor  |Ações          |
      |André Souza             |30%        |30,00  |Editar Excluir |

  Cenario: 1.7 Demais Requisitantes
    Dado que o usuário seleciona uma ou mais opções de requisitantes
    Quando a(s) opções são selecionadas
    Então são adicionadas na tabela de rateio entre requisitantes
    E o usuário tem a permissão de editar e excluir as informações da tabela.

      |Requisitante            |Percentual |Valor  |Ações          |
      |André Souza             |30%        |30,00  |Editar Excluir |
      |Magno Duarte            |30%        |30,00  |Editar Excluir |
      |Miguel Costa            |20%        |20,00  |Editar Excluir |
      |Marcelo Oliveira        |20%        |20,00  |Editar Excluir |

  Cenário: 1.8 Classificação da despesas
    Dado que o usuário seleciona uma ou mais opções de classificação de despesa
    Quando a(s) opções são selecionadas
    Então são adicionadas na tabela de rateio entre classificações
    E o usuário tem a permissão de editar e excluir as informações da tabela.

      |Requisitante                   |Percentual |Valor  |Ações          |
      |Compra de Licença de Software  |50%        |30,00  |Editar Excluir |
      |Compra de Equipamentos         |50%        |30,00  |Editar Excluir |

  Cenário: 1.9 Centro de custo
    Dado que o usuário seleciona uma ou mais opções de Centro de custo
    Quando a(s) opções são selecionadas
    Então são adicionadas na tabela de rateio entre Centro de custo
    E o usuário tem a permissão de editar e excluir as informações da tabela.

      |Requisitante          |Percentual |Valor  |Ações          |
      |Projetos              |30%        |30,00  |Editar Excluir |
      |Administrativo        |30%        |30,00  |Editar Excluir |
      |RH                    |20%        |20,00  |Editar Excluir |


  Cenário: Rateio igualmente
    Quando o sistema apresenta as opções de rateio nas formas "Rateio entre Classificações", "Rateio entre Requisitantes" e "Rateio entre Centro de Custo"
    E o usuário marca a opção "igualmente"
    Então o sistema atribui uma distribuição ao rateio de igual pencentual e valor
      | Requisitante                  | Percentual | Valor | Ações          |
      | Compra de Licença de Software | 50%        | 30,00 | Editar Excluir |
      | Compra de Equipamentos        | 50%        | 30,00 | Editar Excluir |

  Cenário: Rateio Percentual
    Quando o sistema apresenta as opções de rateio nas formas "Rateio entre Classificações", "Rateio entre Requisitantes" e "Rateio entre Centro de Custo"
    E o usuário marca a opção "Percentual"
    Então o sistema habilita a coluna "Percentual" para edição
    E o usuário pode atribuir livremente valores percentuais aos componentes do rateio
    E considerando que a soma total dos campos da coluna "Percentual" deve apresentar o valor exato de 100%
      | Requisitante                  | Percentual | Valor | Ações          |
      | Compra de Licença de Software | 50%        | 30,00 | Editar Excluir |
      | Compra de Equipamentos        | 50%        | 30,00 | Editar Excluir |

  Cenário: Rateio Valor Absoluto
    Quando o sistema apresenta as opções de rateio nas formas "Rateio entre Classificações", "Rateio entre Requisitantes" e "Rateio entre Centro de Custo"
    E o usuário marca a opção "Valor Absoluto"
    Então o sistema habilita a coluna "Valor" para edição
    E o usuário atribuir livremente valores monetários aos componentes do rateio
    E considerando que a soma total dos campos da coluna "Valor" deve apreesentar o valor exato indicado no campo "Campo" 1.4
      | Requisitante                  | Percentual | Valor | Ações          |
      | Compra de Licença de Software | 50%        | 30,00 | Editar Excluir |
      | Compra de Equipamentos        | 50%        | 30,00 | Editar Excluir |

  Cenário: Contador de Caracteres
    Quando o campo for do tipo textarea
    Então é adicionado um contador regressivo de caracteres restantes

  Cenário: Anexo de arquivos
    Dado que o usuário pode anexar arquivos do tipo "PDF", "DOC", "TXT", "PNG", JPEG" e "XLSX"
    E o usuário pode fazer o upload de qualquer formato dentre esses
    Quando o usuário solicitar os arquivos, abre uma janela de arquivos do proprio computador
    Então ao selecionar o(s) arquivos o sistema faz uma verificação do formato e tamanho do arquivo
    E o tamanho maximo dos arquivos somados não pode passar de 20 MB

  Cenário: Formato e tamanho diferentes
    Quando o formato ou tamanho forem diferentes dos validados
    Então o sistema apresenta a mensagem "Formato ou Tamanho excedido à 20 MB"

  Cenário: Cancelar nova despesa
    Quando o usuário cancela a nova requisição de despesas
    E tem qualquer dado minimo preenchido
    Então o sistema apresenta a mensagem: " Os dados inseridos não serão salvos, deseja cancelar ?"

  Cenário: Cancelar nova despesa vazia
    Quando o usuário cancela a nova requisição de despesas
    E não tem nenhum campo preenchido
    Então ele retorna para a pagina anterior


  Cenário: Recarregar ou voltar para página anterior
    Quando que no processo de preenchimento de requisitos, o usuário tenta recarregar a página ou voltar.
    E o sistema apresenta uma mensagem "Tem certeza que deseja sair da pagina? Os dados serão perdidos!".
    E um campo para clicar se deseja ficar na pagina ou sair e perder os dados
    Então se ficar na pagina você volta para preencher os dados


  Cenário: Protótipo
  ![image](Editar.png)

  Contexto
    Dado que exista os dados de Requisição de Despesas:
      |Código|Fornecedor     |Tipo         |Classificação                |Centro de Custo|Data de Vencimento|valor     |status      |Ações                                          |
      |1     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |2     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|
      |3     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Desabilitado|Visualizar Habilitar/Desabilitar Editar Excluir|
      |4     |Emege Soluções |Pagamento    |Compra de Licença de Software|Projetos       |30/04/2023        |R$5.250,60|Habilitado  |Visualizar Habilitar/Desabilitar Editar Excluir|

  Cenário: Salvar nova alteração de Despesas
    Quando o usuário solicita editar uma nova requisição de despesas
    E preenche com, no mínimo, os dados obrigatórios
    E salva  a nova requisição de despesas
    Então o sistema apresenta a mensagem: "Nova requisição salva com sucesso!" e permanece na tela de edição

  Cenário: Salvar faltando campos obrigatório
    Quando que usuário tentar salvar uma requisição.
    E estiver faltando campos obrigatórios.
    E o usuário irá receber a mensagem "Campo Obrigatório vazio".
    Então ele ficará impossibilitado de salvar até preencher tudo.


  Esquema do Cenário: Codificação de Campos
    Quando o usuário clicar em editar <Editar> nova requisição
    Então o sistema apresenta campos codificados <Código> e exibe sua descrição <Descrição>

    Exemplos:
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

  Esquema do Cenario: : Verificar Tipo do Dado, tamanho, máscara e obrigatoriedade
    Quando o usuário clicar em editar <Editar> nova requisição
    E informar o valor <Valor Informado> para o campo <Código do Campo>
    Então o sistema verifica o tipo de dado informado <Tipo do dado>, tamanho <Tamanho>, máscara de Edição <Máscara de Edição> e a obrigatoriedade <Obrigatório>
    E apresenta o resultado <Resultado>

    Exemplos:
      | Valor Informado  | Código do Campo | Tipo do dado | Tamanho | Máscara de Edição |	Resultado     | Obrigatório   |
      | -  -             | 1.1             | Seleção      | -     - | -  -              | -  -            | Sim           |
      | EMAGE SOLUÇÕES   | 1.2             | Seleção      | -   -   | -  -              | EMAGE SOLUÇÕES  | Sim           |
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

  Esquema do Cenário: : Valores padrões para campos de seleção
    Quando o usuário solicita editar uma nova requisição de respesas
    E seleciona um campo <Código> com a função seletor drop down a partir da descrição <Descrição> desejada
    Então o sistema exibe as opções de seleção
    E apresenta o valor padrão <Valor Padrão>

    Exemplos:
      | Código | Valor Padrão| Descrição                     |
      | 1.1    | 1           | Pagamento                     |
      | 1.1    | 2           | Adiantamento                  |
      | 1.1    | 3           | Reembolso                     |
      | 1.2    | 1           | Emage Aoluções                |
      | 1.6    | 1           | André Souza                   |
      | 1.7    | 1           | Magno Duarte                  |
      | 1.7    | 2           | Miguel Costa                  |
      | 1.7    | 3           | Marcelo Oliveira              |
      | 1.8    | 1           | Compra de Licença de Software |
      | 1.8    | 2           | Compra de Equipamentos        |
      | 1.9    | 1           | Projetos                      |
      | 1.9    | 2           | Administrativo                |
      | 1.9    | 3           | RH                            |
      | 1.11   | 1           | LB20220053                    |
      | 1.13   | 2           | 2 vezes ao todo               |
      | 1.13   | 3           | 6 vezes ao todo               |
      | 1.14   | 1           | Meses                         |
      | 1.14   | 2           | Anos                          |


  Cenário: 1.6 Requisitante
    Dado que o usuário seleciona uma opção de requisitante
    Quando a opção é selecionado
    Então o requisitante não pode ser mostrado no campo 1.7
    E a opção selecionada tem que ser listada na tabela de rateio entre requisitantes
    E o usuário tem a permissão de editar e excluir as informações.

      |Requisitante            |Percentual |Valor  |Ações          |
      |André Souza             |30%        |30,00  |Editar Excluir |

  Cenario: 1.7 Demais Requisitantes
    Dado que o usuário seleciona uma ou mais opções de requisitantes
    Quando a(s) opções são selecionadas
    Então são adionadas na tabela de rateio entre requisitantes
    E o usuário tem a permissão de editar e excluir as informações da tabela.

      |Requisitante            |Percentual |Valor  |Ações          |
      |André Souza             |30%        |30,00  |Editar Excluir |
      |Magno Duarte            |30%        |30,00  |Editar Excluir |
      |Miguel Costa            |20%        |20,00  |Editar Excluir |
      |Marcelo Oliveira        |20%        |20,00  |Editar Excluir |

  Cenário: 1.8 Classificação da despesa
    Dado que o usuário seleciona uma ou mais opções de classificação de despesa
    Quando a(s) opções são selecionadas
    Então são adcionadas na tabela de rateio entre classificações
    E o usuário tem a permissão de editar e excluir as informações da tabela.

      |Requisitante                   |Percentual |Valor  |Ações          |
      |Compra de Licença de Software  |50%        |30,00  |Editar Excluir |
      |Compra de Equipamentos         |50%        |30,00  |Editar Excluir |

  Cenário: 1.9 Centro de custo
    Dado que o usuário seleciona uma ou mais opções de Centro de custo
    Quando a(s) opções são selecionadas
    Então são adcionadas na tabela de rateio entre Centro de custo
    E o usuário tem a permissão de editar e excluir as informações da tabela.

      |Requisitante          |Percentual |Valor  |Ações          |
      |Projetos              |30%        |30,00  |Editar Excluir |
      |Administrativo        |30%        |30,00  |Editar Excluir |
      |RH                    |20%        |20,00  |Editar Excluir |


  Cenário: Rateio igualmente
    Quando o sistema apresenta as opções de rateio nas formas "Rateio entre Classificações", "Rateio entre Requisitantes" e "Rateio entre Centro de Custo"
    E o usuário marca a opção "igualmente"
    Então o sistema atribui uma distribuição ao rateio de igual pencentual e valor
      | Requisitante                  | Percentual | Valor | Ações          |
      | Compra de Licença de Software | 50%        | 30,00 | Editar Excluir |
      | Compra de Equipamentos        | 50%        | 30,00 | Editar Excluir |

  Cenário: Rateio Percentual
    Quando o sistema apresenta as opções de rateio nas formas "Rateio entre Classificações", "Rateio entre Requisitantes" e "Rateio entre Centro de Custo"
    E o usuário marca a opção "Percentual"
    Então o sistema habilita a coluna "Percentual" para edição
    E o usuário pode atribuir livremente valores percentuais aos componentes do rateio
    E considerando que a soma total dos campos da coluna "Percentual" deve apresentar o valor exato de 100%
      | Requisitante                  | Percentual | Valor | Ações          |
      | Compra de Licença de Software | 50%        | 30,00 | Editar Excluir |
      | Compra de Equipamentos        | 50%        | 30,00 | Editar Excluir |

  Cenário: Rateio Valor Absoluto
    Quando o sistema apresenta as opções de rateio nas formas "Rateio entre Classificações", "Rateio entre Requisitantes" e "Rateio entre Centro de Custo"
    E o usuário marca a opção "Valor Absoluto"
    Então o sistema habilita a coluna "Valor" para edição
    E o usuário atribuir livremente valores monetários aos componentes do rateio
    E considerando que a soma total dos campos da coluna "Valor" deve apreesentar o valor exato indicado no campo "Campo" 1.4
      | Requisitante                  | Percentual | Valor | Ações          |
      | Compra de Licença de Software | 50%        | 30,00 | Editar Excluir |
      | Compra de Equipamentos        | 50%        | 30,00 | Editar Excluir |

  Cenário: Contador de Caracteres
    Quando o campo for do tipo textarea
    Então é adicionado um contador regressivo de caracteres restantes

  Cenário: Cancelar nova despesa
    Quando o usuário cancela a nova requisição de despesas
    E tem qualquer dado minimo preenchido
    Então o sistema apresenta a mensagem: " Os dados inseridos não serão salvos, deseja cancelar ?"

  Cenário: Cancelar nova despesa vazia
    Quando o usuário cancela a nova requisição de despesas
    E não tem nenhum campo preenchido
    Então ele retorna para a pagina anterior


  Cenário: Recarregar ou voltar para página anterior
    Quando que no processo de preenchimento de requisitos, o usuário tenta recarregar a página ou voltar.
    E o sistema apresenta uma mensagem "Tem certeza que deseja sair da pagina? Os dados serão perdidos!".
    E um campo para clicar se deseja ficar na pagina ou sair e perder os dados
    Então se ficar na pagina você volta para preencher os dados


  Cenário: Protótipo
  ![image](Editar.png)
