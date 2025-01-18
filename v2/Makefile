SOURCE_DIRS=./src/fetch/fetch.v ./src/decode/decode.v ./src/execute/execute.v ./src/decode/decode.v ./src/decode/decode.v

sims:
	iverilog ./test/pl_stages/$(stage)/$(stage)_tb.v ./src/pl_stages/$(stage)/*.v ./src/utils/*.v
	./a.out
	gtkwave dumpfile.vcd

simt:
	iverilog ./test/top/cpu_tb.v ./src/top/cpu.v ./src/pl_stages/*/*.v ./src/pl_regs/* ./src/utils/*.v
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
