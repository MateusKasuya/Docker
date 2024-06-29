FROM python:3.12

# Instalar o Poetry
RUN pip install poetry

# Copiar os arquivos do projeto para o contêiner
COPY . /src

# Definir o diretório de trabalho
WORKDIR /src

# Instalar as dependências do projeto
RUN poetry install

# Expor a porta que a aplicação vai usar
EXPOSE 8501

# Definir o comando de entrada
ENTRYPOINT ["poetry", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
