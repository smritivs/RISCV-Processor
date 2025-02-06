import os
import sys

type = sys.argv[1]
stages = sys.argv[2]

# path = f"~/git_stuff/RISCV-Vivado/{type}{stages}stage/{type}{stages}stage.srcs/sources_1/imports/src/pl_stages/fetch"
path = f"/home/bala/git_stuff/RISCV-Vivado/{type}{stages}stage/{type}{stages}stage.srcs/sources_1/imports/src/pl_stages/fetch/instr_mem.v"

contents = ""

with open(path,"r") as file:
	contents = file.readlines()

	for i in contents:
		if "$readmemh" in i:
			index = contents.index(i)
			new_text = f"$readmemh(\"/home/bala/git_stuff/RISCV-Vivado/{type}{stages}stage/{type}{stages}stage.srcs/sources_1/new/code.hex\", instr_rom);\n"
			contents[index] = new_text



with open(path,"w") as file:
	file.writelines(contents)
