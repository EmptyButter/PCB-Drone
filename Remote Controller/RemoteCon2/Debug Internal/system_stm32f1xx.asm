	.cpu cortex-m3
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"system_stm32f1xx.c"
	.text
.Ltext0:
	.section	.text.SystemInit,"ax",%progbits
	.align	1
	.global	SystemInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	SystemInit, %function
SystemInit:
.LFB65:
	.file 1 "C:\\1234\\PCB drone project\\Remote Controller\\RemoteCon2\\Src\\system_stm32f1xx.c"
	.loc 1 158 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 161 3 view .LVU1
	.loc 1 161 11 is_stmt 0 view .LVU2
	ldr	r3, .L2
	ldr	r2, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 165 3 is_stmt 1 view .LVU3
	.loc 1 165 13 is_stmt 0 view .LVU4
	ldr	r1, [r3, #4]
	ldr	r2, .L2+4
	ands	r2, r2, r1
	str	r2, [r3, #4]
	.loc 1 171 3 is_stmt 1 view .LVU5
	.loc 1 171 11 is_stmt 0 view .LVU6
	ldr	r2, [r3]
	bic	r2, r2, #17301504
	bic	r2, r2, #65536
	str	r2, [r3]
	.loc 1 174 3 is_stmt 1 view .LVU7
	.loc 1 174 11 is_stmt 0 view .LVU8
	ldr	r2, [r3]
	bic	r2, r2, #262144
	str	r2, [r3]
	.loc 1 177 3 is_stmt 1 view .LVU9
	.loc 1 177 13 is_stmt 0 view .LVU10
	ldr	r2, [r3, #4]
	bic	r2, r2, #8323072
	str	r2, [r3, #4]
	.loc 1 196 3 is_stmt 1 view .LVU11
	.loc 1 196 12 is_stmt 0 view .LVU12
	mov	r2, #10420224
	str	r2, [r3, #8]
	.loc 1 208 3 is_stmt 1 view .LVU13
	.loc 1 208 13 is_stmt 0 view .LVU14
	mov	r2, #134217728
	ldr	r3, .L2+8
	str	r2, [r3, #8]
	.loc 1 210 1 view .LVU15
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073876992
	.word	-117506048
	.word	-536810240
.LFE65:
	.size	SystemInit, .-SystemInit
	.section	.text.SystemCoreClockUpdate,"ax",%progbits
	.align	1
	.global	SystemCoreClockUpdate
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	SystemCoreClockUpdate, %function
SystemCoreClockUpdate:
.LFB66:
	.loc 1 248 1 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 249 3 view .LVU17
.LVL0:
	.loc 1 260 3 view .LVU18
	.loc 1 260 12 is_stmt 0 view .LVU19
	ldr	r3, .L12
	ldr	r1, .L12+4
	ldr	r2, [r3, #4]
.LVL1:
	.loc 1 262 3 is_stmt 1 view .LVU20
	.loc 1 260 7 is_stmt 0 view .LVU21
	and	r2, r2, #12
.LVL2:
	.loc 1 262 3 view .LVU22
	cmp	r2, #8
	beq	.L5
	.loc 1 265 7 is_stmt 1 view .LVU23
	.loc 1 265 23 is_stmt 0 view .LVU24
	ldr	r2, .L12+8
.LVL3:
.L9:
	.loc 1 298 27 view .LVU25
	str	r2, [r1]
	.loc 1 350 3 is_stmt 1 view .LVU26
	.loc 1 350 28 is_stmt 0 view .LVU27
	ldr	r3, [r3, #4]
.LVL4:
	.loc 1 352 3 is_stmt 1 view .LVU28
	.loc 1 350 7 is_stmt 0 view .LVU29
	ldr	r2, .L12+12
	.loc 1 350 52 view .LVU30
	ubfx	r3, r3, #4, #4
.LVL5:
	.loc 1 350 7 view .LVU31
	ldrb	r2, [r2, r3]	@ zero_extendqisi2
	.loc 1 352 19 view .LVU32
	ldr	r3, [r1]
	lsrs	r3, r3, r2
	str	r3, [r1]
	.loc 1 353 1 view .LVU33
	bx	lr
.LVL6:
.L5:
	.loc 1 273 7 is_stmt 1 view .LVU34
	.loc 1 273 20 is_stmt 0 view .LVU35
	ldr	r2, [r3, #4]
.LVL7:
	.loc 1 274 7 is_stmt 1 view .LVU36
	.loc 1 274 22 is_stmt 0 view .LVU37
	ldr	r0, [r3, #4]
.LVL8:
	.loc 1 277 7 is_stmt 1 view .LVU38
	.loc 1 277 27 is_stmt 0 view .LVU39
	ubfx	r2, r2, #18, #4
.LVL9:
	.loc 1 279 10 view .LVU40
	lsls	r0, r0, #15
.LVL10:
	.loc 1 277 15 view .LVU41
	add	r2, r2, #2
.LVL11:
	.loc 1 279 7 is_stmt 1 view .LVU42
	.loc 1 279 10 is_stmt 0 view .LVU43
	bmi	.L7
.L11:
	.loc 1 294 11 is_stmt 1 view .LVU44
	.loc 1 294 47 is_stmt 0 view .LVU45
	ldr	r0, .L12+16
.L10:
	.loc 1 298 39 view .LVU46
	muls	r2, r0, r2
.LVL12:
	.loc 1 298 39 view .LVU47
	b	.L9
.LVL13:
.L7:
	.loc 1 292 9 is_stmt 1 view .LVU48
	.loc 1 292 17 is_stmt 0 view .LVU49
	ldr	r0, [r3, #4]
	.loc 1 292 12 view .LVU50
	lsls	r0, r0, #14
	bmi	.L11
	.loc 1 298 11 is_stmt 1 view .LVU51
	.loc 1 298 39 is_stmt 0 view .LVU52
	ldr	r0, .L12+8
	b	.L10
.L13:
	.align	2
.L12:
	.word	1073876992
	.word	.LANCHOR0
	.word	8000000
	.word	.LANCHOR1
	.word	4000000
.LFE66:
	.size	SystemCoreClockUpdate, .-SystemCoreClockUpdate
	.global	APBPrescTable
	.global	AHBPrescTable
	.global	SystemCoreClock
	.section	.data.SystemCoreClock,"aw"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	SystemCoreClock, %object
	.size	SystemCoreClock, 4
SystemCoreClock:
	.word	16000000
	.section	.rodata.AHBPrescTable,"a"
	.set	.LANCHOR1,. + 0
	.type	AHBPrescTable, %object
	.size	AHBPrescTable, 16
AHBPrescTable:
	.ascii	"\000\000\000\000\000\000\000\000\001\002\003\004\006"
	.ascii	"\007\010\011"
	.section	.rodata.APBPrescTable,"a"
	.type	APBPrescTable, %object
	.size	APBPrescTable, 8
APBPrescTable:
	.ascii	"\000\000\000\000\001\002\003\004"
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.align	2
.LEFDE2:
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.52c/include/stdint.h"
	.file 3 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/CMSIS/Include/core_cm3.h"
	.file 4 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/CMSIS/Device/ST/STM32F1xx/Include/system_stm32f1xx.h"
	.file 5 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
	.file 6 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.52c/include/__crossworks.h"
	.file 7 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f1xx.h"
	.file 8 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/STM32F1xx_HAL_Driver/Inc/stm32f1xx_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x9a6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF124
	.byte	0xc
	.4byte	.LASF125
	.4byte	.LASF126
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x30
	.byte	0x1c
	.4byte	0x42
	.uleb128 0x4
	.4byte	0x2c
	.uleb128 0x5
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x5
	.4byte	0x42
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x3c
	.byte	0x1c
	.4byte	0x6d
	.uleb128 0x4
	.4byte	0x5c
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3d
	.byte	0x1c
	.4byte	0x8a
	.uleb128 0x4
	.4byte	0x74
	.uleb128 0x5
	.4byte	0x80
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x7
	.byte	0x8c
	.byte	0x3
	.2byte	0x176
	.byte	0x9
	.4byte	0x1d0
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x3
	.2byte	0x178
	.byte	0x12
	.4byte	0x85
	.byte	0
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x3
	.2byte	0x179
	.byte	0x12
	.4byte	0x80
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x17a
	.byte	0x12
	.4byte	0x80
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x17b
	.byte	0x12
	.4byte	0x80
	.byte	0xc
	.uleb128 0x9
	.ascii	"SCR\000"
	.byte	0x3
	.2byte	0x17c
	.byte	0x12
	.4byte	0x80
	.byte	0x10
	.uleb128 0x9
	.ascii	"CCR\000"
	.byte	0x3
	.2byte	0x17d
	.byte	0x12
	.4byte	0x80
	.byte	0x14
	.uleb128 0x9
	.ascii	"SHP\000"
	.byte	0x3
	.2byte	0x17e
	.byte	0x12
	.4byte	0x1e0
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x17f
	.byte	0x12
	.4byte	0x80
	.byte	0x24
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x180
	.byte	0x12
	.4byte	0x80
	.byte	0x28
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x181
	.byte	0x12
	.4byte	0x80
	.byte	0x2c
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x182
	.byte	0x12
	.4byte	0x80
	.byte	0x30
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x183
	.byte	0x12
	.4byte	0x80
	.byte	0x34
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x184
	.byte	0x12
	.4byte	0x80
	.byte	0x38
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x185
	.byte	0x12
	.4byte	0x80
	.byte	0x3c
	.uleb128 0x9
	.ascii	"PFR\000"
	.byte	0x3
	.2byte	0x186
	.byte	0x12
	.4byte	0x1fa
	.byte	0x40
	.uleb128 0x9
	.ascii	"DFR\000"
	.byte	0x3
	.2byte	0x187
	.byte	0x12
	.4byte	0x85
	.byte	0x48
	.uleb128 0x9
	.ascii	"ADR\000"
	.byte	0x3
	.2byte	0x188
	.byte	0x12
	.4byte	0x85
	.byte	0x4c
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x189
	.byte	0x12
	.4byte	0x214
	.byte	0x50
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x18a
	.byte	0x12
	.4byte	0x22e
	.byte	0x60
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x18b
	.byte	0x12
	.4byte	0x233
	.byte	0x74
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x18c
	.byte	0x12
	.4byte	0x80
	.byte	0x88
	.byte	0
	.uleb128 0xa
	.4byte	0x38
	.4byte	0x1e0
	.uleb128 0xb
	.4byte	0x8a
	.byte	0xb
	.byte	0
	.uleb128 0x4
	.4byte	0x1d0
	.uleb128 0xa
	.4byte	0x85
	.4byte	0x1f5
	.uleb128 0xb
	.4byte	0x8a
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x1e5
	.uleb128 0x4
	.4byte	0x1f5
	.uleb128 0xa
	.4byte	0x85
	.4byte	0x20f
	.uleb128 0xb
	.4byte	0x8a
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.4byte	0x1ff
	.uleb128 0x4
	.4byte	0x20f
	.uleb128 0xa
	.4byte	0x85
	.4byte	0x229
	.uleb128 0xb
	.4byte	0x8a
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.4byte	0x219
	.uleb128 0x4
	.4byte	0x229
	.uleb128 0xa
	.4byte	0x74
	.4byte	0x243
	.uleb128 0xb
	.4byte	0x8a
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x18d
	.byte	0x3
	.4byte	0x9f
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x748
	.byte	0x19
	.4byte	0x68
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x4
	.byte	0x33
	.byte	0x11
	.4byte	0x74
	.uleb128 0xa
	.4byte	0x3d
	.4byte	0x279
	.uleb128 0xb
	.4byte	0x8a
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.4byte	0x269
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x4
	.byte	0x34
	.byte	0x17
	.4byte	0x279
	.uleb128 0xa
	.4byte	0x3d
	.4byte	0x29a
	.uleb128 0xb
	.4byte	0x8a
	.byte	0x7
	.byte	0
	.uleb128 0x5
	.4byte	0x28a
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x4
	.byte	0x35
	.byte	0x17
	.4byte	0x29a
	.uleb128 0x7
	.byte	0x28
	.byte	0x5
	.2byte	0x1a8
	.byte	0x9
	.4byte	0x341
	.uleb128 0x9
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x1aa
	.byte	0x11
	.4byte	0x80
	.byte	0
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x5
	.2byte	0x1ab
	.byte	0x11
	.4byte	0x80
	.byte	0x4
	.uleb128 0x9
	.ascii	"CIR\000"
	.byte	0x5
	.2byte	0x1ac
	.byte	0x11
	.4byte	0x80
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x5
	.2byte	0x1ad
	.byte	0x11
	.4byte	0x80
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x5
	.2byte	0x1ae
	.byte	0x11
	.4byte	0x80
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x5
	.2byte	0x1af
	.byte	0x11
	.4byte	0x80
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x5
	.2byte	0x1b0
	.byte	0x11
	.4byte	0x80
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF35
	.byte	0x5
	.2byte	0x1b1
	.byte	0x11
	.4byte	0x80
	.byte	0x1c
	.uleb128 0x8
	.4byte	.LASF36
	.byte	0x5
	.2byte	0x1b2
	.byte	0x11
	.4byte	0x80
	.byte	0x20
	.uleb128 0x9
	.ascii	"CSR\000"
	.byte	0x5
	.2byte	0x1b3
	.byte	0x11
	.4byte	0x80
	.byte	0x24
	.byte	0
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x5
	.2byte	0x1b6
	.byte	0x3
	.4byte	0x2ab
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x7
	.byte	0x98
	.byte	0x1
	.4byte	0x369
	.uleb128 0x10
	.4byte	.LASF38
	.byte	0
	.uleb128 0x11
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
	.uleb128 0x12
	.4byte	.LASF89
	.byte	0x8
	.byte	0x6
	.byte	0x82
	.byte	0x8
	.4byte	0x391
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x6
	.byte	0x83
	.byte	0x7
	.4byte	0x6d
	.byte	0
	.uleb128 0x13
	.4byte	.LASF40
	.byte	0x6
	.byte	0x84
	.byte	0x8
	.4byte	0x391
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF41
	.uleb128 0x14
	.4byte	0x6d
	.4byte	0x3b1
	.uleb128 0x15
	.4byte	0x3b1
	.uleb128 0x15
	.4byte	0x8a
	.uleb128 0x15
	.4byte	0x3c3
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x3b7
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF42
	.uleb128 0x5
	.4byte	0x3b7
	.uleb128 0x16
	.byte	0x4
	.4byte	0x369
	.uleb128 0x14
	.4byte	0x6d
	.4byte	0x3e7
	.uleb128 0x15
	.4byte	0x3e7
	.uleb128 0x15
	.4byte	0x3ed
	.uleb128 0x15
	.4byte	0x8a
	.uleb128 0x15
	.4byte	0x3c3
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x8a
	.uleb128 0x16
	.byte	0x4
	.4byte	0x3be
	.uleb128 0x17
	.byte	0x58
	.byte	0x6
	.byte	0x8a
	.byte	0x9
	.4byte	0x59d
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x6
	.byte	0x8c
	.byte	0xf
	.4byte	0x3ed
	.byte	0
	.uleb128 0x13
	.4byte	.LASF44
	.byte	0x6
	.byte	0x8d
	.byte	0xf
	.4byte	0x3ed
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF45
	.byte	0x6
	.byte	0x8e
	.byte	0xf
	.4byte	0x3ed
	.byte	0x8
	.uleb128 0x13
	.4byte	.LASF46
	.byte	0x6
	.byte	0x90
	.byte	0xf
	.4byte	0x3ed
	.byte	0xc
	.uleb128 0x13
	.4byte	.LASF47
	.byte	0x6
	.byte	0x91
	.byte	0xf
	.4byte	0x3ed
	.byte	0x10
	.uleb128 0x13
	.4byte	.LASF48
	.byte	0x6
	.byte	0x92
	.byte	0xf
	.4byte	0x3ed
	.byte	0x14
	.uleb128 0x13
	.4byte	.LASF49
	.byte	0x6
	.byte	0x93
	.byte	0xf
	.4byte	0x3ed
	.byte	0x18
	.uleb128 0x13
	.4byte	.LASF50
	.byte	0x6
	.byte	0x94
	.byte	0xf
	.4byte	0x3ed
	.byte	0x1c
	.uleb128 0x13
	.4byte	.LASF51
	.byte	0x6
	.byte	0x95
	.byte	0xf
	.4byte	0x3ed
	.byte	0x20
	.uleb128 0x13
	.4byte	.LASF52
	.byte	0x6
	.byte	0x96
	.byte	0xf
	.4byte	0x3ed
	.byte	0x24
	.uleb128 0x13
	.4byte	.LASF53
	.byte	0x6
	.byte	0x98
	.byte	0x8
	.4byte	0x3b7
	.byte	0x28
	.uleb128 0x13
	.4byte	.LASF54
	.byte	0x6
	.byte	0x99
	.byte	0x8
	.4byte	0x3b7
	.byte	0x29
	.uleb128 0x13
	.4byte	.LASF55
	.byte	0x6
	.byte	0x9a
	.byte	0x8
	.4byte	0x3b7
	.byte	0x2a
	.uleb128 0x13
	.4byte	.LASF56
	.byte	0x6
	.byte	0x9b
	.byte	0x8
	.4byte	0x3b7
	.byte	0x2b
	.uleb128 0x13
	.4byte	.LASF57
	.byte	0x6
	.byte	0x9c
	.byte	0x8
	.4byte	0x3b7
	.byte	0x2c
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x6
	.byte	0x9d
	.byte	0x8
	.4byte	0x3b7
	.byte	0x2d
	.uleb128 0x13
	.4byte	.LASF59
	.byte	0x6
	.byte	0x9e
	.byte	0x8
	.4byte	0x3b7
	.byte	0x2e
	.uleb128 0x13
	.4byte	.LASF60
	.byte	0x6
	.byte	0x9f
	.byte	0x8
	.4byte	0x3b7
	.byte	0x2f
	.uleb128 0x13
	.4byte	.LASF61
	.byte	0x6
	.byte	0xa0
	.byte	0x8
	.4byte	0x3b7
	.byte	0x30
	.uleb128 0x13
	.4byte	.LASF62
	.byte	0x6
	.byte	0xa1
	.byte	0x8
	.4byte	0x3b7
	.byte	0x31
	.uleb128 0x13
	.4byte	.LASF63
	.byte	0x6
	.byte	0xa2
	.byte	0x8
	.4byte	0x3b7
	.byte	0x32
	.uleb128 0x13
	.4byte	.LASF64
	.byte	0x6
	.byte	0xa3
	.byte	0x8
	.4byte	0x3b7
	.byte	0x33
	.uleb128 0x13
	.4byte	.LASF65
	.byte	0x6
	.byte	0xa4
	.byte	0x8
	.4byte	0x3b7
	.byte	0x34
	.uleb128 0x13
	.4byte	.LASF66
	.byte	0x6
	.byte	0xa5
	.byte	0x8
	.4byte	0x3b7
	.byte	0x35
	.uleb128 0x13
	.4byte	.LASF67
	.byte	0x6
	.byte	0xaa
	.byte	0xf
	.4byte	0x3ed
	.byte	0x38
	.uleb128 0x13
	.4byte	.LASF68
	.byte	0x6
	.byte	0xab
	.byte	0xf
	.4byte	0x3ed
	.byte	0x3c
	.uleb128 0x13
	.4byte	.LASF69
	.byte	0x6
	.byte	0xac
	.byte	0xf
	.4byte	0x3ed
	.byte	0x40
	.uleb128 0x13
	.4byte	.LASF70
	.byte	0x6
	.byte	0xad
	.byte	0xf
	.4byte	0x3ed
	.byte	0x44
	.uleb128 0x13
	.4byte	.LASF71
	.byte	0x6
	.byte	0xae
	.byte	0xf
	.4byte	0x3ed
	.byte	0x48
	.uleb128 0x13
	.4byte	.LASF72
	.byte	0x6
	.byte	0xaf
	.byte	0xf
	.4byte	0x3ed
	.byte	0x4c
	.uleb128 0x13
	.4byte	.LASF73
	.byte	0x6
	.byte	0xb0
	.byte	0xf
	.4byte	0x3ed
	.byte	0x50
	.uleb128 0x13
	.4byte	.LASF74
	.byte	0x6
	.byte	0xb1
	.byte	0xf
	.4byte	0x3ed
	.byte	0x54
	.byte	0
	.uleb128 0x3
	.4byte	.LASF75
	.byte	0x6
	.byte	0xb2
	.byte	0x3
	.4byte	0x3f3
	.uleb128 0x5
	.4byte	0x59d
	.uleb128 0x17
	.byte	0x20
	.byte	0x6
	.byte	0xc8
	.byte	0x9
	.4byte	0x620
	.uleb128 0x13
	.4byte	.LASF76
	.byte	0x6
	.byte	0xca
	.byte	0x9
	.4byte	0x634
	.byte	0
	.uleb128 0x13
	.4byte	.LASF77
	.byte	0x6
	.byte	0xcb
	.byte	0x9
	.4byte	0x649
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF78
	.byte	0x6
	.byte	0xcc
	.byte	0x9
	.4byte	0x649
	.byte	0x8
	.uleb128 0x13
	.4byte	.LASF79
	.byte	0x6
	.byte	0xcf
	.byte	0x9
	.4byte	0x663
	.byte	0xc
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x6
	.byte	0xd0
	.byte	0xa
	.4byte	0x678
	.byte	0x10
	.uleb128 0x13
	.4byte	.LASF81
	.byte	0x6
	.byte	0xd1
	.byte	0xa
	.4byte	0x678
	.byte	0x14
	.uleb128 0x13
	.4byte	.LASF82
	.byte	0x6
	.byte	0xd4
	.byte	0x9
	.4byte	0x67e
	.byte	0x18
	.uleb128 0x13
	.4byte	.LASF83
	.byte	0x6
	.byte	0xd5
	.byte	0x9
	.4byte	0x684
	.byte	0x1c
	.byte	0
	.uleb128 0x14
	.4byte	0x6d
	.4byte	0x634
	.uleb128 0x15
	.4byte	0x6d
	.uleb128 0x15
	.4byte	0x6d
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x620
	.uleb128 0x14
	.4byte	0x6d
	.4byte	0x649
	.uleb128 0x15
	.4byte	0x6d
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x63a
	.uleb128 0x14
	.4byte	0x6d
	.4byte	0x663
	.uleb128 0x15
	.4byte	0x391
	.uleb128 0x15
	.4byte	0x6d
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x64f
	.uleb128 0x14
	.4byte	0x391
	.4byte	0x678
	.uleb128 0x15
	.4byte	0x391
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x669
	.uleb128 0x16
	.byte	0x4
	.4byte	0x398
	.uleb128 0x16
	.byte	0x4
	.4byte	0x3c9
	.uleb128 0x3
	.4byte	.LASF84
	.byte	0x6
	.byte	0xd6
	.byte	0x3
	.4byte	0x5ae
	.uleb128 0x5
	.4byte	0x68a
	.uleb128 0x17
	.byte	0xc
	.byte	0x6
	.byte	0xd8
	.byte	0x9
	.4byte	0x6cc
	.uleb128 0x13
	.4byte	.LASF85
	.byte	0x6
	.byte	0xd9
	.byte	0xf
	.4byte	0x3ed
	.byte	0
	.uleb128 0x13
	.4byte	.LASF86
	.byte	0x6
	.byte	0xda
	.byte	0x25
	.4byte	0x6cc
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF87
	.byte	0x6
	.byte	0xdb
	.byte	0x28
	.4byte	0x6d2
	.byte	0x8
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x5a9
	.uleb128 0x16
	.byte	0x4
	.4byte	0x696
	.uleb128 0x3
	.4byte	.LASF88
	.byte	0x6
	.byte	0xdc
	.byte	0x3
	.4byte	0x69b
	.uleb128 0x5
	.4byte	0x6d8
	.uleb128 0x12
	.4byte	.LASF90
	.byte	0x14
	.byte	0x6
	.byte	0xe0
	.byte	0x10
	.4byte	0x704
	.uleb128 0x13
	.4byte	.LASF91
	.byte	0x6
	.byte	0xe1
	.byte	0x20
	.4byte	0x704
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0x714
	.4byte	0x714
	.uleb128 0xb
	.4byte	0x8a
	.byte	0x4
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x6e4
	.uleb128 0xd
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x10a
	.byte	0x1a
	.4byte	0x6e9
	.uleb128 0xd
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x111
	.byte	0x24
	.4byte	0x6e4
	.uleb128 0xd
	.4byte	.LASF94
	.byte	0x6
	.2byte	0x114
	.byte	0x2c
	.4byte	0x696
	.uleb128 0xd
	.4byte	.LASF95
	.byte	0x6
	.2byte	0x115
	.byte	0x2c
	.4byte	0x696
	.uleb128 0xa
	.4byte	0x49
	.4byte	0x75e
	.uleb128 0xb
	.4byte	0x8a
	.byte	0x7f
	.byte	0
	.uleb128 0x5
	.4byte	0x74e
	.uleb128 0xd
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x117
	.byte	0x23
	.4byte	0x75e
	.uleb128 0xa
	.4byte	0x3be
	.4byte	0x77b
	.uleb128 0x18
	.byte	0
	.uleb128 0x5
	.4byte	0x770
	.uleb128 0xd
	.4byte	.LASF97
	.byte	0x6
	.2byte	0x119
	.byte	0x13
	.4byte	0x77b
	.uleb128 0xd
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x11a
	.byte	0x13
	.4byte	0x77b
	.uleb128 0xd
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x11b
	.byte	0x13
	.4byte	0x77b
	.uleb128 0xd
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x11c
	.byte	0x13
	.4byte	0x77b
	.uleb128 0xd
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x11e
	.byte	0x13
	.4byte	0x77b
	.uleb128 0xd
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x11f
	.byte	0x13
	.4byte	0x77b
	.uleb128 0xd
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x120
	.byte	0x13
	.4byte	0x77b
	.uleb128 0xd
	.4byte	.LASF104
	.byte	0x6
	.2byte	0x121
	.byte	0x13
	.4byte	0x77b
	.uleb128 0xd
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x122
	.byte	0x13
	.4byte	0x77b
	.uleb128 0xd
	.4byte	.LASF106
	.byte	0x6
	.2byte	0x123
	.byte	0x13
	.4byte	0x77b
	.uleb128 0x14
	.4byte	0x6d
	.4byte	0x811
	.uleb128 0x15
	.4byte	0x811
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x81c
	.uleb128 0x19
	.4byte	.LASF127
	.uleb128 0x5
	.4byte	0x817
	.uleb128 0xd
	.4byte	.LASF107
	.byte	0x6
	.2byte	0x139
	.byte	0xe
	.4byte	0x82e
	.uleb128 0x16
	.byte	0x4
	.4byte	0x802
	.uleb128 0x14
	.4byte	0x6d
	.4byte	0x843
	.uleb128 0x15
	.4byte	0x843
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x817
	.uleb128 0xd
	.4byte	.LASF108
	.byte	0x6
	.2byte	0x13a
	.byte	0xe
	.4byte	0x856
	.uleb128 0x16
	.byte	0x4
	.4byte	0x834
	.uleb128 0xc
	.4byte	.LASF109
	.byte	0x6
	.2byte	0x151
	.byte	0x18
	.4byte	0x869
	.uleb128 0x16
	.byte	0x4
	.4byte	0x86f
	.uleb128 0x14
	.4byte	0x3ed
	.4byte	0x87e
	.uleb128 0x15
	.4byte	0x6d
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF110
	.byte	0x8
	.byte	0x6
	.2byte	0x153
	.byte	0x10
	.4byte	0x8a9
	.uleb128 0x8
	.4byte	.LASF111
	.byte	0x6
	.2byte	0x155
	.byte	0x1c
	.4byte	0x85c
	.byte	0
	.uleb128 0x8
	.4byte	.LASF112
	.byte	0x6
	.2byte	0x156
	.byte	0x21
	.4byte	0x8a9
	.byte	0x4
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x87e
	.uleb128 0xc
	.4byte	.LASF113
	.byte	0x6
	.2byte	0x157
	.byte	0x3
	.4byte	0x87e
	.uleb128 0xd
	.4byte	.LASF114
	.byte	0x6
	.2byte	0x15b
	.byte	0x1f
	.4byte	0x8c9
	.uleb128 0x16
	.byte	0x4
	.4byte	0x8af
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x42
	.byte	0x8
	.byte	0x32
	.byte	0x1
	.4byte	0x8f6
	.uleb128 0x10
	.4byte	.LASF115
	.byte	0x64
	.uleb128 0x10
	.4byte	.LASF116
	.byte	0xa
	.uleb128 0x10
	.4byte	.LASF117
	.byte	0x1
	.uleb128 0x10
	.4byte	.LASF118
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF119
	.byte	0x8
	.byte	0x37
	.byte	0x3
	.4byte	0x8cf
	.uleb128 0xe
	.4byte	.LASF120
	.byte	0x8
	.byte	0x3c
	.byte	0x11
	.4byte	0x74
	.uleb128 0xe
	.4byte	.LASF121
	.byte	0x8
	.byte	0x3d
	.byte	0x1c
	.4byte	0x8f6
	.uleb128 0x1b
	.4byte	0x25d
	.byte	0x1
	.byte	0x7b
	.byte	0xa
	.uleb128 0x5
	.byte	0x3
	.4byte	SystemCoreClock
	.uleb128 0x1b
	.4byte	0x27e
	.byte	0x1
	.byte	0x7c
	.byte	0xf
	.uleb128 0x5
	.byte	0x3
	.4byte	AHBPrescTable
	.uleb128 0x1b
	.4byte	0x29f
	.byte	0x1
	.byte	0x7d
	.byte	0xf
	.uleb128 0x5
	.byte	0x3
	.4byte	APBPrescTable
	.uleb128 0x1c
	.4byte	.LASF128
	.byte	0x1
	.byte	0xf7
	.byte	0x6
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x997
	.uleb128 0x1d
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xf9
	.byte	0xc
	.4byte	0x74
	.4byte	.LLST0
	.4byte	.LVUS0
	.uleb128 0x1e
	.4byte	.LASF122
	.byte	0x1
	.byte	0xf9
	.byte	0x16
	.4byte	0x74
	.4byte	.LLST1
	.4byte	.LVUS1
	.uleb128 0x1e
	.4byte	.LASF123
	.byte	0x1
	.byte	0xf9
	.byte	0x24
	.4byte	0x74
	.4byte	.LLST2
	.4byte	.LVUS2
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF129
	.byte	0x1
	.byte	0x9d
	.byte	0x6
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x2134
	.uleb128 0x19
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LVUS0:
	.uleb128 .LVU18
	.uleb128 .LVU20
	.uleb128 .LVU20
	.uleb128 .LVU22
	.uleb128 .LVU22
	.uleb128 .LVU25
	.uleb128 .LVU28
	.uleb128 .LVU31
	.uleb128 .LVU34
	.uleb128 .LVU36
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x5
	.byte	0x72
	.sleb128 0
	.byte	0x3c
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x12
	.byte	0x73
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x3f
	.byte	0x1a
	.byte	0x3
	.4byte	AHBPrescTable
	.byte	0x22
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LVUS1:
	.uleb128 .LVU18
	.uleb128 .LVU25
	.uleb128 .LVU34
	.uleb128 .LVU36
	.uleb128 .LVU36
	.uleb128 .LVU40
	.uleb128 .LVU42
	.uleb128 .LVU47
	.uleb128 .LVU48
	.uleb128 0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LVL9
	.2byte	0x7
	.byte	0x72
	.sleb128 0
	.byte	0x4e
	.byte	0x41
	.byte	0x24
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL13
	.4byte	.LFE66
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LVUS2:
	.uleb128 .LVU18
	.uleb128 .LVU25
	.uleb128 .LVU34
	.uleb128 .LVU38
	.uleb128 .LVU38
	.uleb128 .LVU41
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x7
	.byte	0x70
	.sleb128 0
	.byte	0x40
	.byte	0x3c
	.byte	0x24
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x81
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x9aa
	.4byte	0x35c
	.ascii	"RESET\000"
	.4byte	0x362
	.ascii	"SET\000"
	.4byte	0x91a
	.ascii	"SystemCoreClock\000"
	.4byte	0x928
	.ascii	"AHBPrescTable\000"
	.4byte	0x936
	.ascii	"APBPrescTable\000"
	.4byte	0x944
	.ascii	"SystemCoreClockUpdate\000"
	.4byte	0x997
	.ascii	"SystemInit\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x1c1
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x9aa
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x42
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x4e
	.ascii	"short int\000"
	.4byte	0x55
	.ascii	"short unsigned int\000"
	.4byte	0x6d
	.ascii	"int\000"
	.4byte	0x5c
	.ascii	"int32_t\000"
	.4byte	0x8a
	.ascii	"unsigned int\000"
	.4byte	0x74
	.ascii	"uint32_t\000"
	.4byte	0x91
	.ascii	"long long int\000"
	.4byte	0x98
	.ascii	"long long unsigned int\000"
	.4byte	0x243
	.ascii	"SCB_Type\000"
	.4byte	0x341
	.ascii	"RCC_TypeDef\000"
	.4byte	0x391
	.ascii	"long int\000"
	.4byte	0x369
	.ascii	"__mbstate_s\000"
	.4byte	0x3b7
	.ascii	"char\000"
	.4byte	0x59d
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x68a
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x6d8
	.ascii	"__RAL_locale_t\000"
	.4byte	0x6e9
	.ascii	"__locale_s\000"
	.4byte	0x85c
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x87e
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x8af
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0x8f6
	.ascii	"HAL_TickFreqTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB65
	.4byte	.LFE65
	.4byte	.LFB66
	.4byte	.LFE66
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF119:
	.ascii	"HAL_TickFreqTypeDef\000"
.LASF103:
	.ascii	"__RAL_data_utf8_space\000"
.LASF74:
	.ascii	"date_time_format\000"
.LASF98:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF94:
	.ascii	"__RAL_codeset_ascii\000"
.LASF109:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF64:
	.ascii	"int_n_sep_by_space\000"
.LASF55:
	.ascii	"p_cs_precedes\000"
.LASF120:
	.ascii	"uwTickPrio\000"
.LASF29:
	.ascii	"APBPrescTable\000"
.LASF105:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF115:
	.ascii	"HAL_TICK_FREQ_10HZ\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF90:
	.ascii	"__locale_s\000"
.LASF108:
	.ascii	"__user_get_time_of_day\000"
.LASF10:
	.ascii	"CPUID\000"
.LASF72:
	.ascii	"date_format\000"
.LASF112:
	.ascii	"next\000"
.LASF70:
	.ascii	"abbrev_month_names\000"
.LASF22:
	.ascii	"ISAR\000"
.LASF8:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF92:
	.ascii	"__RAL_global_locale\000"
.LASF87:
	.ascii	"codeset\000"
.LASF80:
	.ascii	"__towupper\000"
.LASF122:
	.ascii	"pllmull\000"
.LASF41:
	.ascii	"long int\000"
.LASF31:
	.ascii	"APB2RSTR\000"
.LASF102:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF46:
	.ascii	"int_curr_symbol\000"
.LASF51:
	.ascii	"positive_sign\000"
.LASF61:
	.ascii	"int_p_cs_precedes\000"
.LASF40:
	.ascii	"__wchar\000"
.LASF19:
	.ascii	"BFAR\000"
.LASF44:
	.ascii	"thousands_sep\000"
.LASF71:
	.ascii	"am_pm_indicator\000"
.LASF25:
	.ascii	"SCB_Type\000"
.LASF79:
	.ascii	"__iswctype\000"
.LASF60:
	.ascii	"n_sign_posn\000"
.LASF50:
	.ascii	"mon_grouping\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF63:
	.ascii	"int_p_sep_by_space\000"
.LASF48:
	.ascii	"mon_decimal_point\000"
.LASF121:
	.ascii	"uwTickFreq\000"
.LASF101:
	.ascii	"__RAL_data_utf8_period\000"
.LASF45:
	.ascii	"grouping\000"
.LASF81:
	.ascii	"__towlower\000"
.LASF37:
	.ascii	"RCC_TypeDef\000"
.LASF117:
	.ascii	"HAL_TICK_FREQ_1KHZ\000"
.LASF127:
	.ascii	"timeval\000"
.LASF91:
	.ascii	"__category\000"
.LASF12:
	.ascii	"VTOR\000"
.LASF77:
	.ascii	"__toupper\000"
.LASF58:
	.ascii	"n_sep_by_space\000"
.LASF86:
	.ascii	"data\000"
.LASF52:
	.ascii	"negative_sign\000"
.LASF85:
	.ascii	"name\000"
.LASF11:
	.ascii	"ICSR\000"
.LASF13:
	.ascii	"AIRCR\000"
.LASF17:
	.ascii	"DFSR\000"
.LASF18:
	.ascii	"MMFAR\000"
.LASF67:
	.ascii	"day_names\000"
.LASF21:
	.ascii	"MMFR\000"
.LASF28:
	.ascii	"AHBPrescTable\000"
.LASF62:
	.ascii	"int_n_cs_precedes\000"
.LASF88:
	.ascii	"__RAL_locale_t\000"
.LASF73:
	.ascii	"time_format\000"
.LASF59:
	.ascii	"p_sign_posn\000"
.LASF106:
	.ascii	"__RAL_data_empty_string\000"
.LASF96:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF15:
	.ascii	"CFSR\000"
.LASF111:
	.ascii	"decode\000"
.LASF83:
	.ascii	"__mbtowc\000"
.LASF68:
	.ascii	"abbrev_day_names\000"
.LASF126:
	.ascii	"C:\\1234\\PCB drone project\\Remote Controller\\Rem"
	.ascii	"oteCon2\000"
.LASF57:
	.ascii	"n_cs_precedes\000"
.LASF78:
	.ascii	"__tolower\000"
.LASF118:
	.ascii	"HAL_TICK_FREQ_DEFAULT\000"
.LASF32:
	.ascii	"APB1RSTR\000"
.LASF107:
	.ascii	"__user_set_time_of_day\000"
.LASF27:
	.ascii	"SystemCoreClock\000"
.LASF24:
	.ascii	"CPACR\000"
.LASF23:
	.ascii	"RESERVED0\000"
.LASF39:
	.ascii	"__state\000"
.LASF38:
	.ascii	"RESET\000"
.LASF129:
	.ascii	"SystemInit\000"
.LASF5:
	.ascii	"int32_t\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF14:
	.ascii	"SHCSR\000"
.LASF97:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF26:
	.ascii	"ITM_RxBuffer\000"
.LASF125:
	.ascii	"C:\\1234\\PCB drone project\\Remote Controller\\Rem"
	.ascii	"oteCon2\\Src\\system_stm32f1xx.c\000"
.LASF54:
	.ascii	"frac_digits\000"
.LASF2:
	.ascii	"short int\000"
.LASF114:
	.ascii	"__RAL_error_decoder_head\000"
.LASF124:
	.ascii	"GNU C99 9.2.1 20191025 (release) [ARM/arm-9-branch "
	.ascii	"revision 277599] -fmessage-length=0 -mcpu=cortex-m3"
	.ascii	" -mlittle-endian -mfloat-abi=soft -mthumb -mtp=soft"
	.ascii	" -munaligned-access -std=gnu99 -g2 -gpubnames -Os -"
	.ascii	"fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-builti"
	.ascii	"n -ffunction-sections -fdata-sections -fshort-enums"
	.ascii	" -fno-common\000"
.LASF34:
	.ascii	"APB2ENR\000"
.LASF128:
	.ascii	"SystemCoreClockUpdate\000"
.LASF49:
	.ascii	"mon_thousands_sep\000"
.LASF75:
	.ascii	"__RAL_locale_data_t\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF20:
	.ascii	"AFSR\000"
.LASF65:
	.ascii	"int_p_sign_posn\000"
.LASF47:
	.ascii	"currency_symbol\000"
.LASF42:
	.ascii	"char\000"
.LASF56:
	.ascii	"p_sep_by_space\000"
.LASF116:
	.ascii	"HAL_TICK_FREQ_100HZ\000"
.LASF93:
	.ascii	"__RAL_c_locale\000"
.LASF35:
	.ascii	"APB1ENR\000"
.LASF84:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF66:
	.ascii	"int_n_sign_posn\000"
.LASF99:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF76:
	.ascii	"__isctype\000"
.LASF36:
	.ascii	"BDCR\000"
.LASF110:
	.ascii	"__RAL_error_decoder_s\000"
.LASF113:
	.ascii	"__RAL_error_decoder_t\000"
.LASF89:
	.ascii	"__mbstate_s\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF95:
	.ascii	"__RAL_codeset_utf8\000"
.LASF53:
	.ascii	"int_frac_digits\000"
.LASF69:
	.ascii	"month_names\000"
.LASF30:
	.ascii	"CFGR\000"
.LASF104:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF100:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF16:
	.ascii	"HFSR\000"
.LASF82:
	.ascii	"__wctomb\000"
.LASF43:
	.ascii	"decimal_point\000"
.LASF123:
	.ascii	"pllsource\000"
.LASF33:
	.ascii	"AHBENR\000"
	.ident	"GCC: (GNU) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
