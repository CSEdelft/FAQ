FROM ubuntu:latest

WORKDIR /app

# Install basics
RUN apt update 
RUN apt upgrade -y
RUN apt install -y wget curl git

# Install zsh
RUN apt install -y zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install GAS and GDB
RUN apt install -y build-essential
RUN apt install -y binutils
RUN apt install -y gdb
RUN apt install -y time

CMD ["zsh"]