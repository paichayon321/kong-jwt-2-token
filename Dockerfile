FROM python:alpine3.19
RUN pip install PyJWT==2.8.0
ADD jwt2token.py jwt2token.py
ENTRYPOINT ["python", "jwt2token.py"]
