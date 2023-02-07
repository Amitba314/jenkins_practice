FROM python:3
WORKDIR /app
COPY . .
ENV FLASK_APP=app.py
RUN pip install flask
CMD ["flask", "run", "--host=0.0.0.0"]
