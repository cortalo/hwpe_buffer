clean:
		rm -f ./rtl/hwpe_buffer_reg_pkg.sv ./rtl/hwpe_buffer_reg_top.sv

rtl:
		rm -f ./rtl/hwpe_buffer_reg_pkg.sv ./rtl/hwpe_buffer_reg_top.sv
		python3 ./util/regtool.py -r -t ./rtl hwpe_buffer.hjson

chdr:
		python3 ./util/regtool.py -D hwpe_buffer.hjson

.PHONY: clean reggen chdr
