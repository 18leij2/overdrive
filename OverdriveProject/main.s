	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L17
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L17+4
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L5
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	ble	.L5
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L15
	ldr	r1, .L17+8
	ldr	r0, .L17+12
	ldr	r1, [r1]
	strh	r2, [r0, #2]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r1, #20]
.L5:
	ldr	r3, .L17+16
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L3
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	ble	.L3
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L16
	ldr	r1, .L17+8
	ldr	r0, .L17+12
	ldr	r1, [r1]
	strh	r2, [r0, #6]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r1, #32]
.L3:
	mov	r1, #1
	ldr	r3, .L17
	ldrh	r2, [r3, #2]
	ldrh	r2, [r3, #2]
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L15:
	ldm	r3, {r0, r1}
	ldr	r3, .L17+20
	mov	lr, pc
	bx	r3
	b	.L5
.L16:
	ldm	r3, {r0, r1}
	ldr	r3, .L17+24
	mov	lr, pc
	bx	r3
	b	.L3
.L18:
	.align	2
.L17:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #1
	mov	ip, #8
	ldr	r3, .L21
	ldr	r2, .L21+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L21+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L22:
	.align	2
.L21:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #7424
	mov	r3, #0
	mov	r0, #67108864
	push	{r4, lr}
	ldr	r2, .L25
	ldr	lr, .L25+4
	ldr	r1, .L25+8
	str	r3, [lr]
	str	r3, [r2]
	strh	ip, [r0]	@ movhi
	ldr	r2, .L25+12
	ldr	r4, .L25+16
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	mov	r3, #3808
	mov	r0, #3
	ldr	r2, .L25+20
	ldr	r1, .L25+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L25+32
	ldr	r1, .L25+36
	mov	lr, pc
	bx	r4
	mov	r3, #784
	mov	r0, #3
	ldr	r2, .L25+40
	ldr	r1, .L25+44
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L25+48
	ldr	r1, .L25+52
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L25+56
	ldr	r1, .L25+60
	mov	lr, pc
	bx	r4
	mov	r3, #432
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+64
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L25+68
	ldr	r1, .L25+72
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L25+76
	ldr	r1, .L25+80
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+88
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L25+92
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	hOff2
	.word	hOff1
	.word	gameState
	.word	hideSprites
	.word	DMANow
	.word	100696064
	.word	splashscreen2Tiles
	.word	splashscreen2Pal
	.word	100716544
	.word	splashscreen2Map
	.word	100712448
	.word	background1Tiles
	.word	83886112
	.word	background1Pal+32
	.word	100708352
	.word	background1Map
	.word	background2Tiles
	.word	83886144
	.word	background2Pal+64
	.word	100726784
	.word	background2Map
	.word	unpauseSounds
	.word	waitForVBlank
	.word	shadowOAM
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #4352
	mov	r4, #67108864
	mov	r2, #7936
	ldr	ip, .L29
	ldr	r1, .L29+4
	ldr	r0, .L29+8
	strh	r3, [r4]	@ movhi
	ldr	r5, .L29+12
	strh	r2, [r4, #8]	@ movhi
	mov	r3, #256
	strh	r1, [r4, #10]	@ movhi
	ldr	r2, .L29+16
	strh	r0, [r4, #12]	@ movhi
	ldr	r1, .L29+20
	strh	ip, [r4, #14]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L29+24
	ldr	r1, .L29+28
	mov	lr, pc
	bx	r5
	mov	r1, #0
	ldr	r3, .L29+32
	ldr	r0, .L29+36
	ldrh	ip, [r3, #48]
	ldr	r2, .L29+40
	ldr	r3, .L29+44
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r0, #8
	mov	lr, #97
	mov	r2, #1
	ldr	r3, .L29+48
	strh	r0, [r4, #4]	@ movhi
	ldr	ip, .L29+52
	ldr	r1, [r3]
	ldr	r0, .L29+56
	ldr	r3, .L29+60
	sub	r1, r1, #1000
	strh	lr, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	str	ip, [r0, #4092]
	ldr	r3, .L29+64
	ldr	r0, .L29+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+76
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L29+80
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	b	goToStart
.L30:
	.align	2
.L29:
	.word	22028
	.word	23300
	.word	6664
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	menutheme_length
	.word	interruptHandler
	.word	50360320
	.word	67109376
	.word	playSoundA
	.word	menutheme_data
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause.part.0, %function
pause.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+4
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L33+8
	ldr	r3, .L33+12
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+16
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L33+20
	ldr	r3, .L33+24
	sub	r1, r1, #1000
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L34:
	.align	2
.L33:
	.word	stopSounds
	.word	buttons_length
	.word	buttons_data
	.word	playSoundB
	.word	menutheme_length
	.word	menutheme_data
	.word	playSoundA
	.size	pause.part.0, .-pause.part.0
	.set	win.part.0,pause.part.0
	.align	2
	.global	goToInstruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	mov	r3, #67108864
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L37
	ldr	r2, .L37+4
	ldr	r0, .L37+8
	str	r1, [ip]
	ldr	ip, .L37+12
	str	r1, [r2]
	ldr	r4, .L37+16
	strh	r1, [r3, #16]	@ movhi
	mov	r2, #100663296
	strh	r1, [r3, #28]	@ movhi
	str	r1, [r0]
	mov	r3, #3088
	mov	r0, #3
	ldr	r1, .L37+20
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L37+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L37+28
	ldr	r1, .L37+32
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L37+36
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L37+40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	hOff1
	.word	hOff2
	.word	instructionState
	.word	gameState
	.word	DMANow
	.word	instructionscreenTiles
	.word	instructionscreenPal
	.word	100726784
	.word	instructionscreenMap
	.word	waitForVBlank
	.word	shadowOAM
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r5, #3
	mov	r2, #0
	ldr	ip, .L46
	ldr	r4, .L46+4
	strh	r2, [r3, #16]	@ movhi
	mov	r0, r5
	mov	r3, #16384
	ldr	r2, .L46+8
	ldr	r1, .L46+12
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L46+16
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r3, #4096
	ldr	r2, .L46+20
	ldr	r1, .L46+24
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r3, #224
	mov	r2, #100663296
	ldr	r1, .L46+28
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r3, #16
	ldr	r2, .L46+32
	ldr	r1, .L46+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L46+40
	ldr	r1, .L46+44
	mov	lr, pc
	bx	r4
	ldr	r3, .L46+48
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L45
.L40:
	mov	r2, #67108864
	mov	r1, #4864
	ldr	r3, .L46+52
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L46+56
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L45:
	mov	r0, r5
	mov	r3, #16384
	ldr	r2, .L46+8
	ldr	r1, .L46+60
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L46+64
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r3, #16
	ldr	r2, .L46+32
	ldr	r1, .L46+68
	mov	lr, pc
	bx	r4
	b	.L40
.L47:
	.align	2
.L46:
	.word	gameState
	.word	DMANow
	.word	100679680
	.word	tilesetTiles
	.word	tilesetPal
	.word	100718592
	.word	tilemap2Map
	.word	foregroundTiles
	.word	83886112
	.word	foregroundPal+32
	.word	100726784
	.word	foregroundMap
	.word	overdriving
	.word	waitForVBlank
	.word	shadowOAM
	.word	tilesetinvertTiles
	.word	tilesetinvertPal
	.word	foregroundPal+64
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	ldr	r0, .L60
	ldr	r3, [r0]
	add	r3, r3, #2
	push	{r4, r5, r6, lr}
	str	r3, [r0]
	ldr	r0, .L60+4
	lsl	r2, r3, #16
	ldr	r3, [r0]
	lsr	r2, r2, #16
	add	r3, r3, #1
	strh	r2, [r1, #16]	@ movhi
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	ldr	r4, .L60+8
	str	r3, [r0]
	ldr	r3, .L60+12
	strh	r2, [r1, #28]	@ movhi
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L49
	ldr	r2, .L60+16
	ldrh	r2, [r2]
	ands	r5, r2, #8
	beq	.L58
.L49:
	tst	r3, #4
	beq	.L48
	ldr	r3, .L60+16
	ldrh	r2, [r3]
	ands	r2, r2, #4
	beq	.L59
.L48:
	pop	{r4, r5, r6, lr}
	bx	lr
.L59:
	ldr	r3, .L60+20
	ldr	r1, [r3]
	ldr	r0, .L60+24
	ldr	r3, .L60+28
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToInstruction
.L58:
	ldr	r3, .L60+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+20
	ldr	r1, [r3]
	mov	r2, r5
	ldr	r0, .L60+24
	sub	r1, r1, #100
	ldr	r3, .L60+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+36
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L49
.L61:
	.align	2
.L60:
	.word	hOff1
	.word	hOff2
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	buttons_length
	.word	buttons_data
	.word	playSoundB
	.word	stopSounds
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L92
	ldr	r3, .L92+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L63
	ldr	r2, .L92+8
	ldrh	r2, [r2]
	ands	r6, r2, #8
	beq	.L81
.L63:
	tst	r3, #4
	beq	.L62
	ldr	r3, .L92+8
	ldrh	r2, [r3]
	ands	r3, r2, #4
	bne	.L62
	ldr	r1, .L92+12
	ldr	r2, [r1]
	cmp	r2, #0
	beq	.L82
	sub	r4, r2, #1
	cmp	r4, #0
	str	r4, [r1]
	beq	.L83
	cmp	r4, #1
	beq	.L84
	cmp	r4, #2
	beq	.L85
	cmp	r4, #3
	beq	.L86
	cmp	r4, #4
	bne	.L62
	ldr	r2, .L92+16
	ldr	r1, [r2]
	ldr	r0, .L92+20
	mov	r2, r3
	sub	r1, r1, #100
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L92+28
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L92+32
	ldr	r1, .L92+36
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+44
	ldr	r1, .L92+48
	mov	lr, pc
	bx	r4
.L62:
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	ldr	r2, .L92+12
	ldr	r5, [r2]
	cmp	r5, #5
	beq	.L87
	add	r5, r5, #1
	cmp	r5, #1
	str	r5, [r2]
	beq	.L88
	cmp	r5, #2
	beq	.L89
	cmp	r5, #3
	beq	.L90
	cmp	r5, #4
	beq	.L91
	cmp	r5, #5
	bne	.L63
	ldr	r3, .L92+16
	ldr	r1, [r3]
	mov	r2, r6
	ldr	r0, .L92+20
	ldr	r3, .L92+24
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	ldr	r5, .L92+28
	mov	r3, #5056
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L92+52
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+56
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+44
	ldr	r1, .L92+60
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L63
.L82:
	ldr	r3, .L92+16
	ldr	r1, [r3]
	ldr	r0, .L92+20
	ldr	r3, .L92+24
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToStart
.L87:
	ldr	r3, .L92+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+16
	ldr	r1, [r3]
	mov	r2, r6
	ldr	r0, .L92+20
	sub	r1, r1, #100
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+68
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L63
.L85:
	ldr	r2, .L92+16
	ldr	r1, [r2]
	ldr	r0, .L92+20
	mov	r2, r3
	sub	r1, r1, #100
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L92+28
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L92+72
	ldr	r1, .L92+76
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+80
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+44
	ldr	r1, .L92+84
	mov	lr, pc
	bx	r4
	b	.L62
.L83:
	ldr	r3, .L92+16
	ldr	r1, [r3]
	mov	r2, r4
	ldr	r0, .L92+20
	ldr	r3, .L92+24
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	ldr	r4, .L92+28
	mov	r3, #3088
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L92+88
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+92
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+44
	ldr	r1, .L92+96
	mov	lr, pc
	bx	r4
	b	.L62
.L88:
	ldr	r3, .L92+16
	ldr	r1, [r3]
	mov	r2, r6
	ldr	r0, .L92+20
	ldr	r3, .L92+24
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	ldr	r5, .L92+28
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L92+100
	ldr	r1, .L92+104
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+108
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+44
	ldr	r1, .L92+112
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L63
.L89:
	ldr	r3, .L92+16
	ldr	r1, [r3]
	mov	r2, r6
	ldr	r0, .L92+20
	ldr	r3, .L92+24
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	ldr	r5, .L92+28
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L92+72
	ldr	r1, .L92+76
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+80
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+44
	ldr	r1, .L92+84
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L63
.L90:
	ldr	r3, .L92+16
	ldr	r1, [r3]
	mov	r2, r6
	ldr	r0, .L92+20
	ldr	r3, .L92+24
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	ldr	r6, .L92+28
	mov	r2, #100663296
	mov	r0, r5
	ldr	r3, .L92+116
	ldr	r1, .L92+120
	mov	lr, pc
	bx	r6
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, r5
	ldr	r1, .L92+124
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L92+44
	ldr	r1, .L92+128
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L63
.L91:
	ldr	r3, .L92+16
	ldr	r1, [r3]
	mov	r2, r6
	ldr	r0, .L92+20
	ldr	r3, .L92+24
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	ldr	r5, .L92+28
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L92+32
	ldr	r1, .L92+36
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+40
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+44
	ldr	r1, .L92+48
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L63
.L84:
	ldr	r2, .L92+16
	ldr	r1, [r2]
	ldr	r0, .L92+20
	mov	r2, r3
	sub	r1, r1, #100
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L92+28
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L92+100
	ldr	r1, .L92+104
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+108
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+44
	ldr	r1, .L92+112
	mov	lr, pc
	bx	r4
	b	.L62
.L86:
	ldr	r2, .L92+16
	ldr	r1, [r2]
	ldr	r0, .L92+20
	mov	r2, r3
	sub	r1, r1, #100
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L92+28
	mov	r0, r4
	mov	r2, #100663296
	ldr	r3, .L92+116
	ldr	r1, .L92+120
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L92+124
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L92+44
	ldr	r1, .L92+128
	mov	lr, pc
	bx	r5
	b	.L62
.L93:
	.align	2
.L92:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	instructionState
	.word	buttons_length
	.word	buttons_data
	.word	playSoundB
	.word	DMANow
	.word	5616
	.word	instructionscreen6Tiles
	.word	instructionscreen6Pal
	.word	100726784
	.word	instructionscreen6Map
	.word	instructionscreen4Tiles
	.word	instructionscreen4Pal
	.word	instructionscreen4Map
	.word	stopSounds
	.word	initGame
	.word	6512
	.word	instructionscreen3Tiles
	.word	instructionscreen3Pal
	.word	instructionscreen3Map
	.word	instructionscreenTiles
	.word	instructionscreenPal
	.word	instructionscreenMap
	.word	5488
	.word	instructionscreen2Tiles
	.word	instructionscreen2Pal
	.word	instructionscreen2Map
	.word	4768
	.word	instructionscreen5Tiles
	.word	instructionscreen5Pal
	.word	instructionscreen5Map
	.size	instruction, .-instruction
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #0
	mov	r5, #67108864
	mov	r1, #2
	ldr	r2, .L96
	ldr	r4, .L96+4
	str	r1, [r2]
	mov	r3, #2288
	strh	r0, [r5, #16]	@ movhi
	mov	r2, #100663296
	strh	r0, [r5, #18]	@ movhi
	ldr	r1, .L96+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L96+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L96+16
	mov	r3, #1024
	ldr	r2, .L96+20
	mov	lr, pc
	bx	r4
	mov	r2, #4352
	ldr	r3, .L96+24
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+28
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L96+32
	sub	r1, r1, #1000
	ldr	r3, .L96+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L96+48
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	gameState
	.word	DMANow
	.word	pausescreenTiles
	.word	pausescreenPal
	.word	pausescreenMap
	.word	100726784
	.word	pauseA
	.word	pausetheme_length
	.word	pausetheme_data
	.word	playSoundB
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L110
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L99
	ldr	r2, .L110+4
	ldrh	r2, [r2]
	ands	r5, r2, #8
	beq	.L108
.L99:
	tst	r3, #4
	beq	.L98
	ldr	r3, .L110+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L109
.L98:
	pop	{r4, r5, r6, lr}
	bx	lr
.L109:
	pop	{r4, r5, r6, lr}
	b	pause.part.0
.L108:
	mov	r3, #67108864
	ldr	r2, .L110+8
	ldrh	r1, [r2]
	ldr	r2, .L110+12
	strh	r1, [r3, #16]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L110+16
	strh	r1, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L110+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+24
	ldr	r1, [r3]
	mov	r2, r5
	ldr	r3, .L110+28
	ldr	r0, .L110+32
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L99
.L111:
	.align	2
.L110:
	.word	oldButtons
	.word	buttons
	.word	hOff
	.word	vOff
	.word	stopB
	.word	unpauseSounds
	.word	buttons_length
	.word	playSoundB
	.word	buttons_data
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #0
	mov	r5, #67108864
	mov	r1, #4
	ldr	r2, .L114
	ldr	r4, .L114+4
	str	r1, [r2]
	mov	r3, #2160
	strh	r0, [r5, #16]	@ movhi
	mov	r2, #100663296
	strh	r0, [r5, #18]	@ movhi
	ldr	r1, .L114+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L114+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L114+16
	mov	r3, #1024
	ldr	r2, .L114+20
	mov	lr, pc
	bx	r4
	mov	r2, #4352
	ldr	r3, .L114+24
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L114+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L114+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L115:
	.align	2
.L114:
	.word	gameState
	.word	DMANow
	.word	winscreenTiles
	.word	winscreenPal
	.word	winscreenMap
	.word	100726784
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L121
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L121+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	win.part.0
.L122:
	.align	2
.L121:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #0
	mov	r5, #67108864
	mov	r1, #5
	ldr	r2, .L125
	ldr	r4, .L125+4
	str	r1, [r2]
	mov	r3, #1728
	strh	r0, [r5, #16]	@ movhi
	mov	r2, #100663296
	strh	r0, [r5, #18]	@ movhi
	ldr	r1, .L125+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L125+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L125+16
	mov	r3, #1024
	ldr	r2, .L125+20
	mov	lr, pc
	bx	r4
	mov	r2, #4352
	ldr	r3, .L125+24
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L125+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L126:
	.align	2
.L125:
	.word	gameState
	.word	DMANow
	.word	losescreenTiles
	.word	losescreenPal
	.word	losescreenMap
	.word	100726784
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L141
	mov	lr, pc
	bx	r3
	ldr	r3, .L141+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L141+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L141+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L141+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L141+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L128
	ldr	r3, .L141+24
	ldrh	r2, [r3]
	ands	r2, r2, #8
	beq	.L138
.L128:
	ldr	r3, .L141+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L139
.L129:
	ldr	r3, .L141+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L140
	pop	{r4, lr}
	bx	lr
.L140:
	ldr	r3, .L141+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L141+40
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L141+44
	ldr	r3, .L141+48
	sub	r1, r1, #1000
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToLose
.L139:
	ldr	r3, .L141+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L141+52
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L141+56
	ldr	r3, .L141+48
	sub	r1, r1, #1000
	mov	lr, pc
	bx	r3
	bl	goToWin
	b	.L129
.L138:
	ldr	r3, .L141+60
	ldr	r1, [r3]
	ldr	r0, .L141+64
	ldr	r3, .L141+68
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L128
.L142:
	.align	2
.L141:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	winState
	.word	loseState
	.word	stopSounds
	.word	losetheme_length
	.word	losetheme_data
	.word	playSoundA
	.word	wintheme_length
	.word	wintheme_data
	.word	buttons_length
	.word	buttons_data
	.word	playSoundB
	.size	game, .-game
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Debug Log Initialized!\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L153
	mov	lr, pc
	bx	r3
	ldr	r0, .L153+4
	ldr	r3, .L153+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L153+12
	mov	lr, pc
	bx	r3
	ldr	r10, .L153+16
	ldr	r4, .L153+20
	ldr	r9, .L153+24
	ldr	fp, .L153+28
	ldr	r7, .L153+32
	ldr	r6, .L153+36
	ldr	r8, .L153+40
	ldr	r5, .L153+44
.L151:
	ldrh	r3, [r4]
	strh	r3, [r10]	@ movhi
	ldr	r3, [r9]
	ldrh	r2, [r8, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L144
.L146:
	.word	.L150
	.word	.L149
	.word	.L148
	.word	.L147
	.word	.L145
	.word	.L145
.L145:
	mov	lr, pc
	bx	fp
.L144:
	mov	lr, pc
	bx	r7
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L151
.L147:
	ldr	r3, .L153+48
	mov	lr, pc
	bx	r3
	b	.L144
.L148:
	ldr	r3, .L153+52
	mov	lr, pc
	bx	r3
	b	.L144
.L150:
	ldr	r3, .L153+56
	mov	lr, pc
	bx	r3
	b	.L144
.L149:
	ldr	r3, .L153+60
	mov	lr, pc
	bx	r3
	b	.L144
.L154:
	.align	2
.L153:
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	gameState
	.word	win
	.word	waitForVBlank
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	game
	.word	pause
	.word	start
	.word	instruction
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	instructionState,4,4
	.comm	hOff2,4,4
	.comm	hOff1,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	screenBlock,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	shadowOAM,1024,4
	.comm	gameState,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
