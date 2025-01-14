test:
	iverilog ./pl_stages/$(stage)/test/$(stage)_tb.v ./pl_stages/$(stage)/*
	./a.out
	gtkwave dumpfile.vcd

gpa:
	git add . -A
	git commit -m "$(msg)"
	gp

clean:
	rm -rf a.out dumpfile.vcd
	clear
