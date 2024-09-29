FROM python:3.13.0rc2

RUN mkdir chatApplication
copy ./chatApplication/ /chatApplication

WORKDIR /chatApplication
RUN pip3 install -r requirements.txt

EXPOSE 8000
WORKDIR /chatApplication/fundoo
RUN chmod +x run.sh

CMD ["./run.sh"]

