# WebApp-com-Docker-Compose

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
└── README.md
```

## Como Executar

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/Danieltandrade/WebApp-com-Docker-Compose.git
   cd WebApp-com-Docker-Compose
   ```

2. **Suba os containers:**
   ```bash
   docker-compose up
   ```

3. **Acesse a aplicação:**
   - Normalmente em `http://localhost:PORTA` (substitua pela porta configurada no seu projeto).

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