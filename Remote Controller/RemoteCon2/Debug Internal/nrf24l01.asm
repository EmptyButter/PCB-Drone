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
	.file	"nrf24l01.c"
	.text
.Ltext0:
	.section	.text.NRF24L01_CE_LOW,"ax",%progbits
	.align	1
	.global	NRF24L01_CE_LOW
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_CE_LOW, %function
NRF24L01_CE_LOW:
.LFB65:
	.file 1 "C:\\1234\\PCB drone project\\Remote Controller\\RemoteCon2\\Src\\nrf24l01.c"
	.loc 1 240 24 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 241 2 view .LVU1
	ldr	r3, .L2
	movs	r2, #0
	ldrh	r1, [r3, #4]
	ldr	r0, [r3]
	b	HAL_GPIO_WritePin
.LVL0:
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
.LFE65:
	.size	NRF24L01_CE_LOW, .-NRF24L01_CE_LOW
	.section	.text.NRF24L01_CE_HIGH,"ax",%progbits
	.align	1
	.global	NRF24L01_CE_HIGH
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_CE_HIGH, %function
NRF24L01_CE_HIGH:
.LFB66:
	.loc 1 245 29 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 246 2 view .LVU3
	ldr	r3, .L5
	movs	r2, #1
	ldrh	r1, [r3, #4]
	ldr	r0, [r3]
	b	HAL_GPIO_WritePin
.LVL1:
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
.LFE66:
	.size	NRF24L01_CE_HIGH, .-NRF24L01_CE_HIGH
	.section	.text.NRF24L01_CSN_LOW,"ax",%progbits
	.align	1
	.global	NRF24L01_CSN_LOW
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_CSN_LOW, %function
NRF24L01_CSN_LOW:
.LFB67:
	.loc 1 250 29 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 251 2 view .LVU5
	ldr	r3, .L8
	movs	r2, #0
	ldrh	r1, [r3, #12]
	ldr	r0, [r3, #8]
	b	HAL_GPIO_WritePin
.LVL2:
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
.LFE67:
	.size	NRF24L01_CSN_LOW, .-NRF24L01_CSN_LOW
	.section	.text.NRF24L01_CSN_HIGH,"ax",%progbits
	.align	1
	.global	NRF24L01_CSN_HIGH
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_CSN_HIGH, %function
NRF24L01_CSN_HIGH:
.LFB68:
	.loc 1 255 30 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 256 2 view .LVU7
	ldr	r3, .L11
	movs	r2, #1
	ldrh	r1, [r3, #12]
	ldr	r0, [r3, #8]
	b	HAL_GPIO_WritePin
.LVL3:
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
.LFE68:
	.size	NRF24L01_CSN_HIGH, .-NRF24L01_CSN_HIGH
	.section	.text.NRF24L01_FlushRx,"ax",%progbits
	.align	1
	.global	NRF24L01_FlushRx
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_FlushRx, %function
NRF24L01_FlushRx:
.LFB70:
	.loc 1 268 29 view -0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 269 2 view .LVU9
	.loc 1 268 29 is_stmt 0 view .LVU10
	push	{r0, r1, r2, lr}
.LCFI0:
	.loc 1 269 2 view .LVU11
	bl	NRF24L01_CSN_LOW
.LVL4:
	.loc 1 271 2 is_stmt 1 view .LVU12
	.loc 1 271 10 is_stmt 0 view .LVU13
	movs	r3, #226
	.loc 1 272 2 view .LVU14
	ldr	r0, .L14
	movs	r2, #1
	.loc 1 271 10 view .LVU15
	strb	r3, [sp, #7]
	.loc 1 272 2 is_stmt 1 view .LVU16
	add	r1, sp, #7
	movs	r3, #100
	ldr	r0, [r0, #4]
	bl	HAL_SPI_Transmit
.LVL5:
	.loc 1 274 2 view .LVU17
	bl	NRF24L01_CSN_HIGH
.LVL6:
	.loc 1 275 1 is_stmt 0 view .LVU18
	add	sp, sp, #12
.LCFI1:
	@ sp needed
	ldr	pc, [sp], #4
.L15:
	.align	2
.L14:
	.word	.LANCHOR1
.LFE70:
	.size	NRF24L01_FlushRx, .-NRF24L01_FlushRx
	.section	.text.NRF24L01_FlushTx,"ax",%progbits
	.align	1
	.global	NRF24L01_FlushTx
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_FlushTx, %function
NRF24L01_FlushTx:
.LFB71:
	.loc 1 277 29 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 278 2 view .LVU20
	.loc 1 277 29 is_stmt 0 view .LVU21
	push	{r0, r1, r2, lr}
.LCFI2:
	.loc 1 278 2 view .LVU22
	bl	NRF24L01_CSN_LOW
.LVL7:
	.loc 1 280 2 is_stmt 1 view .LVU23
	.loc 1 280 10 is_stmt 0 view .LVU24
	movs	r3, #225
	.loc 1 281 2 view .LVU25
	ldr	r0, .L17
	movs	r2, #1
	.loc 1 280 10 view .LVU26
	strb	r3, [sp, #7]
	.loc 1 281 2 is_stmt 1 view .LVU27
	add	r1, sp, #7
	movs	r3, #100
	ldr	r0, [r0, #4]
	bl	HAL_SPI_Transmit
.LVL8:
	.loc 1 283 2 view .LVU28
	bl	NRF24L01_CSN_HIGH
.LVL9:
	.loc 1 284 1 is_stmt 0 view .LVU29
	add	sp, sp, #12
.LCFI3:
	@ sp needed
	ldr	pc, [sp], #4
.L18:
	.align	2
.L17:
	.word	.LANCHOR1
.LFE71:
	.size	NRF24L01_FlushTx, .-NRF24L01_FlushTx
	.section	.text.NRF24L01_SpiInit,"ax",%progbits
	.align	1
	.global	NRF24L01_SpiInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_SpiInit, %function
NRF24L01_SpiInit:
.LVL10:
.LFB73:
	.loc 1 373 70 is_stmt 1 view -0
	@ args = 52, pretend = 16, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 374 2 view .LVU31
	.loc 1 399 2 view .LVU32
	.loc 1 373 70 is_stmt 0 view .LVU33
	sub	sp, sp, #16
.LCFI4:
	push	{r4, r5, r6, r7, lr}
.LCFI5:
	.loc 1 400 23 view .LVU34
	movs	r5, #1
	movs	r7, #16
	.loc 1 401 24 view .LVU35
	movs	r6, #3
	.loc 1 373 70 view .LVU36
	sub	sp, sp, #20
.LCFI6:
	.loc 1 402 2 view .LVU37
	ldr	r4, .L20
	.loc 1 373 70 view .LVU38
	add	r0, sp, #44
.LVL11:
	.loc 1 373 70 view .LVU39
	stm	r0, {r1, r2, r3}
	.loc 1 402 2 view .LVU40
	mov	r1, sp
	mov	r0, r4
	.loc 1 401 24 view .LVU41
	str	r6, [sp, #12]
	.loc 1 400 23 view .LVU42
	strd	r7, r5, [sp]
	.loc 1 401 2 is_stmt 1 view .LVU43
	.loc 1 402 2 view .LVU44
	bl	HAL_GPIO_Init
.LVL12:
	.loc 1 405 2 view .LVU45
	.loc 1 406 23 is_stmt 0 view .LVU46
	movs	r2, #160
	movs	r3, #2
	.loc 1 408 2 view .LVU47
	mov	r1, sp
	mov	r0, r4
	.loc 1 406 23 view .LVU48
	strd	r2, r3, [sp]
	.loc 1 407 2 is_stmt 1 view .LVU49
	.loc 1 407 24 is_stmt 0 view .LVU50
	str	r6, [sp, #12]
	.loc 1 408 2 is_stmt 1 view .LVU51
	bl	HAL_GPIO_Init
.LVL13:
	.loc 1 410 2 view .LVU52
	.loc 1 411 23 is_stmt 0 view .LVU53
	movs	r6, #0
	movs	r3, #64
	.loc 1 413 2 view .LVU54
	mov	r1, sp
	mov	r0, r4
	.loc 1 411 23 view .LVU55
	strd	r3, r6, [sp]
	.loc 1 412 2 is_stmt 1 view .LVU56
	.loc 1 412 23 is_stmt 0 view .LVU57
	str	r6, [sp, #8]
	.loc 1 413 2 is_stmt 1 view .LVU58
	bl	HAL_GPIO_Init
.LVL14:
	.loc 1 416 2 view .LVU59
	mov	r2, r5
	mov	r1, r7
	mov	r0, r4
	bl	HAL_GPIO_WritePin
.LVL15:
	.loc 1 419 2 view .LVU60
	mov	r2, r6
	mov	r1, r5
	ldr	r0, .L20+4
	bl	HAL_GPIO_WritePin
.LVL16:
	.loc 1 423 1 is_stmt 0 view .LVU61
	add	sp, sp, #20
.LCFI7:
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
.LCFI8:
	add	sp, sp, #16
.LCFI9:
	bx	lr
.L21:
	.align	2
.L20:
	.word	1073809408
	.word	1073810432
.LFE73:
	.size	NRF24L01_SpiInit, .-NRF24L01_SpiInit
	.section	.text.NRF24L01_ReadRegister,"ax",%progbits
	.align	1
	.global	NRF24L01_ReadRegister
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_ReadRegister, %function
NRF24L01_ReadRegister:
.LVL17:
.LFB77:
	.loc 1 535 44 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 540 2 view .LVU63
	.loc 1 541 2 view .LVU64
	.loc 1 535 44 is_stmt 0 view .LVU65
	push	{r0, r1, r2, r3, r4, lr}
.LCFI10:
	.loc 1 542 14 view .LVU66
	movs	r3, #255
	strb	r3, [sp, #9]
	.loc 1 544 10 view .LVU67
	movs	r3, #0
	.loc 1 541 14 view .LVU68
	strb	r0, [sp, #8]
	.loc 1 542 2 is_stmt 1 view .LVU69
	.loc 1 544 2 view .LVU70
	.loc 1 544 10 is_stmt 0 view .LVU71
	strh	r3, [sp, #12]	@ movhi
	.loc 1 546 2 is_stmt 1 view .LVU72
	bl	NRF24L01_CSN_LOW
.LVL18:
	.loc 1 549 2 view .LVU73
	movs	r3, #100
	ldr	r0, .L23
	str	r3, [sp]
	add	r2, sp, #12
	movs	r3, #2
	add	r1, sp, #8
	ldr	r0, [r0, #4]
	bl	HAL_SPI_TransmitReceive
.LVL19:
	.loc 1 552 2 view .LVU74
	bl	NRF24L01_CSN_HIGH
.LVL20:
	.loc 1 554 2 view .LVU75
	.loc 1 555 1 is_stmt 0 view .LVU76
	ldrb	r0, [sp, #13]	@ zero_extendqisi2
	add	sp, sp, #20
.LCFI11:
	@ sp needed
	ldr	pc, [sp], #4
.L24:
	.align	2
.L23:
	.word	.LANCHOR1
.LFE77:
	.size	NRF24L01_ReadRegister, .-NRF24L01_ReadRegister
	.section	.text.NRF24L01_ReadBit,"ax",%progbits
	.align	1
	.global	NRF24L01_ReadBit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_ReadBit, %function
NRF24L01_ReadBit:
.LVL21:
.LFB75:
	.loc 1 504 52 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 505 2 view .LVU78
	.loc 1 506 2 view .LVU79
	.loc 1 504 52 is_stmt 0 view .LVU80
	push	{r4, lr}
.LCFI12:
	.loc 1 504 52 view .LVU81
	mov	r4, r1
	.loc 1 506 8 view .LVU82
	bl	NRF24L01_ReadRegister
.LVL22:
	.loc 1 508 2 is_stmt 1 view .LVU83
	.loc 1 508 6 is_stmt 0 view .LVU84
	asrs	r0, r0, r4
.LVL23:
	.loc 1 512 1 view .LVU85
	and	r0, r0, #1
	pop	{r4, pc}
.LFE75:
	.size	NRF24L01_ReadBit, .-NRF24L01_ReadBit
	.section	.text.NRF24L01_WriteRegister,"ax",%progbits
	.align	1
	.global	NRF24L01_WriteRegister
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_WriteRegister, %function
NRF24L01_WriteRegister:
.LVL24:
.LFB78:
	.loc 1 557 57 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 558 2 view .LVU87
	.loc 1 559 2 view .LVU88
	.loc 1 557 57 is_stmt 0 view .LVU89
	push	{r0, r1, r2, lr}
.LCFI13:
	.loc 1 559 14 view .LVU90
	orr	r0, r0, #32
.LVL25:
	.loc 1 559 14 view .LVU91
	strb	r0, [sp, #4]
	.loc 1 560 2 is_stmt 1 view .LVU92
	.loc 1 560 14 is_stmt 0 view .LVU93
	strb	r1, [sp, #5]
	.loc 1 562 2 is_stmt 1 view .LVU94
	bl	NRF24L01_CSN_LOW
.LVL26:
	.loc 1 565 2 view .LVU95
	ldr	r0, .L27
	movs	r3, #100
	movs	r2, #2
	add	r1, sp, #4
	ldr	r0, [r0, #4]
	bl	HAL_SPI_Transmit
.LVL27:
	.loc 1 567 2 view .LVU96
	bl	NRF24L01_CSN_HIGH
.LVL28:
	.loc 1 568 1 is_stmt 0 view .LVU97
	add	sp, sp, #12
.LCFI14:
	@ sp needed
	ldr	pc, [sp], #4
.L28:
	.align	2
.L27:
	.word	.LANCHOR1
.LFE78:
	.size	NRF24L01_WriteRegister, .-NRF24L01_WriteRegister
	.section	.text.NRF24L01_ClearInterrupts,"ax",%progbits
	.align	1
	.global	NRF24L01_ClearInterrupts
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_ClearInterrupts, %function
NRF24L01_ClearInterrupts:
.LFB69:
	.loc 1 261 37 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 262 2 view .LVU99
	movs	r1, #112
	movs	r0, #7
	b	NRF24L01_WriteRegister
.LVL29:
.LFE69:
	.size	NRF24L01_ClearInterrupts, .-NRF24L01_ClearInterrupts
	.section	.text.NRF24L01_WriteBit,"ax",%progbits
	.align	1
	.global	NRF24L01_WriteBit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_WriteBit, %function
NRF24L01_WriteBit:
.LVL30:
.LFB76:
	.loc 1 520 65 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 521 2 view .LVU101
	.loc 1 523 2 view .LVU102
	.loc 1 520 65 is_stmt 0 view .LVU103
	push	{r4, r5, r6, lr}
.LCFI15:
	.loc 1 520 65 view .LVU104
	mov	r6, r1
	mov	r4, r0
	mov	r5, r2
	.loc 1 523 8 view .LVU105
	bl	NRF24L01_ReadRegister
.LVL31:
	.loc 1 526 2 is_stmt 1 view .LVU106
	movs	r3, #1
	lsl	r1, r3, r6
	sxtb	r1, r1
	.loc 1 526 5 is_stmt 0 view .LVU107
	cbz	r5, .L31
	.loc 1 527 3 is_stmt 1 view .LVU108
	.loc 1 527 7 is_stmt 0 view .LVU109
	orrs	r1, r1, r0
.L33:
	.loc 1 532 2 view .LVU110
	mov	r0, r4
.LVL32:
	.loc 1 533 1 view .LVU111
	pop	{r4, r5, r6, lr}
.LCFI16:
	.loc 1 529 7 view .LVU112
	uxtb	r1, r1
.LVL33:
	.loc 1 532 2 is_stmt 1 view .LVU113
	b	NRF24L01_WriteRegister
.LVL34:
.L31:
.LCFI17:
	.loc 1 529 3 view .LVU114
	.loc 1 529 7 is_stmt 0 view .LVU115
	bic	r1, r0, r1
	b	.L33
.LFE76:
	.size	NRF24L01_WriteBit, .-NRF24L01_WriteBit
	.section	.text.NRF24L01_ReadRegisterMulti,"ax",%progbits
	.align	1
	.global	NRF24L01_ReadRegisterMulti
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_ReadRegisterMulti, %function
NRF24L01_ReadRegisterMulti:
.LVL35:
.LFB79:
	.loc 1 571 77 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 1 572 2 view .LVU117
	.loc 1 571 77 is_stmt 0 view .LVU118
	push	{r4, r5, r6, r7, r8, lr}
.LCFI18:
	.loc 1 572 10 view .LVU119
	add	r3, r2, #8
	.loc 1 571 77 view .LVU120
	sub	sp, sp, #8
.LCFI19:
	.loc 1 572 10 view .LVU121
	and	r3, r3, #504
	.loc 1 571 77 view .LVU122
	add	r7, sp, #8
.LCFI20:
	.loc 1 572 10 view .LVU123
	sub	sp, sp, r3
	mov	r8, sp
.LVL36:
	.loc 1 573 2 is_stmt 1 view .LVU124
	.loc 1 571 77 is_stmt 0 view .LVU125
	mov	r4, r2
	.loc 1 573 10 view .LVU126
	sub	sp, sp, r3
	.loc 1 571 77 view .LVU127
	mov	r5, r1
.LBB2:
	.loc 1 576 15 view .LVU128
	movs	r3, #1
	.loc 1 577 17 view .LVU129
	movs	r2, #255
.LVL37:
	.loc 1 577 17 view .LVU130
.LBE2:
	.loc 1 573 10 view .LVU131
	add	r6, sp, #8
.LVL38:
	.loc 1 575 2 is_stmt 1 view .LVU132
	.loc 1 575 14 is_stmt 0 view .LVU133
	strb	r0, [r8, #8]!
.LVL39:
	.loc 1 576 2 is_stmt 1 view .LVU134
.LBB3:
	.loc 1 576 7 view .LVU135
.L35:
	.loc 1 576 24 discriminator 1 view .LVU136
	.loc 1 576 2 is_stmt 0 discriminator 1 view .LVU137
	cmp	r4, r3
	bcs	.L36
.LBE3:
	.loc 1 580 2 is_stmt 1 view .LVU138
	bl	NRF24L01_CSN_LOW
.LVL40:
	.loc 1 582 2 view .LVU139
	movs	r3, #100
	ldr	r0, .L39
	str	r3, [sp]
	mov	r2, r6
	mov	r1, r8
	adds	r3, r4, #1
	ldr	r0, [r0, #4]
	bl	HAL_SPI_TransmitReceive
.LVL41:
	.loc 1 585 2 view .LVU140
	bl	NRF24L01_CSN_HIGH
.LVL42:
	.loc 1 587 2 view .LVU141
.LBB4:
	.loc 1 587 7 view .LVU142
	.loc 1 587 7 is_stmt 0 view .LVU143
	mov	r1, r5
	adds	r6, r6, #1
.LVL43:
	.loc 1 587 7 view .LVU144
	add	r4, r4, r5
.LVL44:
.L37:
	.loc 1 587 24 is_stmt 1 discriminator 1 view .LVU145
	.loc 1 587 2 is_stmt 0 discriminator 1 view .LVU146
	cmp	r1, r4
	bne	.L38
.LBE4:
	.loc 1 590 1 view .LVU147
	mov	sp, r7
.LCFI21:
.LVL45:
	.loc 1 590 1 view .LVU148
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.LVL46:
.L36:
.LCFI22:
.LBB5:
	.loc 1 577 3 is_stmt 1 discriminator 3 view .LVU149
	.loc 1 577 17 is_stmt 0 discriminator 3 view .LVU150
	strb	r2, [r8, r3]
	.loc 1 576 39 is_stmt 1 discriminator 3 view .LVU151
	.loc 1 576 42 is_stmt 0 discriminator 3 view .LVU152
	adds	r3, r3, #1
.LVL47:
	.loc 1 576 42 discriminator 3 view .LVU153
	uxtb	r3, r3
.LVL48:
	.loc 1 576 42 discriminator 3 view .LVU154
	b	.L35
.LVL49:
.L38:
	.loc 1 576 42 discriminator 3 view .LVU155
.LBE5:
.LBB6:
	.loc 1 588 3 is_stmt 1 discriminator 3 view .LVU156
	.loc 1 588 23 is_stmt 0 discriminator 3 view .LVU157
	ldrb	r3, [r6], #1	@ zero_extendqisi2
	.loc 1 588 13 discriminator 3 view .LVU158
	strb	r3, [r1], #1
.LVL50:
	.loc 1 587 38 is_stmt 1 discriminator 3 view .LVU159
	.loc 1 587 38 is_stmt 0 discriminator 3 view .LVU160
	b	.L37
.L40:
	.align	2
.L39:
	.word	.LANCHOR1
.LBE6:
.LFE79:
	.size	NRF24L01_ReadRegisterMulti, .-NRF24L01_ReadRegisterMulti
	.section	.text.NRF24L01_WriteRegisterMulti,"ax",%progbits
	.align	1
	.global	NRF24L01_WriteRegisterMulti
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_WriteRegisterMulti, %function
NRF24L01_WriteRegisterMulti:
.LVL51:
.LFB80:
	.loc 1 594 1 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 1 595 2 view .LVU162
	.loc 1 594 1 is_stmt 0 view .LVU163
	push	{r4, r5, r7, lr}
.LCFI23:
	mov	r4, r2
	.loc 1 595 10 view .LVU164
	adds	r2, r2, #8
.LVL52:
	.loc 1 595 10 view .LVU165
	and	r2, r2, #504
	.loc 1 594 1 view .LVU166
	add	r7, sp, #0
.LCFI24:
	.loc 1 595 10 view .LVU167
	sub	sp, sp, r2
	.loc 1 597 14 view .LVU168
	mov	r2, sp
	.loc 1 595 10 view .LVU169
	mov	r5, sp
.LVL53:
	.loc 1 597 2 is_stmt 1 view .LVU170
	.loc 1 597 14 is_stmt 0 view .LVU171
	orr	r0, r0, #32
.LVL54:
	.loc 1 597 14 view .LVU172
	mov	r3, r1
	strb	r0, [r2], #1
.LVL55:
	.loc 1 598 2 is_stmt 1 view .LVU173
.LBB7:
	.loc 1 598 7 view .LVU174
	.loc 1 598 7 is_stmt 0 view .LVU175
	add	r1, r1, r4
.LVL56:
.L42:
	.loc 1 598 24 is_stmt 1 discriminator 1 view .LVU176
	.loc 1 598 2 is_stmt 0 discriminator 1 view .LVU177
	cmp	r3, r1
	bne	.L43
.LBE7:
	.loc 1 602 2 is_stmt 1 view .LVU178
	bl	NRF24L01_CSN_LOW
.LVL57:
	.loc 1 604 2 view .LVU179
	ldr	r0, .L44
	movs	r3, #100
	mov	r1, r5
	adds	r2, r4, #1
	ldr	r0, [r0, #4]
	bl	HAL_SPI_Transmit
.LVL58:
	.loc 1 607 2 view .LVU180
	bl	NRF24L01_CSN_HIGH
.LVL59:
	.loc 1 608 1 is_stmt 0 view .LVU181
	mov	sp, r7
.LCFI25:
	@ sp needed
	pop	{r4, r5, r7, pc}
.LVL60:
.L43:
.LCFI26:
.LBB8:
	.loc 1 599 3 is_stmt 1 discriminator 3 view .LVU182
	.loc 1 599 27 is_stmt 0 discriminator 3 view .LVU183
	ldrb	r0, [r3], #1	@ zero_extendqisi2
.LVL61:
	.loc 1 599 21 discriminator 3 view .LVU184
	strb	r0, [r2], #1
	.loc 1 598 38 is_stmt 1 discriminator 3 view .LVU185
.LVL62:
	.loc 1 598 38 is_stmt 0 discriminator 3 view .LVU186
	b	.L42
.L45:
	.align	2
.L44:
	.word	.LANCHOR1
.LBE8:
.LFE80:
	.size	NRF24L01_WriteRegisterMulti, .-NRF24L01_WriteRegisterMulti
	.section	.text.NRF24L01_SoftwareReset,"ax",%progbits
	.align	1
	.global	NRF24L01_SoftwareReset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_SoftwareReset, %function
NRF24L01_SoftwareReset:
.LFB74:
	.loc 1 425 35 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 426 2 view .LVU188
	.loc 1 428 2 view .LVU189
	.loc 1 425 35 is_stmt 0 view .LVU190
	push	{r0, r1, r2, r4, r5, lr}
.LCFI27:
	.loc 1 428 2 view .LVU191
	movs	r1, #8
	movs	r0, #0
	bl	NRF24L01_WriteRegister
.LVL63:
	.loc 1 430 2 is_stmt 1 view .LVU192
	movs	r1, #63
	movs	r0, #1
	bl	NRF24L01_WriteRegister
.LVL64:
	.loc 1 431 2 view .LVU193
	movs	r1, #3
	movs	r0, #2
	bl	NRF24L01_WriteRegister
.LVL65:
	.loc 1 433 2 view .LVU194
	movs	r1, #3
	.loc 1 447 10 is_stmt 0 view .LVU195
	mov	r5, #-404232217
	.loc 1 451 10 view .LVU196
	movs	r4, #231
	.loc 1 433 2 view .LVU197
	mov	r0, r1
	bl	NRF24L01_WriteRegister
.LVL66:
	.loc 1 435 2 is_stmt 1 view .LVU198
	movs	r1, #3
	movs	r0, #4
	bl	NRF24L01_WriteRegister
.LVL67:
	.loc 1 437 2 view .LVU199
	movs	r1, #2
	movs	r0, #5
	bl	NRF24L01_WriteRegister
.LVL68:
	.loc 1 438 2 view .LVU200
	movs	r1, #14
	movs	r0, #6
	bl	NRF24L01_WriteRegister
.LVL69:
	.loc 1 440 2 view .LVU201
	movs	r1, #14
	movs	r0, #7
	bl	NRF24L01_WriteRegister
.LVL70:
	.loc 1 442 2 view .LVU202
	movs	r1, #0
	movs	r0, #8
	bl	NRF24L01_WriteRegister
.LVL71:
	.loc 1 444 2 view .LVU203
	movs	r1, #0
	movs	r0, #9
	bl	NRF24L01_WriteRegister
.LVL72:
	.loc 1 447 2 view .LVU204
	.loc 1 448 2 view .LVU205
	.loc 1 449 2 view .LVU206
	.loc 1 450 2 view .LVU207
	.loc 1 451 2 view .LVU208
	.loc 1 452 2 is_stmt 0 view .LVU209
	mov	r1, sp
	movs	r2, #5
	movs	r0, #10
	.loc 1 447 10 view .LVU210
	str	r5, [sp]
	.loc 1 451 10 view .LVU211
	strb	r4, [sp, #4]
	.loc 1 452 2 is_stmt 1 view .LVU212
	bl	NRF24L01_WriteRegisterMulti
.LVL73:
	.loc 1 455 2 view .LVU213
	.loc 1 456 2 view .LVU214
	.loc 1 457 2 view .LVU215
	.loc 1 458 2 view .LVU216
	.loc 1 459 2 view .LVU217
	.loc 1 455 10 is_stmt 0 view .LVU218
	mov	r3, #-1027423550
	str	r3, [sp]
	.loc 1 459 10 view .LVU219
	movs	r3, #194
	.loc 1 460 2 view .LVU220
	movs	r2, #5
	mov	r1, sp
	movs	r0, #11
	.loc 1 459 10 view .LVU221
	strb	r3, [sp, #4]
	.loc 1 460 2 is_stmt 1 view .LVU222
	bl	NRF24L01_WriteRegisterMulti
.LVL74:
	.loc 1 462 2 view .LVU223
	movs	r1, #195
	movs	r0, #12
	bl	NRF24L01_WriteRegister
.LVL75:
	.loc 1 464 2 view .LVU224
	movs	r1, #196
	movs	r0, #13
	bl	NRF24L01_WriteRegister
.LVL76:
	.loc 1 466 2 view .LVU225
	movs	r1, #197
	movs	r0, #14
	bl	NRF24L01_WriteRegister
.LVL77:
	.loc 1 468 2 view .LVU226
	movs	r1, #198
	movs	r0, #15
	bl	NRF24L01_WriteRegister
.LVL78:
	.loc 1 472 2 view .LVU227
	.loc 1 473 2 view .LVU228
	.loc 1 474 2 view .LVU229
	.loc 1 475 2 view .LVU230
	.loc 1 476 2 view .LVU231
	.loc 1 477 2 is_stmt 0 view .LVU232
	movs	r2, #5
	mov	r1, sp
	movs	r0, #16
	.loc 1 472 10 view .LVU233
	str	r5, [sp]
	.loc 1 476 10 view .LVU234
	strb	r4, [sp, #4]
	.loc 1 477 2 is_stmt 1 view .LVU235
	bl	NRF24L01_WriteRegisterMulti
.LVL79:
	.loc 1 479 2 view .LVU236
	movs	r1, #0
	movs	r0, #17
	bl	NRF24L01_WriteRegister
.LVL80:
	.loc 1 481 2 view .LVU237
	movs	r1, #0
	movs	r0, #18
	bl	NRF24L01_WriteRegister
.LVL81:
	.loc 1 483 2 view .LVU238
	movs	r1, #0
	movs	r0, #19
	bl	NRF24L01_WriteRegister
.LVL82:
	.loc 1 485 2 view .LVU239
	movs	r1, #0
	movs	r0, #20
	bl	NRF24L01_WriteRegister
.LVL83:
	.loc 1 487 2 view .LVU240
	movs	r1, #0
	movs	r0, #21
	bl	NRF24L01_WriteRegister
.LVL84:
	.loc 1 489 2 view .LVU241
	movs	r1, #0
	movs	r0, #22
	bl	NRF24L01_WriteRegister
.LVL85:
	.loc 1 491 2 view .LVU242
	movs	r1, #23
	mov	r0, r1
	bl	NRF24L01_WriteRegister
.LVL86:
	.loc 1 493 2 view .LVU243
	movs	r1, #0
	movs	r0, #28
	bl	NRF24L01_WriteRegister
.LVL87:
	.loc 1 494 2 view .LVU244
	movs	r1, #0
	movs	r0, #29
	bl	NRF24L01_WriteRegister
.LVL88:
	.loc 1 496 1 is_stmt 0 view .LVU245
	add	sp, sp, #12
.LCFI28:
	@ sp needed
	pop	{r4, r5, pc}
.LFE74:
	.size	NRF24L01_SoftwareReset, .-NRF24L01_SoftwareReset
	.section	.text.NRF24L01_SetRxAddress,"ax",%progbits
	.align	1
	.global	NRF24L01_SetRxAddress
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_SetRxAddress, %function
NRF24L01_SetRxAddress:
.LVL89:
.LFB81:
	.loc 1 610 42 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 611 2 view .LVU247
	.loc 1 610 42 is_stmt 0 view .LVU248
	push	{r4, lr}
.LCFI29:
	.loc 1 610 42 view .LVU249
	mov	r4, r0
	.loc 1 611 2 view .LVU250
	bl	NRF24L01_CE_LOW
.LVL90:
	.loc 1 613 2 is_stmt 1 view .LVU251
	mov	r1, r4
	movs	r2, #5
	movs	r0, #11
	bl	NRF24L01_WriteRegisterMulti
.LVL91:
	.loc 1 615 2 view .LVU252
	.loc 1 616 1 is_stmt 0 view .LVU253
	pop	{r4, lr}
.LCFI30:
.LVL92:
	.loc 1 615 2 view .LVU254
	b	NRF24L01_CE_HIGH
.LVL93:
.LFE81:
	.size	NRF24L01_SetRxAddress, .-NRF24L01_SetRxAddress
	.section	.text.NRF24L01_SetTxAddress,"ax",%progbits
	.align	1
	.global	NRF24L01_SetTxAddress
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_SetTxAddress, %function
NRF24L01_SetTxAddress:
.LVL94:
.LFB82:
	.loc 1 618 42 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 619 2 view .LVU256
	.loc 1 618 42 is_stmt 0 view .LVU257
	push	{r4, lr}
.LCFI31:
	.loc 1 618 42 view .LVU258
	mov	r4, r0
	.loc 1 619 2 view .LVU259
	mov	r1, r0
	movs	r2, #5
	movs	r0, #10
.LVL95:
	.loc 1 619 2 view .LVU260
	bl	NRF24L01_WriteRegisterMulti
.LVL96:
	.loc 1 620 2 is_stmt 1 view .LVU261
	mov	r1, r4
	.loc 1 621 1 is_stmt 0 view .LVU262
	pop	{r4, lr}
.LCFI32:
.LVL97:
	.loc 1 620 2 view .LVU263
	movs	r2, #5
	movs	r0, #16
	b	NRF24L01_WriteRegisterMulti
.LVL98:
	.loc 1 620 2 view .LVU264
.LFE82:
	.size	NRF24L01_SetTxAddress, .-NRF24L01_SetTxAddress
	.section	.text.NRF24L01_PowerDown,"ax",%progbits
	.align	1
	.global	NRF24L01_PowerDown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_PowerDown, %function
NRF24L01_PowerDown:
.LFB83:
	.loc 1 623 31 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 624 2 view .LVU266
	.loc 1 623 31 is_stmt 0 view .LVU267
	push	{r3, lr}
.LCFI33:
	.loc 1 624 2 view .LVU268
	bl	NRF24L01_CE_LOW
.LVL99:
	.loc 1 625 2 is_stmt 1 view .LVU269
	.loc 1 626 1 is_stmt 0 view .LVU270
	pop	{r3, lr}
.LCFI34:
	.loc 1 625 2 view .LVU271
	movs	r2, #0
	movs	r1, #1
	mov	r0, r2
	b	NRF24L01_WriteBit
.LVL100:
.LFE83:
	.size	NRF24L01_PowerDown, .-NRF24L01_PowerDown
	.section	.text.NRF24L01_PowerUP,"ax",%progbits
	.align	1
	.global	NRF24L01_PowerUP
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_PowerUP, %function
NRF24L01_PowerUP:
.LFB84:
	.loc 1 628 29 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 629 2 view .LVU273
	movs	r2, #1
	movs	r0, #0
	mov	r1, r2
	b	NRF24L01_WriteBit
.LVL101:
.LFE84:
	.size	NRF24L01_PowerUP, .-NRF24L01_PowerUP
	.section	.text.NRF24L01_PowerUpRx,"ax",%progbits
	.align	1
	.global	NRF24L01_PowerUpRx
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_PowerUpRx, %function
NRF24L01_PowerUpRx:
.LFB85:
	.loc 1 632 31 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 634 2 view .LVU275
	.loc 1 632 31 is_stmt 0 view .LVU276
	push	{r3, lr}
.LCFI35:
	.loc 1 634 2 view .LVU277
	bl	NRF24L01_CE_LOW
.LVL102:
	.loc 1 636 2 is_stmt 1 view .LVU278
	bl	NRF24L01_FlushRx
.LVL103:
	.loc 1 638 2 view .LVU279
	bl	NRF24L01_ClearInterrupts
.LVL104:
	.loc 1 640 2 view .LVU280
	movs	r1, #11
	movs	r0, #0
	bl	NRF24L01_WriteRegister
.LVL105:
	.loc 1 643 2 view .LVU281
	.loc 1 644 1 is_stmt 0 view .LVU282
	pop	{r3, lr}
.LCFI36:
	.loc 1 643 2 view .LVU283
	b	NRF24L01_CE_HIGH
.LVL106:
.LFE85:
	.size	NRF24L01_PowerUpRx, .-NRF24L01_PowerUpRx
	.section	.text.NRF24L01_PowerUpTx,"ax",%progbits
	.align	1
	.global	NRF24L01_PowerUpTx
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_PowerUpTx, %function
NRF24L01_PowerUpTx:
.LFB86:
	.loc 1 646 31 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 647 2 view .LVU285
	.loc 1 646 31 is_stmt 0 view .LVU286
	push	{r3, lr}
.LCFI37:
	.loc 1 647 2 view .LVU287
	bl	NRF24L01_ClearInterrupts
.LVL107:
	.loc 1 648 2 is_stmt 1 view .LVU288
	.loc 1 649 5 is_stmt 0 view .LVU289
	movs	r0, #0
	bl	NRF24L01_ReadRegister
.LVL108:
	.loc 1 652 1 view .LVU290
	pop	{r3, lr}
.LCFI38:
	.loc 1 651 6 view .LVU291
	and	r1, r0, #244
	.loc 1 648 2 view .LVU292
	orr	r1, r1, #10
	movs	r0, #0
	b	NRF24L01_WriteRegister
.LVL109:
.LFE86:
	.size	NRF24L01_PowerUpTx, .-NRF24L01_PowerUpTx
	.section	.text.NRF24L01_GetData,"ax",%progbits
	.align	1
	.global	NRF24L01_GetData
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_GetData, %function
NRF24L01_GetData:
.LVL110:
.LFB88:
	.loc 1 725 1 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 727 2 view .LVU294
	.loc 1 725 1 is_stmt 0 view .LVU295
	push	{r4, r5, lr}
.LCFI39:
	sub	sp, sp, #20
.LCFI40:
	.loc 1 725 1 view .LVU296
	mov	r5, r0
	.loc 1 727 2 view .LVU297
	bl	NRF24L01_CSN_LOW
.LVL111:
	.loc 1 730 2 is_stmt 1 view .LVU298
	.loc 1 730 10 is_stmt 0 view .LVU299
	movs	r3, #97
	.loc 1 731 2 view .LVU300
	ldr	r4, .L54
	.loc 1 730 10 view .LVU301
	strb	r3, [sp, #15]
	.loc 1 731 2 is_stmt 1 view .LVU302
	add	r1, sp, #15
	movs	r3, #100
	movs	r2, #1
	ldr	r0, [r4, #4]
	bl	HAL_SPI_Transmit
.LVL112:
	.loc 1 734 2 view .LVU303
	movs	r3, #100
	mov	r2, r5
	mov	r1, r5
	str	r3, [sp]
	ldr	r0, [r4, #4]
	ldrb	r3, [r4]	@ zero_extendqisi2
	bl	HAL_SPI_TransmitReceive
.LVL113:
	.loc 1 738 2 view .LVU304
	bl	NRF24L01_CSN_HIGH
.LVL114:
	.loc 1 741 2 view .LVU305
	movs	r1, #64
	movs	r0, #7
	bl	NRF24L01_WriteRegister
.LVL115:
	.loc 1 742 1 is_stmt 0 view .LVU306
	add	sp, sp, #20
.LCFI41:
	@ sp needed
	pop	{r4, r5, pc}
.LVL116:
.L55:
	.loc 1 742 1 view .LVU307
	.align	2
.L54:
	.word	.LANCHOR1
.LFE88:
	.size	NRF24L01_GetData, .-NRF24L01_GetData
	.section	.text.NRF24L01_RxFifoEmpty,"ax",%progbits
	.align	1
	.global	NRF24L01_RxFifoEmpty
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_RxFifoEmpty, %function
NRF24L01_RxFifoEmpty:
.LFB90:
	.loc 1 753 36 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 754 2 view .LVU309
	.loc 1 753 36 is_stmt 0 view .LVU310
	push	{r3, lr}
.LCFI42:
	.loc 1 754 16 view .LVU311
	movs	r0, #23
	bl	NRF24L01_ReadRegister
.LVL117:
	.loc 1 755 2 is_stmt 1 view .LVU312
	.loc 1 756 1 is_stmt 0 view .LVU313
	and	r0, r0, #1
.LVL118:
	.loc 1 756 1 view .LVU314
	pop	{r3, pc}
.LFE90:
	.size	NRF24L01_RxFifoEmpty, .-NRF24L01_RxFifoEmpty
	.section	.text.NRF24L01_GetStatus,"ax",%progbits
	.align	1
	.global	NRF24L01_GetStatus
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_GetStatus, %function
NRF24L01_GetStatus:
.LFB91:
	.loc 1 762 34 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 763 2 view .LVU316
	.loc 1 765 2 view .LVU317
	.loc 1 762 34 is_stmt 0 view .LVU318
	push	{r0, r1, r2, r3, r4, lr}
.LCFI43:
	.loc 1 765 2 view .LVU319
	bl	NRF24L01_CSN_LOW
.LVL119:
	.loc 1 768 2 is_stmt 1 view .LVU320
	.loc 1 768 10 is_stmt 0 view .LVU321
	movs	r3, #255
	strb	r3, [sp, #15]
	.loc 1 769 2 is_stmt 1 view .LVU322
	movs	r3, #100
	ldr	r0, .L58
	str	r3, [sp]
	add	r2, sp, #14
	movs	r3, #1
	add	r1, sp, #15
	ldr	r0, [r0, #4]
	bl	HAL_SPI_TransmitReceive
.LVL120:
	.loc 1 773 2 view .LVU323
	bl	NRF24L01_CSN_HIGH
.LVL121:
	.loc 1 775 2 view .LVU324
	.loc 1 776 1 is_stmt 0 view .LVU325
	ldrb	r0, [sp, #14]	@ zero_extendqisi2
	add	sp, sp, #20
.LCFI44:
	@ sp needed
	ldr	pc, [sp], #4
.L59:
	.align	2
.L58:
	.word	.LANCHOR1
.LFE91:
	.size	NRF24L01_GetStatus, .-NRF24L01_GetStatus
	.section	.text.NRF24L01_DataReady,"ax",%progbits
	.align	1
	.global	NRF24L01_DataReady
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_DataReady, %function
NRF24L01_DataReady:
.LFB89:
	.loc 1 744 34 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 745 2 view .LVU327
	.loc 1 744 34 is_stmt 0 view .LVU328
	push	{r3, lr}
.LCFI45:
	.loc 1 745 19 view .LVU329
	bl	NRF24L01_GetStatus
.LVL122:
	.loc 1 747 2 is_stmt 1 view .LVU330
	.loc 1 747 5 is_stmt 0 view .LVU331
	lsls	r3, r0, #25
	bmi	.L62
	.loc 1 750 2 is_stmt 1 view .LVU332
	.loc 1 750 10 is_stmt 0 view .LVU333
	bl	NRF24L01_RxFifoEmpty
.LVL123:
	.loc 1 750 9 view .LVU334
	clz	r0, r0
	lsrs	r0, r0, #5
.L61:
	.loc 1 751 1 view .LVU335
	pop	{r3, pc}
.LVL124:
.L62:
	.loc 1 748 10 view .LVU336
	movs	r0, #1
.LVL125:
	.loc 1 748 10 view .LVU337
	b	.L61
.LFE89:
	.size	NRF24L01_DataReady, .-NRF24L01_DataReady
	.section	.text.NRF24L01_GetTransmissionStatus,"ax",%progbits
	.align	1
	.global	NRF24L01_GetTransmissionStatus
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_GetTransmissionStatus, %function
NRF24L01_GetTransmissionStatus:
.LFB92:
	.loc 1 778 65 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 779 2 view .LVU339
	.loc 1 778 65 is_stmt 0 view .LVU340
	push	{r3, lr}
.LCFI46:
	.loc 1 779 19 view .LVU341
	bl	NRF24L01_GetStatus
.LVL126:
	.loc 1 780 2 is_stmt 1 view .LVU342
	.loc 1 780 5 is_stmt 0 view .LVU343
	lsls	r3, r0, #26
	.loc 1 783 9 is_stmt 1 view .LVU344
	.loc 1 783 12 is_stmt 0 view .LVU345
	ittet	pl
	eorpl	r0, r0, #16
.LVL127:
	.loc 1 783 12 view .LVU346
	sbfxpl	r0, r0, #4, #1
	.loc 1 782 10 view .LVU347
	movmi	r0, #1
	.loc 1 783 12 view .LVU348
	uxtbpl	r0, r0
	.loc 1 790 1 view .LVU349
	pop	{r3, pc}
.LFE92:
	.size	NRF24L01_GetTransmissionStatus, .-NRF24L01_GetTransmissionStatus
	.section	.text.NRF24L01_Transmit,"ax",%progbits
	.align	1
	.global	NRF24L01_Transmit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_Transmit, %function
NRF24L01_Transmit:
.LVL128:
.LFB87:
	.loc 1 655 64 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 1 656 2 view .LVU351
	.loc 1 657 2 view .LVU352
	.loc 1 655 64 is_stmt 0 view .LVU353
	push	{r4, r5, r6, r7, r8, lr}
.LCFI47:
	.loc 1 659 10 view .LVU354
	ldr	r5, .L72
	.loc 1 655 64 view .LVU355
	add	r7, sp, #0
.LCFI48:
	.loc 1 659 10 view .LVU356
	ldrb	r6, [r5]	@ zero_extendqisi2
	.loc 1 655 64 view .LVU357
	mov	r4, r0
.LVL129:
	.loc 1 659 2 is_stmt 1 view .LVU358
	.loc 1 662 2 view .LVU359
	bl	NRF24L01_CE_LOW
.LVL130:
	.loc 1 665 2 view .LVU360
	bl	NRF24L01_FlushTx
.LVL131:
	.loc 1 667 2 view .LVU361
	.loc 1 667 10 is_stmt 0 view .LVU362
	add	r3, r6, #8
	and	r3, r3, #504
	sub	sp, sp, r3
	.loc 1 670 14 view .LVU363
	movs	r3, #160
	.loc 1 667 10 view .LVU364
	mov	r8, sp
.LVL132:
	.loc 1 670 2 is_stmt 1 view .LVU365
	.loc 1 670 14 is_stmt 0 view .LVU366
	strb	r3, [sp]
	.loc 1 672 2 is_stmt 1 view .LVU367
.LBB9:
	.loc 1 672 7 view .LVU368
.LVL133:
	.loc 1 672 11 is_stmt 0 view .LVU369
	movs	r3, #0
	subs	r0, r4, #1
.LVL134:
.L67:
	.loc 1 672 20 is_stmt 1 discriminator 1 view .LVU370
	.loc 1 672 2 is_stmt 0 discriminator 1 view .LVU371
	cmp	r6, r3
	bgt	.L68
.LBE9:
	.loc 1 677 2 is_stmt 1 view .LVU372
	bl	NRF24L01_PowerUpTx
.LVL135:
	.loc 1 680 2 view .LVU373
	movs	r0, #1
	bl	HAL_Delay
.LVL136:
	.loc 1 683 2 view .LVU374
	bl	NRF24L01_CSN_LOW
.LVL137:
	.loc 1 686 2 view .LVU375
	movs	r3, #100
	mov	r1, r8
	adds	r2, r6, #1
	ldr	r0, [r5, #4]
	bl	HAL_SPI_Transmit
.LVL138:
	.loc 1 690 2 view .LVU376
	bl	NRF24L01_CSN_HIGH
.LVL139:
	.loc 1 693 2 view .LVU377
	bl	NRF24L01_CE_HIGH
.LVL140:
	.loc 1 694 2 view .LVU378
	movs	r0, #1
	bl	HAL_Delay
.LVL141:
	.loc 1 695 2 view .LVU379
	bl	NRF24L01_CE_LOW
.LVL142:
	.loc 1 707 2 view .LVU380
	.loc 1 708 2 view .LVU381
	.loc 1 708 21 is_stmt 0 view .LVU382
	bl	HAL_GetTick
.LVL143:
	mov	r5, r0
.LVL144:
	.loc 1 709 2 is_stmt 1 view .LVU383
.L70:
	.loc 1 711 2 discriminator 2 view .LVU384
	.loc 1 712 3 discriminator 2 view .LVU385
	.loc 1 712 12 is_stmt 0 discriminator 2 view .LVU386
	bl	NRF24L01_GetTransmissionStatus
.LVL145:
	mov	r4, r0
.LVL146:
	.loc 1 714 10 is_stmt 1 discriminator 2 view .LVU387
	.loc 1 714 12 is_stmt 0 discriminator 2 view .LVU388
	bl	HAL_GetTick
.LVL147:
	.loc 1 714 26 discriminator 2 view .LVU389
	subs	r0, r0, r5
	.loc 1 715 4 discriminator 2 view .LVU390
	cmp	r0, #500
	bcs	.L69
	.loc 1 715 4 discriminator 1 view .LVU391
	cmp	r4, #1
	bne	.L70
.L69:
	.loc 1 717 2 is_stmt 1 view .LVU392
	bl	NRF24L01_PowerDown
.LVL148:
	.loc 1 719 2 view .LVU393
	bl	NRF24L01_FlushTx
.LVL149:
	.loc 1 721 2 view .LVU394
	.loc 1 722 1 is_stmt 0 view .LVU395
	mov	r0, r4
	mov	sp, r7
.LCFI49:
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.LVL150:
.L68:
.LCFI50:
.LBB10:
	.loc 1 673 3 is_stmt 1 discriminator 3 view .LVU396
	.loc 1 673 21 is_stmt 0 discriminator 3 view .LVU397
	ldrb	r2, [r0, #1]!	@ zero_extendqisi2
	.loc 1 673 16 discriminator 3 view .LVU398
	adds	r3, r3, #1
.LVL151:
	.loc 1 673 21 discriminator 3 view .LVU399
	strb	r2, [r8, r3]
	.loc 1 672 34 is_stmt 1 discriminator 3 view .LVU400
.LVL152:
	.loc 1 672 34 is_stmt 0 discriminator 3 view .LVU401
	b	.L67
.L73:
	.align	2
.L72:
	.word	.LANCHOR1
.LBE10:
.LFE87:
	.size	NRF24L01_Transmit, .-NRF24L01_Transmit
	.section	.text.NRF24L01_GetRetransmissionsCount,"ax",%progbits
	.align	1
	.global	NRF24L01_GetRetransmissionsCount
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_GetRetransmissionsCount, %function
NRF24L01_GetRetransmissionsCount:
.LFB93:
	.loc 1 792 48 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 794 2 view .LVU403
	.loc 1 792 48 is_stmt 0 view .LVU404
	push	{r3, lr}
.LCFI51:
	.loc 1 794 9 view .LVU405
	movs	r0, #8
	bl	NRF24L01_ReadRegister
.LVL153:
	.loc 1 795 1 view .LVU406
	and	r0, r0, #15
	pop	{r3, pc}
.LFE93:
	.size	NRF24L01_GetRetransmissionsCount, .-NRF24L01_GetRetransmissionsCount
	.section	.text.NRF24L01_SetChannel,"ax",%progbits
	.align	1
	.global	NRF24L01_SetChannel
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_SetChannel, %function
NRF24L01_SetChannel:
.LVL154:
.LFB94:
	.loc 1 797 43 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 798 2 view .LVU408
	.loc 1 798 5 is_stmt 0 view .LVU409
	cmp	r0, #125
	.loc 1 797 43 view .LVU410
	mov	r1, r0
	.loc 1 798 5 view .LVU411
	bhi	.L75
	.loc 1 798 50 discriminator 1 view .LVU412
	ldr	r3, .L77
	.loc 1 798 21 discriminator 1 view .LVU413
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, r0
	beq	.L75
.LVL155:
.LBB13:
.LBI13:
	.loc 1 797 6 is_stmt 1 view .LVU414
.LBB14:
	.loc 1 800 3 view .LVU415
	.loc 1 800 27 is_stmt 0 view .LVU416
	strb	r0, [r3, #1]
	.loc 1 802 3 is_stmt 1 view .LVU417
	movs	r0, #5
.LVL156:
	.loc 1 802 3 is_stmt 0 view .LVU418
	b	NRF24L01_WriteRegister
.LVL157:
.L75:
	.loc 1 802 3 view .LVU419
.LBE14:
.LBE13:
	.loc 1 804 1 view .LVU420
	bx	lr
.L78:
	.align	2
.L77:
	.word	.LANCHOR1
.LFE94:
	.size	NRF24L01_SetChannel, .-NRF24L01_SetChannel
	.section	.text.NRF24L01_SetCrcLength,"ax",%progbits
	.align	1
	.global	NRF24L01_SetCrcLength
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_SetCrcLength, %function
NRF24L01_SetCrcLength:
.LVL158:
.LFB95:
	.loc 1 806 57 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 807 2 view .LVU422
	.loc 1 806 57 is_stmt 0 view .LVU423
	push	{r4, lr}
.LCFI52:
	.loc 1 806 57 view .LVU424
	mov	r4, r0
	.loc 1 807 19 view .LVU425
	movs	r0, #0
.LVL159:
	.loc 1 807 19 view .LVU426
	bl	NRF24L01_ReadRegister
.LVL160:
	mov	r1, r0
.LVL161:
	.loc 1 810 2 is_stmt 1 view .LVU427
	.loc 1 810 5 is_stmt 0 view .LVU428
	cbnz	r4, .L80
	.loc 1 811 3 is_stmt 1 view .LVU429
	.loc 1 811 10 is_stmt 0 view .LVU430
	and	r1, r0, #243
.LVL162:
.L81:
	.loc 1 822 2 is_stmt 1 view .LVU431
	movs	r0, #0
	.loc 1 823 1 is_stmt 0 view .LVU432
	pop	{r4, lr}
.LCFI53:
	.loc 1 822 2 view .LVU433
	b	NRF24L01_WriteRegister
.LVL163:
.L80:
.LCFI54:
	.loc 1 814 9 is_stmt 1 view .LVU434
	.loc 1 814 12 is_stmt 0 view .LVU435
	cmp	r4, #1
	.loc 1 815 3 is_stmt 1 view .LVU436
	.loc 1 815 10 is_stmt 0 view .LVU437
	ite	eq
	orreq	r1, r0, #8
	.loc 1 819 3 is_stmt 1 view .LVU438
	.loc 1 819 10 is_stmt 0 view .LVU439
	orrne	r1, r1, #12
	uxtb	r1, r1
.LVL164:
	.loc 1 819 10 view .LVU440
	b	.L81
.LFE95:
	.size	NRF24L01_SetCrcLength, .-NRF24L01_SetCrcLength
	.section	.text.NRF24L01_SetPaLevel,"ax",%progbits
	.align	1
	.global	NRF24L01_SetPaLevel
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_SetPaLevel, %function
NRF24L01_SetPaLevel:
.LVL165:
.LFB96:
	.loc 1 825 57 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 827 1 view .LVU442
	bx	lr
.LFE96:
	.size	NRF24L01_SetPaLevel, .-NRF24L01_SetPaLevel
	.section	.text.NRF24L01_GetPaLevel,"ax",%progbits
	.align	1
	.global	NRF24L01_GetPaLevel
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_GetPaLevel, %function
NRF24L01_GetPaLevel:
.LFB97:
	.loc 1 829 50 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 833 2 view .LVU444
	.loc 1 834 1 is_stmt 0 view .LVU445
	movs	r0, #3
	bx	lr
.LFE97:
	.size	NRF24L01_GetPaLevel, .-NRF24L01_GetPaLevel
	.section	.text.setDataRate,"ax",%progbits
	.align	1
	.global	setDataRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	setDataRate, %function
setDataRate:
.LFB114:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
.LFE114:
	.size	setDataRate, .-setDataRate
	.section	.text.NRF24L01_GetDataRate,"ax",%progbits
	.align	1
	.global	NRF24L01_GetDataRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_GetDataRate, %function
NRF24L01_GetDataRate:
.LFB99:
	.loc 1 840 48 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 842 2 view .LVU447
	.loc 1 843 1 is_stmt 0 view .LVU448
	movs	r0, #1
	bx	lr
.LFE99:
	.size	NRF24L01_GetDataRate, .-NRF24L01_GetDataRate
	.section	.text.NRF24L01_SetRF,"ax",%progbits
	.align	1
	.global	NRF24L01_SetRF
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_SetRF, %function
NRF24L01_SetRF:
.LVL166:
.LFB100:
	.loc 1 845 82 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 846 2 view .LVU450
	.loc 1 847 2 view .LVU451
	.loc 1 847 27 is_stmt 0 view .LVU452
	ldr	r2, .L95
	.loc 1 845 82 view .LVU453
	mov	r3, r1
	.loc 1 847 27 view .LVU454
	strb	r0, [r2, #3]
	.loc 1 848 2 is_stmt 1 view .LVU455
	.loc 1 848 25 is_stmt 0 view .LVU456
	strb	r1, [r2, #2]
	.loc 1 850 2 is_stmt 1 view .LVU457
	.loc 1 850 5 is_stmt 0 view .LVU458
	cbz	r0, .L93
	.loc 1 852 9 is_stmt 1 view .LVU459
	.loc 1 852 12 is_stmt 0 view .LVU460
	cmp	r0, #2
	.loc 1 853 7 view .LVU461
	ite	ne
	movne	r1, #0
.LVL167:
	.loc 1 853 7 view .LVU462
	moveq	r1, #32
.L89:
.LVL168:
	.loc 1 857 2 is_stmt 1 view .LVU463
	.loc 1 857 5 is_stmt 0 view .LVU464
	cmp	r3, #3
	bne	.L90
	.loc 1 858 3 is_stmt 1 view .LVU465
	.loc 1 858 7 is_stmt 0 view .LVU466
	orr	r1, r1, #6
.LVL169:
.L91:
	.loc 1 866 2 is_stmt 1 view .LVU467
	movs	r0, #6
.LVL170:
	.loc 1 866 2 is_stmt 0 view .LVU468
	b	NRF24L01_WriteRegister
.LVL171:
.L93:
	.loc 1 851 7 view .LVU469
	movs	r1, #8
.LVL172:
	.loc 1 851 7 view .LVU470
	b	.L89
.LVL173:
.L90:
	.loc 1 859 9 is_stmt 1 view .LVU471
	.loc 1 859 12 is_stmt 0 view .LVU472
	cmp	r3, #2
	bne	.L92
	.loc 1 860 3 is_stmt 1 view .LVU473
	.loc 1 860 7 is_stmt 0 view .LVU474
	orr	r1, r1, #4
.LVL174:
	.loc 1 860 7 view .LVU475
	b	.L91
.L92:
	.loc 1 861 9 is_stmt 1 view .LVU476
	.loc 1 861 12 is_stmt 0 view .LVU477
	cmp	r3, #1
	.loc 1 862 3 is_stmt 1 view .LVU478
	.loc 1 862 7 is_stmt 0 view .LVU479
	it	eq
	orreq	r1, r1, #2
.LVL175:
	.loc 1 862 7 view .LVU480
	b	.L91
.L96:
	.align	2
.L95:
	.word	.LANCHOR1
.LFE100:
	.size	NRF24L01_SetRF, .-NRF24L01_SetRF
	.section	.text.NRF24L01_Init,"ax",%progbits
	.align	1
	.global	NRF24L01_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_Init, %function
NRF24L01_Init:
.LVL176:
.LFB72:
	.loc 1 287 50 is_stmt 1 view -0
	@ args = 52, pretend = 8, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 288 2 view .LVU482
	.loc 1 288 16 is_stmt 0 view .LVU483
	ldr	ip, .L98+8
	.loc 1 287 50 view .LVU484
	sub	sp, sp, #8
.LCFI55:
	push	{r4, r5, r6, r7, r8, r9, lr}
.LCFI56:
	.loc 1 288 16 view .LVU485
	mov	r5, ip
	.loc 1 287 50 view .LVU486
	sub	sp, sp, #44
.LCFI57:
	.loc 1 287 50 view .LVU487
	add	r4, sp, #72
	str	r3, [r4, #4]!
	mov	r6, r1
	mov	r7, r0
	mov	r8, r2
	.loc 1 288 16 view .LVU488
	ldmia	r4!, {r0, r1, r2, r3}
.LVL177:
	.loc 1 288 16 view .LVU489
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
.LBB15:
	.loc 1 291 30 view .LVU490
	mov	r9, #0
.LBE15:
	.loc 1 288 16 view .LVU491
	stmia	r5!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1, r2, r3}
	.loc 1 294 2 view .LVU492
	mov	r4, sp
	.loc 1 288 16 view .LVU493
	stm	r5, {r0, r1, r2, r3}
	.loc 1 290 2 is_stmt 1 view .LVU494
.LBB16:
	.loc 1 290 7 view .LVU495
.LVL178:
	.loc 1 290 20 view .LVU496
	.loc 1 291 3 view .LVU497
	.loc 1 291 30 is_stmt 0 view .LVU498
	ldr	r3, .L98
.LBE16:
	.loc 1 294 2 view .LVU499
	add	r5, ip, #12
.LBB17:
	.loc 1 291 30 view .LVU500
	strb	r9, [r3]
	.loc 1 290 29 is_stmt 1 view .LVU501
.LVL179:
	.loc 1 290 20 view .LVU502
	.loc 1 291 3 view .LVU503
	.loc 1 291 30 is_stmt 0 view .LVU504
	strb	r9, [r3, #1]
	.loc 1 290 29 is_stmt 1 view .LVU505
.LVL180:
	.loc 1 290 20 view .LVU506
	.loc 1 291 3 view .LVU507
	.loc 1 291 30 is_stmt 0 view .LVU508
	strb	r9, [r3, #2]
	.loc 1 290 29 is_stmt 1 view .LVU509
.LVL181:
	.loc 1 290 20 view .LVU510
	.loc 1 291 3 view .LVU511
	.loc 1 291 30 is_stmt 0 view .LVU512
	strb	r9, [r3, #3]
	.loc 1 290 29 is_stmt 1 view .LVU513
.LVL182:
	.loc 1 290 20 view .LVU514
	.loc 1 291 3 view .LVU515
	.loc 1 291 30 is_stmt 0 view .LVU516
	strb	r9, [r3, #4]
	.loc 1 290 29 is_stmt 1 view .LVU517
.LVL183:
	.loc 1 290 20 view .LVU518
.LBE17:
	.loc 1 294 2 view .LVU519
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [r5]
	mov	r0, r8
	str	r3, [r4]
	ldm	ip, {r1, r2, r3}
	bl	NRF24L01_SpiInit
.LVL184:
	.loc 1 297 2 view .LVU520
	movs	r0, #5
	bl	HAL_Delay
.LVL185:
	.loc 1 300 2 view .LVU521
	.loc 1 305 2 view .LVU522
	.loc 1 305 28 is_stmt 0 view .LVU523
	clz	r3, r7
	.loc 1 305 26 view .LVU524
	ldr	r4, .L98+4
	.loc 1 305 28 view .LVU525
	lsrs	r3, r3, #5
	.loc 1 306 30 view .LVU526
	cmp	r6, #32
	.loc 1 305 28 view .LVU527
	strb	r3, [r4, #1]
	.loc 1 306 2 is_stmt 1 view .LVU528
	.loc 1 307 25 is_stmt 0 view .LVU529
	movw	r3, #259
	.loc 1 306 30 view .LVU530
	it	cs
	movcs	r6, #32
.LVL186:
	.loc 1 307 25 view .LVU531
	strh	r3, [r4, #2]	@ movhi
	.loc 1 306 30 view .LVU532
	strb	r6, [r4]
	.loc 1 307 2 is_stmt 1 view .LVU533
	.loc 1 308 2 view .LVU534
	.loc 1 309 2 view .LVU535
	.loc 1 309 23 is_stmt 0 view .LVU536
	str	r8, [r4, #4]
	.loc 1 318 2 is_stmt 1 view .LVU537
	bl	NRF24L01_SoftwareReset
.LVL187:
	.loc 1 321 2 view .LVU538
	movs	r1, #79
	movs	r0, #4
	bl	NRF24L01_WriteRegister
.LVL188:
	.loc 1 325 2 view .LVU539
	mov	r0, r7
	bl	NRF24L01_SetChannel
.LVL189:
	.loc 1 328 2 view .LVU540
	ldrb	r1, [r4]	@ zero_extendqisi2
	movs	r0, #17
	bl	NRF24L01_WriteRegister
.LVL190:
	.loc 1 329 2 view .LVU541
	ldrb	r1, [r4]	@ zero_extendqisi2
	movs	r0, #18
	bl	NRF24L01_WriteRegister
.LVL191:
	.loc 1 330 2 view .LVU542
	ldrb	r1, [r4]	@ zero_extendqisi2
	movs	r0, #19
	bl	NRF24L01_WriteRegister
.LVL192:
	.loc 1 331 2 view .LVU543
	ldrb	r1, [r4]	@ zero_extendqisi2
	movs	r0, #20
	bl	NRF24L01_WriteRegister
.LVL193:
	.loc 1 332 2 view .LVU544
	ldrb	r1, [r4]	@ zero_extendqisi2
	movs	r0, #21
	bl	NRF24L01_WriteRegister
.LVL194:
	.loc 1 333 2 view .LVU545
	ldrb	r1, [r4]	@ zero_extendqisi2
	movs	r0, #22
	bl	NRF24L01_WriteRegister
.LVL195:
	.loc 1 336 2 view .LVU546
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	ldrb	r0, [r4, #3]	@ zero_extendqisi2
	bl	NRF24L01_SetRF
.LVL196:
	.loc 1 339 2 view .LVU547
	mov	r0, r9
	movs	r1, #8
	bl	NRF24L01_WriteRegister
.LVL197:
	.loc 1 342 2 view .LVU548
	movs	r1, #63
	movs	r0, #1
	bl	NRF24L01_WriteRegister
.LVL198:
	.loc 1 345 2 view .LVU549
	movs	r1, #63
	movs	r0, #2
	bl	NRF24L01_WriteRegister
.LVL199:
	.loc 1 348 2 view .LVU550
	movs	r1, #79
	movs	r0, #4
	bl	NRF24L01_WriteRegister
.LVL200:
	.loc 1 351 2 view .LVU551
	mov	r1, r9
	movs	r0, #28
	bl	NRF24L01_WriteRegister
.LVL201:
	.loc 1 357 2 view .LVU552
	movs	r0, #2
	bl	NRF24L01_SetCrcLength
.LVL202:
	.loc 1 360 2 view .LVU553
	bl	NRF24L01_FlushTx
.LVL203:
	.loc 1 361 2 view .LVU554
	bl	NRF24L01_FlushRx
.LVL204:
	.loc 1 364 2 view .LVU555
	bl	NRF24L01_ClearInterrupts
.LVL205:
	.loc 1 367 2 view .LVU556
	bl	NRF24L01_PowerUpRx
.LVL206:
	.loc 1 370 2 view .LVU557
	.loc 1 371 1 is_stmt 0 view .LVU558
	movs	r0, #1
	add	sp, sp, #44
.LCFI58:
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
.LCFI59:
.LVL207:
	.loc 1 371 1 view .LVU559
	add	sp, sp, #8
.LCFI60:
	bx	lr
.L99:
	.align	2
.L98:
	.word	.LANCHOR2
	.word	.LANCHOR1
	.word	.LANCHOR0
.LFE72:
	.size	NRF24L01_Init, .-NRF24L01_Init
	.section	.text.NRF24L01_SetAutoAck,"ax",%progbits
	.align	1
	.global	NRF24L01_SetAutoAck
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_SetAutoAck, %function
NRF24L01_SetAutoAck:
.LVL208:
.LFB101:
	.loc 1 869 55 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 870 2 view .LVU561
	.loc 1 870 5 is_stmt 0 view .LVU562
	cmp	r0, #5
	.loc 1 869 55 view .LVU563
	push	{r3, r4, r5, lr}
.LCFI61:
	.loc 1 869 55 view .LVU564
	mov	r5, r0
	mov	r4, r1
	.loc 1 870 5 view .LVU565
	bhi	.L101
.LBB18:
	.loc 1 871 3 is_stmt 1 view .LVU566
	.loc 1 871 18 is_stmt 0 view .LVU567
	movs	r0, #63
.LVL209:
	.loc 1 871 18 view .LVU568
	bl	NRF24L01_ReadRegister
.LVL210:
	.loc 1 871 18 view .LVU569
	mov	r1, r0
.LVL211:
	.loc 1 873 3 is_stmt 1 view .LVU570
	.loc 1 873 6 is_stmt 0 view .LVU571
	cbnz	r4, .L102
	.loc 1 874 4 is_stmt 1 view .LVU572
	.loc 1 874 16 is_stmt 0 view .LVU573
	movs	r4, #1
	lsls	r4, r4, r5
	.loc 1 874 9 view .LVU574
	bic	r1, r0, r4
.LVL212:
.L108:
	.loc 1 874 9 view .LVU575
.LBE18:
.LBB19:
	.loc 1 890 9 view .LVU576
	uxtb	r1, r1
.LVL213:
	.loc 1 890 9 view .LVU577
	b	.L106
.LVL214:
.L102:
	.loc 1 890 9 view .LVU578
.LBE19:
.LBB20:
	.loc 1 876 10 is_stmt 1 view .LVU579
	.loc 1 876 13 is_stmt 0 view .LVU580
	cmp	r4, #1
	bne	.L106
	.loc 1 877 4 is_stmt 1 view .LVU581
	.loc 1 877 15 is_stmt 0 view .LVU582
	lsls	r4, r4, r5
	.loc 1 877 9 view .LVU583
	orrs	r1, r1, r4
	b	.L108
.LVL215:
.L101:
	.loc 1 877 9 view .LVU584
.LBE20:
	.loc 1 883 9 is_stmt 1 view .LVU585
	.loc 1 883 12 is_stmt 0 view .LVU586
	cmp	r0, #255
	bne	.L100
.LBB21:
	.loc 1 884 3 is_stmt 1 view .LVU587
	.loc 1 884 18 is_stmt 0 view .LVU588
	movs	r0, #63
.LVL216:
	.loc 1 884 18 view .LVU589
	bl	NRF24L01_ReadRegister
.LVL217:
	.loc 1 884 18 view .LVU590
	mov	r1, r0
.LVL218:
	.loc 1 886 3 is_stmt 1 view .LVU591
	.loc 1 886 6 is_stmt 0 view .LVU592
	cbnz	r4, .L105
	.loc 1 887 4 is_stmt 1 view .LVU593
	.loc 1 887 9 is_stmt 0 view .LVU594
	and	r1, r0, #192
.LVL219:
.L106:
	.loc 1 893 3 is_stmt 1 view .LVU595
	movs	r0, #1
.LBE21:
	.loc 1 895 1 is_stmt 0 view .LVU596
	pop	{r3, r4, r5, lr}
.LCFI62:
.LBB22:
	.loc 1 893 3 view .LVU597
	b	NRF24L01_WriteRegister
.LVL220:
.L105:
.LCFI63:
	.loc 1 889 10 is_stmt 1 view .LVU598
	.loc 1 889 13 is_stmt 0 view .LVU599
	cmp	r4, #1
	bne	.L106
	.loc 1 890 4 is_stmt 1 view .LVU600
	.loc 1 890 9 is_stmt 0 view .LVU601
	orr	r1, r0, #63
	b	.L108
.LVL221:
.L100:
	.loc 1 890 9 view .LVU602
.LBE22:
	.loc 1 895 1 view .LVU603
	pop	{r3, r4, r5, pc}
.LFE101:
	.size	NRF24L01_SetAutoAck, .-NRF24L01_SetAutoAck
	.section	.text.NRF24L01_Available,"ax",%progbits
	.align	1
	.global	NRF24L01_Available
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_Available, %function
NRF24L01_Available:
.LVL222:
.LFB102:
	.loc 1 898 1 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 899 2 view .LVU605
	.loc 1 898 1 is_stmt 0 view .LVU606
	push	{r4, r5, r6, lr}
.LCFI64:
	.loc 1 898 1 view .LVU607
	mov	r5, r0
	.loc 1 899 17 view .LVU608
	bl	NRF24L01_GetStatus
.LVL223:
	.loc 1 899 17 view .LVU609
	mov	r4, r0
.LVL224:
	.loc 1 901 2 is_stmt 1 view .LVU610
	.loc 1 901 10 is_stmt 0 view .LVU611
	and	r6, r0, #64
.LVL225:
	.loc 1 904 2 is_stmt 1 view .LVU612
	.loc 1 904 5 is_stmt 0 view .LVU613
	cbz	r5, .L110
	.loc 1 905 3 is_stmt 1 view .LVU614
	.loc 1 905 21 is_stmt 0 view .LVU615
	and	r3, r0, #14
	.loc 1 905 13 view .LVU616
	strb	r3, [r5]
.L110:
	.loc 1 908 2 is_stmt 1 view .LVU617
	movs	r1, #64
	movs	r0, #7
.LVL226:
	.loc 1 908 2 is_stmt 0 view .LVU618
	bl	NRF24L01_WriteRegister
.LVL227:
	.loc 1 911 2 is_stmt 1 view .LVU619
	.loc 1 911 5 is_stmt 0 view .LVU620
	lsls	r3, r4, #26
	bpl	.L111
	.loc 1 912 3 is_stmt 1 view .LVU621
	movs	r1, #32
	movs	r0, #7
	bl	NRF24L01_WriteRegister
.LVL228:
.L111:
	.loc 1 915 2 view .LVU622
	.loc 1 916 1 is_stmt 0 view .LVU623
	mov	r0, r6
	pop	{r4, r5, r6, pc}
	.loc 1 916 1 view .LVU624
.LFE102:
	.size	NRF24L01_Available, .-NRF24L01_Available
	.section	.text.NRF24L01_TestCarrier,"ax",%progbits
	.align	1
	.global	NRF24L01_TestCarrier
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_TestCarrier, %function
NRF24L01_TestCarrier:
.LFB103:
	.loc 1 918 36 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 919 2 view .LVU626
	.loc 1 918 36 is_stmt 0 view .LVU627
	push	{r3, lr}
.LCFI65:
	.loc 1 919 10 view .LVU628
	movs	r0, #9
	bl	NRF24L01_ReadRegister
.LVL229:
	.loc 1 920 1 view .LVU629
	and	r0, r0, #1
	pop	{r3, pc}
.LFE103:
	.size	NRF24L01_TestCarrier, .-NRF24L01_TestCarrier
	.section	.text.NRF24L01_OpenWritingPipe,"ax",%progbits
	.align	1
	.global	NRF24L01_OpenWritingPipe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_OpenWritingPipe, %function
NRF24L01_OpenWritingPipe:
.LVL230:
.LFB104:
	.loc 1 922 49 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 923 2 view .LVU631
	.loc 1 922 49 is_stmt 0 view .LVU632
	push	{r3, lr}
.LCFI66:
	.loc 1 923 2 view .LVU633
	bl	NRF24L01_SetTxAddress
.LVL231:
	.loc 1 925 2 is_stmt 1 view .LVU634
	ldr	r3, .L120
	movs	r0, #17
	ldrb	r1, [r3]	@ zero_extendqisi2
	.loc 1 926 1 is_stmt 0 view .LVU635
	pop	{r3, lr}
.LCFI67:
	.loc 1 925 2 view .LVU636
	b	NRF24L01_WriteRegister
.LVL232:
.L121:
	.align	2
.L120:
	.word	.LANCHOR1
.LFE104:
	.size	NRF24L01_OpenWritingPipe, .-NRF24L01_OpenWritingPipe
	.section	.text.NRF24L01_StartListening,"ax",%progbits
	.align	1
	.global	NRF24L01_StartListening
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_StartListening, %function
NRF24L01_StartListening:
.LFB105:
	.loc 1 928 36 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 930 2 view .LVU638
	.loc 1 928 36 is_stmt 0 view .LVU639
	push	{r3, lr}
.LCFI68:
	.loc 1 931 5 view .LVU640
	movs	r0, #0
	bl	NRF24L01_ReadRegister
.LVL233:
	.loc 1 930 2 view .LVU641
	orr	r1, r0, #3
	uxtb	r1, r1
	movs	r0, #0
	bl	NRF24L01_WriteRegister
.LVL234:
	.loc 1 934 2 is_stmt 1 view .LVU642
	bl	NRF24L01_ClearInterrupts
.LVL235:
	.loc 1 940 2 view .LVU643
	bl	NRF24L01_FlushRx
.LVL236:
	.loc 1 941 2 view .LVU644
	bl	NRF24L01_FlushTx
.LVL237:
	.loc 1 944 2 view .LVU645
	bl	NRF24L01_CE_HIGH
.LVL238:
	.loc 1 947 2 view .LVU646
	.loc 1 949 1 is_stmt 0 view .LVU647
	pop	{r3, lr}
.LCFI69:
	.loc 1 947 2 view .LVU648
	movs	r0, #1
	b	HAL_Delay
.LVL239:
.LFE105:
	.size	NRF24L01_StartListening, .-NRF24L01_StartListening
	.section	.text.NRF24L01_StopListening,"ax",%progbits
	.align	1
	.global	NRF24L01_StopListening
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_StopListening, %function
NRF24L01_StopListening:
.LFB106:
	.loc 1 951 35 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 953 2 view .LVU650
	.loc 1 951 35 is_stmt 0 view .LVU651
	push	{r3, lr}
.LCFI70:
	.loc 1 953 2 view .LVU652
	bl	NRF24L01_CE_LOW
.LVL240:
	.loc 1 955 2 is_stmt 1 view .LVU653
	bl	NRF24L01_FlushRx
.LVL241:
	.loc 1 956 2 view .LVU654
	.loc 1 957 1 is_stmt 0 view .LVU655
	pop	{r3, lr}
.LCFI71:
	.loc 1 956 2 view .LVU656
	b	NRF24L01_FlushTx
.LVL242:
.LFE106:
	.size	NRF24L01_StopListening, .-NRF24L01_StopListening
	.section	.text.NRF24L01_OpenReadingPipe,"ax",%progbits
	.align	1
	.global	NRF24L01_OpenReadingPipe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_OpenReadingPipe, %function
NRF24L01_OpenReadingPipe:
.LVL243:
.LFB107:
	.loc 1 960 1 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 965 2 view .LVU658
	.loc 1 965 5 is_stmt 0 view .LVU659
	mov	r3, r0
	.loc 1 960 1 view .LVU660
	push	{r4, r5}
.LCFI72:
	.loc 1 965 5 view .LVU661
	cbnz	r0, .L125
	ldr	r0, .L133
.LVL244:
	.loc 1 965 5 view .LVU662
	subs	r2, r1, #1
	adds	r4, r1, #4
.L126:
.LBB23:
	.loc 1 967 4 is_stmt 1 discriminator 3 view .LVU663
	.loc 1 967 40 is_stmt 0 discriminator 3 view .LVU664
	ldrb	r5, [r2, #1]!	@ zero_extendqisi2
	.loc 1 966 3 discriminator 3 view .LVU665
	cmp	r2, r4
	.loc 1 967 31 discriminator 3 view .LVU666
	strb	r5, [r0], #1
	.loc 1 966 30 is_stmt 1 discriminator 3 view .LVU667
	.loc 1 966 21 discriminator 3 view .LVU668
	.loc 1 966 3 is_stmt 0 discriminator 3 view .LVU669
	bne	.L126
.L128:
.LBE23:
	.loc 1 974 4 is_stmt 1 view .LVU670
	.loc 1 984 1 is_stmt 0 view .LVU671
	pop	{r4, r5}
.LCFI73:
	.loc 1 974 4 view .LVU672
	add	r0, r3, #10
	movs	r2, #5
	uxtb	r0, r0
	b	NRF24L01_WriteRegisterMulti
.LVL245:
.L125:
.LCFI74:
	.loc 1 970 2 is_stmt 1 view .LVU673
	.loc 1 970 5 is_stmt 0 view .LVU674
	cmp	r0, #5
	bhi	.L124
	.loc 1 973 3 is_stmt 1 view .LVU675
	adds	r0, r0, #10
.LVL246:
	.loc 1 973 6 is_stmt 0 view .LVU676
	cmp	r3, #1
	uxtb	r0, r0
	beq	.L128
	.loc 1 979 4 is_stmt 1 view .LVU677
	.loc 1 984 1 is_stmt 0 view .LVU678
	pop	{r4, r5}
.LCFI75:
	.loc 1 979 4 view .LVU679
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
.LVL247:
	.loc 1 979 4 view .LVU680
	b	NRF24L01_WriteRegister
.LVL248:
.L124:
.LCFI76:
	.loc 1 984 1 view .LVU681
	pop	{r4, r5}
.LCFI77:
	bx	lr
.L134:
	.align	2
.L133:
	.word	.LANCHOR2
.LFE107:
	.size	NRF24L01_OpenReadingPipe, .-NRF24L01_OpenReadingPipe
	.section	.text.NRF24L01_Read,"ax",%progbits
	.align	1
	.global	NRF24L01_Read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_Read, %function
NRF24L01_Read:
.LVL249:
.LFB108:
	.loc 1 986 35 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 1 987 2 view .LVU683
	.loc 1 986 35 is_stmt 0 view .LVU684
	push	{r4, r5, r6, r7, lr}
.LCFI78:
	sub	sp, sp, #12
.LCFI79:
	.loc 1 987 34 view .LVU685
	ldr	r4, .L138
	.loc 1 986 35 view .LVU686
	add	r7, sp, #8
.LCFI80:
	.loc 1 987 34 view .LVU687
	ldrb	r2, [r4]	@ zero_extendqisi2
.LVL250:
	.loc 1 986 35 view .LVU688
	mov	r5, r0
	.loc 1 987 10 view .LVU689
	add	r3, r2, #8
	and	r3, r3, #504
	sub	sp, sp, r3
	.loc 1 990 14 view .LVU690
	movs	r3, #97
	strb	r3, [sp, #8]
.LBB24:
	.loc 1 991 2 view .LVU691
	movs	r3, #0
	.loc 1 992 21 view .LVU692
	mov	ip, r3
.LBE24:
	.loc 1 987 10 view .LVU693
	add	r6, sp, #8
.LVL251:
	.loc 1 990 2 is_stmt 1 view .LVU694
	.loc 1 991 2 view .LVU695
.LBB25:
	.loc 1 991 7 view .LVU696
	.loc 1 991 7 is_stmt 0 view .LVU697
	add	r0, sp, #9
.LVL252:
.L136:
	.loc 1 991 24 is_stmt 1 discriminator 1 view .LVU698
	.loc 1 991 2 is_stmt 0 discriminator 1 view .LVU699
	uxtb	r1, r3
	cmp	r2, r1
	bhi	.L137
.LBE25:
	.loc 1 994 2 is_stmt 1 view .LVU700
.LVL253:
	.loc 1 997 2 view .LVU701
	bl	NRF24L01_CSN_LOW
.LVL254:
	.loc 1 1000 2 view .LVU702
	movs	r2, #100
	.loc 1 1001 20 is_stmt 0 view .LVU703
	ldrb	r3, [r4]	@ zero_extendqisi2
	.loc 1 1000 2 view .LVU704
	mov	r1, r6
	adds	r3, r3, #1
	str	r2, [sp]
	ldr	r0, [r4, #4]
	movs	r2, #0
	bl	HAL_SPI_TransmitReceive
.LVL255:
	.loc 1 1004 2 is_stmt 1 view .LVU705
	bl	NRF24L01_CSN_HIGH
.LVL256:
	.loc 1 1007 2 view .LVU706
	movs	r1, #64
	movs	r0, #7
	bl	NRF24L01_WriteRegister
.LVL257:
	.loc 1 1009 2 view .LVU707
	movs	r1, #1
	ldrb	r2, [r4]	@ zero_extendqisi2
	mov	r0, r5
	bl	memcpy
.LVL258:
	.loc 1 1011 2 view .LVU708
	.loc 1 1011 10 is_stmt 0 view .LVU709
	movs	r0, #23
	bl	NRF24L01_ReadRegister
.LVL259:
	.loc 1 1013 1 view .LVU710
	adds	r7, r7, #4
.LCFI81:
	and	r0, r0, #1
	mov	sp, r7
.LCFI82:
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LVL260:
.L137:
.LCFI83:
.LBB26:
	.loc 1 992 3 is_stmt 1 discriminator 3 view .LVU711
	.loc 1 992 21 is_stmt 0 discriminator 3 view .LVU712
	strb	ip, [r0], #1
	.loc 1 991 59 is_stmt 1 discriminator 3 view .LVU713
.LVL261:
	.loc 1 991 59 is_stmt 0 discriminator 3 view .LVU714
	adds	r3, r3, #1
.LVL262:
	.loc 1 991 59 discriminator 3 view .LVU715
	b	.L136
.L139:
	.align	2
.L138:
	.word	.LANCHOR1
.LBE26:
.LFE108:
	.size	NRF24L01_Read, .-NRF24L01_Read
	.section	.text.NRF24L01_GetPayloadSize,"ax",%progbits
	.align	1
	.global	NRF24L01_GetPayloadSize
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_GetPayloadSize, %function
NRF24L01_GetPayloadSize:
.LFB109:
	.loc 1 1015 39 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1016 2 view .LVU717
	.loc 1 1017 1 is_stmt 0 view .LVU718
	ldr	r3, .L141
	ldrb	r0, [r3]	@ zero_extendqisi2
	bx	lr
.L142:
	.align	2
.L141:
	.word	.LANCHOR1
.LFE109:
	.size	NRF24L01_GetPayloadSize, .-NRF24L01_GetPayloadSize
	.section	.text.NRF24L01_GetDynamicPayloadSize,"ax",%progbits
	.align	1
	.global	NRF24L01_GetDynamicPayloadSize
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_GetDynamicPayloadSize, %function
NRF24L01_GetDynamicPayloadSize:
.LFB110:
	.loc 1 1019 46 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1021 2 view .LVU720
	.loc 1 1022 1 is_stmt 0 view .LVU721
	movs	r0, #0
	bx	lr
.LFE110:
	.size	NRF24L01_GetDynamicPayloadSize, .-NRF24L01_GetDynamicPayloadSize
	.section	.text.NRF24L01_SetRetries,"ax",%progbits
	.align	1
	.global	NRF24L01_SetRetries
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NRF24L01_SetRetries, %function
NRF24L01_SetRetries:
.LVL263:
.LFB111:
	.loc 1 1024 56 is_stmt 1 view -0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 1026 1 view .LVU723
	bx	lr
.LFE111:
	.size	NRF24L01_SetRetries, .-NRF24L01_SetRetries
	.global	pipe0_reading_address
	.section	.bss.NRF24L01_Pins,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	NRF24L01_Pins, %object
	.size	NRF24L01_Pins, 48
NRF24L01_Pins:
	.space	48
	.section	.bss.NRF24L01_Struct,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	NRF24L01_Struct, %object
	.size	NRF24L01_Struct, 8
NRF24L01_Struct:
	.space	8
	.section	.bss.pipe0_reading_address,"aw",%nobits
	.set	.LANCHOR2,. + 0
	.type	pipe0_reading_address, %object
	.size	pipe0_reading_address, 5
pipe0_reading_address:
	.space	5
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
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.byte	0x4
	.4byte	.LCFI0-.LFB70
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.byte	0x4
	.4byte	.LCFI2-.LFB71
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.byte	0x4
	.4byte	.LCFI4-.LFB73
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x24
	.byte	0x84
	.uleb128 0x9
	.byte	0x85
	.uleb128 0x8
	.byte	0x86
	.uleb128 0x7
	.byte	0x87
	.uleb128 0x6
	.byte	0x8e
	.uleb128 0x5
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x24
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xce
	.byte	0xc7
	.byte	0xc6
	.byte	0xc5
	.byte	0xc4
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.byte	0x4
	.4byte	.LCFI10-.LFB77
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.byte	0x4
	.4byte	.LCFI12-.LFB75
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.byte	0x4
	.4byte	.LCFI13-.LFB78
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.byte	0x4
	.4byte	.LCFI15-.LFB76
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xa
	.byte	0xce
	.byte	0xc6
	.byte	0xc5
	.byte	0xc4
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xb
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.byte	0x4
	.4byte	.LCFI18-.LFB79
	.byte	0xe
	.uleb128 0x18
	.byte	0x84
	.uleb128 0x6
	.byte	0x85
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x88
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xa
	.byte	0xd
	.uleb128 0xd
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xb
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.byte	0x4
	.4byte	.LCFI23-.LFB80
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0xd
	.uleb128 0x7
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xa
	.byte	0xd
	.uleb128 0xd
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0xb
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.byte	0x4
	.4byte	.LCFI27-.LFB74
	.byte	0xe
	.uleb128 0x18
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0xc
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.byte	0x4
	.4byte	.LCFI29-.LFB81
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
	.byte	0xce
	.byte	0xc4
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.byte	0x4
	.4byte	.LCFI31-.LFB82
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
	.byte	0xce
	.byte	0xc4
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.byte	0x4
	.4byte	.LCFI33-.LFB83
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xce
	.byte	0xc3
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.byte	0x4
	.4byte	.LCFI35-.LFB85
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xce
	.byte	0xc3
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.byte	0x4
	.4byte	.LCFI37-.LFB86
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xce
	.byte	0xc3
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.byte	0x4
	.4byte	.LCFI39-.LFB88
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0xc
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.byte	0x4
	.4byte	.LCFI42-.LFB90
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.byte	0x4
	.4byte	.LCFI43-.LFB91
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.byte	0x4
	.4byte	.LCFI45-.LFB89
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.byte	0x4
	.4byte	.LCFI46-.LFB92
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.byte	0x4
	.4byte	.LCFI47-.LFB87
	.byte	0xe
	.uleb128 0x18
	.byte	0x84
	.uleb128 0x6
	.byte	0x85
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x88
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0xd
	.uleb128 0x7
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xa
	.byte	0xd
	.uleb128 0xd
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
	.byte	0xb
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.byte	0x4
	.4byte	.LCFI51-.LFB93
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB94
	.4byte	.LFE94-.LFB94
	.align	2
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB95
	.4byte	.LFE95-.LFB95
	.byte	0x4
	.4byte	.LCFI52-.LFB95
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
	.byte	0xa
	.byte	0xce
	.byte	0xc4
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
	.byte	0xb
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB96
	.4byte	.LFE96-.LFB96
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB97
	.4byte	.LFE97-.LFB97
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB114
	.4byte	.LFE114-.LFB114
	.align	2
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB99
	.4byte	.LFE99-.LFB99
	.align	2
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB100
	.4byte	.LFE100-.LFB100
	.align	2
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.byte	0x4
	.4byte	.LCFI55-.LFB72
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x24
	.byte	0x84
	.uleb128 0x9
	.byte	0x85
	.uleb128 0x8
	.byte	0x86
	.uleb128 0x7
	.byte	0x87
	.uleb128 0x6
	.byte	0x88
	.uleb128 0x5
	.byte	0x89
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x50
	.byte	0x4
	.4byte	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0x24
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
	.byte	0xce
	.byte	0xc9
	.byte	0xc8
	.byte	0xc7
	.byte	0xc6
	.byte	0xc5
	.byte	0xc4
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB101
	.4byte	.LFE101-.LFB101
	.byte	0x4
	.4byte	.LCFI61-.LFB101
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
	.byte	0xa
	.byte	0xce
	.byte	0xc5
	.byte	0xc4
	.byte	0xc3
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.4byte	.LCFI63-.LCFI62
	.byte	0xb
	.align	2
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB102
	.4byte	.LFE102-.LFB102
	.byte	0x4
	.4byte	.LCFI64-.LFB102
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB103
	.4byte	.LFE103-.LFB103
	.byte	0x4
	.4byte	.LCFI65-.LFB103
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE76:
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB104
	.4byte	.LFE104-.LFB104
	.byte	0x4
	.4byte	.LCFI66-.LFB104
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
	.byte	0xce
	.byte	0xc3
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE78:
.LSFDE80:
	.4byte	.LEFDE80-.LASFDE80
.LASFDE80:
	.4byte	.Lframe0
	.4byte	.LFB105
	.4byte	.LFE105-.LFB105
	.byte	0x4
	.4byte	.LCFI68-.LFB105
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI69-.LCFI68
	.byte	0xce
	.byte	0xc3
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB106
	.4byte	.LFE106-.LFB106
	.byte	0x4
	.4byte	.LCFI70-.LFB106
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI71-.LCFI70
	.byte	0xce
	.byte	0xc3
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE82:
.LSFDE84:
	.4byte	.LEFDE84-.LASFDE84
.LASFDE84:
	.4byte	.Lframe0
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.byte	0x4
	.4byte	.LCFI72-.LFB107
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x85
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI73-.LCFI72
	.byte	0xa
	.byte	0xc5
	.byte	0xc4
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.4byte	.LCFI74-.LCFI73
	.byte	0xb
	.byte	0x4
	.4byte	.LCFI75-.LCFI74
	.byte	0xa
	.byte	0xc5
	.byte	0xc4
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.4byte	.LCFI76-.LCFI75
	.byte	0xb
	.byte	0x4
	.4byte	.LCFI77-.LCFI76
	.byte	0xc5
	.byte	0xc4
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE84:
.LSFDE86:
	.4byte	.LEFDE86-.LASFDE86
.LASFDE86:
	.4byte	.Lframe0
	.4byte	.LFB108
	.4byte	.LFE108-.LFB108
	.byte	0x4
	.4byte	.LCFI78-.LFB108
	.byte	0xe
	.uleb128 0x14
	.byte	0x84
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI79-.LCFI78
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI80-.LCFI79
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI81-.LCFI80
	.byte	0xa
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.4byte	.LCFI82-.LCFI81
	.byte	0xd
	.uleb128 0xd
	.byte	0x4
	.4byte	.LCFI83-.LCFI82
	.byte	0xb
	.align	2
.LEFDE86:
.LSFDE88:
	.4byte	.LEFDE88-.LASFDE88
.LASFDE88:
	.4byte	.Lframe0
	.4byte	.LFB109
	.4byte	.LFE109-.LFB109
	.align	2
.LEFDE88:
.LSFDE90:
	.4byte	.LEFDE90-.LASFDE90
.LASFDE90:
	.4byte	.Lframe0
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.align	2
.LEFDE90:
.LSFDE92:
	.4byte	.LEFDE92-.LASFDE92
.LASFDE92:
	.4byte	.Lframe0
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.align	2
.LEFDE92:
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.52c/include/stdint.h"
	.file 3 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/CMSIS/Include/core_cm3.h"
	.file 4 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/CMSIS/Device/ST/STM32F1xx/Include/system_stm32f1xx.h"
	.file 5 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xb.h"
	.file 6 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.52c/include/__crossworks.h"
	.file 7 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f1xx.h"
	.file 8 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/STM32F1xx_HAL_Driver/Inc/stm32f1xx_hal_def.h"
	.file 9 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/STM32F1xx_HAL_Driver/Inc/stm32f1xx_hal_gpio.h"
	.file 10 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/STM32F1xx_HAL_Driver/Inc/stm32f1xx_hal_dma.h"
	.file 11 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/STM32F1xx_HAL_Driver/Inc/stm32f1xx_hal_spi.h"
	.file 12 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Drivers/STM32F1xx_HAL_Driver/Inc/stm32f1xx_hal.h"
	.file 13 "C:/1234/PCB drone project/Remote Controller/RemoteCon2/Inc/nrf24l01.h"
	.file 14 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.52c/include/stdio.h"
	.file 15 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.52c/include/string.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2582
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF290
	.byte	0xc
	.4byte	.LASF291
	.4byte	.LASF292
	.4byte	.Ldebug_ranges0+0xe0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x30
	.byte	0x1c
	.4byte	0x3d
	.uleb128 0x4
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x4
	.4byte	0x3d
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x36
	.byte	0x1c
	.4byte	0x61
	.uleb128 0x5
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3c
	.byte	0x1c
	.4byte	0x79
	.uleb128 0x5
	.4byte	0x68
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x3d
	.byte	0x1c
	.4byte	0x96
	.uleb128 0x5
	.4byte	0x80
	.uleb128 0x4
	.4byte	0x80
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x3
	.2byte	0x748
	.byte	0x19
	.4byte	0x74
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x4
	.byte	0x33
	.byte	0x11
	.4byte	0x80
	.uleb128 0x9
	.4byte	0x38
	.4byte	0xd4
	.uleb128 0xa
	.4byte	0x96
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.4byte	0xc4
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x4
	.byte	0x34
	.byte	0x17
	.4byte	0xd4
	.uleb128 0x9
	.4byte	0x38
	.4byte	0xf5
	.uleb128 0xa
	.4byte	0x96
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.4byte	0xe5
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x4
	.byte	0x35
	.byte	0x17
	.4byte	0xf5
	.uleb128 0xb
	.byte	0x10
	.byte	0x5
	.2byte	0x123
	.byte	0x9
	.4byte	0x149
	.uleb128 0xc
	.ascii	"CCR\000"
	.byte	0x5
	.2byte	0x125
	.byte	0x11
	.4byte	0x8c
	.byte	0
	.uleb128 0xd
	.4byte	.LASF15
	.byte	0x5
	.2byte	0x126
	.byte	0x11
	.4byte	0x8c
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF16
	.byte	0x5
	.2byte	0x127
	.byte	0x11
	.4byte	0x8c
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF17
	.byte	0x5
	.2byte	0x128
	.byte	0x11
	.4byte	0x8c
	.byte	0xc
	.byte	0
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x5
	.2byte	0x129
	.byte	0x3
	.4byte	0x106
	.uleb128 0xb
	.byte	0x8
	.byte	0x5
	.2byte	0x12b
	.byte	0x9
	.4byte	0x17d
	.uleb128 0xc
	.ascii	"ISR\000"
	.byte	0x5
	.2byte	0x12d
	.byte	0x11
	.4byte	0x8c
	.byte	0
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x5
	.2byte	0x12e
	.byte	0x11
	.4byte	0x8c
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.4byte	.LASF20
	.byte	0x5
	.2byte	0x12f
	.byte	0x3
	.4byte	0x156
	.uleb128 0xb
	.byte	0x1c
	.byte	0x5
	.2byte	0x166
	.byte	0x9
	.4byte	0x1f7
	.uleb128 0xc
	.ascii	"CRL\000"
	.byte	0x5
	.2byte	0x168
	.byte	0x11
	.4byte	0x8c
	.byte	0
	.uleb128 0xc
	.ascii	"CRH\000"
	.byte	0x5
	.2byte	0x169
	.byte	0x11
	.4byte	0x8c
	.byte	0x4
	.uleb128 0xc
	.ascii	"IDR\000"
	.byte	0x5
	.2byte	0x16a
	.byte	0x11
	.4byte	0x8c
	.byte	0x8
	.uleb128 0xc
	.ascii	"ODR\000"
	.byte	0x5
	.2byte	0x16b
	.byte	0x11
	.4byte	0x8c
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x5
	.2byte	0x16c
	.byte	0x11
	.4byte	0x8c
	.byte	0x10
	.uleb128 0xc
	.ascii	"BRR\000"
	.byte	0x5
	.2byte	0x16d
	.byte	0x11
	.4byte	0x8c
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x16e
	.byte	0x11
	.4byte	0x8c
	.byte	0x18
	.byte	0
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x16f
	.byte	0x3
	.4byte	0x18a
	.uleb128 0xb
	.byte	0x20
	.byte	0x5
	.2byte	0x1ce
	.byte	0x9
	.4byte	0x27d
	.uleb128 0xc
	.ascii	"CR1\000"
	.byte	0x5
	.2byte	0x1d0
	.byte	0x11
	.4byte	0x8c
	.byte	0
	.uleb128 0xc
	.ascii	"CR2\000"
	.byte	0x5
	.2byte	0x1d1
	.byte	0x11
	.4byte	0x8c
	.byte	0x4
	.uleb128 0xc
	.ascii	"SR\000"
	.byte	0x5
	.2byte	0x1d2
	.byte	0x11
	.4byte	0x8c
	.byte	0x8
	.uleb128 0xc
	.ascii	"DR\000"
	.byte	0x5
	.2byte	0x1d3
	.byte	0x11
	.4byte	0x8c
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x5
	.2byte	0x1d4
	.byte	0x11
	.4byte	0x8c
	.byte	0x10
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x1d5
	.byte	0x11
	.4byte	0x8c
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x1d6
	.byte	0x11
	.4byte	0x8c
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x1d7
	.byte	0x11
	.4byte	0x8c
	.byte	0x1c
	.byte	0
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x1d8
	.byte	0x3
	.4byte	0x204
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0x7
	.byte	0x98
	.byte	0x1
	.4byte	0x2a5
	.uleb128 0x10
	.4byte	.LASF29
	.byte	0
	.uleb128 0x11
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x8
	.byte	0x6
	.byte	0x82
	.byte	0x8
	.4byte	0x2cf
	.uleb128 0x14
	.4byte	.LASF30
	.byte	0x6
	.byte	0x83
	.byte	0x7
	.4byte	0x79
	.byte	0
	.uleb128 0x14
	.4byte	.LASF31
	.byte	0x6
	.byte	0x84
	.byte	0x8
	.4byte	0x2cf
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF32
	.uleb128 0x15
	.4byte	0x79
	.4byte	0x2ef
	.uleb128 0x16
	.4byte	0x2ef
	.uleb128 0x16
	.4byte	0x96
	.uleb128 0x16
	.4byte	0x301
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x2f5
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF33
	.uleb128 0x4
	.4byte	0x2f5
	.uleb128 0x17
	.byte	0x4
	.4byte	0x2a7
	.uleb128 0x15
	.4byte	0x79
	.4byte	0x325
	.uleb128 0x16
	.4byte	0x325
	.uleb128 0x16
	.4byte	0x32b
	.uleb128 0x16
	.4byte	0x96
	.uleb128 0x16
	.4byte	0x301
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x96
	.uleb128 0x17
	.byte	0x4
	.4byte	0x2fc
	.uleb128 0x18
	.byte	0x58
	.byte	0x6
	.byte	0x8a
	.byte	0x9
	.4byte	0x4db
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x6
	.byte	0x8c
	.byte	0xf
	.4byte	0x32b
	.byte	0
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x6
	.byte	0x8d
	.byte	0xf
	.4byte	0x32b
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x6
	.byte	0x8e
	.byte	0xf
	.4byte	0x32b
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0x6
	.byte	0x90
	.byte	0xf
	.4byte	0x32b
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF38
	.byte	0x6
	.byte	0x91
	.byte	0xf
	.4byte	0x32b
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0x6
	.byte	0x92
	.byte	0xf
	.4byte	0x32b
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x6
	.byte	0x93
	.byte	0xf
	.4byte	0x32b
	.byte	0x18
	.uleb128 0x14
	.4byte	.LASF41
	.byte	0x6
	.byte	0x94
	.byte	0xf
	.4byte	0x32b
	.byte	0x1c
	.uleb128 0x14
	.4byte	.LASF42
	.byte	0x6
	.byte	0x95
	.byte	0xf
	.4byte	0x32b
	.byte	0x20
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x6
	.byte	0x96
	.byte	0xf
	.4byte	0x32b
	.byte	0x24
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x6
	.byte	0x98
	.byte	0x8
	.4byte	0x2f5
	.byte	0x28
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0x6
	.byte	0x99
	.byte	0x8
	.4byte	0x2f5
	.byte	0x29
	.uleb128 0x14
	.4byte	.LASF46
	.byte	0x6
	.byte	0x9a
	.byte	0x8
	.4byte	0x2f5
	.byte	0x2a
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x6
	.byte	0x9b
	.byte	0x8
	.4byte	0x2f5
	.byte	0x2b
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x6
	.byte	0x9c
	.byte	0x8
	.4byte	0x2f5
	.byte	0x2c
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x6
	.byte	0x9d
	.byte	0x8
	.4byte	0x2f5
	.byte	0x2d
	.uleb128 0x14
	.4byte	.LASF50
	.byte	0x6
	.byte	0x9e
	.byte	0x8
	.4byte	0x2f5
	.byte	0x2e
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x6
	.byte	0x9f
	.byte	0x8
	.4byte	0x2f5
	.byte	0x2f
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x6
	.byte	0xa0
	.byte	0x8
	.4byte	0x2f5
	.byte	0x30
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x6
	.byte	0xa1
	.byte	0x8
	.4byte	0x2f5
	.byte	0x31
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0x6
	.byte	0xa2
	.byte	0x8
	.4byte	0x2f5
	.byte	0x32
	.uleb128 0x14
	.4byte	.LASF55
	.byte	0x6
	.byte	0xa3
	.byte	0x8
	.4byte	0x2f5
	.byte	0x33
	.uleb128 0x14
	.4byte	.LASF56
	.byte	0x6
	.byte	0xa4
	.byte	0x8
	.4byte	0x2f5
	.byte	0x34
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x6
	.byte	0xa5
	.byte	0x8
	.4byte	0x2f5
	.byte	0x35
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x6
	.byte	0xaa
	.byte	0xf
	.4byte	0x32b
	.byte	0x38
	.uleb128 0x14
	.4byte	.LASF59
	.byte	0x6
	.byte	0xab
	.byte	0xf
	.4byte	0x32b
	.byte	0x3c
	.uleb128 0x14
	.4byte	.LASF60
	.byte	0x6
	.byte	0xac
	.byte	0xf
	.4byte	0x32b
	.byte	0x40
	.uleb128 0x14
	.4byte	.LASF61
	.byte	0x6
	.byte	0xad
	.byte	0xf
	.4byte	0x32b
	.byte	0x44
	.uleb128 0x14
	.4byte	.LASF62
	.byte	0x6
	.byte	0xae
	.byte	0xf
	.4byte	0x32b
	.byte	0x48
	.uleb128 0x14
	.4byte	.LASF63
	.byte	0x6
	.byte	0xaf
	.byte	0xf
	.4byte	0x32b
	.byte	0x4c
	.uleb128 0x14
	.4byte	.LASF64
	.byte	0x6
	.byte	0xb0
	.byte	0xf
	.4byte	0x32b
	.byte	0x50
	.uleb128 0x14
	.4byte	.LASF65
	.byte	0x6
	.byte	0xb1
	.byte	0xf
	.4byte	0x32b
	.byte	0x54
	.byte	0
	.uleb128 0x3
	.4byte	.LASF66
	.byte	0x6
	.byte	0xb2
	.byte	0x3
	.4byte	0x331
	.uleb128 0x4
	.4byte	0x4db
	.uleb128 0x18
	.byte	0x20
	.byte	0x6
	.byte	0xc8
	.byte	0x9
	.4byte	0x55e
	.uleb128 0x14
	.4byte	.LASF67
	.byte	0x6
	.byte	0xca
	.byte	0x9
	.4byte	0x572
	.byte	0
	.uleb128 0x14
	.4byte	.LASF68
	.byte	0x6
	.byte	0xcb
	.byte	0x9
	.4byte	0x587
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF69
	.byte	0x6
	.byte	0xcc
	.byte	0x9
	.4byte	0x587
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF70
	.byte	0x6
	.byte	0xcf
	.byte	0x9
	.4byte	0x5a1
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF71
	.byte	0x6
	.byte	0xd0
	.byte	0xa
	.4byte	0x5b6
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF72
	.byte	0x6
	.byte	0xd1
	.byte	0xa
	.4byte	0x5b6
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF73
	.byte	0x6
	.byte	0xd4
	.byte	0x9
	.4byte	0x5bc
	.byte	0x18
	.uleb128 0x14
	.4byte	.LASF74
	.byte	0x6
	.byte	0xd5
	.byte	0x9
	.4byte	0x5c2
	.byte	0x1c
	.byte	0
	.uleb128 0x15
	.4byte	0x79
	.4byte	0x572
	.uleb128 0x16
	.4byte	0x79
	.uleb128 0x16
	.4byte	0x79
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x55e
	.uleb128 0x15
	.4byte	0x79
	.4byte	0x587
	.uleb128 0x16
	.4byte	0x79
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x578
	.uleb128 0x15
	.4byte	0x79
	.4byte	0x5a1
	.uleb128 0x16
	.4byte	0x2cf
	.uleb128 0x16
	.4byte	0x79
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x58d
	.uleb128 0x15
	.4byte	0x2cf
	.4byte	0x5b6
	.uleb128 0x16
	.4byte	0x2cf
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x5a7
	.uleb128 0x17
	.byte	0x4
	.4byte	0x2d6
	.uleb128 0x17
	.byte	0x4
	.4byte	0x307
	.uleb128 0x3
	.4byte	.LASF75
	.byte	0x6
	.byte	0xd6
	.byte	0x3
	.4byte	0x4ec
	.uleb128 0x4
	.4byte	0x5c8
	.uleb128 0x18
	.byte	0xc
	.byte	0x6
	.byte	0xd8
	.byte	0x9
	.4byte	0x60a
	.uleb128 0x14
	.4byte	.LASF76
	.byte	0x6
	.byte	0xd9
	.byte	0xf
	.4byte	0x32b
	.byte	0
	.uleb128 0x14
	.4byte	.LASF77
	.byte	0x6
	.byte	0xda
	.byte	0x25
	.4byte	0x60a
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF78
	.byte	0x6
	.byte	0xdb
	.byte	0x28
	.4byte	0x610
	.byte	0x8
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x4e7
	.uleb128 0x17
	.byte	0x4
	.4byte	0x5d4
	.uleb128 0x3
	.4byte	.LASF79
	.byte	0x6
	.byte	0xdc
	.byte	0x3
	.4byte	0x5d9
	.uleb128 0x4
	.4byte	0x616
	.uleb128 0x13
	.4byte	.LASF81
	.byte	0x14
	.byte	0x6
	.byte	0xe0
	.byte	0x10
	.4byte	0x642
	.uleb128 0x14
	.4byte	.LASF82
	.byte	0x6
	.byte	0xe1
	.byte	0x20
	.4byte	0x642
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	0x652
	.4byte	0x652
	.uleb128 0xa
	.4byte	0x96
	.byte	0x4
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x622
	.uleb128 0x7
	.4byte	.LASF83
	.byte	0x6
	.2byte	0x10a
	.byte	0x1a
	.4byte	0x627
	.uleb128 0x7
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x111
	.byte	0x24
	.4byte	0x622
	.uleb128 0x7
	.4byte	.LASF85
	.byte	0x6
	.2byte	0x114
	.byte	0x2c
	.4byte	0x5d4
	.uleb128 0x7
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x115
	.byte	0x2c
	.4byte	0x5d4
	.uleb128 0x9
	.4byte	0x44
	.4byte	0x69c
	.uleb128 0xa
	.4byte	0x96
	.byte	0x7f
	.byte	0
	.uleb128 0x4
	.4byte	0x68c
	.uleb128 0x7
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x117
	.byte	0x23
	.4byte	0x69c
	.uleb128 0x9
	.4byte	0x2fc
	.4byte	0x6b9
	.uleb128 0x19
	.byte	0
	.uleb128 0x4
	.4byte	0x6ae
	.uleb128 0x7
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x119
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x7
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x11a
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x7
	.4byte	.LASF90
	.byte	0x6
	.2byte	0x11b
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x7
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x11c
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x7
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x11e
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x7
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x11f
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x7
	.4byte	.LASF94
	.byte	0x6
	.2byte	0x120
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x7
	.4byte	.LASF95
	.byte	0x6
	.2byte	0x121
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x7
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x122
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x7
	.4byte	.LASF97
	.byte	0x6
	.2byte	0x123
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x15
	.4byte	0x79
	.4byte	0x74f
	.uleb128 0x16
	.4byte	0x74f
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x75a
	.uleb128 0x1a
	.4byte	.LASF202
	.uleb128 0x4
	.4byte	0x755
	.uleb128 0x7
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x139
	.byte	0xe
	.4byte	0x76c
	.uleb128 0x17
	.byte	0x4
	.4byte	0x740
	.uleb128 0x15
	.4byte	0x79
	.4byte	0x781
	.uleb128 0x16
	.4byte	0x781
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x755
	.uleb128 0x7
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x13a
	.byte	0xe
	.4byte	0x794
	.uleb128 0x17
	.byte	0x4
	.4byte	0x772
	.uleb128 0xe
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x151
	.byte	0x18
	.4byte	0x7a7
	.uleb128 0x17
	.byte	0x4
	.4byte	0x7ad
	.uleb128 0x15
	.4byte	0x32b
	.4byte	0x7bc
	.uleb128 0x16
	.4byte	0x79
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF101
	.byte	0x8
	.byte	0x6
	.2byte	0x153
	.byte	0x10
	.4byte	0x7e7
	.uleb128 0xd
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x155
	.byte	0x1c
	.4byte	0x79a
	.byte	0
	.uleb128 0xd
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x156
	.byte	0x21
	.4byte	0x7e7
	.byte	0x4
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x7bc
	.uleb128 0xe
	.4byte	.LASF104
	.byte	0x6
	.2byte	0x157
	.byte	0x3
	.4byte	0x7bc
	.uleb128 0x7
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x15b
	.byte	0x1f
	.4byte	0x807
	.uleb128 0x17
	.byte	0x4
	.4byte	0x7ed
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0x8
	.byte	0x35
	.byte	0x1
	.4byte	0x828
	.uleb128 0x10
	.4byte	.LASF106
	.byte	0
	.uleb128 0x10
	.4byte	.LASF107
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF108
	.byte	0x8
	.byte	0x38
	.byte	0x3
	.4byte	0x80d
	.uleb128 0x18
	.byte	0x10
	.byte	0x9
	.byte	0x2f
	.byte	0x9
	.4byte	0x872
	.uleb128 0x1c
	.ascii	"Pin\000"
	.byte	0x9
	.byte	0x31
	.byte	0xc
	.4byte	0x80
	.byte	0
	.uleb128 0x14
	.4byte	.LASF109
	.byte	0x9
	.byte	0x34
	.byte	0xc
	.4byte	0x80
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF110
	.byte	0x9
	.byte	0x37
	.byte	0xc
	.4byte	0x80
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF111
	.byte	0x9
	.byte	0x3a
	.byte	0xc
	.4byte	0x80
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.4byte	.LASF112
	.byte	0x9
	.byte	0x3c
	.byte	0x3
	.4byte	0x834
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0x9
	.byte	0x42
	.byte	0x1
	.4byte	0x899
	.uleb128 0x10
	.4byte	.LASF113
	.byte	0
	.uleb128 0x10
	.4byte	.LASF114
	.byte	0x1
	.byte	0
	.uleb128 0x18
	.byte	0x1c
	.byte	0xa
	.byte	0x30
	.byte	0x9
	.4byte	0x8fe
	.uleb128 0x14
	.4byte	.LASF115
	.byte	0xa
	.byte	0x32
	.byte	0xc
	.4byte	0x80
	.byte	0
	.uleb128 0x14
	.4byte	.LASF116
	.byte	0xa
	.byte	0x36
	.byte	0xc
	.4byte	0x80
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF117
	.byte	0xa
	.byte	0x39
	.byte	0xc
	.4byte	0x80
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF118
	.byte	0xa
	.byte	0x3c
	.byte	0xc
	.4byte	0x80
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF119
	.byte	0xa
	.byte	0x3f
	.byte	0xc
	.4byte	0x80
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF109
	.byte	0xa
	.byte	0x42
	.byte	0xc
	.4byte	0x80
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF120
	.byte	0xa
	.byte	0x47
	.byte	0xc
	.4byte	0x80
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.4byte	.LASF121
	.byte	0xa
	.byte	0x49
	.byte	0x3
	.4byte	0x899
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0xa
	.byte	0x4f
	.byte	0x1
	.4byte	0x931
	.uleb128 0x10
	.4byte	.LASF122
	.byte	0
	.uleb128 0x10
	.4byte	.LASF123
	.byte	0x1
	.uleb128 0x10
	.4byte	.LASF124
	.byte	0x2
	.uleb128 0x10
	.4byte	.LASF125
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF126
	.byte	0xa
	.byte	0x54
	.byte	0x2
	.4byte	0x90a
	.uleb128 0x13
	.4byte	.LASF127
	.byte	0x44
	.byte	0xa
	.byte	0x6f
	.byte	0x10
	.4byte	0x9e7
	.uleb128 0x14
	.4byte	.LASF128
	.byte	0xa
	.byte	0x71
	.byte	0x1a
	.4byte	0x9e7
	.byte	0
	.uleb128 0x14
	.4byte	.LASF129
	.byte	0xa
	.byte	0x73
	.byte	0x19
	.4byte	0x8fe
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF130
	.byte	0xa
	.byte	0x75
	.byte	0x19
	.4byte	0x828
	.byte	0x20
	.uleb128 0x14
	.4byte	.LASF131
	.byte	0xa
	.byte	0x77
	.byte	0x19
	.4byte	0x931
	.byte	0x21
	.uleb128 0x14
	.4byte	.LASF132
	.byte	0xa
	.byte	0x79
	.byte	0x1a
	.4byte	0x2a5
	.byte	0x24
	.uleb128 0x14
	.4byte	.LASF133
	.byte	0xa
	.byte	0x7b
	.byte	0x1c
	.4byte	0x9fe
	.byte	0x28
	.uleb128 0x14
	.4byte	.LASF134
	.byte	0xa
	.byte	0x7d
	.byte	0x1c
	.4byte	0x9fe
	.byte	0x2c
	.uleb128 0x14
	.4byte	.LASF135
	.byte	0xa
	.byte	0x7f
	.byte	0x1c
	.4byte	0x9fe
	.byte	0x30
	.uleb128 0x14
	.4byte	.LASF136
	.byte	0xa
	.byte	0x81
	.byte	0x1c
	.4byte	0x9fe
	.byte	0x34
	.uleb128 0x14
	.4byte	.LASF137
	.byte	0xa
	.byte	0x83
	.byte	0x19
	.4byte	0x8c
	.byte	0x38
	.uleb128 0x14
	.4byte	.LASF138
	.byte	0xa
	.byte	0x85
	.byte	0x1b
	.4byte	0xa04
	.byte	0x3c
	.uleb128 0x14
	.4byte	.LASF139
	.byte	0xa
	.byte	0x87
	.byte	0x1a
	.4byte	0x80
	.byte	0x40
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x149
	.uleb128 0x1d
	.4byte	0x9f8
	.uleb128 0x16
	.4byte	0x9f8
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x93d
	.uleb128 0x17
	.byte	0x4
	.4byte	0x9ed
	.uleb128 0x17
	.byte	0x4
	.4byte	0x17d
	.uleb128 0x3
	.4byte	.LASF140
	.byte	0xa
	.byte	0x89
	.byte	0x3
	.4byte	0x93d
	.uleb128 0x17
	.byte	0x4
	.4byte	0xa0a
	.uleb128 0x17
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x18
	.byte	0x2c
	.byte	0xb
	.byte	0x2f
	.byte	0x9
	.4byte	0xabb
	.uleb128 0x14
	.4byte	.LASF109
	.byte	0xb
	.byte	0x31
	.byte	0xc
	.4byte	0x80
	.byte	0
	.uleb128 0x14
	.4byte	.LASF115
	.byte	0xb
	.byte	0x34
	.byte	0xc
	.4byte	0x80
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF141
	.byte	0xb
	.byte	0x37
	.byte	0xc
	.4byte	0x80
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF142
	.byte	0xb
	.byte	0x3a
	.byte	0xc
	.4byte	0x80
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF143
	.byte	0xb
	.byte	0x3d
	.byte	0xc
	.4byte	0x80
	.byte	0x10
	.uleb128 0x1c
	.ascii	"NSS\000"
	.byte	0xb
	.byte	0x40
	.byte	0xc
	.4byte	0x80
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF144
	.byte	0xb
	.byte	0x44
	.byte	0xc
	.4byte	0x80
	.byte	0x18
	.uleb128 0x14
	.4byte	.LASF145
	.byte	0xb
	.byte	0x4a
	.byte	0xc
	.4byte	0x80
	.byte	0x1c
	.uleb128 0x14
	.4byte	.LASF146
	.byte	0xb
	.byte	0x4d
	.byte	0xc
	.4byte	0x80
	.byte	0x20
	.uleb128 0x14
	.4byte	.LASF147
	.byte	0xb
	.byte	0x50
	.byte	0xc
	.4byte	0x80
	.byte	0x24
	.uleb128 0x14
	.4byte	.LASF148
	.byte	0xb
	.byte	0x53
	.byte	0xc
	.4byte	0x80
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.4byte	.LASF149
	.byte	0xb
	.byte	0x55
	.byte	0x3
	.4byte	0xa22
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0xb
	.byte	0x5b
	.byte	0x1
	.4byte	0xb06
	.uleb128 0x10
	.4byte	.LASF150
	.byte	0
	.uleb128 0x10
	.4byte	.LASF151
	.byte	0x1
	.uleb128 0x10
	.4byte	.LASF152
	.byte	0x2
	.uleb128 0x10
	.4byte	.LASF153
	.byte	0x3
	.uleb128 0x10
	.4byte	.LASF154
	.byte	0x4
	.uleb128 0x10
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF156
	.byte	0x6
	.uleb128 0x10
	.4byte	.LASF157
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF158
	.byte	0xb
	.byte	0x64
	.byte	0x3
	.4byte	0xac7
	.uleb128 0x5
	.4byte	0xb06
	.uleb128 0x13
	.4byte	.LASF159
	.byte	0x58
	.byte	0xb
	.byte	0x69
	.byte	0x10
	.4byte	0xbe8
	.uleb128 0x14
	.4byte	.LASF128
	.byte	0xb
	.byte	0x6b
	.byte	0x1f
	.4byte	0xbe8
	.byte	0
	.uleb128 0x14
	.4byte	.LASF129
	.byte	0xb
	.byte	0x6d
	.byte	0x1e
	.4byte	0xabb
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF160
	.byte	0xb
	.byte	0x6f
	.byte	0x1f
	.4byte	0xa1c
	.byte	0x30
	.uleb128 0x14
	.4byte	.LASF161
	.byte	0xb
	.byte	0x71
	.byte	0x1e
	.4byte	0x50
	.byte	0x34
	.uleb128 0x14
	.4byte	.LASF162
	.byte	0xb
	.byte	0x73
	.byte	0x1e
	.4byte	0x5c
	.byte	0x36
	.uleb128 0x14
	.4byte	.LASF163
	.byte	0xb
	.byte	0x75
	.byte	0x1f
	.4byte	0xa1c
	.byte	0x38
	.uleb128 0x14
	.4byte	.LASF164
	.byte	0xb
	.byte	0x77
	.byte	0x1e
	.4byte	0x50
	.byte	0x3c
	.uleb128 0x14
	.4byte	.LASF165
	.byte	0xb
	.byte	0x79
	.byte	0x1e
	.4byte	0x5c
	.byte	0x3e
	.uleb128 0x14
	.4byte	.LASF166
	.byte	0xb
	.byte	0x7b
	.byte	0xa
	.4byte	0xbff
	.byte	0x40
	.uleb128 0x14
	.4byte	.LASF167
	.byte	0xb
	.byte	0x7d
	.byte	0xa
	.4byte	0xbff
	.byte	0x44
	.uleb128 0x14
	.4byte	.LASF168
	.byte	0xb
	.byte	0x7f
	.byte	0x1f
	.4byte	0xa16
	.byte	0x48
	.uleb128 0x14
	.4byte	.LASF169
	.byte	0xb
	.byte	0x81
	.byte	0x1f
	.4byte	0xa16
	.byte	0x4c
	.uleb128 0x14
	.4byte	.LASF130
	.byte	0xb
	.byte	0x83
	.byte	0x1e
	.4byte	0x828
	.byte	0x50
	.uleb128 0x14
	.4byte	.LASF131
	.byte	0xb
	.byte	0x85
	.byte	0x1e
	.4byte	0xb12
	.byte	0x51
	.uleb128 0x14
	.4byte	.LASF137
	.byte	0xb
	.byte	0x87
	.byte	0x1e
	.4byte	0x8c
	.byte	0x54
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x27d
	.uleb128 0x1d
	.4byte	0xbf9
	.uleb128 0x16
	.4byte	0xbf9
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0xb17
	.uleb128 0x17
	.byte	0x4
	.4byte	0xbee
	.uleb128 0x3
	.4byte	.LASF170
	.byte	0xb
	.byte	0x96
	.byte	0x3
	.4byte	0xb17
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0xc
	.byte	0x32
	.byte	0x1
	.4byte	0xc38
	.uleb128 0x10
	.4byte	.LASF171
	.byte	0x64
	.uleb128 0x10
	.4byte	.LASF172
	.byte	0xa
	.uleb128 0x10
	.4byte	.LASF173
	.byte	0x1
	.uleb128 0x10
	.4byte	.LASF174
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF175
	.byte	0xc
	.byte	0x37
	.byte	0x3
	.4byte	0xc11
	.uleb128 0x8
	.4byte	.LASF176
	.byte	0xc
	.byte	0x3c
	.byte	0x11
	.4byte	0x80
	.uleb128 0x8
	.4byte	.LASF177
	.byte	0xc
	.byte	0x3d
	.byte	0x1c
	.4byte	0xc38
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0xd
	.byte	0x28
	.byte	0xe
	.4byte	0xc7d
	.uleb128 0x10
	.4byte	.LASF178
	.byte	0
	.uleb128 0x10
	.4byte	.LASF179
	.byte	0x1
	.uleb128 0x10
	.4byte	.LASF180
	.byte	0xff
	.byte	0
	.uleb128 0x3
	.4byte	.LASF181
	.byte	0xd
	.byte	0x2c
	.byte	0x3
	.4byte	0xc5c
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0xd
	.byte	0x31
	.byte	0xe
	.4byte	0xcaa
	.uleb128 0x10
	.4byte	.LASF182
	.byte	0
	.uleb128 0x10
	.4byte	.LASF183
	.byte	0x1
	.uleb128 0x10
	.4byte	.LASF184
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF185
	.byte	0xd
	.byte	0x35
	.byte	0x3
	.4byte	0xc89
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0xd
	.byte	0x3a
	.byte	0xe
	.4byte	0xcdd
	.uleb128 0x10
	.4byte	.LASF186
	.byte	0
	.uleb128 0x10
	.4byte	.LASF187
	.byte	0x1
	.uleb128 0x10
	.4byte	.LASF188
	.byte	0x2
	.uleb128 0x10
	.4byte	.LASF189
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF190
	.byte	0xd
	.byte	0x3f
	.byte	0x3
	.4byte	0xcb6
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0xd
	.byte	0x45
	.byte	0xd
	.4byte	0xd0a
	.uleb128 0x10
	.4byte	.LASF191
	.byte	0
	.uleb128 0x10
	.4byte	.LASF192
	.byte	0x1
	.uleb128 0x10
	.4byte	.LASF193
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF194
	.byte	0xd
	.byte	0x49
	.byte	0x3
	.4byte	0xce9
	.uleb128 0x18
	.byte	0x8
	.byte	0xd
	.byte	0x4e
	.byte	0x9
	.4byte	0xd3a
	.uleb128 0x14
	.4byte	.LASF195
	.byte	0xd
	.byte	0x4f
	.byte	0x10
	.4byte	0xd3a
	.byte	0
	.uleb128 0x14
	.4byte	.LASF196
	.byte	0xd
	.byte	0x50
	.byte	0xb
	.4byte	0x50
	.byte	0x4
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x1f7
	.uleb128 0x3
	.4byte	.LASF197
	.byte	0xd
	.byte	0x51
	.byte	0x3
	.4byte	0xd16
	.uleb128 0x18
	.byte	0x30
	.byte	0xd
	.byte	0x53
	.byte	0x9
	.4byte	0xda3
	.uleb128 0x1c
	.ascii	"CE\000"
	.byte	0xd
	.byte	0x54
	.byte	0x8
	.4byte	0xd40
	.byte	0
	.uleb128 0x1c
	.ascii	"CSN\000"
	.byte	0xd
	.byte	0x55
	.byte	0x8
	.4byte	0xd40
	.byte	0x8
	.uleb128 0x1c
	.ascii	"SCK\000"
	.byte	0xd
	.byte	0x56
	.byte	0x8
	.4byte	0xd40
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF198
	.byte	0xd
	.byte	0x57
	.byte	0x8
	.4byte	0xd40
	.byte	0x18
	.uleb128 0x14
	.4byte	.LASF199
	.byte	0xd
	.byte	0x58
	.byte	0x8
	.4byte	0xd40
	.byte	0x20
	.uleb128 0x1c
	.ascii	"IRQ\000"
	.byte	0xd
	.byte	0x59
	.byte	0x8
	.4byte	0xd40
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.4byte	.LASF200
	.byte	0xd
	.byte	0x5a
	.byte	0x3
	.4byte	0xd4c
	.uleb128 0xe
	.4byte	.LASF201
	.byte	0xe
	.2byte	0x317
	.byte	0x1b
	.4byte	0xdbc
	.uleb128 0x1a
	.4byte	.LASF203
	.uleb128 0x7
	.4byte	.LASF204
	.byte	0xe
	.2byte	0x31b
	.byte	0xe
	.4byte	0xdce
	.uleb128 0x17
	.byte	0x4
	.4byte	0xdaf
	.uleb128 0x7
	.4byte	.LASF205
	.byte	0xe
	.2byte	0x31c
	.byte	0xe
	.4byte	0xdce
	.uleb128 0x7
	.4byte	.LASF206
	.byte	0xe
	.2byte	0x31d
	.byte	0xe
	.4byte	0xdce
	.uleb128 0x18
	.byte	0x8
	.byte	0x1
	.byte	0xd4
	.byte	0x9
	.4byte	0xe39
	.uleb128 0x14
	.4byte	.LASF207
	.byte	0x1
	.byte	0xd5
	.byte	0xa
	.4byte	0x2c
	.byte	0
	.uleb128 0x14
	.4byte	.LASF208
	.byte	0x1
	.byte	0xd6
	.byte	0xa
	.4byte	0x2c
	.byte	0x1
	.uleb128 0x14
	.4byte	.LASF209
	.byte	0x1
	.byte	0xd7
	.byte	0x19
	.4byte	0xcdd
	.byte	0x2
	.uleb128 0x14
	.4byte	.LASF210
	.byte	0x1
	.byte	0xd8
	.byte	0x16
	.4byte	0xcaa
	.byte	0x3
	.uleb128 0x14
	.4byte	.LASF211
	.byte	0x1
	.byte	0xd9
	.byte	0x15
	.4byte	0xe39
	.byte	0x4
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0xc05
	.uleb128 0x3
	.4byte	.LASF212
	.byte	0x1
	.byte	0xda
	.byte	0x3
	.4byte	0xdee
	.uleb128 0x1e
	.4byte	.LASF213
	.byte	0x1
	.byte	0xe9
	.byte	0x13
	.4byte	0xe3f
	.uleb128 0x5
	.byte	0x3
	.4byte	NRF24L01_Struct
	.uleb128 0x1e
	.4byte	.LASF214
	.byte	0x1
	.byte	0xec
	.byte	0x18
	.4byte	0xda3
	.uleb128 0x5
	.byte	0x3
	.4byte	NRF24L01_Pins
	.uleb128 0x9
	.4byte	0x2c
	.4byte	0xe7f
	.uleb128 0xa
	.4byte	0x96
	.byte	0x4
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF215
	.byte	0x1
	.byte	0xee
	.byte	0x9
	.4byte	0xe6f
	.uleb128 0x5
	.byte	0x3
	.4byte	pipe0_reading_address
	.uleb128 0x20
	.4byte	.LASF222
	.byte	0x1
	.2byte	0x400
	.byte	0x6
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xec7
	.uleb128 0x21
	.4byte	.LASF216
	.byte	0x1
	.2byte	0x400
	.byte	0x22
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x21
	.4byte	.LASF217
	.byte	0x1
	.2byte	0x400
	.byte	0x31
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x22
	.4byte	.LASF218
	.byte	0x1
	.2byte	0x3fb
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x22
	.4byte	.LASF219
	.byte	0x1
	.2byte	0x3f7
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB109
	.4byte	.LFE109-.LFB109
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x23
	.4byte	.LASF229
	.byte	0x1
	.2byte	0x3da
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB108
	.4byte	.LFE108-.LFB108
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfef
	.uleb128 0x24
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x3da
	.byte	0x1d
	.4byte	0x2a5
	.4byte	.LLST67
	.4byte	.LVUS67
	.uleb128 0x25
	.4byte	.LASF220
	.byte	0x1
	.2byte	0x3db
	.byte	0xa
	.4byte	0xfef
	.4byte	.LLST68
	.4byte	.LVUS68
	.uleb128 0x25
	.4byte	.LASF221
	.byte	0x1
	.2byte	0x3e2
	.byte	0xb
	.4byte	0xa1c
	.4byte	.LLST69
	.4byte	.LVUS69
	.uleb128 0x26
	.4byte	.Ldebug_ranges0+0xc0
	.4byte	0xf6e
	.uleb128 0x27
	.ascii	"ind\000"
	.byte	0x1
	.2byte	0x3df
	.byte	0xf
	.4byte	0x2c
	.4byte	.LLST70
	.4byte	.LVUS70
	.byte	0
	.uleb128 0x28
	.4byte	0x96
	.4byte	.LLST66
	.4byte	.LVUS66
	.uleb128 0x29
	.4byte	.LVL254
	.4byte	0x244c
	.uleb128 0x2a
	.4byte	.LVL255
	.4byte	0x252d
	.4byte	0xfa4
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2b
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x29
	.4byte	.LVL256
	.4byte	0x2426
	.uleb128 0x2a
	.4byte	.LVL257
	.4byte	0x1ba3
	.4byte	0xfc6
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x40
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL258
	.4byte	0x253a
	.4byte	0xfdf
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2c
	.4byte	.LVL259
	.4byte	0x1c36
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x47
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	0x2c
	.4byte	0x1002
	.uleb128 0x2d
	.4byte	0x96
	.4byte	0xf6e
	.byte	0
	.uleb128 0x20
	.4byte	.LASF223
	.byte	0x1
	.2byte	0x3bf
	.byte	0x6
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x107b
	.uleb128 0x24
	.4byte	.LASF224
	.byte	0x1
	.2byte	0x3bf
	.byte	0x27
	.4byte	0x2c
	.4byte	.LLST63
	.4byte	.LVUS63
	.uleb128 0x24
	.4byte	.LASF225
	.byte	0x1
	.2byte	0x3bf
	.byte	0x38
	.4byte	0xa1c
	.4byte	.LLST64
	.4byte	.LVUS64
	.uleb128 0x2e
	.4byte	.LBB23
	.4byte	.LBE23-.LBB23
	.4byte	0x105e
	.uleb128 0x2f
	.ascii	"ind\000"
	.byte	0x1
	.2byte	0x3c6
	.byte	0xc
	.4byte	0x79
	.byte	0
	.uleb128 0x30
	.4byte	.LVL245
	.4byte	0x198e
	.4byte	0x1071
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x31
	.4byte	.LVL248
	.4byte	0x1ba3
	.byte	0
	.uleb128 0x20
	.4byte	.LASF226
	.byte	0x1
	.2byte	0x3b7
	.byte	0x6
	.4byte	.LFB106
	.4byte	.LFE106-.LFB106
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10ae
	.uleb128 0x29
	.4byte	.LVL240
	.4byte	0x2498
	.uleb128 0x29
	.4byte	.LVL241
	.4byte	0x23a0
	.uleb128 0x31
	.4byte	.LVL242
	.4byte	0x2347
	.byte	0
	.uleb128 0x20
	.4byte	.LASF227
	.byte	0x1
	.2byte	0x3a0
	.byte	0x6
	.4byte	.LFB105
	.4byte	.LFE105-.LFB105
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x111f
	.uleb128 0x2a
	.4byte	.LVL233
	.4byte	0x1c36
	.4byte	0x10d8
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL234
	.4byte	0x1ba3
	.4byte	0x10eb
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x29
	.4byte	.LVL235
	.4byte	0x23f9
	.uleb128 0x29
	.4byte	.LVL236
	.4byte	0x23a0
	.uleb128 0x29
	.4byte	.LVL237
	.4byte	0x2347
	.uleb128 0x29
	.4byte	.LVL238
	.4byte	0x2472
	.uleb128 0x32
	.4byte	.LVL239
	.4byte	0x2546
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF228
	.byte	0x1
	.2byte	0x39a
	.byte	0x6
	.4byte	.LFB104
	.4byte	.LFE104-.LFB104
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1170
	.uleb128 0x24
	.4byte	.LASF225
	.byte	0x1
	.2byte	0x39a
	.byte	0x28
	.4byte	0xa1c
	.4byte	.LLST62
	.4byte	.LVUS62
	.uleb128 0x2a
	.4byte	.LVL231
	.4byte	0x18cb
	.4byte	0x1160
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x32
	.4byte	.LVL232
	.4byte	0x1ba3
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x41
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LASF230
	.byte	0x1
	.2byte	0x396
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB103
	.4byte	.LFE103-.LFB103
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x119b
	.uleb128 0x2c
	.4byte	.LVL229
	.4byte	0x1c36
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x39
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LASF231
	.byte	0x1
	.2byte	0x381
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB102
	.4byte	.LFE102-.LFB102
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x122d
	.uleb128 0x24
	.4byte	.LASF232
	.byte	0x1
	.2byte	0x381
	.byte	0x25
	.4byte	0xa1c
	.4byte	.LLST59
	.4byte	.LVUS59
	.uleb128 0x25
	.4byte	.LASF233
	.byte	0x1
	.2byte	0x383
	.byte	0xa
	.4byte	0x2c
	.4byte	.LLST60
	.4byte	.LVUS60
	.uleb128 0x25
	.4byte	.LASF234
	.byte	0x1
	.2byte	0x385
	.byte	0xa
	.4byte	0x2c
	.4byte	.LLST61
	.4byte	.LVUS61
	.uleb128 0x29
	.4byte	.LVL223
	.4byte	0x148c
	.uleb128 0x2a
	.4byte	.LVL227
	.4byte	0x1ba3
	.4byte	0x1217
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x40
	.byte	0
	.uleb128 0x2c
	.4byte	.LVL228
	.4byte	0x1ba3
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF235
	.byte	0x1
	.2byte	0x365
	.byte	0x6
	.4byte	.LFB101
	.4byte	.LFE101-.LFB101
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12dc
	.uleb128 0x24
	.4byte	.LASF236
	.byte	0x1
	.2byte	0x365
	.byte	0x22
	.4byte	0x2c
	.4byte	.LLST55
	.4byte	.LVUS55
	.uleb128 0x24
	.4byte	.LASF237
	.byte	0x1
	.2byte	0x365
	.byte	0x30
	.4byte	0x2c
	.4byte	.LLST56
	.4byte	.LVUS56
	.uleb128 0x26
	.4byte	.Ldebug_ranges0+0x88
	.4byte	0x129d
	.uleb128 0x25
	.4byte	.LASF233
	.byte	0x1
	.2byte	0x367
	.byte	0xb
	.4byte	0x2c
	.4byte	.LLST57
	.4byte	.LVUS57
	.uleb128 0x2c
	.4byte	.LVL210
	.4byte	0x1c36
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x3f
	.byte	0
	.byte	0
	.uleb128 0x33
	.4byte	.Ldebug_ranges0+0xa0
	.uleb128 0x25
	.4byte	.LASF233
	.byte	0x1
	.2byte	0x374
	.byte	0xb
	.4byte	0x2c
	.4byte	.LLST58
	.4byte	.LVUS58
	.uleb128 0x2a
	.4byte	.LVL217
	.4byte	0x1c36
	.4byte	0x12cb
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x3f
	.byte	0
	.uleb128 0x32
	.4byte	.LVL220
	.4byte	0x1ba3
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF238
	.byte	0x1
	.2byte	0x34d
	.byte	0x6
	.4byte	.LFB100
	.4byte	.LFE100-.LFB100
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1342
	.uleb128 0x24
	.4byte	.LASF210
	.byte	0x1
	.2byte	0x34d
	.byte	0x29
	.4byte	0xcaa
	.4byte	.LLST48
	.4byte	.LVUS48
	.uleb128 0x24
	.4byte	.LASF209
	.byte	0x1
	.2byte	0x34d
	.byte	0x4a
	.4byte	0xcdd
	.4byte	.LLST49
	.4byte	.LVUS49
	.uleb128 0x27
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x34e
	.byte	0xa
	.4byte	0x2c
	.4byte	.LLST50
	.4byte	.LVUS50
	.uleb128 0x32
	.4byte	.LVL171
	.4byte	0x1ba3
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x36
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	.LASF239
	.byte	0x1
	.2byte	0x348
	.byte	0x15
	.4byte	0xcaa
	.4byte	.LFB99
	.4byte	.LFE99-.LFB99
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x34
	.4byte	.LASF293
	.byte	0x1
	.2byte	0x344
	.byte	0x6
	.4byte	0x1374
	.uleb128 0x35
	.4byte	.LASF210
	.byte	0x1
	.2byte	0x344
	.byte	0x26
	.4byte	0xcaa
	.byte	0
	.uleb128 0x22
	.4byte	.LASF240
	.byte	0x1
	.2byte	0x33d
	.byte	0x18
	.4byte	0xcdd
	.4byte	.LFB97
	.4byte	.LFE97-.LFB97
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x36
	.4byte	.LASF244
	.byte	0x1
	.2byte	0x339
	.byte	0x6
	.byte	0x1
	.4byte	0x13a7
	.uleb128 0x35
	.4byte	.LASF209
	.byte	0x1
	.2byte	0x339
	.byte	0x31
	.4byte	0xcdd
	.byte	0
	.uleb128 0x20
	.4byte	.LASF241
	.byte	0x1
	.2byte	0x326
	.byte	0x6
	.4byte	.LFB95
	.4byte	.LFE95-.LFB95
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x140b
	.uleb128 0x24
	.4byte	.LASF242
	.byte	0x1
	.2byte	0x326
	.byte	0x31
	.4byte	0xd0a
	.4byte	.LLST46
	.4byte	.LVUS46
	.uleb128 0x25
	.4byte	.LASF243
	.byte	0x1
	.2byte	0x327
	.byte	0xa
	.4byte	0x2c
	.4byte	.LLST47
	.4byte	.LVUS47
	.uleb128 0x2a
	.4byte	.LVL160
	.4byte	0x1c36
	.4byte	0x13fb
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x32
	.4byte	.LVL163
	.4byte	0x1ba3
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x36
	.4byte	.LASF245
	.byte	0x1
	.2byte	0x31d
	.byte	0x6
	.byte	0x1
	.4byte	0x1427
	.uleb128 0x35
	.4byte	.LASF246
	.byte	0x1
	.2byte	0x31d
	.byte	0x22
	.4byte	0x2c
	.byte	0
	.uleb128 0x23
	.4byte	.LASF247
	.byte	0x1
	.2byte	0x318
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1452
	.uleb128 0x2c
	.4byte	.LVL153
	.4byte	0x1c36
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LASF248
	.byte	0x1
	.2byte	0x30a
	.byte	0x1c
	.4byte	0xc7d
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x148c
	.uleb128 0x25
	.4byte	.LASF249
	.byte	0x1
	.2byte	0x30b
	.byte	0xa
	.4byte	0x2c
	.4byte	.LLST34
	.4byte	.LVUS34
	.uleb128 0x29
	.4byte	.LVL126
	.4byte	0x148c
	.byte	0
	.uleb128 0x23
	.4byte	.LASF250
	.byte	0x1
	.2byte	0x2fa
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1500
	.uleb128 0x37
	.4byte	.LASF249
	.byte	0x1
	.2byte	0x2fb
	.byte	0xa
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x38
	.ascii	"aux\000"
	.byte	0x1
	.2byte	0x300
	.byte	0xa
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x29
	.4byte	.LVL119
	.4byte	0x244c
	.uleb128 0x2a
	.4byte	.LVL120
	.4byte	0x252d
	.4byte	0x14f6
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2b
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x29
	.4byte	.LVL121
	.4byte	0x2426
	.byte	0
	.uleb128 0x23
	.4byte	.LASF251
	.byte	0x1
	.2byte	0x2f1
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1540
	.uleb128 0x27
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x2f2
	.byte	0xa
	.4byte	0x2c
	.4byte	.LLST32
	.4byte	.LVUS32
	.uleb128 0x2c
	.4byte	.LVL117
	.4byte	0x1c36
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x47
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LASF252
	.byte	0x1
	.2byte	0x2e8
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1583
	.uleb128 0x25
	.4byte	.LASF249
	.byte	0x1
	.2byte	0x2e9
	.byte	0xa
	.4byte	0x2c
	.4byte	.LLST33
	.4byte	.LVUS33
	.uleb128 0x29
	.4byte	.LVL122
	.4byte	0x148c
	.uleb128 0x29
	.4byte	.LVL123
	.4byte	0x1500
	.byte	0
	.uleb128 0x20
	.4byte	.LASF253
	.byte	0x1
	.2byte	0x2d4
	.byte	0x6
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1627
	.uleb128 0x24
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x2d4
	.byte	0x20
	.4byte	0xa1c
	.4byte	.LLST31
	.4byte	.LVUS31
	.uleb128 0x38
	.ascii	"aux\000"
	.byte	0x1
	.2byte	0x2da
	.byte	0xa
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x29
	.4byte	.LVL111
	.4byte	0x244c
	.uleb128 0x2a
	.4byte	.LVL112
	.4byte	0x2553
	.4byte	0x15e7
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL113
	.4byte	0x252d
	.4byte	0x1608
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x29
	.4byte	.LVL114
	.4byte	0x2426
	.uleb128 0x2c
	.4byte	.LVL115
	.4byte	0x1ba3
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LASF254
	.byte	0x1
	.2byte	0x28f
	.byte	0x1c
	.4byte	0xc7d
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17a7
	.uleb128 0x24
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x28f
	.byte	0x3a
	.4byte	0x17a7
	.4byte	.LLST36
	.4byte	.LVUS36
	.uleb128 0x27
	.ascii	"aux\000"
	.byte	0x1
	.2byte	0x290
	.byte	0x11
	.4byte	0x17ae
	.4byte	.LLST37
	.4byte	.LVUS37
	.uleb128 0x25
	.4byte	.LASF242
	.byte	0x1
	.2byte	0x293
	.byte	0xa
	.4byte	0x2c
	.4byte	.LLST38
	.4byte	.LVUS38
	.uleb128 0x25
	.4byte	.LASF220
	.byte	0x1
	.2byte	0x29b
	.byte	0xa
	.4byte	0x17b4
	.4byte	.LLST39
	.4byte	.LVUS39
	.uleb128 0x25
	.4byte	.LASF249
	.byte	0x1
	.2byte	0x2c3
	.byte	0x1d
	.4byte	0xc7d
	.4byte	.LLST40
	.4byte	.LVUS40
	.uleb128 0x25
	.4byte	.LASF255
	.byte	0x1
	.2byte	0x2c4
	.byte	0xb
	.4byte	0x80
	.4byte	.LLST41
	.4byte	.LVUS41
	.uleb128 0x25
	.4byte	.LASF256
	.byte	0x1
	.2byte	0x2c5
	.byte	0x11
	.4byte	0x91
	.4byte	.LLST42
	.4byte	.LVUS42
	.uleb128 0x26
	.4byte	.Ldebug_ranges0+0x50
	.4byte	0x16f4
	.uleb128 0x27
	.ascii	"ind\000"
	.byte	0x1
	.2byte	0x2a0
	.byte	0xb
	.4byte	0x79
	.4byte	.LLST43
	.4byte	.LVUS43
	.byte	0
	.uleb128 0x29
	.4byte	.LVL130
	.4byte	0x2498
	.uleb128 0x29
	.4byte	.LVL131
	.4byte	0x2347
	.uleb128 0x29
	.4byte	.LVL135
	.4byte	0x17c9
	.uleb128 0x2a
	.4byte	.LVL136
	.4byte	0x2546
	.4byte	0x1722
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x29
	.4byte	.LVL137
	.4byte	0x244c
	.uleb128 0x2a
	.4byte	.LVL138
	.4byte	0x2553
	.4byte	0x174b
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 1
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x29
	.4byte	.LVL139
	.4byte	0x2426
	.uleb128 0x29
	.4byte	.LVL140
	.4byte	0x2472
	.uleb128 0x2a
	.4byte	.LVL141
	.4byte	0x2546
	.4byte	0x1770
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x29
	.4byte	.LVL142
	.4byte	0x2498
	.uleb128 0x29
	.4byte	.LVL143
	.4byte	0x2560
	.uleb128 0x29
	.4byte	.LVL145
	.4byte	0x1452
	.uleb128 0x29
	.4byte	.LVL147
	.4byte	0x2560
	.uleb128 0x29
	.4byte	.LVL148
	.4byte	0x1891
	.uleb128 0x29
	.4byte	.LVL149
	.4byte	0x2347
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x17ad
	.uleb128 0x39
	.uleb128 0x17
	.byte	0x4
	.4byte	0x38
	.uleb128 0x9
	.4byte	0x2c
	.4byte	0x17c9
	.uleb128 0x3a
	.4byte	0x96
	.uleb128 0x5
	.byte	0x76
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0
	.uleb128 0x20
	.4byte	.LASF257
	.byte	0x1
	.2byte	0x286
	.byte	0x6
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x180c
	.uleb128 0x29
	.4byte	.LVL107
	.4byte	0x23f9
	.uleb128 0x2a
	.4byte	.LVL108
	.4byte	0x1c36
	.4byte	0x17fc
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x32
	.4byte	.LVL109
	.4byte	0x1ba3
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF258
	.byte	0x1
	.2byte	0x278
	.byte	0x6
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1860
	.uleb128 0x29
	.4byte	.LVL102
	.4byte	0x2498
	.uleb128 0x29
	.4byte	.LVL103
	.4byte	0x23a0
	.uleb128 0x29
	.4byte	.LVL104
	.4byte	0x23f9
	.uleb128 0x2a
	.4byte	.LVL105
	.4byte	0x1ba3
	.4byte	0x1856
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3b
	.byte	0
	.uleb128 0x31
	.4byte	.LVL106
	.4byte	0x2472
	.byte	0
	.uleb128 0x20
	.4byte	.LASF259
	.byte	0x1
	.2byte	0x274
	.byte	0x6
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1891
	.uleb128 0x32
	.4byte	.LVL101
	.4byte	0x1cbf
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF260
	.byte	0x1
	.2byte	0x26f
	.byte	0x6
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18cb
	.uleb128 0x29
	.4byte	.LVL99
	.4byte	0x2498
	.uleb128 0x32
	.4byte	.LVL100
	.4byte	0x1cbf
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF261
	.byte	0x1
	.2byte	0x26a
	.byte	0x6
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1931
	.uleb128 0x3b
	.ascii	"adr\000"
	.byte	0x1
	.2byte	0x26a
	.byte	0x25
	.4byte	0xa1c
	.4byte	.LLST30
	.4byte	.LVUS30
	.uleb128 0x2a
	.4byte	.LVL96
	.4byte	0x198e
	.4byte	0x1915
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x32
	.4byte	.LVL98
	.4byte	0x198e
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x40
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF262
	.byte	0x1
	.2byte	0x262
	.byte	0x6
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x198e
	.uleb128 0x3b
	.ascii	"adr\000"
	.byte	0x1
	.2byte	0x262
	.byte	0x25
	.4byte	0xa1c
	.4byte	.LLST29
	.4byte	.LVUS29
	.uleb128 0x29
	.4byte	.LVL90
	.4byte	0x2498
	.uleb128 0x2a
	.4byte	.LVL91
	.4byte	0x198e
	.4byte	0x1984
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3b
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x31
	.4byte	.LVL93
	.4byte	0x2472
	.byte	0
	.uleb128 0x20
	.4byte	.LASF263
	.byte	0x1
	.2byte	0x251
	.byte	0x6
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a58
	.uleb128 0x3b
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x251
	.byte	0x2a
	.4byte	0x2c
	.4byte	.LLST24
	.4byte	.LVUS24
	.uleb128 0x24
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x251
	.byte	0x38
	.4byte	0xa1c
	.4byte	.LLST25
	.4byte	.LVUS25
	.uleb128 0x24
	.4byte	.LASF242
	.byte	0x1
	.2byte	0x251
	.byte	0x46
	.4byte	0x2c
	.4byte	.LLST26
	.4byte	.LVUS26
	.uleb128 0x25
	.4byte	.LASF220
	.byte	0x1
	.2byte	0x253
	.byte	0xa
	.4byte	0x1a58
	.4byte	.LLST27
	.4byte	.LVUS27
	.uleb128 0x26
	.4byte	.Ldebug_ranges0+0x38
	.4byte	0x1a18
	.uleb128 0x27
	.ascii	"ind\000"
	.byte	0x1
	.2byte	0x256
	.byte	0xf
	.4byte	0x2c
	.4byte	.LLST28
	.4byte	.LVUS28
	.byte	0
	.uleb128 0x28
	.4byte	0x96
	.4byte	.LLST23
	.4byte	.LVUS23
	.uleb128 0x29
	.4byte	.LVL57
	.4byte	0x244c
	.uleb128 0x2a
	.4byte	.LVL58
	.4byte	0x2553
	.4byte	0x1a4e
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 1
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x29
	.4byte	.LVL59
	.4byte	0x2426
	.byte	0
	.uleb128 0x9
	.4byte	0x2c
	.4byte	0x1a6b
	.uleb128 0x2d
	.4byte	0x96
	.4byte	0x1a18
	.byte	0
	.uleb128 0x20
	.4byte	.LASF264
	.byte	0x1
	.2byte	0x23b
	.byte	0x6
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1b7d
	.uleb128 0x3b
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x23b
	.byte	0x29
	.4byte	0x2c
	.4byte	.LLST15
	.4byte	.LVUS15
	.uleb128 0x24
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x23b
	.byte	0x37
	.4byte	0xa1c
	.4byte	.LLST16
	.4byte	.LVUS16
	.uleb128 0x24
	.4byte	.LASF242
	.byte	0x1
	.2byte	0x23b
	.byte	0x45
	.4byte	0x2c
	.4byte	.LLST17
	.4byte	.LVUS17
	.uleb128 0x25
	.4byte	.LASF220
	.byte	0x1
	.2byte	0x23c
	.byte	0xa
	.4byte	0x1b7d
	.4byte	.LLST18
	.4byte	.LVUS18
	.uleb128 0x25
	.4byte	.LASF221
	.byte	0x1
	.2byte	0x23d
	.byte	0xa
	.4byte	0x1b90
	.4byte	.LLST19
	.4byte	.LVUS19
	.uleb128 0x26
	.4byte	.Ldebug_ranges0+0
	.4byte	0x1b0a
	.uleb128 0x27
	.ascii	"ind\000"
	.byte	0x1
	.2byte	0x240
	.byte	0xf
	.4byte	0x2c
	.4byte	.LLST20
	.4byte	.LVUS20
	.byte	0
	.uleb128 0x26
	.4byte	.Ldebug_ranges0+0x20
	.4byte	0x1b29
	.uleb128 0x27
	.ascii	"ind\000"
	.byte	0x1
	.2byte	0x24b
	.byte	0xf
	.4byte	0x2c
	.4byte	.LLST21
	.4byte	.LVUS21
	.byte	0
	.uleb128 0x28
	.4byte	0x96
	.4byte	.LLST12
	.4byte	.LVUS12
	.uleb128 0x28
	.4byte	0x96
	.4byte	.LLST14
	.4byte	.LVUS14
	.uleb128 0x29
	.4byte	.LVL40
	.4byte	0x244c
	.uleb128 0x2a
	.4byte	.LVL41
	.4byte	0x252d
	.4byte	0x1b73
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x74
	.sleb128 1
	.uleb128 0x2b
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x29
	.4byte	.LVL42
	.4byte	0x2426
	.byte	0
	.uleb128 0x9
	.4byte	0x2c
	.4byte	0x1b90
	.uleb128 0x2d
	.4byte	0x96
	.4byte	0x1b29
	.byte	0
	.uleb128 0x9
	.4byte	0x2c
	.4byte	0x1ba3
	.uleb128 0x2d
	.4byte	0x96
	.4byte	0x1b36
	.byte	0
	.uleb128 0x20
	.4byte	.LASF265
	.byte	0x1
	.2byte	0x22d
	.byte	0x6
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c26
	.uleb128 0x3b
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x22d
	.byte	0x25
	.4byte	0x2c
	.4byte	.LLST5
	.4byte	.LVUS5
	.uleb128 0x24
	.4byte	.LASF266
	.byte	0x1
	.2byte	0x22d
	.byte	0x32
	.4byte	0x2c
	.4byte	.LLST6
	.4byte	.LVUS6
	.uleb128 0x37
	.4byte	.LASF220
	.byte	0x1
	.2byte	0x22e
	.byte	0xa
	.4byte	0x1c26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x29
	.4byte	.LVL26
	.4byte	0x244c
	.uleb128 0x2a
	.4byte	.LVL27
	.4byte	0x2553
	.4byte	0x1c1c
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x29
	.4byte	.LVL28
	.4byte	0x2426
	.byte	0
	.uleb128 0x9
	.4byte	0x2c
	.4byte	0x1c36
	.uleb128 0xa
	.4byte	0x96
	.byte	0x1
	.byte	0
	.uleb128 0x23
	.4byte	.LASF267
	.byte	0x1
	.2byte	0x217
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1cbf
	.uleb128 0x3b
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x217
	.byte	0x27
	.4byte	0x2c
	.4byte	.LLST1
	.4byte	.LVUS1
	.uleb128 0x37
	.4byte	.LASF220
	.byte	0x1
	.2byte	0x21c
	.byte	0xa
	.4byte	0x1c26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x37
	.4byte	.LASF221
	.byte	0x1
	.2byte	0x220
	.byte	0xa
	.4byte	0x1c26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x29
	.4byte	.LVL18
	.4byte	0x244c
	.uleb128 0x2a
	.4byte	.LVL19
	.4byte	0x252d
	.4byte	0x1cb5
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2b
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x29
	.4byte	.LVL20
	.4byte	0x2426
	.byte	0
	.uleb128 0x20
	.4byte	.LASF268
	.byte	0x1
	.2byte	0x208
	.byte	0x6
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d48
	.uleb128 0x3b
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x208
	.byte	0x20
	.4byte	0x2c
	.4byte	.LLST7
	.4byte	.LVUS7
	.uleb128 0x3b
	.ascii	"bit\000"
	.byte	0x1
	.2byte	0x208
	.byte	0x2d
	.4byte	0x2c
	.4byte	.LLST8
	.4byte	.LVUS8
	.uleb128 0x24
	.4byte	.LASF266
	.byte	0x1
	.2byte	0x208
	.byte	0x3a
	.4byte	0x2c
	.4byte	.LLST9
	.4byte	.LVUS9
	.uleb128 0x27
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x209
	.byte	0xa
	.4byte	0x2c
	.4byte	.LLST10
	.4byte	.LVUS10
	.uleb128 0x2a
	.4byte	.LVL31
	.4byte	0x1c36
	.4byte	0x1d3e
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x31
	.4byte	.LVL34
	.4byte	0x1ba3
	.byte	0
	.uleb128 0x23
	.4byte	.LASF269
	.byte	0x1
	.2byte	0x1f8
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1dac
	.uleb128 0x3b
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x1f8
	.byte	0x22
	.4byte	0x2c
	.4byte	.LLST2
	.4byte	.LVUS2
	.uleb128 0x3b
	.ascii	"bit\000"
	.byte	0x1
	.2byte	0x1f8
	.byte	0x2f
	.4byte	0x2c
	.4byte	.LLST3
	.4byte	.LVUS3
	.uleb128 0x27
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x1f9
	.byte	0xa
	.4byte	0x2c
	.4byte	.LLST4
	.4byte	.LVUS4
	.uleb128 0x29
	.4byte	.LVL22
	.4byte	0x1c36
	.byte	0
	.uleb128 0x20
	.4byte	.LASF270
	.byte	0x1
	.2byte	0x1a9
	.byte	0x6
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2057
	.uleb128 0x37
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x1aa
	.byte	0xa
	.4byte	0xe6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2a
	.4byte	.LVL63
	.4byte	0x1ba3
	.4byte	0x1deb
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL64
	.4byte	0x1ba3
	.4byte	0x1e04
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x3f
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL65
	.4byte	0x1ba3
	.4byte	0x1e1c
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x33
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL66
	.4byte	0x1ba3
	.4byte	0x1e34
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x33
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL67
	.4byte	0x1ba3
	.4byte	0x1e4c
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x33
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL68
	.4byte	0x1ba3
	.4byte	0x1e64
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL69
	.4byte	0x1ba3
	.4byte	0x1e7c
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x36
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3e
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL70
	.4byte	0x1ba3
	.4byte	0x1e94
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3e
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL71
	.4byte	0x1ba3
	.4byte	0x1eac
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x38
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL72
	.4byte	0x1ba3
	.4byte	0x1ec4
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x39
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL73
	.4byte	0x198e
	.4byte	0x1ee2
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL74
	.4byte	0x198e
	.4byte	0x1f00
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3b
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL75
	.4byte	0x1ba3
	.4byte	0x1f19
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3c
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x9
	.byte	0xc3
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL76
	.4byte	0x1ba3
	.4byte	0x1f32
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3d
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x9
	.byte	0xc4
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL77
	.4byte	0x1ba3
	.4byte	0x1f4b
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3e
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x9
	.byte	0xc5
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL78
	.4byte	0x1ba3
	.4byte	0x1f64
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3f
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x9
	.byte	0xc6
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL79
	.4byte	0x198e
	.4byte	0x1f82
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x40
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL80
	.4byte	0x1ba3
	.4byte	0x1f9a
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x41
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL81
	.4byte	0x1ba3
	.4byte	0x1fb2
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x42
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL82
	.4byte	0x1ba3
	.4byte	0x1fca
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x43
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL83
	.4byte	0x1ba3
	.4byte	0x1fe2
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x44
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL84
	.4byte	0x1ba3
	.4byte	0x1ffa
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x45
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL85
	.4byte	0x1ba3
	.4byte	0x2012
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x46
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL86
	.4byte	0x1ba3
	.4byte	0x202a
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x47
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x47
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL87
	.4byte	0x1ba3
	.4byte	0x2042
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x4c
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2c
	.4byte	.LVL88
	.4byte	0x1ba3
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x4d
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF271
	.byte	0x1
	.2byte	0x175
	.byte	0x6
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2131
	.uleb128 0x24
	.4byte	.LASF211
	.byte	0x1
	.2byte	0x175
	.byte	0x2a
	.4byte	0xe39
	.4byte	.LLST0
	.4byte	.LVUS0
	.uleb128 0x21
	.4byte	.LASF272
	.byte	0x1
	.2byte	0x175
	.byte	0x40
	.4byte	0xda3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x37
	.4byte	.LASF273
	.byte	0x1
	.2byte	0x176
	.byte	0x13
	.4byte	0x872
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2a
	.4byte	.LVL12
	.4byte	0x256d
	.4byte	0x20bd
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL13
	.4byte	0x256d
	.4byte	0x20d7
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL14
	.4byte	0x256d
	.4byte	0x20f1
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL15
	.4byte	0x2579
	.4byte	0x2111
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x2c
	.4byte	.LVL16
	.4byte	0x2579
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0xc
	.4byte	0x40010c00
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LASF274
	.byte	0x1
	.2byte	0x11e
	.byte	0x9
	.4byte	0x2c
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2347
	.uleb128 0x24
	.4byte	.LASF246
	.byte	0x1
	.2byte	0x11e
	.byte	0x1f
	.4byte	0x2c
	.4byte	.LLST51
	.4byte	.LVUS51
	.uleb128 0x24
	.4byte	.LASF275
	.byte	0x1
	.2byte	0x11e
	.byte	0x30
	.4byte	0x2c
	.4byte	.LLST52
	.4byte	.LVUS52
	.uleb128 0x24
	.4byte	.LASF211
	.byte	0x1
	.2byte	0x11f
	.byte	0x16
	.4byte	0xe39
	.4byte	.LLST53
	.4byte	.LVUS53
	.uleb128 0x21
	.4byte	.LASF272
	.byte	0x1
	.2byte	0x11f
	.byte	0x2c
	.4byte	0xda3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x26
	.4byte	.Ldebug_ranges0+0x68
	.4byte	0x21ba
	.uleb128 0x27
	.ascii	"ind\000"
	.byte	0x1
	.2byte	0x122
	.byte	0xb
	.4byte	0x79
	.4byte	.LLST54
	.4byte	.LVUS54
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL184
	.4byte	0x2057
	.4byte	0x21ce
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL185
	.4byte	0x2546
	.4byte	0x21e1
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x29
	.4byte	.LVL187
	.4byte	0x1dac
	.uleb128 0x2a
	.4byte	.LVL188
	.4byte	0x1ba3
	.4byte	0x2203
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x4f
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL189
	.4byte	0x140b
	.4byte	0x2217
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL190
	.4byte	0x1ba3
	.4byte	0x222a
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x41
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL191
	.4byte	0x1ba3
	.4byte	0x223d
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x42
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL192
	.4byte	0x1ba3
	.4byte	0x2250
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x43
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL193
	.4byte	0x1ba3
	.4byte	0x2263
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x44
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL194
	.4byte	0x1ba3
	.4byte	0x2276
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x45
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL195
	.4byte	0x1ba3
	.4byte	0x2289
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x46
	.byte	0
	.uleb128 0x29
	.4byte	.LVL196
	.4byte	0x12dc
	.uleb128 0x2a
	.4byte	.LVL197
	.4byte	0x1ba3
	.4byte	0x22ab
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL198
	.4byte	0x1ba3
	.4byte	0x22c4
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x3f
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL199
	.4byte	0x1ba3
	.4byte	0x22dd
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x3f
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL200
	.4byte	0x1ba3
	.4byte	0x22f6
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x4f
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL201
	.4byte	0x1ba3
	.4byte	0x230f
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x4c
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL202
	.4byte	0x13a7
	.4byte	0x2322
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x29
	.4byte	.LVL203
	.4byte	0x2347
	.uleb128 0x29
	.4byte	.LVL204
	.4byte	0x23a0
	.uleb128 0x29
	.4byte	.LVL205
	.4byte	0x23f9
	.uleb128 0x29
	.4byte	.LVL206
	.4byte	0x180c
	.byte	0
	.uleb128 0x20
	.4byte	.LASF276
	.byte	0x1
	.2byte	0x115
	.byte	0x6
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x23a0
	.uleb128 0x38
	.ascii	"aux\000"
	.byte	0x1
	.2byte	0x118
	.byte	0xa
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x29
	.4byte	.LVL7
	.4byte	0x244c
	.uleb128 0x2a
	.4byte	.LVL8
	.4byte	0x2553
	.4byte	0x2396
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x29
	.4byte	.LVL9
	.4byte	0x2426
	.byte	0
	.uleb128 0x20
	.4byte	.LASF277
	.byte	0x1
	.2byte	0x10c
	.byte	0x6
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x23f9
	.uleb128 0x38
	.ascii	"aux\000"
	.byte	0x1
	.2byte	0x10f
	.byte	0xa
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x29
	.4byte	.LVL4
	.4byte	0x244c
	.uleb128 0x2a
	.4byte	.LVL5
	.4byte	0x2553
	.4byte	0x23ef
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x29
	.4byte	.LVL6
	.4byte	0x2426
	.byte	0
	.uleb128 0x20
	.4byte	.LASF278
	.byte	0x1
	.2byte	0x105
	.byte	0x6
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2426
	.uleb128 0x32
	.4byte	.LVL29
	.4byte	0x1ba3
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x70
	.byte	0
	.byte	0
	.uleb128 0x3c
	.4byte	.LASF279
	.byte	0x1
	.byte	0xff
	.byte	0x6
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x244c
	.uleb128 0x32
	.4byte	.LVL3
	.4byte	0x2579
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x3c
	.4byte	.LASF280
	.byte	0x1
	.byte	0xfa
	.byte	0x6
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2472
	.uleb128 0x32
	.4byte	.LVL2
	.4byte	0x2579
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x3c
	.4byte	.LASF281
	.byte	0x1
	.byte	0xf5
	.byte	0x6
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2498
	.uleb128 0x32
	.4byte	.LVL1
	.4byte	0x2579
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x3c
	.4byte	.LASF282
	.byte	0x1
	.byte	0xf0
	.byte	0x6
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24be
	.uleb128 0x32
	.4byte	.LVL0
	.4byte	0x2579
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x3d
	.4byte	0x140b
	.4byte	.LFB94
	.4byte	.LFE94-.LFB94
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2512
	.uleb128 0x3e
	.4byte	0x1419
	.4byte	.LLST44
	.4byte	.LVUS44
	.uleb128 0x3f
	.4byte	0x140b
	.4byte	.LBI13
	.byte	.LVU414
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.byte	0x1
	.2byte	0x31d
	.byte	0x6
	.uleb128 0x3e
	.4byte	0x1419
	.4byte	.LLST45
	.4byte	.LVUS45
	.uleb128 0x32
	.4byte	.LVL157
	.4byte	0x1ba3
	.uleb128 0x2b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3d
	.4byte	0x138b
	.4byte	.LFB96
	.4byte	.LFE96-.LFB96
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x252d
	.uleb128 0x40
	.4byte	0x1399
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x41
	.4byte	.LASF283
	.4byte	.LASF283
	.byte	0xb
	.2byte	0x29d
	.byte	0x13
	.uleb128 0x42
	.4byte	.LASF284
	.4byte	.LASF284
	.byte	0xf
	.byte	0x5a
	.byte	0x7
	.uleb128 0x41
	.4byte	.LASF285
	.4byte	.LASF285
	.byte	0xc
	.2byte	0x128
	.byte	0x6
	.uleb128 0x41
	.4byte	.LASF286
	.4byte	.LASF286
	.byte	0xb
	.2byte	0x29b
	.byte	0x13
	.uleb128 0x41
	.4byte	.LASF287
	.4byte	.LASF287
	.byte	0xc
	.2byte	0x129
	.byte	0xa
	.uleb128 0x42
	.4byte	.LASF288
	.4byte	.LASF288
	.byte	0x9
	.byte	0xe0
	.byte	0x7
	.uleb128 0x42
	.4byte	.LASF289
	.4byte	.LASF289
	.byte	0x9
	.byte	0xeb
	.byte	0x6
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x21
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x24
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x34
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
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x5
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
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3c
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
	.uleb128 0x3d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x3e
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LVUS67:
	.uleb128 0
	.uleb128 .LVU698
	.uleb128 .LVU698
	.uleb128 0
.LLST67:
	.4byte	.LVL249
	.4byte	.LVL252
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL252
	.4byte	.LFE108
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LVUS68:
	.uleb128 .LVU694
	.uleb128 0
.LLST68:
	.4byte	.LVL251
	.4byte	.LFE108
	.2byte	0x2
	.byte	0x76
	.sleb128 0
	.4byte	0
	.4byte	0
.LVUS69:
	.uleb128 .LVU701
	.uleb128 .LVU711
.LLST69:
	.4byte	.LVL253
	.4byte	.LVL260
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS70:
	.uleb128 .LVU697
	.uleb128 .LVU698
	.uleb128 .LVU698
	.uleb128 .LVU702
	.uleb128 .LVU711
	.uleb128 .LVU714
	.uleb128 .LVU714
	.uleb128 .LVU715
	.uleb128 .LVU715
	.uleb128 0
.LLST70:
	.4byte	.LVL251
	.4byte	.LVL252
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL252
	.4byte	.LVL254-1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL260
	.4byte	.LVL261
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL261
	.4byte	.LVL262
	.2byte	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL262
	.4byte	.LFE108
	.2byte	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS66:
	.uleb128 .LVU688
	.uleb128 .LVU702
	.uleb128 .LVU711
	.uleb128 0
.LLST66:
	.4byte	.LVL250
	.4byte	.LVL254-1
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL260
	.4byte	.LFE108
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS63:
	.uleb128 0
	.uleb128 .LVU662
	.uleb128 .LVU662
	.uleb128 .LVU673
	.uleb128 .LVU673
	.uleb128 .LVU676
	.uleb128 .LVU676
	.uleb128 .LVU681
	.uleb128 .LVU681
	.uleb128 0
.LLST63:
	.4byte	.LVL243
	.4byte	.LVL244
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL244
	.4byte	.LVL245
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL245
	.4byte	.LVL246
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL246
	.4byte	.LVL248
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL248
	.4byte	.LFE107
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS64:
	.uleb128 0
	.uleb128 .LVU673
	.uleb128 .LVU673
	.uleb128 .LVU673
	.uleb128 .LVU673
	.uleb128 .LVU680
	.uleb128 .LVU680
	.uleb128 .LVU681
	.uleb128 .LVU681
	.uleb128 0
.LLST64:
	.4byte	.LVL243
	.4byte	.LVL245-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL245-1
	.4byte	.LVL245
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL245
	.4byte	.LVL247
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL247
	.4byte	.LVL248
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL248
	.4byte	.LFE107
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LVUS62:
	.uleb128 0
	.uleb128 .LVU634
	.uleb128 .LVU634
	.uleb128 0
.LLST62:
	.4byte	.LVL230
	.4byte	.LVL231-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL231-1
	.4byte	.LFE104
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS59:
	.uleb128 0
	.uleb128 .LVU609
	.uleb128 .LVU609
	.uleb128 0
.LLST59:
	.4byte	.LVL222
	.4byte	.LVL223-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL223-1
	.4byte	.LFE102
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LVUS60:
	.uleb128 .LVU610
	.uleb128 .LVU618
.LLST60:
	.4byte	.LVL224
	.4byte	.LVL226
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS61:
	.uleb128 .LVU612
	.uleb128 0
.LLST61:
	.4byte	.LVL225
	.4byte	.LFE102
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LVUS55:
	.uleb128 0
	.uleb128 .LVU568
	.uleb128 .LVU568
	.uleb128 .LVU584
	.uleb128 .LVU584
	.uleb128 .LVU589
	.uleb128 .LVU589
	.uleb128 .LVU602
	.uleb128 .LVU602
	.uleb128 0
.LLST55:
	.4byte	.LVL208
	.4byte	.LVL209
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL209
	.4byte	.LVL215
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL215
	.4byte	.LVL216
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL216
	.4byte	.LVL221
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL221
	.4byte	.LFE101
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS56:
	.uleb128 0
	.uleb128 .LVU569
	.uleb128 .LVU569
	.uleb128 .LVU584
	.uleb128 .LVU584
	.uleb128 .LVU590
	.uleb128 .LVU590
	.uleb128 .LVU602
	.uleb128 .LVU602
	.uleb128 0
.LLST56:
	.4byte	.LVL208
	.4byte	.LVL210-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL210-1
	.4byte	.LVL215
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL215
	.4byte	.LVL217-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL217-1
	.4byte	.LVL221
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL221
	.4byte	.LFE101
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LVUS57:
	.uleb128 .LVU570
	.uleb128 .LVU575
	.uleb128 .LVU578
	.uleb128 .LVU584
.LLST57:
	.4byte	.LVL211
	.4byte	.LVL212
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL214
	.4byte	.LVL215
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS58:
	.uleb128 .LVU577
	.uleb128 .LVU578
	.uleb128 .LVU591
	.uleb128 .LVU595
	.uleb128 .LVU595
	.uleb128 .LVU598
	.uleb128 .LVU598
	.uleb128 .LVU602
.LLST58:
	.4byte	.LVL213
	.4byte	.LVL214
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL218
	.4byte	.LVL219
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL219
	.4byte	.LVL220-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL220
	.4byte	.LVL221
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS48:
	.uleb128 0
	.uleb128 .LVU468
	.uleb128 .LVU468
	.uleb128 .LVU469
	.uleb128 .LVU469
	.uleb128 .LVU469
	.uleb128 .LVU469
	.uleb128 0
.LLST48:
	.4byte	.LVL166
	.4byte	.LVL170
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL170
	.4byte	.LVL171-1
	.2byte	0x5
	.byte	0x3
	.4byte	NRF24L01_Struct+3
	.4byte	.LVL171-1
	.4byte	.LVL171
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL171
	.4byte	.LFE100
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS49:
	.uleb128 0
	.uleb128 .LVU462
	.uleb128 .LVU462
	.uleb128 .LVU469
	.uleb128 .LVU469
	.uleb128 .LVU469
	.uleb128 .LVU469
	.uleb128 .LVU470
	.uleb128 .LVU470
	.uleb128 0
.LLST49:
	.4byte	.LVL166
	.4byte	.LVL167
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL167
	.4byte	.LVL171-1
	.2byte	0x5
	.byte	0x3
	.4byte	NRF24L01_Struct+2
	.4byte	.LVL171-1
	.4byte	.LVL171
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL171
	.4byte	.LVL172
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL172
	.4byte	.LFE100
	.2byte	0x5
	.byte	0x3
	.4byte	NRF24L01_Struct+2
	.4byte	0
	.4byte	0
.LVUS50:
	.uleb128 .LVU451
	.uleb128 .LVU463
	.uleb128 .LVU463
	.uleb128 .LVU469
	.uleb128 .LVU469
	.uleb128 .LVU471
	.uleb128 .LVU471
	.uleb128 0
.LLST50:
	.4byte	.LVL166
	.4byte	.LVL168
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL168
	.4byte	.LVL171-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL171
	.4byte	.LVL173
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL173
	.4byte	.LFE100
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LVUS46:
	.uleb128 0
	.uleb128 .LVU426
	.uleb128 .LVU426
	.uleb128 0
.LLST46:
	.4byte	.LVL158
	.4byte	.LVL159
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL159
	.4byte	.LFE95
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS47:
	.uleb128 .LVU427
	.uleb128 .LVU431
	.uleb128 .LVU431
	.uleb128 .LVU434
	.uleb128 .LVU434
	.uleb128 .LVU440
	.uleb128 .LVU440
	.uleb128 0
.LLST47:
	.4byte	.LVL161
	.4byte	.LVL162
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL162
	.4byte	.LVL163-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL163
	.4byte	.LVL164
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL164
	.4byte	.LFE95
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LVUS34:
	.uleb128 .LVU342
	.uleb128 .LVU346
.LLST34:
	.4byte	.LVL126
	.4byte	.LVL127
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS32:
	.uleb128 .LVU312
	.uleb128 .LVU314
.LLST32:
	.4byte	.LVL117
	.4byte	.LVL118
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS33:
	.uleb128 .LVU330
	.uleb128 .LVU334
	.uleb128 .LVU336
	.uleb128 .LVU337
.LLST33:
	.4byte	.LVL122
	.4byte	.LVL123-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL124
	.4byte	.LVL125
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS31:
	.uleb128 0
	.uleb128 .LVU298
	.uleb128 .LVU298
	.uleb128 .LVU307
	.uleb128 .LVU307
	.uleb128 0
.LLST31:
	.4byte	.LVL110
	.4byte	.LVL111-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL111-1
	.4byte	.LVL116
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL116
	.4byte	.LFE88
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS36:
	.uleb128 0
	.uleb128 .LVU360
	.uleb128 .LVU360
	.uleb128 .LVU384
	.uleb128 .LVU384
	.uleb128 .LVU396
	.uleb128 .LVU396
	.uleb128 0
.LLST36:
	.4byte	.LVL128
	.4byte	.LVL130-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL130-1
	.4byte	.LVL144
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL144
	.4byte	.LVL150
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL150
	.4byte	.LFE87
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LVUS37:
	.uleb128 .LVU358
	.uleb128 .LVU360
	.uleb128 .LVU360
	.uleb128 .LVU384
	.uleb128 .LVU384
	.uleb128 .LVU396
	.uleb128 .LVU396
	.uleb128 0
.LLST37:
	.4byte	.LVL129
	.4byte	.LVL130-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL130-1
	.4byte	.LVL144
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL144
	.4byte	.LVL150
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL150
	.4byte	.LFE87
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LVUS38:
	.uleb128 .LVU359
	.uleb128 0
.LLST38:
	.4byte	.LVL129
	.4byte	.LFE87
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LVUS39:
	.uleb128 .LVU365
	.uleb128 0
.LLST39:
	.4byte	.LVL132
	.4byte	.LFE87
	.2byte	0x2
	.byte	0x78
	.sleb128 0
	.4byte	0
	.4byte	0
.LVUS40:
	.uleb128 .LVU381
	.uleb128 .LVU384
	.uleb128 .LVU387
	.uleb128 .LVU396
.LLST40:
	.4byte	.LVL142
	.4byte	.LVL144
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL146
	.4byte	.LVL150
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LVUS41:
	.uleb128 .LVU383
	.uleb128 .LVU384
	.uleb128 .LVU384
	.uleb128 .LVU396
.LLST41:
	.4byte	.LVL144
	.4byte	.LVL144
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL144
	.4byte	.LVL150
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LVUS42:
	.uleb128 .LVU384
	.uleb128 .LVU396
.LLST42:
	.4byte	.LVL144
	.4byte	.LVL150
	.2byte	0x4
	.byte	0xa
	.2byte	0x1f4
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS43:
	.uleb128 .LVU369
	.uleb128 .LVU370
	.uleb128 .LVU370
	.uleb128 .LVU373
	.uleb128 .LVU396
	.uleb128 .LVU399
	.uleb128 .LVU399
	.uleb128 .LVU401
	.uleb128 .LVU401
	.uleb128 0
.LLST43:
	.4byte	.LVL133
	.4byte	.LVL134
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL134
	.4byte	.LVL135-1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL150
	.4byte	.LVL151
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL151
	.4byte	.LVL152
	.2byte	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL152
	.4byte	.LFE87
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LVUS30:
	.uleb128 0
	.uleb128 .LVU260
	.uleb128 .LVU260
	.uleb128 .LVU261
	.uleb128 .LVU261
	.uleb128 .LVU263
	.uleb128 .LVU263
	.uleb128 .LVU264
	.uleb128 .LVU264
	.uleb128 0
.LLST30:
	.4byte	.LVL94
	.4byte	.LVL95
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL95
	.4byte	.LVL96-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL96-1
	.4byte	.LVL97
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL97
	.4byte	.LVL98-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL98-1
	.4byte	.LFE82
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS29:
	.uleb128 0
	.uleb128 .LVU251
	.uleb128 .LVU251
	.uleb128 .LVU254
	.uleb128 .LVU254
	.uleb128 0
.LLST29:
	.4byte	.LVL89
	.4byte	.LVL90-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL90-1
	.4byte	.LVL92
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL92
	.4byte	.LFE81
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS24:
	.uleb128 0
	.uleb128 .LVU172
	.uleb128 .LVU172
	.uleb128 0
.LLST24:
	.4byte	.LVL51
	.4byte	.LVL54
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL54
	.4byte	.LFE80
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS25:
	.uleb128 0
	.uleb128 .LVU176
	.uleb128 .LVU176
	.uleb128 0
.LLST25:
	.4byte	.LVL51
	.4byte	.LVL56
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL56
	.4byte	.LFE80
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS26:
	.uleb128 0
	.uleb128 .LVU165
	.uleb128 .LVU165
	.uleb128 0
.LLST26:
	.4byte	.LVL51
	.4byte	.LVL52
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL52
	.4byte	.LFE80
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS27:
	.uleb128 .LVU170
	.uleb128 .LVU173
	.uleb128 .LVU173
	.uleb128 0
.LLST27:
	.4byte	.LVL53
	.4byte	.LVL55
	.2byte	0x2
	.byte	0x72
	.sleb128 0
	.4byte	.LVL55
	.4byte	.LFE80
	.2byte	0x2
	.byte	0x75
	.sleb128 0
	.4byte	0
	.4byte	0
.LVUS28:
	.uleb128 .LVU175
	.uleb128 .LVU176
	.uleb128 .LVU176
	.uleb128 .LVU179
	.uleb128 .LVU182
	.uleb128 .LVU184
	.uleb128 .LVU186
	.uleb128 0
.LLST28:
	.4byte	.LVL55
	.4byte	.LVL56
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL56
	.4byte	.LVL57-1
	.2byte	0x7
	.byte	0x73
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL60
	.4byte	.LVL61
	.2byte	0x7
	.byte	0x73
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL62
	.4byte	.LFE80
	.2byte	0x7
	.byte	0x73
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS23:
	.uleb128 .LVU163
	.uleb128 .LVU165
	.uleb128 .LVU165
	.uleb128 0
.LLST23:
	.4byte	.LVL51
	.4byte	.LVL52
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL52
	.4byte	.LFE80
	.2byte	0x7
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS15:
	.uleb128 0
	.uleb128 .LVU139
	.uleb128 .LVU139
	.uleb128 .LVU149
	.uleb128 .LVU149
	.uleb128 .LVU155
	.uleb128 .LVU155
	.uleb128 0
.LLST15:
	.4byte	.LVL35
	.4byte	.LVL40-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40-1
	.4byte	.LVL46
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL46
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL49
	.4byte	.LFE79
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS16:
	.uleb128 0
	.uleb128 .LVU139
	.uleb128 .LVU139
	.uleb128 .LVU149
	.uleb128 .LVU149
	.uleb128 .LVU155
	.uleb128 .LVU155
	.uleb128 0
.LLST16:
	.4byte	.LVL35
	.4byte	.LVL40-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL40-1
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL46
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL49
	.4byte	.LFE79
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LVUS17:
	.uleb128 0
	.uleb128 .LVU130
	.uleb128 .LVU130
	.uleb128 0
.LLST17:
	.4byte	.LVL35
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL37
	.4byte	.LFE79
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS18:
	.uleb128 .LVU124
	.uleb128 .LVU134
	.uleb128 .LVU134
	.uleb128 0
.LLST18:
	.4byte	.LVL36
	.4byte	.LVL39
	.2byte	0x2
	.byte	0x78
	.sleb128 8
	.4byte	.LVL39
	.4byte	.LFE79
	.2byte	0x2
	.byte	0x78
	.sleb128 0
	.4byte	0
	.4byte	0
.LVUS19:
	.uleb128 .LVU132
	.uleb128 .LVU144
	.uleb128 .LVU144
	.uleb128 .LVU145
	.uleb128 .LVU145
	.uleb128 .LVU148
	.uleb128 .LVU149
	.uleb128 .LVU155
	.uleb128 .LVU155
	.uleb128 0
.LLST19:
	.4byte	.LVL38
	.4byte	.LVL43
	.2byte	0x2
	.byte	0x76
	.sleb128 0
	.4byte	.LVL43
	.4byte	.LVL44
	.2byte	0x2
	.byte	0x76
	.sleb128 -1
	.4byte	.LVL44
	.4byte	.LVL45
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LVL46
	.4byte	.LVL49
	.2byte	0x2
	.byte	0x76
	.sleb128 0
	.4byte	.LVL49
	.4byte	.LFE79
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	0
	.4byte	0
.LVUS20:
	.uleb128 .LVU136
	.uleb128 .LVU139
	.uleb128 .LVU149
	.uleb128 .LVU153
	.uleb128 .LVU154
	.uleb128 .LVU155
.LLST20:
	.4byte	.LVL39
	.4byte	.LVL40-1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL46
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL48
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LVUS21:
	.uleb128 .LVU143
	.uleb128 .LVU145
	.uleb128 .LVU145
	.uleb128 .LVU149
	.uleb128 .LVU155
	.uleb128 .LVU159
	.uleb128 .LVU160
	.uleb128 0
.LLST21:
	.4byte	.LVL42
	.4byte	.LVL44
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL44
	.4byte	.LVL46
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL49
	.4byte	.LVL50
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL50
	.4byte	.LFE79
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS12:
	.uleb128 .LVU118
	.uleb128 .LVU130
	.uleb128 .LVU130
	.uleb128 0
.LLST12:
	.4byte	.LVL35
	.4byte	.LVL37
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL37
	.4byte	.LFE79
	.2byte	0x7
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS14:
	.uleb128 .LVU125
	.uleb128 .LVU130
	.uleb128 .LVU130
	.uleb128 0
.LLST14:
	.4byte	.LVL36
	.4byte	.LVL37
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL37
	.4byte	.LFE79
	.2byte	0x7
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS5:
	.uleb128 0
	.uleb128 .LVU91
	.uleb128 .LVU91
	.uleb128 0
.LLST5:
	.4byte	.LVL24
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL25
	.4byte	.LFE78
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS6:
	.uleb128 0
	.uleb128 .LVU95
	.uleb128 .LVU95
	.uleb128 0
.LLST6:
	.4byte	.LVL24
	.4byte	.LVL26-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL26-1
	.4byte	.LFE78
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS1:
	.uleb128 0
	.uleb128 .LVU73
	.uleb128 .LVU73
	.uleb128 0
.LLST1:
	.4byte	.LVL17
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL18-1
	.4byte	.LFE77
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS7:
	.uleb128 0
	.uleb128 .LVU106
	.uleb128 .LVU106
	.uleb128 0
.LLST7:
	.4byte	.LVL30
	.4byte	.LVL31-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL31-1
	.4byte	.LFE76
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS8:
	.uleb128 0
	.uleb128 .LVU106
	.uleb128 .LVU106
	.uleb128 0
.LLST8:
	.4byte	.LVL30
	.4byte	.LVL31-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL31-1
	.4byte	.LFE76
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS9:
	.uleb128 0
	.uleb128 .LVU106
	.uleb128 .LVU106
	.uleb128 0
.LLST9:
	.4byte	.LVL30
	.4byte	.LVL31-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL31-1
	.4byte	.LFE76
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS10:
	.uleb128 .LVU106
	.uleb128 .LVU111
	.uleb128 .LVU113
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 0
.LLST10:
	.4byte	.LVL31
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL33
	.4byte	.LVL34-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL34
	.4byte	.LFE76
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS2:
	.uleb128 0
	.uleb128 .LVU83
	.uleb128 .LVU83
	.uleb128 0
.LLST2:
	.4byte	.LVL21
	.4byte	.LVL22-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22-1
	.4byte	.LFE75
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS3:
	.uleb128 0
	.uleb128 .LVU83
	.uleb128 .LVU83
	.uleb128 0
.LLST3:
	.4byte	.LVL21
	.4byte	.LVL22-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL22-1
	.4byte	.LFE75
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS4:
	.uleb128 .LVU83
	.uleb128 .LVU85
.LLST4:
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU39
	.uleb128 .LVU39
	.uleb128 0
.LLST0:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LFE73
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS51:
	.uleb128 0
	.uleb128 .LVU489
	.uleb128 .LVU489
	.uleb128 0
.LLST51:
	.4byte	.LVL176
	.4byte	.LVL177
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL177
	.4byte	.LFE72
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS52:
	.uleb128 0
	.uleb128 .LVU489
	.uleb128 .LVU489
	.uleb128 .LVU522
	.uleb128 .LVU522
	.uleb128 .LVU531
.LLST52:
	.4byte	.LVL176
	.4byte	.LVL177
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL177
	.4byte	.LVL185
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL185
	.4byte	.LVL186
	.2byte	0x14
	.byte	0x76
	.sleb128 0
	.byte	0x12
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x8
	.byte	0x20
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x2d
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS53:
	.uleb128 0
	.uleb128 .LVU489
	.uleb128 .LVU489
	.uleb128 .LVU559
	.uleb128 .LVU559
	.uleb128 0
.LLST53:
	.4byte	.LVL176
	.4byte	.LVL177
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL177
	.4byte	.LVL207
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL207
	.4byte	.LFE72
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS54:
	.uleb128 .LVU496
	.uleb128 .LVU502
	.uleb128 .LVU502
	.uleb128 .LVU506
	.uleb128 .LVU506
	.uleb128 .LVU510
	.uleb128 .LVU510
	.uleb128 .LVU514
	.uleb128 .LVU514
	.uleb128 .LVU518
	.uleb128 .LVU518
	.uleb128 0
.LLST54:
	.4byte	.LVL178
	.4byte	.LVL179
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL179
	.4byte	.LVL180
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL180
	.4byte	.LVL181
	.2byte	0x2
	.byte	0x32
	.byte	0x9f
	.4byte	.LVL181
	.4byte	.LVL182
	.2byte	0x2
	.byte	0x33
	.byte	0x9f
	.4byte	.LVL182
	.4byte	.LVL183
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL183
	.4byte	.LFE72
	.2byte	0x2
	.byte	0x35
	.byte	0x9f
	.4byte	0
	.4byte	0
.LVUS44:
	.uleb128 0
	.uleb128 .LVU418
	.uleb128 .LVU418
	.uleb128 .LVU419
	.uleb128 .LVU419
	.uleb128 .LVU419
	.uleb128 .LVU419
	.uleb128 0
.LLST44:
	.4byte	.LVL154
	.4byte	.LVL156
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL156
	.4byte	.LVL157-1
	.2byte	0x5
	.byte	0x3
	.4byte	NRF24L01_Struct+1
	.4byte	.LVL157-1
	.4byte	.LVL157
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL157
	.4byte	.LFE94
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LVUS45:
	.uleb128 .LVU414
	.uleb128 .LVU418
	.uleb128 .LVU418
	.uleb128 .LVU419
	.uleb128 .LVU419
	.uleb128 .LVU419
.LLST45:
	.4byte	.LVL155
	.4byte	.LVL156
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL156
	.4byte	.LVL157-1
	.2byte	0x5
	.byte	0x3
	.4byte	NRF24L01_Struct+1
	.4byte	.LVL157-1
	.4byte	.LVL157
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x6b9
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2586
	.4byte	0x298
	.ascii	"RESET\000"
	.4byte	0x29e
	.ascii	"SET\000"
	.4byte	0x88c
	.ascii	"GPIO_PIN_RESET\000"
	.4byte	0x892
	.ascii	"GPIO_PIN_SET\000"
	.4byte	0xc6a
	.ascii	"NRF24L01_Transmit_Status_Lost\000"
	.4byte	0xc70
	.ascii	"NRF24L01_Transmit_Status_Ok\000"
	.4byte	0xc76
	.ascii	"NRF24L01_Transmit_Status_Sending\000"
	.4byte	0xc97
	.ascii	"NRF24L01_DataRate_2M\000"
	.4byte	0xc9d
	.ascii	"NRF24L01_DataRate_1M\000"
	.4byte	0xca3
	.ascii	"NRF24L01_DataRate_250k\000"
	.4byte	0xcc4
	.ascii	"NRF24L01_OutputPower_M18dBm\000"
	.4byte	0xcca
	.ascii	"NRF24L01_OutputPower_M12dBm\000"
	.4byte	0xcd0
	.ascii	"NRF24L01_OutputPower_M6dBm\000"
	.4byte	0xcd6
	.ascii	"NRF24L01_OutputPower_0dBm\000"
	.4byte	0xcf7
	.ascii	"NRF24L01_CRC_Disable\000"
	.4byte	0xcfd
	.ascii	"NRF24L01_CRC_8\000"
	.4byte	0xd03
	.ascii	"NRF24L01_CRC_16\000"
	.4byte	0xe4b
	.ascii	"NRF24L01_Struct\000"
	.4byte	0xe5d
	.ascii	"NRF24L01_Pins\000"
	.4byte	0xe7f
	.ascii	"pipe0_reading_address\000"
	.4byte	0xe4b
	.ascii	"NRF24L01_Struct\000"
	.4byte	0xe5d
	.ascii	"NRF24L01_Pins\000"
	.4byte	0xe7f
	.ascii	"pipe0_reading_address\000"
	.4byte	0xe91
	.ascii	"NRF24L01_SetRetries\000"
	.4byte	0xec7
	.ascii	"NRF24L01_GetDynamicPayloadSize\000"
	.4byte	0xede
	.ascii	"NRF24L01_GetPayloadSize\000"
	.4byte	0xef5
	.ascii	"NRF24L01_Read\000"
	.4byte	0x1002
	.ascii	"NRF24L01_OpenReadingPipe\000"
	.4byte	0x107b
	.ascii	"NRF24L01_StopListening\000"
	.4byte	0x10ae
	.ascii	"NRF24L01_StartListening\000"
	.4byte	0x111f
	.ascii	"NRF24L01_OpenWritingPipe\000"
	.4byte	0x1170
	.ascii	"NRF24L01_TestCarrier\000"
	.4byte	0x119b
	.ascii	"NRF24L01_Available\000"
	.4byte	0x122d
	.ascii	"NRF24L01_SetAutoAck\000"
	.4byte	0x12dc
	.ascii	"NRF24L01_SetRF\000"
	.4byte	0x1342
	.ascii	"NRF24L01_GetDataRate\000"
	.4byte	0x1359
	.ascii	"setDataRate\000"
	.4byte	0x1374
	.ascii	"NRF24L01_GetPaLevel\000"
	.4byte	0x138b
	.ascii	"NRF24L01_SetPaLevel\000"
	.4byte	0x13a7
	.ascii	"NRF24L01_SetCrcLength\000"
	.4byte	0x140b
	.ascii	"NRF24L01_SetChannel\000"
	.4byte	0x1427
	.ascii	"NRF24L01_GetRetransmissionsCount\000"
	.4byte	0x1452
	.ascii	"NRF24L01_GetTransmissionStatus\000"
	.4byte	0x148c
	.ascii	"NRF24L01_GetStatus\000"
	.4byte	0x1500
	.ascii	"NRF24L01_RxFifoEmpty\000"
	.4byte	0x1540
	.ascii	"NRF24L01_DataReady\000"
	.4byte	0x1583
	.ascii	"NRF24L01_GetData\000"
	.4byte	0x1627
	.ascii	"NRF24L01_Transmit\000"
	.4byte	0x17c9
	.ascii	"NRF24L01_PowerUpTx\000"
	.4byte	0x180c
	.ascii	"NRF24L01_PowerUpRx\000"
	.4byte	0x1860
	.ascii	"NRF24L01_PowerUP\000"
	.4byte	0x1891
	.ascii	"NRF24L01_PowerDown\000"
	.4byte	0x18cb
	.ascii	"NRF24L01_SetTxAddress\000"
	.4byte	0x1931
	.ascii	"NRF24L01_SetRxAddress\000"
	.4byte	0x198e
	.ascii	"NRF24L01_WriteRegisterMulti\000"
	.4byte	0x1a6b
	.ascii	"NRF24L01_ReadRegisterMulti\000"
	.4byte	0x1ba3
	.ascii	"NRF24L01_WriteRegister\000"
	.4byte	0x1c36
	.ascii	"NRF24L01_ReadRegister\000"
	.4byte	0x1cbf
	.ascii	"NRF24L01_WriteBit\000"
	.4byte	0x1d48
	.ascii	"NRF24L01_ReadBit\000"
	.4byte	0x1dac
	.ascii	"NRF24L01_SoftwareReset\000"
	.4byte	0x2057
	.ascii	"NRF24L01_SpiInit\000"
	.4byte	0x2131
	.ascii	"NRF24L01_Init\000"
	.4byte	0x2347
	.ascii	"NRF24L01_FlushTx\000"
	.4byte	0x23a0
	.ascii	"NRF24L01_FlushRx\000"
	.4byte	0x23f9
	.ascii	"NRF24L01_ClearInterrupts\000"
	.4byte	0x2426
	.ascii	"NRF24L01_CSN_HIGH\000"
	.4byte	0x244c
	.ascii	"NRF24L01_CSN_LOW\000"
	.4byte	0x2472
	.ascii	"NRF24L01_CE_HIGH\000"
	.4byte	0x2498
	.ascii	"NRF24L01_CE_LOW\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x37a
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2586
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x3d
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x49
	.ascii	"short int\000"
	.4byte	0x61
	.ascii	"short unsigned int\000"
	.4byte	0x50
	.ascii	"uint16_t\000"
	.4byte	0x79
	.ascii	"int\000"
	.4byte	0x68
	.ascii	"int32_t\000"
	.4byte	0x96
	.ascii	"unsigned int\000"
	.4byte	0x80
	.ascii	"uint32_t\000"
	.4byte	0x9d
	.ascii	"long long int\000"
	.4byte	0xa4
	.ascii	"long long unsigned int\000"
	.4byte	0x149
	.ascii	"DMA_Channel_TypeDef\000"
	.4byte	0x17d
	.ascii	"DMA_TypeDef\000"
	.4byte	0x1f7
	.ascii	"GPIO_TypeDef\000"
	.4byte	0x27d
	.ascii	"SPI_TypeDef\000"
	.4byte	0x2cf
	.ascii	"long int\000"
	.4byte	0x2a7
	.ascii	"__mbstate_s\000"
	.4byte	0x2f5
	.ascii	"char\000"
	.4byte	0x4db
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x5c8
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x616
	.ascii	"__RAL_locale_t\000"
	.4byte	0x627
	.ascii	"__locale_s\000"
	.4byte	0x79a
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x7bc
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x7ed
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0x828
	.ascii	"HAL_LockTypeDef\000"
	.4byte	0x872
	.ascii	"GPIO_InitTypeDef\000"
	.4byte	0x8fe
	.ascii	"DMA_InitTypeDef\000"
	.4byte	0x931
	.ascii	"HAL_DMA_StateTypeDef\000"
	.4byte	0x93d
	.ascii	"__DMA_HandleTypeDef\000"
	.4byte	0xa0a
	.ascii	"DMA_HandleTypeDef\000"
	.4byte	0xabb
	.ascii	"SPI_InitTypeDef\000"
	.4byte	0xb06
	.ascii	"HAL_SPI_StateTypeDef\000"
	.4byte	0xb17
	.ascii	"__SPI_HandleTypeDef\000"
	.4byte	0xc05
	.ascii	"SPI_HandleTypeDef\000"
	.4byte	0xc38
	.ascii	"HAL_TickFreqTypeDef\000"
	.4byte	0xc7d
	.ascii	"NRF24L01_Transmit_Status_t\000"
	.4byte	0xcaa
	.ascii	"NRF24L01_DataRate_t\000"
	.4byte	0xcdd
	.ascii	"NRF24L01_OutputPower_t\000"
	.4byte	0xd0a
	.ascii	"NRF24L01_CrcLength_t\000"
	.4byte	0xd40
	.ascii	"PIN_t\000"
	.4byte	0xda3
	.ascii	"NRF24L01_Pins_t\000"
	.4byte	0xdaf
	.ascii	"FILE\000"
	.4byte	0xe3f
	.ascii	"NRF24L01_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x184
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
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.4byte	.LFB94
	.4byte	.LFE94-.LFB94
	.4byte	.LFB95
	.4byte	.LFE95-.LFB95
	.4byte	.LFB96
	.4byte	.LFE96-.LFB96
	.4byte	.LFB97
	.4byte	.LFE97-.LFB97
	.4byte	.LFB99
	.4byte	.LFE99-.LFB99
	.4byte	.LFB100
	.4byte	.LFE100-.LFB100
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.4byte	.LFB101
	.4byte	.LFE101-.LFB101
	.4byte	.LFB102
	.4byte	.LFE102-.LFB102
	.4byte	.LFB103
	.4byte	.LFE103-.LFB103
	.4byte	.LFB104
	.4byte	.LFE104-.LFB104
	.4byte	.LFB105
	.4byte	.LFE105-.LFB105
	.4byte	.LFB106
	.4byte	.LFE106-.LFB106
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.4byte	.LFB108
	.4byte	.LFE108-.LFB108
	.4byte	.LFB109
	.4byte	.LFE109-.LFB109
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB2
	.4byte	.LBE2
	.4byte	.LBB3
	.4byte	.LBE3
	.4byte	.LBB5
	.4byte	.LBE5
	.4byte	0
	.4byte	0
	.4byte	.LBB4
	.4byte	.LBE4
	.4byte	.LBB6
	.4byte	.LBE6
	.4byte	0
	.4byte	0
	.4byte	.LBB7
	.4byte	.LBE7
	.4byte	.LBB8
	.4byte	.LBE8
	.4byte	0
	.4byte	0
	.4byte	.LBB9
	.4byte	.LBE9
	.4byte	.LBB10
	.4byte	.LBE10
	.4byte	0
	.4byte	0
	.4byte	.LBB15
	.4byte	.LBE15
	.4byte	.LBB16
	.4byte	.LBE16
	.4byte	.LBB17
	.4byte	.LBE17
	.4byte	0
	.4byte	0
	.4byte	.LBB18
	.4byte	.LBE18
	.4byte	.LBB20
	.4byte	.LBE20
	.4byte	0
	.4byte	0
	.4byte	.LBB19
	.4byte	.LBE19
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	0
	.4byte	0
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	.LBB25
	.4byte	.LBE25
	.4byte	.LBB26
	.4byte	.LBE26
	.4byte	0
	.4byte	0
	.4byte	.LFB65
	.4byte	.LFE65
	.4byte	.LFB66
	.4byte	.LFE66
	.4byte	.LFB67
	.4byte	.LFE67
	.4byte	.LFB68
	.4byte	.LFE68
	.4byte	.LFB70
	.4byte	.LFE70
	.4byte	.LFB71
	.4byte	.LFE71
	.4byte	.LFB73
	.4byte	.LFE73
	.4byte	.LFB77
	.4byte	.LFE77
	.4byte	.LFB75
	.4byte	.LFE75
	.4byte	.LFB78
	.4byte	.LFE78
	.4byte	.LFB69
	.4byte	.LFE69
	.4byte	.LFB76
	.4byte	.LFE76
	.4byte	.LFB79
	.4byte	.LFE79
	.4byte	.LFB80
	.4byte	.LFE80
	.4byte	.LFB74
	.4byte	.LFE74
	.4byte	.LFB81
	.4byte	.LFE81
	.4byte	.LFB82
	.4byte	.LFE82
	.4byte	.LFB83
	.4byte	.LFE83
	.4byte	.LFB84
	.4byte	.LFE84
	.4byte	.LFB85
	.4byte	.LFE85
	.4byte	.LFB86
	.4byte	.LFE86
	.4byte	.LFB88
	.4byte	.LFE88
	.4byte	.LFB90
	.4byte	.LFE90
	.4byte	.LFB91
	.4byte	.LFE91
	.4byte	.LFB89
	.4byte	.LFE89
	.4byte	.LFB92
	.4byte	.LFE92
	.4byte	.LFB87
	.4byte	.LFE87
	.4byte	.LFB93
	.4byte	.LFE93
	.4byte	.LFB94
	.4byte	.LFE94
	.4byte	.LFB95
	.4byte	.LFE95
	.4byte	.LFB96
	.4byte	.LFE96
	.4byte	.LFB97
	.4byte	.LFE97
	.4byte	.LFB99
	.4byte	.LFE99
	.4byte	.LFB100
	.4byte	.LFE100
	.4byte	.LFB72
	.4byte	.LFE72
	.4byte	.LFB101
	.4byte	.LFE101
	.4byte	.LFB102
	.4byte	.LFE102
	.4byte	.LFB103
	.4byte	.LFE103
	.4byte	.LFB104
	.4byte	.LFE104
	.4byte	.LFB105
	.4byte	.LFE105
	.4byte	.LFB106
	.4byte	.LFE106
	.4byte	.LFB107
	.4byte	.LFE107
	.4byte	.LFB108
	.4byte	.LFE108
	.4byte	.LFB109
	.4byte	.LFE109
	.4byte	.LFB110
	.4byte	.LFE110
	.4byte	.LFB111
	.4byte	.LFE111
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF220:
	.ascii	"txBuffer\000"
.LASF111:
	.ascii	"Speed\000"
.LASF115:
	.ascii	"Direction\000"
.LASF260:
	.ascii	"NRF24L01_PowerDown\000"
.LASF231:
	.ascii	"NRF24L01_Available\000"
.LASF81:
	.ascii	"__locale_s\000"
.LASF71:
	.ascii	"__towupper\000"
.LASF214:
	.ascii	"NRF24L01_Pins\000"
.LASF75:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF273:
	.ascii	"GPIO_InitStruct\000"
.LASF194:
	.ascii	"NRF24L01_CrcLength_t\000"
.LASF130:
	.ascii	"Lock\000"
.LASF278:
	.ascii	"NRF24L01_ClearInterrupts\000"
.LASF6:
	.ascii	"int32_t\000"
.LASF164:
	.ascii	"RxXferSize\000"
.LASF252:
	.ascii	"NRF24L01_DataReady\000"
.LASF215:
	.ascii	"pipe0_reading_address\000"
.LASF180:
	.ascii	"NRF24L01_Transmit_Status_Sending\000"
.LASF64:
	.ascii	"time_format\000"
.LASF92:
	.ascii	"__RAL_data_utf8_period\000"
.LASF243:
	.ascii	"config\000"
.LASF60:
	.ascii	"month_names\000"
.LASF93:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF37:
	.ascii	"int_curr_symbol\000"
.LASF63:
	.ascii	"date_format\000"
.LASF79:
	.ascii	"__RAL_locale_t\000"
.LASF146:
	.ascii	"TIMode\000"
.LASF56:
	.ascii	"int_p_sign_posn\000"
.LASF15:
	.ascii	"CNDTR\000"
.LASF48:
	.ascii	"n_cs_precedes\000"
.LASF69:
	.ascii	"__tolower\000"
.LASF153:
	.ascii	"HAL_SPI_STATE_BUSY_TX\000"
.LASF222:
	.ascii	"NRF24L01_SetRetries\000"
.LASF216:
	.ascii	"delay\000"
.LASF44:
	.ascii	"int_frac_digits\000"
.LASF58:
	.ascii	"day_names\000"
.LASF229:
	.ascii	"NRF24L01_Read\000"
.LASF42:
	.ascii	"positive_sign\000"
.LASF259:
	.ascii	"NRF24L01_PowerUP\000"
.LASF245:
	.ascii	"NRF24L01_SetChannel\000"
.LASF234:
	.ascii	"result\000"
.LASF114:
	.ascii	"GPIO_PIN_SET\000"
.LASF253:
	.ascii	"NRF24L01_GetData\000"
.LASF271:
	.ascii	"NRF24L01_SpiInit\000"
.LASF244:
	.ascii	"NRF24L01_SetPaLevel\000"
.LASF39:
	.ascii	"mon_decimal_point\000"
.LASF201:
	.ascii	"FILE\000"
.LASF32:
	.ascii	"long int\000"
.LASF101:
	.ascii	"__RAL_error_decoder_s\000"
.LASF104:
	.ascii	"__RAL_error_decoder_t\000"
.LASF83:
	.ascii	"__RAL_global_locale\000"
.LASF210:
	.ascii	"DataRate\000"
.LASF100:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF120:
	.ascii	"Priority\000"
.LASF163:
	.ascii	"pRxBuffPtr\000"
.LASF53:
	.ascii	"int_n_cs_precedes\000"
.LASF137:
	.ascii	"ErrorCode\000"
.LASF108:
	.ascii	"HAL_LockTypeDef\000"
.LASF143:
	.ascii	"CLKPhase\000"
.LASF208:
	.ascii	"Channel\000"
.LASF275:
	.ascii	"payload_size\000"
.LASF74:
	.ascii	"__mbtowc\000"
.LASF16:
	.ascii	"CPAR\000"
.LASF0:
	.ascii	"signed char\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF73:
	.ascii	"__wctomb\000"
.LASF112:
	.ascii	"GPIO_InitTypeDef\000"
.LASF248:
	.ascii	"NRF24L01_GetTransmissionStatus\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF223:
	.ascii	"NRF24L01_OpenReadingPipe\000"
.LASF49:
	.ascii	"n_sep_by_space\000"
.LASF20:
	.ascii	"DMA_TypeDef\000"
.LASF139:
	.ascii	"ChannelIndex\000"
.LASF177:
	.ascii	"uwTickFreq\000"
.LASF255:
	.ascii	"sent_at\000"
.LASF262:
	.ascii	"NRF24L01_SetRxAddress\000"
.LASF94:
	.ascii	"__RAL_data_utf8_space\000"
.LASF266:
	.ascii	"value\000"
.LASF288:
	.ascii	"HAL_GPIO_Init\000"
.LASF33:
	.ascii	"char\000"
.LASF290:
	.ascii	"GNU C99 9.2.1 20191025 (release) [ARM/arm-9-branch "
	.ascii	"revision 277599] -fmessage-length=0 -mcpu=cortex-m3"
	.ascii	" -mlittle-endian -mfloat-abi=soft -mthumb -mtp=soft"
	.ascii	" -munaligned-access -std=gnu99 -g2 -gpubnames -Os -"
	.ascii	"fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-builti"
	.ascii	"n -ffunction-sections -fdata-sections -fshort-enums"
	.ascii	" -fno-common\000"
.LASF19:
	.ascii	"IFCR\000"
.LASF265:
	.ascii	"NRF24L01_WriteRegister\000"
.LASF51:
	.ascii	"n_sign_posn\000"
.LASF202:
	.ascii	"timeval\000"
.LASF169:
	.ascii	"hdmarx\000"
.LASF267:
	.ascii	"NRF24L01_ReadRegister\000"
.LASF91:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF40:
	.ascii	"mon_thousands_sep\000"
.LASF285:
	.ascii	"HAL_Delay\000"
.LASF232:
	.ascii	"pipe_num\000"
.LASF157:
	.ascii	"HAL_SPI_STATE_ABORT\000"
.LASF72:
	.ascii	"__towlower\000"
.LASF204:
	.ascii	"stdin\000"
.LASF238:
	.ascii	"NRF24L01_SetRF\000"
.LASF43:
	.ascii	"negative_sign\000"
.LASF279:
	.ascii	"NRF24L01_CSN_HIGH\000"
.LASF274:
	.ascii	"NRF24L01_Init\000"
.LASF52:
	.ascii	"int_p_cs_precedes\000"
.LASF102:
	.ascii	"decode\000"
.LASF116:
	.ascii	"PeriphInc\000"
.LASF195:
	.ascii	"GPIOx\000"
.LASF136:
	.ascii	"XferAbortCallback\000"
.LASF241:
	.ascii	"NRF24L01_SetCrcLength\000"
.LASF230:
	.ascii	"NRF24L01_TestCarrier\000"
.LASF287:
	.ascii	"HAL_GetTick\000"
.LASF269:
	.ascii	"NRF24L01_ReadBit\000"
.LASF168:
	.ascii	"hdmatx\000"
.LASF85:
	.ascii	"__RAL_codeset_ascii\000"
.LASF286:
	.ascii	"HAL_SPI_Transmit\000"
.LASF173:
	.ascii	"HAL_TICK_FREQ_1KHZ\000"
.LASF61:
	.ascii	"abbrev_month_names\000"
.LASF228:
	.ascii	"NRF24L01_OpenWritingPipe\000"
.LASF145:
	.ascii	"FirstBit\000"
.LASF212:
	.ascii	"NRF24L01_t\000"
.LASF78:
	.ascii	"codeset\000"
.LASF156:
	.ascii	"HAL_SPI_STATE_ERROR\000"
.LASF128:
	.ascii	"Instance\000"
.LASF221:
	.ascii	"rxBuffer\000"
.LASF31:
	.ascii	"__wchar\000"
.LASF105:
	.ascii	"__RAL_error_decoder_head\000"
.LASF66:
	.ascii	"__RAL_locale_data_t\000"
.LASF249:
	.ascii	"status\000"
.LASF90:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF192:
	.ascii	"NRF24L01_CRC_8\000"
.LASF225:
	.ascii	"address\000"
.LASF12:
	.ascii	"SystemCoreClock\000"
.LASF199:
	.ascii	"MISO\000"
.LASF113:
	.ascii	"GPIO_PIN_RESET\000"
.LASF144:
	.ascii	"BaudRatePrescaler\000"
.LASF250:
	.ascii	"NRF24L01_GetStatus\000"
.LASF239:
	.ascii	"NRF24L01_GetDataRate\000"
.LASF62:
	.ascii	"am_pm_indicator\000"
.LASF22:
	.ascii	"LCKR\000"
.LASF246:
	.ascii	"channel\000"
.LASF47:
	.ascii	"p_sep_by_space\000"
.LASF272:
	.ascii	"pins\000"
.LASF193:
	.ascii	"NRF24L01_CRC_16\000"
.LASF55:
	.ascii	"int_n_sep_by_space\000"
.LASF226:
	.ascii	"NRF24L01_StopListening\000"
.LASF141:
	.ascii	"DataSize\000"
.LASF98:
	.ascii	"__user_set_time_of_day\000"
.LASF165:
	.ascii	"RxXferCount\000"
.LASF119:
	.ascii	"MemDataAlignment\000"
.LASF9:
	.ascii	"long long int\000"
.LASF80:
	.ascii	"__mbstate_s\000"
.LASF211:
	.ascii	"hspi\000"
.LASF183:
	.ascii	"NRF24L01_DataRate_1M\000"
.LASF118:
	.ascii	"PeriphDataAlignment\000"
.LASF170:
	.ascii	"SPI_HandleTypeDef\000"
.LASF284:
	.ascii	"memcpy\000"
.LASF155:
	.ascii	"HAL_SPI_STATE_BUSY_TX_RX\000"
.LASF213:
	.ascii	"NRF24L01_Struct\000"
.LASF236:
	.ascii	"pipe\000"
.LASF82:
	.ascii	"__category\000"
.LASF11:
	.ascii	"ITM_RxBuffer\000"
.LASF25:
	.ascii	"RXCRCR\000"
.LASF65:
	.ascii	"date_time_format\000"
.LASF256:
	.ascii	"timeout\000"
.LASF217:
	.ascii	"count\000"
.LASF125:
	.ascii	"HAL_DMA_STATE_TIMEOUT\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF182:
	.ascii	"NRF24L01_DataRate_2M\000"
.LASF50:
	.ascii	"p_sign_posn\000"
.LASF138:
	.ascii	"DmaBaseAddress\000"
.LASF258:
	.ascii	"NRF24L01_PowerUpRx\000"
.LASF99:
	.ascii	"__user_get_time_of_day\000"
.LASF132:
	.ascii	"Parent\000"
.LASF17:
	.ascii	"CMAR\000"
.LASF219:
	.ascii	"NRF24L01_GetPayloadSize\000"
.LASF122:
	.ascii	"HAL_DMA_STATE_RESET\000"
.LASF86:
	.ascii	"__RAL_codeset_utf8\000"
.LASF84:
	.ascii	"__RAL_c_locale\000"
.LASF129:
	.ascii	"Init\000"
.LASF160:
	.ascii	"pTxBuffPtr\000"
.LASF270:
	.ascii	"NRF24L01_SoftwareReset\000"
.LASF34:
	.ascii	"decimal_point\000"
.LASF117:
	.ascii	"MemInc\000"
.LASF184:
	.ascii	"NRF24L01_DataRate_250k\000"
.LASF185:
	.ascii	"NRF24L01_DataRate_t\000"
.LASF240:
	.ascii	"NRF24L01_GetPaLevel\000"
.LASF203:
	.ascii	"__RAL_FILE\000"
.LASF172:
	.ascii	"HAL_TICK_FREQ_100HZ\000"
.LASF198:
	.ascii	"MOSI\000"
.LASF179:
	.ascii	"NRF24L01_Transmit_Status_Ok\000"
.LASF187:
	.ascii	"NRF24L01_OutputPower_M12dBm\000"
.LASF135:
	.ascii	"XferErrorCallback\000"
.LASF167:
	.ascii	"TxISR\000"
.LASF110:
	.ascii	"Pull\000"
.LASF257:
	.ascii	"NRF24L01_PowerUpTx\000"
.LASF109:
	.ascii	"Mode\000"
.LASF191:
	.ascii	"NRF24L01_CRC_Disable\000"
.LASF268:
	.ascii	"NRF24L01_WriteBit\000"
.LASF186:
	.ascii	"NRF24L01_OutputPower_M18dBm\000"
.LASF95:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF18:
	.ascii	"DMA_Channel_TypeDef\000"
.LASF13:
	.ascii	"AHBPrescTable\000"
.LASF189:
	.ascii	"NRF24L01_OutputPower_0dBm\000"
.LASF161:
	.ascii	"TxXferSize\000"
.LASF150:
	.ascii	"HAL_SPI_STATE_RESET\000"
.LASF67:
	.ascii	"__isctype\000"
.LASF261:
	.ascii	"NRF24L01_SetTxAddress\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF127:
	.ascii	"__DMA_HandleTypeDef\000"
.LASF54:
	.ascii	"int_p_sep_by_space\000"
.LASF242:
	.ascii	"length\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF218:
	.ascii	"NRF24L01_GetDynamicPayloadSize\000"
.LASF131:
	.ascii	"State\000"
.LASF106:
	.ascii	"HAL_UNLOCKED\000"
.LASF207:
	.ascii	"PayloadSize\000"
.LASF140:
	.ascii	"DMA_HandleTypeDef\000"
.LASF175:
	.ascii	"HAL_TickFreqTypeDef\000"
.LASF159:
	.ascii	"__SPI_HandleTypeDef\000"
.LASF293:
	.ascii	"setDataRate\000"
.LASF133:
	.ascii	"XferCpltCallback\000"
.LASF227:
	.ascii	"NRF24L01_StartListening\000"
.LASF263:
	.ascii	"NRF24L01_WriteRegisterMulti\000"
.LASF205:
	.ascii	"stdout\000"
.LASF176:
	.ascii	"uwTickPrio\000"
.LASF29:
	.ascii	"RESET\000"
.LASF235:
	.ascii	"NRF24L01_SetAutoAck\000"
.LASF27:
	.ascii	"I2SCFGR\000"
.LASF291:
	.ascii	"C:\\1234\\PCB drone project\\Remote Controller\\Rem"
	.ascii	"oteCon2\\Src\\nrf24l01.c\000"
.LASF59:
	.ascii	"abbrev_day_names\000"
.LASF224:
	.ascii	"number\000"
.LASF26:
	.ascii	"TXCRCR\000"
.LASF28:
	.ascii	"SPI_TypeDef\000"
.LASF152:
	.ascii	"HAL_SPI_STATE_BUSY\000"
.LASF277:
	.ascii	"NRF24L01_FlushRx\000"
.LASF24:
	.ascii	"CRCPR\000"
.LASF124:
	.ascii	"HAL_DMA_STATE_BUSY\000"
.LASF87:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF35:
	.ascii	"thousands_sep\000"
.LASF281:
	.ascii	"NRF24L01_CE_HIGH\000"
.LASF196:
	.ascii	"GPIO_Pin\000"
.LASF68:
	.ascii	"__toupper\000"
.LASF121:
	.ascii	"DMA_InitTypeDef\000"
.LASF282:
	.ascii	"NRF24L01_CE_LOW\000"
.LASF76:
	.ascii	"name\000"
.LASF264:
	.ascii	"NRF24L01_ReadRegisterMulti\000"
.LASF14:
	.ascii	"APBPrescTable\000"
.LASF45:
	.ascii	"frac_digits\000"
.LASF38:
	.ascii	"currency_symbol\000"
.LASF206:
	.ascii	"stderr\000"
.LASF2:
	.ascii	"short int\000"
.LASF283:
	.ascii	"HAL_SPI_TransmitReceive\000"
.LASF280:
	.ascii	"NRF24L01_CSN_LOW\000"
.LASF30:
	.ascii	"__state\000"
.LASF126:
	.ascii	"HAL_DMA_StateTypeDef\000"
.LASF292:
	.ascii	"C:\\1234\\PCB drone project\\Remote Controller\\Rem"
	.ascii	"oteCon2\000"
.LASF41:
	.ascii	"mon_grouping\000"
.LASF276:
	.ascii	"NRF24L01_FlushTx\000"
.LASF254:
	.ascii	"NRF24L01_Transmit\000"
.LASF21:
	.ascii	"BSRR\000"
.LASF188:
	.ascii	"NRF24L01_OutputPower_M6dBm\000"
.LASF96:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF23:
	.ascii	"GPIO_TypeDef\000"
.LASF70:
	.ascii	"__iswctype\000"
.LASF134:
	.ascii	"XferHalfCpltCallback\000"
.LASF151:
	.ascii	"HAL_SPI_STATE_READY\000"
.LASF162:
	.ascii	"TxXferCount\000"
.LASF88:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF190:
	.ascii	"NRF24L01_OutputPower_t\000"
.LASF149:
	.ascii	"SPI_InitTypeDef\000"
.LASF181:
	.ascii	"NRF24L01_Transmit_Status_t\000"
.LASF148:
	.ascii	"CRCPolynomial\000"
.LASF7:
	.ascii	"uint32_t\000"
.LASF57:
	.ascii	"int_n_sign_posn\000"
.LASF247:
	.ascii	"NRF24L01_GetRetransmissionsCount\000"
.LASF97:
	.ascii	"__RAL_data_empty_string\000"
.LASF289:
	.ascii	"HAL_GPIO_WritePin\000"
.LASF107:
	.ascii	"HAL_LOCKED\000"
.LASF46:
	.ascii	"p_cs_precedes\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF171:
	.ascii	"HAL_TICK_FREQ_10HZ\000"
.LASF123:
	.ascii	"HAL_DMA_STATE_READY\000"
.LASF197:
	.ascii	"PIN_t\000"
.LASF209:
	.ascii	"OutPwr\000"
.LASF237:
	.ascii	"state\000"
.LASF166:
	.ascii	"RxISR\000"
.LASF200:
	.ascii	"NRF24L01_Pins_t\000"
.LASF174:
	.ascii	"HAL_TICK_FREQ_DEFAULT\000"
.LASF233:
	.ascii	"temp\000"
.LASF178:
	.ascii	"NRF24L01_Transmit_Status_Lost\000"
.LASF36:
	.ascii	"grouping\000"
.LASF251:
	.ascii	"NRF24L01_RxFifoEmpty\000"
.LASF103:
	.ascii	"next\000"
.LASF77:
	.ascii	"data\000"
.LASF158:
	.ascii	"HAL_SPI_StateTypeDef\000"
.LASF154:
	.ascii	"HAL_SPI_STATE_BUSY_RX\000"
.LASF147:
	.ascii	"CRCCalculation\000"
.LASF89:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF142:
	.ascii	"CLKPolarity\000"
	.ident	"GCC: (GNU) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
