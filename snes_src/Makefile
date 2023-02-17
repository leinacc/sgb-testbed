all: main.bin

build/main.o: code/main.s hacks/*
	wla-65816 -h -o $@ $<

main.bin: build/main.o
	wlalink -b -S linkfile $@
