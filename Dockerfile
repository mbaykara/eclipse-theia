FROM debian:buster

RUN apt-get update -y && apt-get install -y clang cmake 

CMD tail -f /dev/null