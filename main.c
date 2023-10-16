#include <efi/efi.h>
#include <efi/efiapi.h>
#include <efi/efidef.h>
#include <efi/efierr.h>
#include <efi/efilib.h>
#include <efi/x86_64/efibind.h>

EFI_STATUS
EFIAPI
efi_main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
	InitializeLib(ImageHandle, SystemTable);

	Print(L"Pluto OS Bootstrapper\n");
	
	return EFI_SUCCESS;
}