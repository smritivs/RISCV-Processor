sim:
	iverilog ./test/pl_stages/$(stage)/$(stage)_tb.v ./src/pl_stages/$(stage)/*.v ./src/utils/*.v
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
