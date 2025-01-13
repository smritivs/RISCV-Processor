transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code {/home/bala/git_stuff/RISCV-Processor/v1/code/t1c_riscv_cpu.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code {/home/bala/git_stuff/RISCV-Processor/v1/code/riscv_cpu.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code {/home/bala/git_stuff/RISCV-Processor/v1/code/data_mem.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/reset_ff.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/reg_file.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/mux4.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/mux3.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/mux2.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/main_decoder.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/imm_extend.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/datapath.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/controller.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/alu_decoder.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/alu.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code/components {/home/bala/git_stuff/RISCV-Processor/v1/code/components/adder.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/code {/home/bala/git_stuff/RISCV-Processor/v1/code/instr_mem.v}

vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v1/.test {/home/bala/git_stuff/RISCV-Processor/v1/.test/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run 2000 ns
