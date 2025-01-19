# SOURCES=./src/pl_stages/fetch/fetch.v ./src/pl_stages/decode/decode.v ./src/pl_stages/execute/execute.v ./src/pl_stages/memory/memory.v ./src/pl_stages/writeback/writeback.v ./src/utils ./src/pl_regs/
SRC_STG=-Y .v -y ./src/pl_stages/fetch -Y .v -y ./src/pl_stages/decode -Y .v -y ./src/pl_stages/execute -Y .v -y ./src/pl_stages/memory -Y .v -y ./src/pl_stages/writeback
SRC_REGS=-Y .v -y ./src/pl_regs
SRC_UTILS=-Y .v -y ./src/utils
SRC_TOP=-Y .v -y ./src/top
SRC_ALL=$(SRC_STG) $(SRC_REGS) $(SRC_UTILS) $(SRC_TOP)
sims:
	iverilog $(SRC_ALL) ./test/pl_stages/$(target)/$(target)_tb.v
	./a.out
	gtkwave dumpfile.vcd

simt:
	iverilog $(SRC_ALL) ./test/top/cpu_tb.v
	./a.out
	gtkwave dumpfile.vcd
lint:
	# ./pl_stages/$(stage)/$(stage).v
	verilator --lint-only --top-module ./test/pl_stages/$(stage)/$(stage)_tb.v ./src/pl_stages/$(stage)/*.v ./src/utils/*.v

gh:
	git add . -A
	git commit -m "$(msg)"
	xclip -sel c < ~/git_stuff/key.txt
	git push origin main

clean:
	rm -rf a.out dumpfile.vcd
	clear
