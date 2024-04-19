# fullstack_dev_test

## Camadas
### DATA
Camada que agrupa as camadas que buscam dados externos como datasource, dto e repository.

### DOMAIN
Camada responsável pelas regras de negócio e seus manipuladores.

### EXCEPTIONS
Centralizador de exceções da aplicação, usada para tipar erros.

### INFRA
Camada com serviços base do projeto.

### ROUTER
Centraliza e genrencia as rotas do app.

### UI
Centraliza todos os componentes da aplicação e seu design system (baseado no atomic design).

## Libs usadas
#### Firebase
- firebase_core
- cloud_firestore
- firebase_core_web

#### Routa
- go_router

#### Binds
- get_it

#### Transparte de dados
- either_dart

#### AI
- flutter_gemini

#### Configuração da URL do app
- url_strategy

#### Teste
- mockito

## Rodar o projeto
#### Configuração inicial
#### FIREBASE
1. Crie um projeto no firebase: https://www.youtube.com/watch?v=6juww5Lmvgo
2. Adicione um aplicativo web:

3. Copie os dados em json para o arquivo **env/env.json**.

#### GEMINI
1. Crie um projeto no painel do Gemini: https://ai.google.dev
2. Ao criar o projeto, vincule ao projeto do Firebase. (Importante usar a mesma conta.).
3. Copie o código informado e salve em algum lugar. (esse código não poderá ser recuperado no painel).
4. Salve o a chave no arquivo **env/env.json**.

#### RUN
**OBS:** *O projeto roda apenas na web, por ser mais rápido de configurar.*

```bash
flutter build web -d chrome --web-port 8080
/ --dart-define=GEMINI_API_KEY=
/ --dart-define=FIREBASE_API_KEY=
/ --dart-define=FIREBASE_APP_ID=
/ --dart-define=FIREBASE_AUTH_DOMAIN=
/ --dart-define=FIREBASE_PROJECT_ID=
/ --dart-define=FIREBASE_STORE_BUCKET=
/ --dart-define=FIREBASE_MESSAGING_SENDER_ID=
```

OU

```bash
flutter build web -d chrome --web-port 8080 --dart-define-from-file=env/env.json
```
**env/env.json**
```json
{
    "GEMINI_API_KEY": "",
    "FIREBASE_API_KEY": "",
    "FIREBASE_APP_ID": "",
    "FIREBASE_AUTH_DOMAIN": "",
    "FIREBASE_PROJECT_ID": "",
    "FIREBASE_STORE_BUCKET": "",
    "FIREBASE_MESSAGING_SENDER_ID": ""
}
```

**OBS:** *A pasta env está no .gitignore.*
<br>
**Não esqueça de popular as chaves no arquivo env.json ou nas --dart-define.**

## Uso
#### Rotas
App hospedado: https://dev-test.codemagic.app

1. A rota inicial é: **/counties** - Exibe 25 países por vez.
2. Ao selecionar um país: **counties/{pais}/cities** - Exibe todas as cidades.
3. Ao selecionar uma cidade: **counties/{pais}/cities/{estado}/{cidade}/details** - Exibe detalhes sobre a cidade usando o Gemini.
3. Caso seja inserida uma URL inválida, o usuário verá uma tela 404.

## UI
#### Padrão - Atomic Design
Doc: https://bradfrost.com/blog/post/atomic-web-design/
- Proporciona um desacoplamento de componentes.

## Observações gerais
1. Existe um service de tradução (TranslateService) e uma extension para Strings que realiza essa tardução. Não deu tempo de finalizar a implementação do serviço, mas deixei um exemplo de como seria o funcionamento.

2. Decidi usar o go_router por ele proporcionar um gerenciamento mais flexível. A seguunda alternativa seria o Modular. (o acomplamento dessa lib é maior, em todo o projeto).

3. Para fazer a injeção de dependência decidi usar o get_it.

4. Todo as camadas do app possuem contratos, evitando o acoplamento de libs externas.