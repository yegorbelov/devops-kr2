FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1
WORKDIR /app

RUN useradd --system --uid 10001 --no-create-home app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
USER app

EXPOSE 8004
CMD ["gunicorn", "--bind", "0.0.0.0:8004", "app:app"]
