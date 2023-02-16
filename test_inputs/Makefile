CC=clang
IRFLAGS=-S -emit-llvm -g -fno-discard-value-names
BCFLAGS=-c -emit-llvm -g -fno-discard-value-names

SRC_DIR=./src/
IR_DIR=./ir/
BC_DIR=./bc/

SRCS=$(notdir $(wildcard $(SRC_DIR)/*.c))
IRS=$(addprefix $(IR_DIR), $(SRCS:.c=.ll))
BCS=$(addprefix $(BC_DIR), $(SRCS:.c=.bc))

all: $(IRS) $(BCS)

$(IR_DIR)%.ll: $(SRC_DIR)%.c
	$(CC) $(IRFLAGS) $< -o $@

$(BC_DIR)%.bc: $(SRC_DIR)%.c
	$(CC) $(BCFLAGS) $< -o $@

.PHONY: clean

clean:
	rm $(IR_DIR)* $(BC_DIR)*