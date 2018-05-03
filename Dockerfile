FROM python:2.7



RUN mkdir -p /code/lanmanagement
COPY main.py /code/lanmanagement


WORKDIR /code







