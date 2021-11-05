// THE ACTUAL FILE EXTENSION IS SUPPOSED TO BE .CT! USING .s BECAUSE GITHUB DOES NOT RECOGNIZE .CT FILE EXTENSION!
// All created by FreddyZhang666, Fandom’s Official Cheat Engine Wiki Admin. Credits go to the actual video games that allow my mod to run on.



// Flash BTD5 Bloon Income Hack for 32bit Flash Player. Last updated: Sept 2021
[ENABLE]

aobscan(INJECT,8B 71 50 66 0F 57 D2)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
  mov esi,[ecx+50]
  add [ecx+50],FFFF
  xorpd xmm2,xmm2
  jmp return

INJECT:
  jmp newmem
  nop 2
return:
registersymbol(INJECT)

[DISABLE]

INJECT:
  db 8B 71 50 66 0F 57 D2

unregistersymbol(INJECT)
dealloc(newmem)



// Flash BTD5 Fat Mod for 32bit Flash Player. Last updated: Sept 2021
[ENABLE]

aobscanmodule(INJECT,flashplayer_32_sa.exe,D9 5F 2C E8 70 F4 05 00)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
  fstp dword ptr [edi+2C]
  add [edi+2C],FFFF
  call flashplayer_32_sa.exe+2310E0
  jmp return

INJECT:
  jmp newmem
  nop 3
return:
registersymbol(INJECT)

[DISABLE]

INJECT:
  db D9 5F 2C E8 70 F4 05 00

unregistersymbol(INJECT)
dealloc(newmem)



// Note that at least one of the two scripts work. If you don’t see anything happening on display, drop an item out
// Minecraft Java Edition 1.15.2 Item Spawner Version 1. Last updated: May 2020
[ENABLE]
aobscan(INJECT,44 8B 4B 0C 48 8B D0)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
  mov r9d,[rbx+0C]
  add [rbx+0C],02
  mov rdx,rax
  jmp return

INJECT:
  jmp newmem
  nop 2
return:
registersymbol(INJECT)

[DISABLE]

INJECT:
  db 44 8B 4B 0C 48 8B D0

unregistersymbol(INJECT)
dealloc(newmem)



// Note that at least one of the two scripts work. If you don’t see anything happening on display, drop an item out
// Minecraft Java Edition 1.15.2 Item Spawner Version 2. Last updated: May 2020
[ENABLE]
aobscan(INJECT,44 8B 58 0C 4C 8B D0)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
  mov r11d,[rax+0C]
  add [rax+0C],02
  mov r10,rax
  jmp return

INJECT:
  jmp newmem
  nop 2
return:
registersymbol(INJECT)

[DISABLE]

INJECT:
  db 44 8B 58 0C 4C 8B D0

unregistersymbol(INJECT)
dealloc(newmem)



// Minecraft Java Edition 1.15.2 XP Hack. Last updated: May 2020
[ENABLE]

aobscan(INJECT,8B ?2 A4 02 00 00 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 00 00 00)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
  mov r10d,[rdx+000002A4]
  mov [rdx+000002A4],95000
  jmp return

INJECT:
  jmp newmem
  nop
return:
registersymbol(INJECT)

[DISABLE]

INJECT:
  db 8B B2 A4 02 00 00

unregistersymbol(INJECT)
dealloc(newmem)



// Minecraft Java Edition 1.15.2 Premium Vision Mod. Last updated: Dec 2020
[ENABLE]
//only refers to the item display in-hand
aobscan(INJECT,45 8B 42 20 4D 8B D8)
alloc(newmem,$1000)

label(code)
label(return)

newmem:

code:
  mov r8d,[r10+20]
  mov r8,[r10+20]
  mov r11,r8
  jmp return

INJECT:
  jmp newmem
  nop 2
return:
registersymbol(INJECT)

[DISABLE]

INJECT:
  db 45 8B 42 20 4D 8B D8

unregistersymbol(INJECT)
dealloc(newmem)




// 70% credits give to Cheat the Game, a YouTuber.
// Minecraft Java Edition 1.15.2 Teleport Hack. Last updated: March 2020
[ENABLE]

aobscan(teleport,C5 FB 58 62 30)
alloc(newmem,$1000,teleport)
alloc(store_coord,8)
label(code)
label(xpos)
label(ypos)
label(zpos)
label(return)
label(en_load)
label(en_save)
label(save)
label(load)
registersymbol(en_load)
registersymbol(en_save)

store_coord:
  xpos:
  dd 0
  ypos:
  dd 0
  zpos:
  dd 0
  en_save:
  dd 0
  en_load:
  dd 0

newmem:
  cmp [en_save], 1
  je save
  cmp [en_load], 1
  je load
  jmp code

save:
  mov [en_save], 0
  push r15
  mov r15, [rdx+28]
  mov [xpos], r15
  mov r15, [rdx+30]
  mov [ypos], r15
  mov r15, [rdx+38]
  mov [zpos], r15
  pop r15
  jmp code

load:
  mov [en_load], 0
  push r15
  mov r15, [xpos]
  mov [rdx+28], r15
  mov r15, [ypos]
  mov [rdx+30], r15
  mov r15, [zpos]
  mov [rdx+38], r15
  pop r15
  jmp code

code:
  vaddsd xmm4,xmm0,[rdx+30]
  jmp return

teleport:
  jmp newmem

return:
registersymbol(teleport)


[DISABLE]
teleport:
  db C5 FB 58 62 30

unregistersymbol(teleport)
unregistersymbol(en_save)
unregistersymbol(en_load)
dealloc(newmem)
dealloc(store_coord)
