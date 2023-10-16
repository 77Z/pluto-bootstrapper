CC = gcc
LD = ld

all:
	$(CC) -Ignu-efi-dir/inc -fpic -ffreestanding -fno-stack-protector -fno-stack-check -fshort-wchar -mno-red-zone -maccumulate-outgoing-args -c main.c -o main.o
	$(LD) -shared -Bsymbolic -Lgnu-efi/x86_64/lib -Lgnu-efi/x86_64/gnuefi -Telf_x86_64_efi.lds gnu-efi/x86_64/gnuefi/crt0-efi-x86_64.o main.o -o main.so -lgnuefi -lefi
	objcopy -j .text -j .sdata -j .data -j .dynamic -j .dynsym  -j .rel -j .rela -j .rel.* -j .rela.* -j .reloc --target efi-app-x86_64 --subsystem=10 main.so main.efi