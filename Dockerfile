FROM python:3.6
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN ls
ENTRYPOINT ["python"]
CMD ["app.py"]