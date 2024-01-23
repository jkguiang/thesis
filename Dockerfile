FROM ubuntu:latest

# # Python3 (for good measure)
# RUN apt update && apt install -y python3 python3-pip && ln -sf python3 /usr/bin/python
# RUN pip3 install --no-cache --upgrade pip setuptools

# Set up working directory
WORKDIR /thesis

# LaTeX
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y texlive-latex-base texlive-formats-extra texlive-extra-utils latexmk

# Spellcheck (aspell)
RUN apt install -y aspell

# VIM
RUN apt install -y vim
ENV TERM=xterm-256color

ENTRYPOINT ["tail", "-f", "/dev/null"]
