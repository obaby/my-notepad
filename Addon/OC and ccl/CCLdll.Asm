.386 
.model flat,stdcall 
option casemap:none 

include windows.inc 
include kernel32.inc 
includelib kernel32.lib


;所有的入口参数中
;lpSecStart 为内存中节表开始的地址
;lpFileHead 为内存中文件开始的地址	（由MapViewOfFile返回）

 
.code 


cGetSecRawSize proc lpSecStart				;取得某节的RawSize
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


cGetSecRawOff	proc lpSecStart				;取得某节的RawOffset
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

cGetSecNum	proc	lpFileHead:DWORD	;获取节的个数
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



cGetSecTableStart	proc	lpFileHead:DWORD	;获取节表头
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


cGetRvaSection	proc	lpFileHead,dRVA;获得RVA所在节号,thanks罗云彬
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



cRvaToOffset	proc	lpFileHead,dRVA;将RVA转换成文件中的偏移,thanks罗云彬
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

cCheckPE	proc	lpFileHead			;检查是否是有效的PE文件
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

cGetEntryOff	proc	lpFileHead;取得原PE文件入口的文件偏移
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

cGetEntryRva	proc	lpFileHead;取得原PE文件入口的RVA地址
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

cCanAddNewSec	proc	lpFileHead;判断是否能添加一个新节，返回值为TRUE和FALSE
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

cOffsetToRva	proc	lpFileHead,dOffset			;将文件Offset转换为内存RVA
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


cGetSecAttribute	proc	lpFileHead,dNum		;取得第N个节的属性
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

cChangeSecAttribute	proc	lpFileHead,dNum,dAttribute	;改变第dNum个节的属性
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


cCheckIsDll	proc	lpFileHead	;检测是否是DLL
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
