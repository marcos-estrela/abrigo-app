# Seleção Full Stack 2019

## Escopo do projeto

Monza, é dona de um abrigo de animais e precisa de uma sistema para cadastrar os bichinhos =). Hoje o abrigo trabalha com cães e gatos de várias raças e precisa de algo simples que facilite o trabalho de catalogar e exibir os animais para adoção:
****
* Animais
  * nome
  * raça `[Relacionamento com a tabela de Raças]`
  * sexo - `[M - Macho, F - Fêmea]`
  * espécie - `[1 - Cachorro, 2 - Gato]`
  * data nascimento
  * data de atualização
  * data falecimento
* Raças
  * nome
  * situação - `[ATI - Ativo, INA - Inativo]`

Para atender a este desafio você deverá criar uma aplicação em `PHP` apenas com os endpoints da `Api`, uma `SPA` em `Vue.js` que será o frontend da aplicação e uma estruta de tabelas, views, procedures e funções no banco de banco de dados `MySQL`. 

PS: (não precisa se preocupar com menus ou autenticação)

## Entregáveis

### APP (Front-end)
Aplicação desenvolvida em Vue.js

  * Tela com a Listagem de animais
    * Cada animal deve ser exibido em um card com seu nome, sexo, idade, número do chip, se está vivo ou não (caso morto o card fica esmaecido) e um botão de editar
    * Form de inclusão de animais 
    * Form de edição de animais
  * Catálogo de animais para adoção - (trazer apenas animais vivos)
    * Cada animal deve ser exibido em um card com nome, sexo e idade
    * Nessa exibição deve ser possível filtrar os animais por Espécie, Raça (combo com as raças cadastradas), Idade e Sexo.
  
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
* Responder o e-mail com o link do seu repositório
* Não obrigatório, mas se quiser ir além:
  * Hospedar aplicação (front-end e back-end) em algum servidor e enviar a url junto com e-mail;
  * Não é obrigatório usar nenhuma biblioteca visual de frontend, mas se a interface estiver intuitiva, agradável e responsiva você ganhará pontos.
  * Não é obrigatório autenticação, perfis, menus, etc.
  * Usar docker pode facilitar algumas coisas, mas fique a vontade para fazer do seu jeito.

### Estrutura de pastas
```
./
  |_ api //back-end
  |_ app //front-end
  |_ db //banco de dados
```

## Requisitos

### Vue

* versão do vue.js: `2.6.*`
* versão do vue-cli: `3.*`
* criar o projeto na pasta `app`
* usar `yarn` como gerenciador de dependências

### PHP

* versão do php: `7.2.*`
* framework para API: SlimFramework `4.*`
* usar o `composer` como gerenciador de dependências
* para se conectar com `MySQL`, deve ser usada o `PDO` do próprio `PHP`

### MySQL

* versão do MySQL: `5.6.*` ou `5.7.*`
* encoding: `utf-8`
* as procedures devem validar os dados passados para elas 
* as procedures devem ter como parâmetro de saída `status (boolean)` e uma `mensagem (string)` de erro ou sucesso.
