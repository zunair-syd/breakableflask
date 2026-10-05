FROM python:3.7
WORKDIR /app
RUN apt-get update && apt-get install -y gcc libpq-dev
RUN useradd --create-home --shell /bin/bash appuser
COPY . /app
RUN pip install -r requirements.txt
RUN chown -R appuser:appuser /app
USER appuser
EXPOSE 4000
CMD ["python", "main.py"]
