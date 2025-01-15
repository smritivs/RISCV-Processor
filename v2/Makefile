icv:
	iverilog ./pl_stages/$(stage)/test/$(stage)_tb.v ./pl_stages/$(stage)/*.v ./utils/*.v

test:
	iverilog ./pl_stages/$(stage)/test/$(stage)_tb.v ./pl_stages/$(stage)/*.v ./utils/*.v
	./a.out
	gtkwave dumpfile.vcd

lint:
	# ./pl_stages/$(stage)/$(stage).v
	verilator --lint-only --top-module $(stage)_tb ./pl_stages/$(stage)/test/$(stage)_tb.v ./pl_stages/$(stage)/*.v ./utils/*.v

gh:
	git add . -A
	git commit -m "$(msg)"
	xclip -sel c < ~/git_stuff/key.txt
	git push origin main

clean:
	rm -rf a.out dumpfile.vcd
	clear
