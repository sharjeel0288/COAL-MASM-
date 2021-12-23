INCLUDE Irvine32.inc
INCLUDE macros.inc

.data
blanks BYTE "                                        ",0
project BYTE "Anagram Solver !!!",0
name1 BYTE " 20K-0288 SHARJEEL AHMED ",0
name2 BYTE " 20K-1612 AHZAM IMAM",0


count = 20
prompt BYTE "Do you want to check possible combinations? (Yes/No) ",0
promptin BYTE "Enter your word of max length 10 : ",0
wordinput BYTE count DUP(?)
c1 DWORD 0
p DWORD count dup (0)
i DWORD 1
j DWORD 0
ans BYTE 20 DUP(?)
character BYTE 3 DUP(?)

count1 dword 0
flag BYTE 0
len1 DWORD ?
len2 DWORD ?
back BYTE ?
word_cnt DWORD ?

load BYTE "PLEASE WAIT WHILE DICTIONARIES ARE BEING LOADED: ",0
loading_success BYTE "CONTENT LOADED SUCCESSFULLY",0

filehandle DWORD ?
afile BYTE "a.txt", 0
bfile BYTE "b.txt", 0
cfile BYTE "c.txt", 0
dfile BYTE "d.txt", 0
efile BYTE "e.txt", 0
ffile BYTE "f.txt", 0
gfile BYTE "g.txt", 0
hfile BYTE "h.txt", 0
ifile BYTE "i.txt", 0
jfile BYTE "j.txt", 0
kfile BYTE "k.txt", 0
lfile BYTE "l.txt", 0
mfile BYTE "m.txt", 0
nfile BYTE "n.txt", 0
ofile BYTE "o.txt", 0
pfile BYTE "p.txt", 0
qfile BYTE "q.txt", 0
rfile BYTE "r.txt", 0
sfile BYTE "s.txt", 0
tfile BYTE "t.txt", 0
ufile BYTE "u.txt", 0
vfile BYTE "v.txt", 0
wfile BYTE "w.txt", 0
xfile BYTE "x.txt", 0
yfile BYTE "y.txt", 0
zfile BYTE "z.txt", 0

bufferSize = 999990
buffer BYTE "1234567890",0
buffer1 BYTE bufferSize dup(?)
copyarr BYTE 20 DUP(?)

.code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  check
check PROC
	mov eax,0
	MOV al,ans[0]
	CMP al,'a'
	JE LA
	CMP al,'b'
	JE LB
	CMP al,'c'
	JE LC
	CMP al,'d'
	JE LD
	CMP al,'e'
	JE LEE
	CMP al,'f'
	JE LF
	CMP al,'g'
	JE LG
	CMP al,'h'
	JE LH
	CMP al,'i'
	JE LI
	CMP al,'j'
	JE LJ
	CMP al,'k'
	JE LK
	CMP al,'l'
	JE LL
	CMP al,'m'
	JE LM
	CMP al,'n'
	JE LN
	CMP al,'o'
	JE LO
	CMP al,'p'
	JE LP
	CMP al,'q'
	JE LQ
	CMP al,'r'
	JE LR
	CMP al,'s'
	JE LS
	CMP al,'t'
	JE LTT
	CMP al,'u'
	JE LU
	CMP al,'v'
	JE LV
	CMP al,'w'
	JE LW
	CMP al,'x'
	JE LX
	CMP al,'y'
	JE LY
	CMP al,'z'
	JE LZ

	LA:
		MOV edx,OFFSET afile
		JMP Last
	LB:
		MOV edx,OFFSET bfile
		JMP Last
	LC:
		MOV edx,OFFSET cfile
		JMP Last
	LD:
		MOV edx,OFFSET dfile
		JMP Last
	LEE:
		MOV edx,OFFSET efile
		JMP Last	
	LF:
		MOV edx,OFFSET ffile
		JMP Last
	LG:
		MOV edx,OFFSET gfile
		JMP Last
	LH:
		MOV edx,OFFSET hfile
		JMP Last
	LI:
		MOV edx,OFFSET ifile
		JMP Last
	LJ:
		MOV edx,OFFSET jfile
		JMP Last
	LK:
		MOV edx,OFFSET kfile
		JMP Last
	LL:
		MOV edx,OFFSET lfile
		JMP Last
	LM:
		MOV edx,OFFSET mfile
		JMP Last
	LN:
		MOV edx,OFFSET nfile
		JMP Last
	LO:
		MOV edx,OFFSET ofile
		JMP Last
	LP:
		MOV edx,OFFSET pfile
		JMP Last
	LQ:
		MOV edx,OFFSET qfile
		JMP Last
	LR:
		MOV edx,OFFSET rfile
		JMP Last
	LS:
		MOV edx,OFFSET sfile
		JMP Last
	LTT:
		MOV edx,OFFSET tfile
		JMP Last
	LU:
		MOV edx,OFFSET ufile
		JMP Last
	LV:
		MOV edx,OFFSET vfile
		JMP Last
	LW:
		MOV edx,OFFSET wfile
		JMP Last
	LX:
		MOV edx,OFFSET xfile
		JMP Last
	LY:
		MOV edx,OFFSET yfile
		JMP Last
	LZ:
		MOV edx,OFFSET zfile
		JMP Last

	Last:
		call OpenInputFile
		mov filehandle, EAX
		mov eax, filehandle



		mov edx, OFFSET buffer1
		mov ecx,LENGTHOF wordinput
		mov word_cnt,ecx
		mov ecx, bufferSize
		call ReadFromFile
		MOV eax, 0
	INVOKE str_length, addr buffer1
	MOV len1, eax

	MOV eax, 0
	INVOKE str_length, addr ans
	MOV len2, eax

	MOV back,al
	dec back
	MOV ebx, len1
	MOV ecx,0

	MOV esi, OFFSET buffer1

	MOV ecx, ebx
	Loop1:
		push ecx
		MOV esi, OFFSET buffer1
		add esi, count1
		MOV ecx, len2
		MOV edi, OFFSET copyarr
			cld
			rep MOVsb
			
			pop ecx
			MOV eax,1
			INVOKE Str_compare, addr copyarr, addr ans
			jz _found

			INC count1
	
			Loop Loop1
		mov flag,0
		mwrite "NOT FOUND     ",0ah,0dh
		JMP _end

		_found:
		;mwrite "Found     ",0ah,0dh
			MOV flag,1
quit:

	_end:
	ret
check ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  swap
swap PROC , pval:Ptr Dword ,pval2:PTR dword
	mov esi,pval
	mov al,[esi]	;al=second alphabet ka address 
	mov esi,pval2
	mov bl,[esi]	;bl=first alphabet ka address

	mov [esi],al
	mov esi,pval
	mov [esi],bl
	ret
swap ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  findperms
findPerms proc , n : dword	;n=Length of wordinput
	;mov edx, OFFSET wordinput ; loop
	mov dl,wordinput[0]
	mov ans,dl
	call check
	cmp flag,1
	je print
	print:
		mov edx,OFFSET wordinput
		mwrite "                                "
		call writestring
		call crlf
	inc c1
	L1:
		mov eax,i ;1
		cmp eax,n ;4
		JAE L2		;eax>=n
			mov esi,i
			mov eax,p[esi*type p]
			;call DumpRegs
			cmp eax,i
			JAE L3
				MOV edx,0
				mov eax,i
				mov ebx,2
				div ebx

				mov ebx,edx
				mov esi,i
				mov eax,p[esi*type p]
				mul ebx

				mov j,eax

				mov esi,OFFSET wordinput
				add esi,i
				mov edi,OFFSET wordinput
				add edi,j

				invoke swap, esi,edi
				mov edx,OFFSET wordinput
				mov ans,dl
				call check

				cmp flag,1
				je print1
				jmp not_print
				print1:
					inc c1
					mov eax,500
					call delay
					mov edx,OFFSET wordinput
					mwrite"                                "
					call writestring
					call crlf
				not_print:	
					mov esi,i
					mov eax,p[esi*type p]
					inc eax
					mov p[esi*type p],eax
					mov i,1
					jmp L1
	L3:
		mov esi,i
		mov p[esi*type p],0
		inc i
		jmp L1
	L2:
		ret
findPerms endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  loading
loading proc
	call clrscr
	mov ecx,50
	mov dh, 10
	mov dl, 30
	call gotoxy
	mov edx,offset load
	call writestring
	mov dh, 12
	mov dl, 30
	l1:
		call gotoxy
		mov eax, 25
		call delay
		mov eax, 219
		call writechar
		inc dl
	loop l1
	mov dh, 15
	mov dl, 42
	call gotoxy
	mov edx,offset loading_success
	call writestring
	call crlf
	mov eax, 2000
	call delay
	call clrscr

	mov dh, 7
	mov dl, 44
	call gotoxy
	mov edx,offset project
	call writestring
	mov eax,500

	mov eax,1200
	mov dh, 11
	mov dl, 42
	call gotoxy
	mov edx,offset name1
	call writestring

	call delay
	mov dh, 13
	mov dl, 42
	call gotoxy
	mov edx,offset name2
	call writestring

	mov eax,2000
	call delay
	ret
loading endp

loading2 proc
	call clrscr
	mov ecx,50
	mov dh, 10
	mov dl, 30
	call gotoxy
	mwrite "Please wait while combinations are being generated"
	mov dh, 12
	mov dl, 30
	l1:
		call gotoxy
		mov eax, 25
		call delay
		mov eax, 219
		call writechar
		inc dl
	loop l1
	mov eax,150
	call delay
	ret
loading2 endp



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  main
main PROC	
	mov eax, red + (white * 16)
	call settextcolor
	call clrscr

	call loading
	call clrscr

	;above_prompt:
		mov dh,12
		mov dl,30
		call gotoxy
		mov edx, offset prompt
		call writestring
		mov edx, offset character
		mov ecx, 3
		call readstring
		MOVZX eax,character[0]
		cmp eax,'y'
		je permotation_again
		jmp end_main
		permotation_again:
			mov dh,14
			mov dl,30
			call gotoxy
			mov edx, offset promptin
			call writestring
			mreadstring wordinput
			call crlf
			mov eax,0
			invoke str_length, addr wordinput
			push eax
			push ecx
			push edx
			call loading2
			pop edx
			pop ecx
			pop eax
			call clrscr
			call crlf
			call crlf
			call crlf
			call crlf
			mwrite "                              Possible combination of the word entered are "
			call crlf
			invoke findPerms, eax
			call check
			call crlf
			call crlf
			mov eax,c1
			mwrite "                                Number of combinations :- "
			;
			call writedec
			call crlf
			call crlf
			mwrite "                                Above mentioned words were found in dictionary"
		end_main:
		call crlf
		call crlf
		call crlf
		mov eax,20
		call delay
		mwrite "                                   ** THANK YOU ****"
			exit 
main ENDP
END main