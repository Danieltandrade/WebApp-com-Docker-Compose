# WebApp-com-Docker-Compose `#0969DA`

![Docker](https://img.shields.io/badge/Docker-Compose-blue?logo=docker)
![MySQL](https://img.shields.io/badge/MySQL-8.4-white?logo=mysql)
![GitHub last commit](https://img.shields.io/github/last-commit/Danieltandrade/WebApp-com-Docker-Compose)
![License](https://img.shields.io/github/license/Danieltandrade/WebApp-com-Docker-Compose)
![Python](https://img.shields.io/badge/Python-3.12-blue?logo=python)

## Sobre o Projeto

Este projeto demonstra como criar e executar uma aplicação web utilizando **Docker Compose**. O objetivo é facilitar o desenvolvimento, testes e deploy de aplicações multi-serviço, como web apps com banco de dados, de forma simples e eficiente.

## Tecnologias Utilizadas

- **Docker**
- **Docker Compose**
- **MySQL**
- **Python**
- **Streamlit**

## Estrutura do Projeto

```
WebApp-com-Docker-Compose/
├── docker-compose.yml
├── app/
│   ├── app.py             # Código da aplicação
│   ├── Dockerfile         # Dockerfile para construir a imagem da aplicação
│   └── requirements.txt   # Dependências da aplicação
├── db/
│   └── init.sql           # Script de inicialização do banco de dados
├── .dockerignore
├── .gitignore
├── docker-compose.override.yml  # Arquivo de sobreposição do Docker Compose
├── LICENSE
└── README.md
```

## Como Executar

1. **Clone o repositório:**
   Clone o repositório do GitHub na pasta desejada em seu servidor conforme 
descrito abaixo:

   ```bash
   git clone https://github.com/Danieltandrade/WebApp-com-Docker-Compose.git
   cd WebApp-com-Docker-Compose
   ```

2. **Suba os containers:**
   ```bash
   docker-compose up -d
   ```

> [!NOTE]
> O argumento "-d" é muito importante para rodar os containers em segundo plano.

3. **Acesse a aplicação:**
   - Normalmente em `http://localhost:8501` (substitua pela porta configurada no seu projeto).
   - Exemplo: `http://192.168.100.155:8501`

## Formato da Página Web

A página da aplicação é construída utilizando a biblioteca Streamlit e possui 
um layout simples, com um campo de texto para entrada de consultas SQL e um 
botão para executá-las. 
Os resultados são exibidos logo abaixo do campo de entrada.
Foram incluídos no projeto 20 registros fictícios de pessoas, endereços e 
contatos para teste dos dados no Streamlit.

## Comandos Úteis

- **Parar os containers:**
  ```bash
  docker-compose down
  ```

- **Ver logs:**
  ```bash
  docker-compose logs
  ```

## Contribuição

Contribuições são bem-vindas!  
Abra uma issue ou envie um pull request.

## Licença

Este projeto está sob a Apache License 2.0. Veja o arquivo

## Conclusão

Este projeto é um exemplo básico de como utilizar o Docker Compose para 
orquestrar uma aplicação web com um banco de dados. Foram abortados conteúdos
sobre banco de dados relacionais, com a utilização do SGBD MySQL e também a 
biblioteca Streamlit em Python para construção de uma página Web que é capaz 
de executar consultas SQL nas tabelas do banco de dados. Sinta-se à vontade 
para modificar e expandir este projeto conforme necessário.
