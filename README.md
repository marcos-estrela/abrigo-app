# Fullstack 2019

## Escopo do projeto

Monza, é dona de um abrigo de animais e precisa de uma sistema para cadastrar os animais. Hoje o abrigo trabalha com cães e gatos de várias raças e precisa de algo simples que facilite o trabalho de catalogar e exibir os animais para adoção:


* Animal
  * nome
  * raça
  * sexo - `[M - Macho, F - Fêmea]`
  * espécie - `[1 - Cachorro, 2 - Gato]`
  * chip
  * data nascimento 
  * data de atualização
  * data falecimento
* Raça
  * nome
  * situação - `[ATI - Ativo, INA - Inativo]`

Para atender a este desafio você deverá criar uma aplicação em php apenas com os endpoints da api (usamos o framework slim e já montamos uma pequena estrutura para você), uma app em vue que será o frontend da aplicação (não precisa se preocupar com menu ou autenticação) e uma estruta de views, procedures e funções no banco de banco de dados.

## Entregáveis

### APP (Front-end)
Aplicação desenvolvida em Vue.js

  * Listagem de animais
    * Cada animal deve ser exibido em um card com seu nome, sexo, idade, número do chip, se está vivo ou não (caso morto o card fica esmaecido) e um botão de editar
  * Catálogo de animais para adoção - (trazer apenas animais vivos)
    * Cada animal deve ser exibido em um card com nome, sexo e idade
    * Nessa exibição deve ser possível filtrar os animais por Espécie, Raça (combo com as raças cadastradas), Idade e Sexo.
  * Form de cadastro e edição de animais

### API (Back-end)
API REST os endpoints para chamar as procedures e as views. Não deve ser feito `SELECT`, `INSERT` ou `UPDATE` direto na tabela.

  * Endpoints
    * Animais
      * Listar - Select na view de animais
      * Atualizar - Chamar procedure de update de animais
      * Criar - Chamar procedure de insert de animais
    * Raças
      * Listar - Select na view de raças

### Banco de Dados (MySQL)

  * Procedure de insert de animais
  * Procedure de update de animais
  * Função para informar a idade do animal de acordo com a data de nascimento
  * View contento todos os dados dos animais e das raças, além de uma coluna com a idade do animal e uma coluna informando se o animal está vivo ou morto

## Instruções para entrega

* Fazer um clone do projeto
* Gerar dump do banco de dados e colocar na pasta `db`
* Criar arquivo `SETUP.md` instruções para rodar sua aplicação
* Responder o e-mail com o link do repositório
* Não obrigatório, mas se quiser ir além:
  * Hospedar aplicação (front-end e back-end) em algum servidor e enviar a url junto com e-mail;
  * Não é obrigatório usar nenhuma biblioteca visual de frontend, mas se a interface estiver intuitiva, agradável e responsiva você ganhará pontos.

### Estrutura de pastas
```
./
  |_ api //back-end
  |_ app //front-end
  |_ db //banco de dados
```

## Requisitos técnicos

### Vue

* versão do vue.js: `2.6.*`
* versão do vue-cli: `3.*`
* criar o projeto na pasta `app`
* usar `yarn` como gerenciador de dependência

### PHP

* versão do php: `7.2.*`

### MySQL

* versão do MySQL: `5.6.*` ou `5.7.*`
* encoding: `utf-8`

