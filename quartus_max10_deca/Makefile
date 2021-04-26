
DESIGN_NAME = mini_cpu

QUARTUS_DIR = ~/intelFPGA_lite/20.1/quartus/bin

DB_CPU_RAM0 = $(wildcard ./db/mini_cpu.ram0_top*.mif)
DB_CPU_RAM1 = $(wildcard ./db/mini_cpu.ram1_top*.mif)
DB_CPU_RAM2 = $(wildcard ./db/mini_cpu.ram2_top*.mif)
DB_CPU_RAM3 = $(wildcard ./db/mini_cpu.ram3_top*.mif)

DB_CPU_RAMS = $(DB_CPU_RAM0) $(DB_CPU_RAM1) $(DB_CPU_RAM2) $(DB_CPU_RAM3)

all: compile

compile: 
	$(QUARTUS_DIR)/quartus_map --read_settings_files=on --write_settings_files=off $(DESIGN_NAME) -c $(DESIGN_NAME)
	$(QUARTUS_DIR)/quartus_fit --read_settings_files=on --write_settings_files=off $(DESIGN_NAME) -c $(DESIGN_NAME)
	$(QUARTUS_DIR)/quartus_asm --read_settings_files=on --write_settings_files=off $(DESIGN_NAME) -c $(DESIGN_NAME)
	$(QUARTUS_DIR)/quartus_sta $(DESIGN_NAME) -c $(DESIGN_NAME)

update_ram: sw $(DB_CPU_RAMS)
	$(QUARTUS_DIR)/quartus_cdb $(DESIGN_NAME) -c $(DESIGN_NAME) --update_mif
	$(QUARTUS_DIR)/quartus_asm --read_settings_files=on --write_settings_files=off $(DESIGN_NAME) -c $(DESIGN_NAME)

$(DB_CPU_RAM0): ../sw/progmem0.mif
	cp $< $@

$(DB_CPU_RAM1): ../sw/progmem1.mif
	cp $< $@

$(DB_CPU_RAM2): ../sw/progmem2.mif
	cp $< $@

$(DB_CPU_RAM3): ../sw/progmem3.mif
	cp $< $@

sw:
	cd ../sw && make

clean:
	\rm -fr db incremental_db simulation
