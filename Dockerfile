# Use a imagem oficial do Python como base
FROM python:3.10-slim


# Defina o diretório de trabalho no contêiner para /app
WORKDIR /app

# Copie o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instale as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante dos arquivos do projeto para o diretório de trabalho
COPY . .

# Defina a variável de ambiente para executar o servidor em um ambiente de produção
ENV DJANGO_SETTINGS_MODULE=meuprojeto.settings

# Expõe a porta 8000
EXPOSE 8000

# Execute o servidor de aplicativos Gunicorn para servir o aplicativo Django
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "meuprojeto.wsgi:application"]
