# VirtuaLeague

:small_blue_diamond: [Descrição do projeto](#descrição-do-projeto)

:small_blue_diamond: [Pré-requisitos](#pré-requisitos)

:small_blue_diamond: [Como rodar a aplicação](#como-rodar-a-aplicação)

:small_blue_diamond: [Telas](#telas-da-aplicação)

:small_blue_diamond: [API](#api)

:small_blue_diamond: [Banco de dados](#banco-de-dados)

:small_blue_diamond: [Shared Preferences](#shared-preferences)

:small_blue_diamond: [Dependências](#dependências)

## Descrição do projeto

O aplicativo VirtuaLeague é um aplicativo feito com o framework flutter para um trabalho de faculdade, com o objetivo de aprender o front-end, back-end e a interação com banco de dados com o flutter.  
Nosso publico alvo são pessoas que gostam de seguir o competitivo do jogo CounterStriker, mostrando noticias e o rank dos melhores times do jogo.

## Pré-Requisitos

- [AndroidStudio](https://developer.android.com/)
- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

## Como rodar a aplicação
 
**1° passo:** Abra o terminal e entre na pasta desejada onde você quer que esteja este projeto.

**2° passo:** No terminal, clone o projeto com o comando: 

```
git clone https://github.com/MatheusFortes7/HLTV-mobile.git
```

**3° passo:** Abra o projeto no Android Studio, clique no menu File, depois em Open e procure pela pasta onde clonou este repositório, selecione esta pasta e clique em "OK".

**4° passo:** Para rodar o aplicativo no emulador ou no seu dispositivo, siga o passo a passo neste [site](https://developer.android.com/training/basics/firstapp/running-app?hl=pt-br#:~:text=No%20Android%20Studio%2C%20crie%20um,voc%C3%AA%20quer%20executar%20o%20app.).

## Telas da aplicação

Abaixo é possivel ver as telas principais da aplicação, onde aparecem o ranking mundial do competitivo do jogo e as noticias do jogo 

<img src="https://github.com/MatheusFortes7/HLTV-mobile/blob/master/flutter_04.png" width=200> <img src="https://github.com/MatheusFortes7/HLTV-mobile/blob/master/flutter_05.png" width=200>

Algumas das imagens não são carregadas corretamente pois eles sao salvos na api como arquivos svg, e não por arquivos png, que são os arquivos lidos pela função no flutter.

Na tela de noticia, quando a noticia é clicada, é aberto uma pagina com a noticia no site oficial, podemos ver um exemplo de como essa página e aberta abaixo.

<img src="https://github.com/MatheusFortes7/HLTV-mobile/blob/master/flutter_06.png" width=200>

Agora é possivel ver as telas em relação ao login da aplicação, respectivamente, temos a tela de login, a tela de registro e a tela de perfil

<img src="https://github.com/MatheusFortes7/HLTV-mobile/blob/master/flutter_02.png" width=200> <img src="https://github.com/MatheusFortes7/HLTV-mobile/blob/master/flutter_03.png" width=200> <img src="https://github.com/MatheusFortes7/HLTV-mobile/blob/master/flutter_01.png" width=200>

## API

Para mostrar as noticas e o ranking, foi utilizada uma api do site [hltv](hltv.org), porém como o site oficial nao libera uma api oficial, foi utilizada uma api encontrada na internet.

Para ter acesso a api utilizada no aplicativo, clique [aqui](https://hltv-api.vercel.app)

## Banco de dados

Para criar e armazenar as informações de login de usuarios, foi utilizado o SQLlite.
A tabela criada dentro do banco de dados com seus respectivos dados:

|nome (VARCHAR)|email (VARCHAR)|senha (VARCHAR)|
|-------- |-------- |-------- |
|Ilo Saldanha|ilo@sga.pucminas.com|teste1|
|Joaozinho|joaozinho@gmail.com|minhasenha|

A tabela tem como primary key o email, portanto é possivel criar uma conta por email.

## Shared Preferences

Foi utilizado o shared prefernces para salvar o nome e o email do usuario logado para estas informações aparecerem na pagina de perfil do aplicativo

## Dependências

Dependências utilizadas no aplicativo: (todas podem ser encontradas no [pub.dev](https://pub.dev))

cupertino_icons

circle_nav_bar

shared_preferences

sqflite

http

url_launcher

google_fonts
