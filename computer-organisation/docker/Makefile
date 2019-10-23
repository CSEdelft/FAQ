# Dockerfile spesific
DOCKER_REPO=ubuntu-toolchain
DOCKER_TAG=latest
DOCKER_IMAGE=$(DOCKER_REPO):$(DOCKER_TAG)
DOCKER_ZSH=/bin/zsh -c
DOCKER_SH=docker run -it --rm \
	-v `pwd`:/app \
	--security-opt seccomp=unconfined \
	$(DOCKER_IMAGE)
DOCKER=$(DOCKER_SH) $(DOCKER_ZSH)

# Assembly spesific
PROGRAM=hello
SRC_FILES=$(PROGRAM).s # include multiple asm files here as needed
OUT=$(PROGRAM).x86_64 # only one out file beeded
OUT_EX=./$(OUT)

CC=gcc
GDB=gdb

# Docker
docker_build:
	docker build . -t $(DOCKER_IMAGE)

# Assembly
run:
	$(DOCKER) "make _run"

_run: _assembly_build
	$(OUT_EX)

assembly_build:
	$(DOCKER) "make _assembly_build"

_assembly_build: $(SRC_FILES)
	$(CC) -no-pie -o $(OUT_EX) $(SRC_FILES)
	chmod a+x $(OUT_EX)

assembly_build_debug:
	$(DOCKER) "make _assembly_build_debug"

_assebly_build_debug: $(SRC_FILES)
	$(CC) -g -no-pie -o $(OUT_EX) $(SRC_FILES)

assembly_debug:
	$(DOCKER) "make _assembly_debug"

_assembly_debug: _assembly_build_debug
	$(GDB) $(OUT_EX)
