transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/utils {/home/bala/git_stuff/RISCV-Processor/v3/code/utils/reset_ff.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/utils {/home/bala/git_stuff/RISCV-Processor/v3/code/utils/mux3.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/utils {/home/bala/git_stuff/RISCV-Processor/v3/code/utils/mux2.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/utils {/home/bala/git_stuff/RISCV-Processor/v3/code/utils/adder.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/top {/home/bala/git_stuff/RISCV-Processor/v3/code/top/cpu.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/writeback {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/writeback/writeback.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/memory {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/memory/memory.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/memory {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/memory/data_memory.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/hazard {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/hazard/hazard.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/fetch {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/fetch/fetch.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/execute {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/execute/execute.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/execute {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/execute/alu.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/decode {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/decode/reg_file.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/decode {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/decode/imm_ext.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/decode {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/decode/decode.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/decode {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/decode/control_unit.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_regs {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_regs/pl_reg_mw.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_regs {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_regs/pl_reg_fd.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_regs {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_regs/pl_reg_em.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_regs {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_regs/pl_reg_de.v}
vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/fetch {/home/bala/git_stuff/RISCV-Processor/v3/code/pl_stages/fetch/instr_mem.v}

vlog -vlog01compat -work work +incdir+/home/bala/git_stuff/RISCV-Processor/v3/.test {/home/bala/git_stuff/RISCV-Processor/v3/.test/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run 2000 ns
