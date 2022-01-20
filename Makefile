clean:
		rm -f ./rtl/hwpe_buffer_reg_pkg.sv ./rtl/hwpe_buffer_reg_top.sv

reggen:
		rm -f ./rtl/hwpe_buffer_reg_pkg.sv ./rtl/hwpe_buffer_reg_top.sv
		python3 ./util/regtool.py -r -t ./rtl hwpe_buffer.hjson

.PHONY: clean reggen
