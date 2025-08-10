"""
WebApp-com-Docker-Compose

Aplicação web desenvolvida com Streamlit para execução de consultas SQL em um banco de dados MySQL.
A conexão é realizada via SQLAlchemy, utilizando variáveis de ambiente configuradas pelo Docker Compose.
Permite ao usuário digitar consultas SQL, visualizar resultados e explorar dados de forma interativa.

Requisitos:
- Streamlit
- pandas
- SQLAlchemy
- pymysql

Como executar:
1. Configure o ambiente com Docker Compose.
2. Execute o container da aplicação.
3. Acesse a interface web para realizar consultas SQL.

Autor: Daniel Torres de Andrade
Licença: Apache 2.0
"""

import streamlit as st
import pandas as pd
import os
from sqlalchemy import create_engine
from sqlalchemy import text

st.set_page_config(layout="wide")  # Já abre com layout mais largo

# CSS para expandir o conteúdo
st.markdown(
    """
    <style>
    .stApp {
        background: linear-gradient(120deg, #e0eafc 0%, #cfdef3 100%);
    }
    .block-container {
        padding-top: 1.5rem !important;
        padding-left: 2rem;
        padding-right: 2rem;
        max-width: 90% !important;
    }
    .dataframe {
        width: 100% !important;
    }
    h1 {
        color: #0077b6 !important;
        text-align: center;
        margin-top: 0.5rem;
        margin-bottom: 1.5rem;
        font-weight: 700;
        letter-spacing: 1px;
        font-size: 2.5rem;
    }
    </style>
    """,
    unsafe_allow_html=True
)

st.title("Executar Consultas SQL no MySQL")

# Configurações do banco vindas do docker-compose
db_user = os.getenv('MYSQL_USER', 'userdb')
db_password = os.getenv('MYSQL_PASSWORD', 'Zo0&p,12yT$7')
db_host = os.getenv('MYSQL_HOST', '192.168.100.155')
db_name = os.getenv('MYSQL_DB', 'db_webapp')

# Cria a conexão via SQLAlchemy
engine = create_engine(f"mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}")
# Caixa de texto para a consulta SQL
consulta_sql = st.text_area(
    "Digite sua consulta SQL:",
    height=200,
    value="""SELECT
    p.PessoaID,
    CONCAT(p.Nome, ' ', p.Sobrenome) AS Nome_Completo,
    p.CPF,
    TIMESTAMPDIFF(YEAR, p.Data_Nascimento, CURDATE()) AS Idade,
    p.Genero,
    e.Cidade,
    e.Estado,
    c.Telefone1 AS Telefone,
    c.Email1 AS Email
FROM pessoas p
LEFT JOIN enderecos e ON p.PessoaID = e.PessoaID
LEFT JOIN contatos c ON p.PessoaID = c.PessoaID;"""
)

# Botão para executar
if st.button("Executar Consulta"):
    if consulta_sql.strip():
        try:
            with engine.connect() as conn:
                df = pd.read_sql(text(consulta_sql), conn)

            # Limitar para no máximo 7 linhas
            st.dataframe(df.head(5), use_container_width=True, hide_index=True)

            # Exibir info de quantos registros existem no total
            st.caption(f"Mostrando {min(len(df), 5)} de {len(df)} registros.")

        except Exception as e:
            st.error(f"Erro ao executar consulta: {e}")
    else:
        st.warning("Digite uma consulta SQL antes de executar.")
