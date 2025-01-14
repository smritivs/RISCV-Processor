test:
	iverilog ./pl_stages/$(stage)/test/$(stage)_tb.v ./pl_stages/$(stage)/*
	./a.out
	gtkwave dumpfile.vcd

gh:
	git add . -A
	git commit -m "$(msg)"
	xclip -sel c < ~/git_stuff/key.txt
	git push origin main

clean:
	rm -rf a.out dumpfile.vcd
	clear
