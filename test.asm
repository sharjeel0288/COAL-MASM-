INCLUDE Irvine32.INC
include Macros.inc
.data
blanks byte "                                        ",0
titles byte"Little Giants",0
name4 byte " 18k-1171 ALQAMA RAO",0
name5 byte " 18K-0191 AQSA BATOOL ",0
name1 byte " 18k-1091 ALI AMAN ",0
name2 byte " 18K-1094 SHAMSA SHAKIR ",0
name3 byte " 18K-1118 SAWERA SALEEM ",0
name6 byte " 18K-1139 ISTABRAQ SHAHEER ",0

copy BYTE 20 DUP(?)
count1 dword 0
validword BYTE "Your word was FOUND in the Dictionary !!! ",0ah,0dh
invalidword BYTE "Your word was NOT FOUND in the Dictionary !!! ",0ah,0dh
flag BYTE 0
len1 Dword ?
len2 DWORD ?
back byte ?

arr BYTE "ABCDEFGHIJKLMNOPQRSTUVWXYZ",0
ans BYTE 20 DUP(?)
pos1 BYTE 20 DUP(?)
pos2 BYTE 20 DUP(?)
row BYTE 2
col BYTE 20
temprow BYTE 2
tempcol BYTE 20
str1	BYTE "--------- Assume a Word --------- ",0ah,0dh,0ah,0dh,"                                 Step 01 : ",0ah,0dh,"                      ==============================",0ah,0dh,"                                 Table 01 : ",0
str11	BYTE "--------- Assume a Word --------- ",0ah,0dh,0ah,0dh,"                                 Step 02 : ",0ah,0dh,"                      ==============================",0ah,0dh,"                                 Table 02 : ",0
str2	BYTE "Enter Total Number of Alphabets in Your Word : ",0
str3	BYTE "Enter Column Number of Letter # ",0
str4    BYTE " : ",0
space   BYTE "                                                                                    ",0
str5	BYTE "Surprise !!! Your Word Is = ",0
k       BYTE 1
i    BYTE 5
j    BYTE 0
wcount BYTE ?
str111 byte "PLEASE WAIT WHILE LOADING: ",0
str222 byte "CONTENT LOADED SUCCESSFULLY",0
enterkeytoaccess byte "Press Enter key to see its possible Anagrams  ",0
promptin BYTE "Following are the all possible Anagrams of the word entered : ",0
c1 dword 0
count = 20
p dword count dup (0)
ii dword 1
jj dword 0
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
buffer1 BYTE bufferSize dup(?)
copyarr byte 20 DUP(?)

.code

check PROC
	MOVZX eax,ans[0]

	CMP eax,'A'
	JE LA
		CMP eax,'B'
		JE LB
			CMP eax,'C'
			JE LC
				CMP eax,'D'
				JE LD
					CMP eax,'E'
					JE LEE
						CMP eax,'F'
						JE LF
							CMP eax,'G'
							JE LG
								CMP eax,'H'
								JE LH
									CMP eax,'I'
									JE LI
										CMP eax,'J'
										JE LJ
											CMP eax,'K'
											JE LK
												CMP eax,'L'
												JE LL
													CMP eax,'M'
													JE LM
														CMP eax,'N'
														JE LN
															CMP eax,'O'
															JE LO
																CMP eax,'P'
																JE LP
																	CMP eax,'Q'
																	JE LQ
																		CMP eax,'R'
																		JE LR
																			CMP eax,'S'
																			JE LS
																				CMP eax,'T'
																				JE LTT
																					CMP eax,'U'
																					JE LU
																						CMP eax,'V'
																						JE LV
																							CMP eax,'W'
																							JE LW
																								CMP eax,'X'
																								JE LX
																									CMP eax,'Y'
																									JE LY
																										CMP eax,'Z'
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
	CALL OpenInputFile
	MOV filehandle, EAX
	MOV eax, filehandle
	MOV edx, OFFSET buffer1
	MOV ecx, bufferSize
	CALL ReadFromFile

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
		MOV flag,0
			  mWriteString OFFSET invalidword
		
	JMP _end

	_found:
		MOV flag,1
		mWriteString OFFSET validword
		
			  
			 
_end:
RET
check ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  swap
swap PROC , pval:Ptr Dword ,pval2:PTR dword
	MOV esi,pval
	MOV al,[esi]

	MOV esi,pval2
	MOV bl,[esi]

	MOV [esi],al
	MOV esi,pval
	MOV [esi],bl

	RET
swap ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   findperms
findPerms PROC , n : dword
	MOV row,2
	MOV col,2
	MOV DH,row
	MOV DL,col
	CALL GOTOXY
	INC row
	add col,4
	MOV edx,OFFSET promptin
	CALL WriteString
	CALL CRLF
	CALL CRLF
	MOV DH,row
	MOV DL,col
	CALL GOTOXY
	INC row
	MOV edx, OFFSET ans
		CALL WriteString
		CALL CRLF
		INC c1
		add col,2
L1:
	MOV eax,ii
	CMP eax,n
	JAE L2
		MOV esi,ii
		MOV eax,p[esi*type p]
		CMP eax,ii
		JAE L3
			MOV edx,0
			MOV eax,ii
			MOV ebx,2
			div ebx

			MOV ebx,edx
			MOV esi,ii
			MOV eax,p[esi*type p]
			mul ebx

			MOV jj,eax

			MOV esi,OFFSET ans
			add esi,ii
			MOV edi,OFFSET ans
			add edi,jj

			 INVOKE swap, esi,edi
			 

			INC c1
			MOV DH,row
			MOV DL,col
			;CALL GOTOXY
				
				MOV edx,OFFSET ans
				
				CALL WriteString
				CALL CRLF
				INC row
				add col,2
			MOV esi,ii
			MOV eax,p[esi*type p]
			INC eax
			MOV p[esi*type p],eax
			MOV ii,1
			JMP L1
				
L3:
	MOV esi,ii
	MOV p[esi*type p],0
	INC ii
	JMP L1
L2:
	RET
findPerms ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; module2
Anagram PROC
	CALL CRLF
	MOV eax,0
	INVOKE str_length, addr ans
	INVOKE findPerms, eax
	MOV eax,c1
	CALL Writedec
	CALL CRLF
	RET 
Anagram ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; loading
loading proc
	call clrscr
	mov ecx,50
	mov dh, 10
	mov dl, 43
	call gotoxy
	mov edx,offset str111
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
	mov edx,offset str222
	call writestring
	call crlf
	mov eax, 2000
	call delay
	call clrscr

	mov dh, 12
	mov dl, 47
	call gotoxy
	mov edx,offset titles
	call writestring
	mov eax,500

	mov eax,800

	mov dh, 15
	mov dl, 42
	call gotoxy
	mov edx,offset name1
	call writestring

	call delay
	mov dh, 16
	mov dl, 42
	call gotoxy
	mov edx,offset name2
	call writestring

	call delay
	mov dh, 17
	mov dl, 42
	call gotoxy
	mov edx,offset name3
	call writestring

	call delay
	mov dh, 18
	mov dl, 42
	call gotoxy
	mov edx,offset name4
	call writestring

	call delay
	mov dh, 19
	mov dl, 42
	call gotoxy
	mov edx,offset name5
	call writestring

	call delay
	mov dh, 20
	mov dl, 42
	call gotoxy
	mov edx,offset name6
	call writestring
	mov eax,10000
	call delay

RET
loading endp




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; main
main PROC
MOV eax, magenta + (white * 16)
CALL SetTextColor
CALL CLRSCR

;CALL loading
CALL CLRSCR
mov ecx,lengthof ans
mov edx,offset ans
call readstring
CALL check

;CALL findWordGame

 
	CMP flag,1
	JNE LEXIT
		MOV dh,17
		MOV dl,15
		CALL GOTOXY
		MOV edx, OFFSET validword
		CALL WriteString
		MOV DH,22
		MOV Dl,15
		CALL GOTOXY
		MOV edx, OFFSET enterkeytoaccess
		CALL WriteString
		CALL readchar
		CALL CRLF
		CALL CLRSCR
		CALL Anagram
		JMP endl
LEXIT:
		MOV dh,17
		MOV dl,15
		CALL GOTOXY
		MOV edx,OFFSET invalidword
		CALL WriteString
		MOV DH,22
		MOV Dl,15
		CALL GOTOXY
endl:call anagram
exit
main ENDP
end main