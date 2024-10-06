FROM python3
RUN pip install jwt
ADD jwt2token.py jwt2token.py
ENTRYPOINT ["python", "jwt2token.py"]