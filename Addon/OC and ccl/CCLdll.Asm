.386 
.model flat,stdcall 
option casemap:none 

include windows.inc 
include kernel32.inc 
includelib kernel32.lib


;���е���ڲ�����
;lpSecStart Ϊ�ڴ��нڱ���ʼ�ĵ�ַ
;lpFileHead Ϊ�ڴ����ļ���ʼ�ĵ�ַ	����MapViewOfFile���أ�

 
.code 


cGetSecRawSize proc lpSecStart				;ȡ��ĳ�ڵ�RawSize
LOCAL	_dReturn
	pushad
	mov	esi,lpSecStart
	assume esi:ptr IMAGE_SECTION_HEADER
	mov	eax,[esi].SizeOfRawData
	mov	_dReturn,eax
	popad
	mov	eax,_dReturn
	assume esi:nothing
	ret

cGetSecRawSize endp


cGetSecRawOff	proc lpSecStart				;ȡ��ĳ�ڵ�RawOffset
LOCAL	_dReturn
	pushad
	mov	esi,lpSecStart
	assume esi:ptr IMAGE_SECTION_HEADER
	mov	eax,[esi].PointerToRawData
	mov	_dReturn,eax
	popad
	mov	eax,_dReturn
	assume esi:nothing
	ret	
cGetSecRawOff endp

cGetSecNum	proc	lpFileHead:DWORD	;��ȡ�ڵĸ���
LOCAL	_dReturn
	pushad
	mov	esi,lpFileHead
	assume	esi:ptr IMAGE_DOS_HEADER
	add	esi,[esi].e_lfanew
	assume	esi:ptr IMAGE_NT_HEADERS
	mov	edx,esi
	add	edx,sizeof IMAGE_NT_HEADERS
	assume	edx:ptr IMAGE_SECTION_HEADER
	movzx	eax,[esi].FileHeader.NumberOfSections
	assume	esi:nothing
	assume	edx:nothing
	mov		_dReturn,eax
	popad
	mov		eax,_dReturn
	ret

cGetSecNum endp



cGetSecTableStart	proc	lpFileHead:DWORD	;��ȡ�ڱ�ͷ
LOCAL	_dReturn
		pushad
		mov	esi,lpFileHead
		assume	esi:ptr IMAGE_DOS_HEADER
		add	esi,[esi].e_lfanew
		add	esi,IMAGE_NT_HEADERS
		mov	_dReturn,esi
		popad
		mov	eax,_dReturn
		assume	esi:nothing
	ret
cGetSecTableStart endp


cGetRvaSection	proc	lpFileHead,dRVA;���RVA���ڽں�,thanks���Ʊ�
LOCAL	_dReturn
		pushad
		mov	esi,lpFileHead
		assume	esi:ptr IMAGE_DOS_HEADER
		add	esi,[esi].e_lfanew
		assume	esi:ptr IMAGE_NT_HEADERS
		mov	edi,dRVA
		mov	edx,esi
		add	edx,sizeof IMAGE_NT_HEADERS
		assume	edx:ptr IMAGE_SECTION_HEADER
		movzx	ecx,[esi].FileHeader.NumberOfSections
		.repeat
			mov	eax,[edx].VirtualAddress
			add	eax,[edx].SizeOfRawData		;eax = Section End
			.if	(edi >= [edx].VirtualAddress) && (edi < eax)
				movzx	eax,word ptr[esi].FileHeader.NumberOfSections	;eax= Section Name
				sub	eax,ecx
				inc	eax
				jmp	@F
			.endif
			add	edx,sizeof IMAGE_SECTION_HEADER
		.untilcxz
		assume	edx:nothing
		assume	esi:nothing
		xor		eax,eax
		dec		eax
@@:		mov	_dReturn,eax
		popad
		mov	eax,_dReturn
		ret
cGetRvaSection	endp



cRvaToOffset	proc	lpFileHead,dRVA;��RVAת�����ļ��е�ƫ��,thanks���Ʊ�
LOCAL	_dReturn
		pushad
		mov	esi,lpFileHead
		assume	esi:ptr IMAGE_DOS_HEADER
		mov	eax,[esi].e_lfanew
		add	esi,eax
		assume	esi:ptr IMAGE_NT_HEADERS
		mov	edi,dRVA
		mov	edx,esi
		add	edx,sizeof IMAGE_NT_HEADERS
		assume	edx:ptr IMAGE_SECTION_HEADER
		movzx	ecx,[esi].FileHeader.NumberOfSections
		.repeat
			mov	eax,[edx].VirtualAddress
			add	eax,[edx].SizeOfRawData		;eax = Section End
			.if	(edi >= [edx].VirtualAddress) && (edi < eax)
				mov	eax,[edx].VirtualAddress ;eax= Section start
				sub	edi,eax			;edi = offset in section
				mov	eax,[edx].PointerToRawData
				add	eax,edi			;eax = file offset
				jmp	@F
			.endif
			add	edx,sizeof IMAGE_SECTION_HEADER
		.untilcxz
		assume	edx:nothing
		assume	esi:nothing
		xor		eax,eax
@@:
		mov	_dReturn,eax
		popad
		mov	eax,_dReturn
		ret
cRvaToOffset	endp

cCheckPE	proc	lpFileHead			;����Ƿ�����Ч��PE�ļ�
LOCAL	_dReturn
	pushad
	push  FALSE
	pop	_dReturn
	mov	esi,lpFileHead
	assume	esi:ptr IMAGE_DOS_HEADER
	.if	[esi].e_magic=="ZM"
		add	esi,[esi].e_lfanew
	assume	esi:ptr IMAGE_NT_HEADERS
		.if	[esi].Signature=="EP"		
			push	TRUE
			pop		_dReturn
		.endif
	.endif
	assume	esi:NOTHING
	popad
	mov	eax,_dReturn
	ret

cCheckPE endp

cGetEntryOff	proc	lpFileHead;ȡ��ԭPE�ļ���ڵ��ļ�ƫ��
LOCAL	_dReturn
	pushad
	mov	esi,lpFileHead
	assume	esi:ptr IMAGE_DOS_HEADER
	add	esi,[esi].e_lfanew
	assume	esi:ptr IMAGE_NT_HEADERS
	mov	eax,[esi].OptionalHeader.AddressOfEntryPoint
	invoke	cRvaToOffset,lpFileHead,eax
	mov	_dReturn,eax
	popad
	mov	eax,_dReturn	
	ret

cGetEntryOff endp

cGetEntryRva	proc	lpFileHead;ȡ��ԭPE�ļ���ڵ�RVA��ַ
LOCAL	_dReturn
	pushad
	mov	esi,lpFileHead
	assume	esi:ptr IMAGE_DOS_HEADER
	mov	eax,[esi].e_lfanew
	add	esi,eax
	assume	esi:ptr IMAGE_NT_HEADERS
	mov	eax,[esi].OptionalHeader.AddressOfEntryPoint
	mov	_dReturn,eax
	assume	esi:nothing	
	popad
	mov	eax,_dReturn
	ret

cGetEntryRva endp

cCanAddNewSec	proc	lpFileHead;�ж��Ƿ�������һ���½ڣ�����ֵΪTRUE��FALSE
LOCAL	_dReturn
	pushad
	mov	_dReturn,FALSE
	mov	esi,lpFileHead
	assume	esi:ptr IMAGE_DOS_HEADER
	mov	edi,[esi].e_lfanew
	add	esi,[esi].e_lfanew
	assume	esi:ptr IMAGE_NT_HEADERS
	invoke	cGetSecNum,lpFileHead
	mov	ecx,28h
	inc	eax
	mul	ecx
	add eax,edi
	add eax,24
	add ax,[esi].FileHeader.SizeOfOptionalHeader
	.if	eax<[esi].OptionalHeader.SizeOfHeaders
		mov	_dReturn,TRUE
	.endif
	popad
	mov eax,_dReturn
	ret

cCanAddNewSec endp

cOffsetToRva	proc	lpFileHead,dOffset			;���ļ�Offsetת��Ϊ�ڴ�RVA
LOCAL	_dReturn
	pushad
		mov	esi,lpFileHead
		assume	esi:ptr IMAGE_DOS_HEADER
		add	esi,[esi].e_lfanew
		assume	esi:ptr IMAGE_NT_HEADERS
		mov	edi,dOffset
		mov	edx,esi
		add	edx,sizeof IMAGE_NT_HEADERS
		assume	edx:ptr IMAGE_SECTION_HEADER
		movzx	ecx,[esi].FileHeader.NumberOfSections
		.repeat
			mov	eax,[edx].PointerToRawData
			add	eax,[edx].SizeOfRawData		;eax = Section End
			.if	(edi >= [edx].PointerToRawData) && (edi < eax)
				mov	eax,[edx].PointerToRawData ;eax= Section start
				sub	edi,eax			;edi = offset in section
				mov	eax,[edx].VirtualAddress
				add	eax,edi			;eax = file offset
				jmp	@F
			.endif
			add	edx,sizeof IMAGE_SECTION_HEADER
		.untilcxz
		assume	edx:nothing
		assume	esi:nothing
		xor		eax,eax
@@:
		mov	_dReturn,eax
		popad
		mov	eax,_dReturn
	ret

cOffsetToRva endp


cGetSecAttribute	proc	lpFileHead,dNum		;ȡ�õ�N���ڵ�����
LOCAL	_dReturn
	pushad	
	mov eax,dNum
	dec eax
	mov ecx,28h
	mul ecx
	mov ebx,eax
	invoke	cGetSecTableStart,lpFileHead
	add eax,ebx
	mov esi,eax
assume esi:ptr IMAGE_SECTION_HEADER	
	push [esi].Characteristics
	pop _dReturn
assume esi:nothing	
	popad
	mov eax,_dReturn
	ret

cGetSecAttribute endp

cChangeSecAttribute	proc	lpFileHead,dNum,dAttribute	;�ı��dNum���ڵ�����
	pushad
	mov eax,dNum
	nop
	dec eax
	nop
	mov ecx,28h
	mul ecx
	mov ebx,eax
	invoke	cGetSecTableStart,lpFileHead
	add eax,ebx
	mov esi,eax	
assume esi:ptr IMAGE_SECTION_HEADER	
	push dAttribute
	pop	dword ptr [esi].Characteristics
assume esi:nothing	
@@:	popad
	ret
cChangeSecAttribute	endp


cCheckIsDll	proc	lpFileHead	;����Ƿ���DLL
LOCAL	_dReturn
	pushad
	mov	esi,lpFileHead
	assume	esi:ptr IMAGE_DOS_HEADER
	add	esi,[esi].e_lfanew
	assume	esi:ptr IMAGE_NT_HEADERS
	xor	eax,eax
	mov	ax,word ptr [esi].FileHeader.Characteristics
	and ax,2000h
	.if	eax==0
		mov	_dReturn,FALSE
	.else
		mov	_dReturn,TRUE
	.endif
	popad
	mov	eax,_dReturn
	ret

cCheckIsDll endp

DllEntry proc hInstDLL:HINSTANCE, reason:DWORD, reserved1:DWORD 

        mov  eax,TRUE 
        ret 
DllEntry Endp 

db	"CCLdll.dll Version 2.5"
db	"tankaiha[NE365][FCG]"

End DllEntry 

;------------------------------------------------------------------------------------- 