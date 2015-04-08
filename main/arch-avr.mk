# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

MCU = attiny45
DF_CPU = 8000000
AVRDUDE_FLAGS=-c avrisp -b 19200 -P /dev/ttyACM0

CC = avr-gcc
CFLAGS = -c -std=gnu99 -mmcu=$(MCU) -DF_CPU=$(DF_CPU) -Os \
	     -fpack-struct -fshort-enums -Wall -Wstrict-prototypes
LDFLAGS = -mmcu=$(MCU) -Wall


ALLSUBDIRS = $(SUBDIRS) $(SUBDIRS_AVR)


TARGET = $(BUILDDIR)/$(NAME)


.PHONY: all program size


all: $(TARGET).hex


program: $(TARGET).hex
	@echo write program to flash
	avrdude -p$(MCU) $(AVRDUDE_FLAGS) -Uflash:w:$(TARGET).hex:a


size: $(TARGET).hex
	@avr-size --mcu=$(MCU) -C $(TARGET).elf


$(TARGET).hex: $(TARGET).elf
	@echo generate hex file
	@avr-objcopy -O ihex -R .eeprom $(TARGET).elf $(TARGET).hex
