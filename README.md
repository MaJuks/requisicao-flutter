# Flutter API - Busca de Usuário com ReqRes

## Visão Geral
Este é um aplicativo Flutter simples que permite buscar informações de usuários através da API pública [ReqRes](https://reqres.in/). O usuário insere um ID (entre 1 e 12) e, ao clicar em "Buscar", o aplicativo realiza uma requisição HTTP e exibe os dados retornados: nome, e-mail e foto de perfil. Se o ID for inválido, é exibida uma mensagem de erro amigável informando que o usuário não foi encontrado.

O projeto foi desenvolvido como parte das atividades de Engenharia de Software, com foco em integração com APIs REST e manipulação de estados no Flutter.

## Funcionalidades

✅ O usuário digita um **ID de 1 a 12** no campo de texto  
✅ Ao pressionar o botão **"Buscar"**, é feita uma requisição GET para `https://reqres.in/api/users/{id}`  
✅ Se a resposta for válida, o app exibe:
- **Nome completo**
- **E-mail**
- **Imagem de perfil (avatar)**  
✅ Se o ID for inválido ou inexistente, o app exibe:
- Mensagem: `"Usuário não encontrado!"`  
✅ Tratamento de erros de rede ou falha na requisição


## Tecnologias Utilizadas
- **Flutter** (Framework para desenvolvimento mobile)
- **Dart** (Linguagem de programação)
- **HTTP Package** (`http`) para consumo da API REST
- **Android Studio** (IDE utilizada)

## Como Funciona

### 1. Entrada de Dados
- O usuário digita um número entre **1 e 12**, correspondente ao ID dos usuários disponíveis na API ReqRes.

### 2. Requisição à API
- O app monta a URL `https://reqres.in/api/users/{id}` e faz uma requisição HTTP do tipo GET.
- Se a resposta for 200, os dados do usuário são exibidos.
- Se a resposta for 404 ou qualquer erro de rede, é exibida uma mensagem informando que o usuário não foi encontrado.

### 3. Exibição de Dados
- Nome: Combinação de `first_name` e `last_name`
- E-mail: Campo `email`
- Imagem: Campo `avatar` (URL da imagem)

### 4. Tratamento de Erros
- O app trata casos como:
  - ID fora do intervalo (ex: 0, 13, etc)
  - Falha de conexão
  - Resposta com status 404

## Como Executar o Projeto

1. Clone o repositório:
```bash
git clone [URL_DO_REPOSITORIO]
