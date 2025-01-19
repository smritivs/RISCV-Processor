# SOURCES=./src/pl_stages/fetch/fetch.v ./src/pl_stages/decode/decode.v ./src/pl_stages/execute/execute.v ./src/pl_stages/memory/memory.v ./src/pl_stages/writeback/writeback.v ./src/utils ./src/pl_regs/
SRC_STG=-Y .v -y ./src/pl_stages/fetch -Y .v -y ./src/pl_stages/decode -Y .v -y ./src/pl_stages/execute -Y .v -y ./src/pl_stages/memory -Y .v -y ./src/pl_stages/writeback -Y .v -y ./src/pl_stages/hazard
SRC_REGS=-Y .v -y ./src/pl_regs
SRC_UTILS=-Y .v -y ./src/utils
SRC_TOP=-Y .v -y ./src/top

SRC_STG_V=-y ./src/pl_stages/hazard/ -y ./src/pl_stages/fetch -y ./src/pl_stages/decode -y ./src/pl_stages/execute -y ./src/pl_stages/memory -y ./src/pl_stages/writeback
SRC_REGS_V=--y ./src/pl_regs
SRC_UTILS_V=-y ./src/utils
SRC_TOP_V=-y ./src/top

SRC_ALL=$(SRC_STG) $(SRC_REGS) $(SRC_UTILS) $(SRC_TOP)

SRC_ALL_V=$(SRC_STG_V) $(SRC_REGS_V) $(SRC_UTILS_V) $(SRC_TOP_V)
sims:
	iverilog $(SRC_ALL) ./test/pl_stages/$(target)/$(target)_tb.v
	./a.out
	gtkwave dumpfile.vcd

simt:
	iverilog -Wall $(SRC_ALL) ./test/top/cpu_tb.v
	./a.out
	gtkwave dumpfile.vcd
lint:
ifeq ($(top),cpu)
	verilator --lint-only ./test/top/cpu_tb.v  $(SRC_ALL_V)
else
	verilator --lint-only --top-module ./test/pl_stages/$(stage)/$(stage)_tb.v ./src/pl_stages/$(stage)/*.v ./src/utils/*.v
endif

gh:
	git add . -A
	git commit -m "$(msg)"
	xclip -sel c < ~/git_stuff/key.txt
	git push origin main

clean:
	rm -rf a.out dumpfile.vcd
	clear
