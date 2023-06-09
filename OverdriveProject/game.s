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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCrescents.part.0, %function
updateCrescents.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, .L12
	mov	r4, r0
	ldr	r3, [r6, #8]
	ldr	r0, [r0]
	sub	r3, r0, r3
	cmp	r3, #250
	movgt	r3, #0
	ldr	r5, .L12+4
	add	r1, r5, #24
	strgt	r3, [r4, #24]
	ldm	r1, {r1, ip}
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	ldr	lr, [r4, #20]
	sub	sp, sp, #20
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r0, lr
	str	r0, [r4]
	ldmib	r4, {r1, r2, r3}
	ldr	r8, .L12+8
	mov	lr, pc
	bx	r8
	subs	r7, r0, #0
	beq	.L3
	mov	r1, #0
	ldr	r3, [r6, #120]
	ldr	r2, [r5, #44]
	rsb	r3, r3, r3, lsl #4
	add	r3, r3, #30
	sub	r3, r2, r3
	str	r3, [r5, #44]
	str	r1, [r4, #24]
.L4:
	ldr	r3, .L12+12
	ldr	r1, [r4, #4]
	ldr	r3, [r3]
	ldr	r2, [r4]
	add	r3, r3, r1, lsl #10
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	streq	r3, [r4, #24]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L3:
	ldr	r5, .L12+16
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r8
	subs	r9, r0, #0
	beq	.L5
	ldr	r3, [r6, #120]
	ldr	r2, [r5, #44]
	rsb	r3, r3, r3, lsl #4
	add	r3, r3, #30
	sub	r3, r2, r3
	str	r3, [r5, #44]
	str	r7, [r4, #24]
	b	.L4
.L5:
	ldr	r5, .L12+20
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L4
	ldr	r3, [r6, #120]
	ldr	r2, [r5, #44]
	rsb	r3, r3, r3, lsl #4
	add	r3, r3, #30
	sub	r3, r2, r3
	str	r3, [r5, #44]
	str	r9, [r4, #24]
	b	.L4
.L13:
	.align	2
.L12:
	.word	player
	.word	driller
	.word	collision
	.word	collisionMap
	.word	baller
	.word	boss
	.size	updateCrescents.part.0, .-updateCrescents.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, #0
	mov	lr, #5
	mov	r1, #14
	mov	r10, #50
	mov	r9, #52
	mov	r8, #32
	mov	r7, #16
	mov	r6, #3
	mov	r5, #100
	mov	r4, #10
	mov	ip, #2
	mov	r0, #1
	ldr	r3, .L16
	str	r2, [r3]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	str	r2, [r3, #60]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #72]
	str	r2, [r3, #80]
	str	r2, [r3, #84]
	str	r2, [r3, #88]
	str	r2, [r3, #112]
	str	r2, [r3, #120]
	str	r10, [r3, #4]
	str	r9, [r3, #12]
	str	r8, [r3, #28]
	str	r7, [r3, #32]
	str	r6, [r3, #48]
	str	r5, [r3, #92]
	str	r4, [r3, #96]
	str	lr, [r3, #8]
	str	lr, [r3, #16]
	str	ip, [r3, #24]
	str	ip, [r3, #100]
	str	r1, [r3, #20]
	str	r1, [r3, #104]
	str	r1, [r3, #108]
	str	r0, [r3, #56]
	str	r0, [r3, #76]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initDriller
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDriller, %function
initDriller:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, #0
	mov	r10, #200
	mov	r9, #50
	mov	r8, #213
	mov	r7, #56
	mov	r6, #19
	mov	r5, #26
	mov	r4, #300
	mov	lr, #8
	mov	r1, #32
	mov	ip, #16
	mov	r0, #23
	ldr	r3, .L20
	str	r10, [r3]
	str	r9, [r3, #4]
	str	r8, [r3, #8]
	str	r7, [r3, #12]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #44]
	str	lr, [r3, #52]
	str	ip, [r3, #56]
	str	r0, [r3, #60]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	driller
	.size	initDriller, .-initDriller
	.align	2
	.global	initBaller
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBaller, %function
initBaller:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r7, #50
	mov	r2, #0
	mov	r9, #712
	mov	r8, #57
	mov	r6, #22
	mov	r5, #240
	mov	r4, #708
	mov	lr, #58
	mov	r0, #32
	mov	r1, #25
	mov	ip, #14
	ldr	r3, .L24
	str	r7, [r3, #4]
	add	r7, r7, #672
	str	r9, [r3]
	str	r8, [r3, #12]
	str	r7, [r3, #8]
	str	r6, [r3, #24]
	str	r5, [r3, #44]
	str	r4, [r3, #48]
	str	lr, [r3, #52]
	str	ip, [r3, #56]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #28]
	str	r1, [r3, #60]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	baller
	.size	initBaller, .-initBaller
	.align	2
	.global	initBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoss, %function
initBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	lr, #920
	mov	r2, #0
	mov	r9, #10
	mov	r8, #20
	mov	r7, #12
	mov	r6, #18
	mov	r5, #1000
	mov	r4, #21
	mov	ip, #64
	mov	r0, #32
	mov	r1, #54
	ldr	r3, .L28
	str	lr, [r3]
	str	lr, [r3, #48]
	add	lr, lr, #31
	str	r9, [r3, #4]
	str	r8, [r3, #12]
	str	lr, [r3, #8]
	str	r7, [r3, #36]
	str	r6, [r3, #40]
	str	r5, [r3, #44]
	str	r4, [r3, #52]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #56]
	str	r1, [r3, #28]
	str	r1, [r3, #60]
	str	r2, [r3, #32]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	boss
	.size	initBoss, .-initBoss
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	mov	r0, #27
	ldr	r2, .L38
	ldr	r3, .L38+4
	ldr	r1, [r2]
	ldr	r4, .L38+8
	ldr	r3, [r3]
	ldr	r2, .L38+12
	ldr	r6, .L38+16
	ldr	lr, .L38+20
	ldr	ip, .L38+24
	str	r1, [r4]
	str	r3, [r4, #4]
	ldr	r1, .L38+28
	ldr	r3, .L38+32
	str	r2, [r4, #8]
	ldr	r2, .L38+36
	str	r5, [r6]
	str	r5, [lr]
	str	r5, [ip]
	str	r5, [r1]
	str	r5, [r3]
	str	r5, [r2]
	ldr	r6, .L38+40
	ldr	lr, .L38+44
	ldr	ip, .L38+48
	ldr	r1, .L38+52
	ldr	r3, .L38+56
	ldr	r2, .L38+60
	str	r5, [r6]
	str	r5, [lr]
	str	r5, [ip]
	str	r5, [r1]
	str	r5, [r3]
	str	r5, [r2]
	ldr	r6, .L38+64
	ldr	lr, .L38+68
	ldr	ip, .L38+72
	ldr	r1, .L38+76
	ldr	r3, .L38+80
	ldr	r2, .L38+84
	str	r5, [r6]
	str	r5, [lr]
	str	r5, [ip]
	ldr	lr, .L38+88
	ldr	ip, .L38+92
	str	r5, [r1]
	str	r5, [r3]
	ldr	r1, .L38+96
	ldr	r3, .L38+100
	str	r5, [r2]
	ldr	r6, .L38+104
	ldr	r2, .L38+108
	str	r0, [r1]
	str	r2, [r3]
	str	r5, [lr]
	str	r5, [ip]
	str	r5, [r6]
	bl	initPlayer
	bl	initDriller
	bl	initBaller
	mov	lr, #16
	mov	ip, #8
	mov	r0, #1
	mov	r1, #3
	ldr	r3, .L38+112
	add	r2, r3, #96
.L31:
	str	r5, [r3]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #24]
	str	r5, [r3, #28]
	stmib	r3, {r5, lr}
	add	r3, r3, #32
	cmp	r3, r2
	bne	.L31
	mov	r2, #0
	mov	ip, #8
	mov	r5, #16
	mov	lr, #1
	mov	r0, #6
	ldr	r3, .L38+116
	add	r1, r3, #360
.L32:
	str	r2, [r3]
	str	r5, [r3, #12]
	str	lr, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	stmib	r3, {r2, ip}
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L32
	mov	r8, #1000
	mov	r7, #80
	mov	r6, #3
	mov	r5, #71
	mov	r1, #8
	mov	r0, #32
	mov	r3, #0
	ldr	lr, .L38+120
	str	ip, [lr, #8]
	str	ip, [lr, #12]
	str	r2, [lr, #16]
	str	r2, [lr, #20]
	str	r2, [lr, #28]
	str	r8, [lr]
	str	r7, [lr, #4]
	str	r6, [lr, #24]
	ldr	r2, .L38+124
	ldr	ip, .L38+128
	ldr	lr, .L38+132
.L33:
	str	ip, [r2]
	add	ip, ip, #8
	cmp	ip, lr
	str	r5, [r2, #4]
	str	r1, [r2, #8]
	str	r0, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	str	r3, [r2, #24]
	str	r3, [r2, #28]
	add	r2, r2, #32
	bne	.L33
	mov	lr, #152
	mov	r10, #64
	mov	r9, #140
	mov	r8, #50
	ldr	ip, .L38+136
	ldr	fp, .L38+140
	str	r0, [ip, #12]
	ldr	fp, [fp, #92]
	ldr	r0, .L38+144
	str	lr, [ip, #4]
	str	r3, [ip]
	str	fp, [ip, #16]
	str	r10, [ip, #8]
	str	r3, [ip, #20]
	str	r3, [ip, #24]
	ldr	r0, [r0, #44]
	ldr	ip, .L38+148
	str	r0, [ip, #16]
	ldr	r0, .L38+152
	str	lr, [r0, #4]
	str	r1, [r0, #12]
	str	r3, [r0, #16]
	str	r3, [r0, #24]
	str	r9, [r0]
	str	r8, [r0, #8]
	ldr	r0, .L38+156
	str	r3, [r0, #20]
	str	r3, [r0, #28]
	str	r3, [r0, #32]
	mov	r3, #45
	str	r3, [r0, #4]
	mov	r3, #16
	mov	r2, #95
	mov	r5, #1
	str	r3, [r0, #12]
	mov	r7, #190
	mov	r3, #5
	mov	r6, #60
	str	lr, [ip, #4]
	str	r1, [ip, #12]
	str	r7, [ip]
	str	r6, [ip, #8]
	str	r2, [r0]
	str	r1, [r0, #8]
	str	r3, [r0, #24]
	str	r5, [r0, #16]
	bl	initBoss
	ldr	r1, [r4, #4]
	mov	r2, r5
	ldr	r0, [r4, #8]
	ldr	r3, .L38+160
	sub	r1, r1, #1000
	mov	lr, pc
	bx	r3
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	maintheme_sampleRate
	.word	maintheme_length
	.word	song
	.word	maintheme_data
	.word	hOff
	.word	vOff
	.word	oldAni
	.word	dodgeTime
	.word	hitTime
	.word	drillerTimer
	.word	ballerTimer
	.word	bossTimer
	.word	winState
	.word	loseState
	.word	overdriveTimer
	.word	overdriveCooldown
	.word	drillerCounter
	.word	ballerCounter
	.word	bossCounter
	.word	drillerDead
	.word	ballerDead
	.word	regenBar
	.word	demonMode
	.word	overdriving
	.word	screenBlock
	.word	collisionMap
	.word	cheatActive
	.word	collisionmap2Bitmap
	.word	bullets
	.word	crescents
	.word	flame
	.word	lasers
	.word	455
	.word	519
	.word	health
	.word	player
	.word	driller
	.word	lowerHealth
	.word	upperHealth
	.word	blade
	.word	playSoundA
	.size	initGame, .-initGame
	.align	2
	.global	initLasers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLasers, %function
initLasers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #32
	mov	r4, #71
	mov	lr, #8
	mov	r1, #0
	ldr	r3, .L44
	ldr	r2, .L44+4
	ldr	r0, .L44+8
.L41:
	str	r2, [r3]
	add	r2, r2, #8
	cmp	r2, r0
	stmib	r3, {r4, lr}
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	add	r3, r3, #32
	bne	.L41
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	lasers
	.word	455
	.word	519
	.size	initLasers, .-initLasers
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #16
	mov	lr, #8
	mov	ip, #1
	mov	r0, #3
	ldr	r3, .L50
	add	r1, r3, #96
.L47:
	str	r2, [r3]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	stmib	r3, {r2, r4, lr}
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L47
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	initCrescents
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCrescents, %function
initCrescents:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #8
	mov	lr, #16
	mov	ip, #1
	mov	r0, #6
	ldr	r3, .L56
	add	r1, r3, #360
.L53:
	str	r2, [r3]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	stmib	r3, {r2, r4, lr}
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L53
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	crescents
	.size	initCrescents, .-initCrescents
	.align	2
	.global	initBlade
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBlade, %function
initBlade:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #95
	mov	r4, #45
	mov	lr, #8
	mov	ip, #16
	mov	r0, #1
	mov	r1, #5
	ldr	r3, .L60
	stmib	r3, {r4, lr}
	str	r5, [r3]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	pop	{r4, r5, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	blade
	.size	initBlade, .-initBlade
	.align	2
	.global	initFlame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFlame, %function
initFlame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #1000
	mov	r1, #8
	mov	ip, #80
	mov	r0, #3
	ldr	r3, .L64
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #24]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L65:
	.align	2
.L64:
	.word	flame
	.size	initFlame, .-initFlame
	.align	2
	.global	initHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHealth, %function
initHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #152
	mov	r0, #64
	mov	r1, #32
	ldr	ip, .L68
	ldr	r3, .L68+4
	ldr	ip, [ip, #92]
	str	lr, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L69:
	.align	2
.L68:
	.word	player
	.word	health
	.size	initHealth, .-initHealth
	.align	2
	.global	initEnemyHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemyHealth, %function
initEnemyHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #60
	push	{r4, r5, r6, lr}
	mov	ip, #152
	mov	r6, #190
	mov	r4, #140
	mov	lr, #50
	mov	r0, #8
	mov	r1, #0
	ldr	r2, .L72
	ldr	r5, .L72+4
	str	r3, [r2, #8]
	ldr	r5, [r5, #44]
	ldr	r3, .L72+8
	str	r6, [r2]
	stm	r3, {r4, ip, lr}
	str	r5, [r2, #16]
	str	ip, [r2, #4]
	str	r0, [r2, #12]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	lowerHealth
	.word	driller
	.word	upperHealth
	.size	initEnemyHealth, .-initEnemyHealth
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L133
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldrh	lr, [r2]
	ldr	r2, .L133+4
	ldr	r6, .L133+8
	ldrh	r7, [r2]
	ldr	r2, [r6, #52]
	strh	lr, [r3, #20]	@ movhi
	strh	r7, [r3, #22]	@ movhi
	ldr	r3, .L133+12
	cmp	r2, #0
	ldr	r1, [r3]
	ldr	r9, [r6, #120]
	beq	.L75
	ldr	ip, .L133+16
	ldrh	r3, [ip]
	orr	r3, r3, #512
	strh	r3, [ip]	@ movhi
	sub	r1, r1, #27
.L76:
	ldr	r0, .L133+20
	ldr	r5, [r0, #32]
	cmp	r5, #0
	beq	.L80
	ldrh	r3, [ip, #8]
	orr	r3, r3, #512
	strh	r3, [ip, #8]	@ movhi
.L81:
	ldr	r0, .L133+24
	ldr	r5, [r0, #32]
	cmp	r5, #0
	beq	.L85
	ldrh	r3, [ip, #16]
	orr	r3, r3, #512
	strh	r3, [ip, #16]	@ movhi
.L86:
	ldr	r0, .L133+28
	ldr	r5, [r0, #32]
	cmp	r5, #0
	beq	.L90
	ldrh	r3, [ip, #144]
	orr	r3, r3, #512
	strh	r3, [ip, #144]	@ movhi
.L91:
	ldr	r3, .L133+16
	mov	ip, r3
	mov	r2, r3
	add	lr, lr, r1, lsl #8
	lsl	lr, lr, #16
	ldr	r1, .L133+32
	ldr	r10, .L133+36
	ldr	fp, .L133+40
	lsr	lr, lr, #16
	add	r8, r3, #24
.L98:
	ldr	r0, [r1, #16]
	cmp	r0, #0
	beq	.L95
	ldrh	r0, [r2, #32]
	orr	r0, r0, #512
	strh	r0, [r2, #32]	@ movhi
.L96:
	add	r2, r2, #8
	cmp	r8, r2
	add	r1, r1, #32
	bne	.L98
	ldr	r2, .L133+12
	ldr	r1, .L133
	ldr	r2, [r2]
	ldr	r5, [r1]
	sub	r2, r2, #27
	add	r5, r5, r2, lsl #8
	ldr	r4, .L133+44
	ldr	r2, .L133+4
	lsl	r5, r5, #16
	ldrh	r10, [r2]
	ldr	r1, .L133+48
	ldr	r9, .L133+52
	ldr	r8, .L133+56
	ldr	r7, .L133+60
	lsr	r5, r5, #16
	sub	r2, r4, #80
	b	.L101
.L129:
	ldrh	r0, [r2, #160]
	orr	r0, r0, #512
	strh	r0, [r2, #160]	@ movhi
	add	r2, r2, #8
	cmp	r4, r2
	add	r1, r1, #36
	beq	.L128
.L101:
	ldr	r0, [r1, #16]
	cmp	r0, #0
	bne	.L129
	ldr	r0, [r1, #4]
	ldr	lr, [r1]
	sub	r0, r0, r10
	and	r0, r0, #255
	sub	lr, lr, r5
	orr	r0, r0, r9
	and	lr, lr, r8
	strh	r7, [r2, #164]	@ movhi
	strh	r0, [r2, #160]	@ movhi
	strh	lr, [r2, #162]	@ movhi
	add	r2, r2, #8
	cmp	r4, r2
	add	r1, r1, #36
	bne	.L101
.L128:
	ldr	r2, .L133+12
	ldr	r1, .L133
	ldr	r2, [r2]
	ldr	r4, [r1]
	sub	r2, r2, #27
	add	r4, r4, r2, lsl #8
	ldr	r2, .L133+4
	lsl	r4, r4, #16
	ldrh	fp, [r2]
	ldr	r10, [r6, #120]
	ldr	r1, .L133+64
	ldr	r5, .L133+68
	ldr	r9, .L133+52
	ldr	r8, .L133+56
	ldr	r7, .L133+72
	lsr	r4, r4, #16
	b	.L105
.L131:
	ldrh	r2, [r3, #56]
	orr	r2, r2, #512
	strh	r2, [r3, #56]	@ movhi
	add	r3, r3, #8
	cmp	r3, r5
	add	r1, r1, #32
	beq	.L130
.L105:
	ldr	r2, [r1, #24]
	cmp	r2, #0
	bne	.L131
	ldr	r2, [r1, #20]
	ldm	r1, {r0, lr}
	add	r2, r2, #608
	sub	r0, r0, r4
	add	r2, r2, #1
	and	r0, r0, r8
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	orr	r0, r0, #16384
	sub	lr, lr, fp
	cmp	r10, #0
	strh	r0, [r3, #58]	@ movhi
	and	lr, lr, #255
	and	r0, r2, r7
	orr	lr, lr, r9
	andeq	r2, r2, r7
	orr	r0, r0, #16384
	strh	lr, [r3, #56]	@ movhi
	strhne	r0, [r3, #60]	@ movhi
	strheq	r2, [r3, #60]	@ movhi
	add	r3, r3, #8
	cmp	r3, r5
	add	r1, r1, #32
	bne	.L105
.L130:
	ldr	r3, .L133+76
	ldr	r2, [r3, #16]
	cmp	r2, #0
	ldr	r2, [r6, #120]
	beq	.L106
	ldrh	r3, [ip, #24]
	orr	r3, r3, #512
	strh	r3, [ip, #24]	@ movhi
.L107:
	ldr	r1, .L133+80
	ldr	r3, [r1, #16]
	cmp	r3, #0
	beq	.L109
	ldr	r1, .L133+84
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	cmp	r2, #0
	ldr	r6, .L133+88
	moveq	r6, #460
	ldrb	r0, [r1, #4]	@ zero_extendqisi2
	ldrh	r1, [ip, #112]
	orr	r0, r0, #16384
	orr	r1, r1, #512
	strh	r3, [ip, #122]	@ movhi
	strh	r0, [ip, #120]	@ movhi
	strh	r1, [ip, #112]	@ movhi
.L110:
	ldr	lr, .L133+92
	ldr	r0, .L133+96
	ldr	r3, [lr]
	ldr	r4, [r0, #24]
	ldr	r5, .L133+56
	ldrb	lr, [lr, #4]	@ zero_extendqisi2
	and	r3, r3, r5
	cmp	r4, #0
	strh	r6, [ip, #124]	@ movhi
	ldr	r4, .L133+100
	orr	lr, lr, #16384
	orr	r3, r3, #49152
	beq	.L112
	ldrh	r1, [ip, #128]
	cmp	r2, #0
	orr	r2, r1, #512
	strh	lr, [ip, #136]	@ movhi
	strh	r3, [ip, #138]	@ movhi
	strh	r2, [ip, #128]	@ movhi
	beq	.L114
.L113:
	ldr	r3, .L133+104
	ldr	r2, [r3]
	ldr	r3, .L133+108
	cmp	r2, #0
	strh	r3, [ip, #140]	@ movhi
	beq	.L116
.L118:
	ldrh	r3, [ip, #152]
	orr	r3, r3, #512
	strh	r3, [ip, #152]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L95:
	cmp	r9, #0
	moveq	r5, r10
	movne	r5, fp
	ldr	r0, [r1, #4]
	ldr	r4, [r1]
	sub	r0, r0, r7
	sub	r4, r4, lr
	and	r0, r0, #255
	lsl	r4, r4, #23
	orr	r0, r0, #16384
	lsr	r4, r4, #23
	strh	r0, [r2, #32]	@ movhi
	strh	r5, [r2, #36]	@ movhi
	strh	r4, [r2, #34]	@ movhi
	b	.L96
.L112:
	ldr	r1, [r0]
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	and	r1, r1, r5
	cmp	r2, #0
	orr	r2, r1, r4
	orr	r1, r0, #16384
	strh	r2, [ip, #130]	@ movhi
	strh	r1, [ip, #128]	@ movhi
	bne	.L132
	mov	r2, #24
	strh	lr, [ip, #136]	@ movhi
	strh	r3, [ip, #138]	@ movhi
	strh	r2, [ip, #132]	@ movhi
.L114:
	mov	r3, #152
	ldr	r2, .L133+104
	ldr	r2, [r2]
	cmp	r2, #0
	strh	r3, [ip, #140]	@ movhi
	bne	.L118
	mov	r1, #8
	ldr	r2, .L133+112
	ldr	r3, .L133+116
	strh	r1, [ip, #152]	@ movhi
	strh	r2, [ip, #154]	@ movhi
	strh	r3, [ip, #156]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L109:
	ldr	r3, .L133+4
	ldr	r0, [r3]
	ldr	r3, [r1, #4]
	sub	r3, r3, r0
	and	r3, r3, #255
	mvn	lr, r3, lsl #17
	ldr	r3, .L133
	ldr	r4, [r3]
	ldr	r3, .L133+12
	ldr	r0, [r3]
	ldr	r3, [r1]
	sub	r0, r0, #27
	sub	r3, r3, r4
	ldr	r4, .L133+56
	sub	r3, r3, r0, lsl #8
	ldr	r0, .L133+84
	and	r3, r3, r4
	strh	r3, [ip, #114]	@ movhi
	ldr	r3, [r0]
	and	r3, r3, r4
	mvn	lr, lr, lsr #17
	mvn	r3, r3, lsl #18
	ldr	r1, [r1, #20]
	lsl	r1, r1, #22
	add	r1, r1, #44040192
	cmp	r2, #0
	mvn	r3, r3, lsr #18
	strh	lr, [ip, #112]	@ movhi
	lsr	r1, r1, #16
	beq	.L111
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	and	r1, r1, #992
	orr	r1, r1, #16384
	orr	r0, r0, #16384
	strh	r1, [ip, #116]	@ movhi
	strh	r3, [ip, #122]	@ movhi
	strh	r0, [ip, #120]	@ movhi
	ldr	r6, .L133+88
	b	.L110
.L106:
	ldr	r0, .L133
	ldr	lr, .L133+12
	ldr	r1, [r3]
	ldr	r0, [r0]
	ldr	lr, [lr]
	sub	r1, r1, r0
	sub	lr, lr, #27
	ldr	r0, [r3, #4]
	ldr	r3, [r3, #20]
	sub	r1, r1, lr, lsl #8
	ldr	lr, .L133+4
	add	r3, r3, #18
	ldr	lr, [lr]
	lsl	r3, r3, #21
	lsr	r3, r3, #16
	and	r3, r3, #992
	lsl	r1, r1, #23
	sub	r0, r0, lr
	cmp	r2, #0
	lsr	r1, r1, #23
	and	r0, r0, #255
	orrne	r3, r3, #16384
	strh	r1, [ip, #26]	@ movhi
	strh	r0, [ip, #24]	@ movhi
	strh	r3, [ip, #28]	@ movhi
	b	.L107
.L90:
	ldr	r3, [r0]
	sub	r3, r3, lr
	sub	r3, r3, r1, lsl #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r8, [r0, #36]
	ldr	r2, [r0, #40]
	ldr	r4, [r0, #4]
	add	r2, r8, r2, lsl #5
	ldr	r8, [r0, #64]
	sub	r4, r4, r7
	and	r4, r4, #255
	lsl	r2, r2, #16
	cmp	r8, #0
	strh	r3, [ip, #146]	@ movhi
	strh	r4, [ip, #144]	@ movhi
	lsr	r2, r2, #16
	beq	.L92
	ldr	r3, [r0, #68]
	lsl	r2, r2, #22
	add	r3, r3, #1
	lsr	r2, r2, #22
	cmp	r3, #4
	orr	r2, r2, #4096
	str	r3, [r0, #68]
	strgt	r5, [r0, #64]
	strh	r2, [ip, #148]	@ movhi
	b	.L91
.L85:
	ldr	r3, [r0]
	sub	r3, r3, lr
	sub	r3, r3, r1, lsl #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r4, [r0, #4]
	ldr	r2, [r0, #40]
	ldr	r8, [r0, #64]
	sub	r4, r4, r7
	lsl	r2, r2, #23
	and	r4, r4, #255
	add	r2, r2, #29884416
	cmp	r8, #0
	strh	r3, [ip, #18]	@ movhi
	strh	r4, [ip, #16]	@ movhi
	lsr	r2, r2, #16
	beq	.L87
	ldr	r3, [r0, #68]
	and	r2, r2, #1016
	add	r3, r3, #1
	cmp	r3, #4
	orr	r2, r2, #4096
	str	r3, [r0, #68]
	strgt	r5, [r0, #64]
	strh	r2, [ip, #20]	@ movhi
	b	.L86
.L80:
	ldr	r2, [r0]
	sub	r2, r2, lr
	sub	r2, r2, r1, lsl #8
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r0, #40]
	ldr	r4, [r0, #36]
	lsl	r3, r3, #5
	add	r3, r3, #48
	add	r3, r3, r4
	ldr	r4, [r0, #4]
	ldr	r8, [r0, #64]
	sub	r4, r4, r7
	lsl	r3, r3, #18
	and	r4, r4, #255
	cmp	r8, #0
	strh	r2, [ip, #10]	@ movhi
	strh	r4, [ip, #8]	@ movhi
	lsr	r3, r3, #16
	beq	.L82
	ldr	r2, [r0, #68]
	and	r3, r3, #1020
	add	r2, r2, #1
	cmp	r2, #4
	orr	r3, r3, #4096
	str	r2, [r0, #68]
	strgt	r5, [r0, #64]
	strh	r3, [ip, #12]	@ movhi
	b	.L81
.L75:
	ldr	r3, [r6]
	sub	r1, r1, #27
	sub	r3, r3, lr
	sub	r3, r3, r1, lsl #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r4, [r6, #44]
	ldr	r0, [r6, #4]
	ldr	r2, [r6, #40]
	sub	r0, r0, r7
	add	r2, r2, r4, lsl #4
	ldr	r4, [r6, #112]
	ldr	ip, .L133+16
	and	r0, r0, #255
	orr	r0, r0, #16384
	lsl	r2, r2, #18
	cmp	r4, #0
	strh	r3, [ip, #2]	@ movhi
	strh	r0, [ip]	@ movhi
	lsr	r2, r2, #16
	andne	r2, r2, #1020
	orrne	r2, r2, #8192
	strhne	r2, [ip, #4]	@ movhi
	bne	.L76
.L77:
	ldr	r3, [r6, #80]
	cmp	r3, #0
	and	r2, r2, #1020
	beq	.L78
	ldr	r3, .L133+120
	ldr	r3, [r3]
	cmp	r3, #7
	orrle	r3, r2, #4096
	strhle	r3, [ip, #4]	@ movhi
	ble	.L76
.L78:
	cmp	r9, #0
	orrne	r3, r2, #12288
	strhne	r3, [ip, #4]	@ movhi
	strheq	r2, [ip, #4]	@ movhi
	b	.L76
.L82:
	and	r3, r3, #1020
	cmp	r9, #0
	orrne	r3, r3, #16384
	strh	r3, [ip, #12]	@ movhi
	b	.L81
.L87:
	cmp	r9, #0
	and	r2, r2, #1016
	orrne	r3, r2, #16384
	strhne	r3, [ip, #20]	@ movhi
	strheq	r2, [ip, #20]	@ movhi
	b	.L86
.L92:
	lsl	r2, r2, #22
	lsr	r2, r2, #22
	cmp	r9, #0
	orrne	r2, r2, #16384
	strh	r2, [ip, #148]	@ movhi
	b	.L91
.L111:
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	and	r1, r1, #992
	orr	r0, r0, #16384
	mov	r6, #460
	strh	r1, [ip, #116]	@ movhi
	strh	r3, [ip, #122]	@ movhi
	strh	r0, [ip, #120]	@ movhi
	b	.L110
.L132:
	ldr	r2, .L133+124
	strh	lr, [ip, #136]	@ movhi
	strh	r3, [ip, #138]	@ movhi
	strh	r2, [ip, #132]	@ movhi
	b	.L113
.L116:
	mov	r1, #8
	ldr	r2, .L133+112
	ldr	r3, .L133+128
	strh	r1, [ip, #152]	@ movhi
	strh	r2, [ip, #154]	@ movhi
	strh	r3, [ip, #156]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	hOff
	.word	vOff
	.word	player
	.word	screenBlock
	.word	shadowOAM
	.word	driller
	.word	baller
	.word	boss
	.word	bullets
	.word	577
	.word	16961
	.word	shadowOAM+80
	.word	crescents
	.word	-32768
	.word	511
	.word	739
	.word	lasers
	.word	shadowOAM+64
	.word	1023
	.word	flame
	.word	blade
	.word	health
	.word	16844
	.word	lowerHealth
	.word	upperHealth
	.word	-16384
	.word	overdriveCooldown
	.word	16536
	.word	16392
	.word	737
	.word	dodgeTime
	.word	16408
	.word	13025
	.size	drawGame, .-drawGame
	.align	2
	.global	canMoveLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveLeft, %function
canMoveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L140
	ldr	r3, .L140+4
	ldr	r2, [r1, #24]
	ldr	r0, [r1, #8]
	ldr	r3, [r3]
	sub	r0, r0, r2
	ldr	r2, [r1, #12]
	add	r3, r3, r0
	ldrb	r0, [r3, r2, lsl #10]	@ zero_extendqisi2
	cmp	r0, #0
	add	ip, r3, r2, lsl #10
	bxeq	lr
	ldr	r1, [r1, #20]
	add	r2, r2, r1
	sub	r2, r2, #1
	ldrb	r0, [r3, r2, lsl #10]	@ zero_extendqisi2
	cmp	r0, #0
	add	r3, r3, r2, lsl #10
	bxeq	lr
	add	ip, ip, #4096
	ldrb	r0, [ip]	@ zero_extendqisi2
	cmp	r0, #0
	bxeq	lr
	sub	r3, r3, #4096
	ldrb	r0, [r3]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L141:
	.align	2
.L140:
	.word	player
	.word	collisionMap
	.size	canMoveLeft, .-canMoveLeft
	.align	2
	.global	canMoveRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveRight, %function
canMoveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L157
	ldr	r0, [r4, #8]
	ldr	r2, [r4, #16]
	ldr	ip, .L157+4
	ldr	r1, [r4, #24]
	add	r3, r0, r2
	ldr	ip, [ip]
	sub	r3, r3, #1
	add	r3, r3, r1
	ldr	r1, [r4, #12]
	add	ip, ip, r3
	ldrb	r3, [ip, r1, lsl #10]	@ zero_extendqisi2
	cmp	r3, #0
	sub	sp, sp, #16
	add	r5, ip, r1, lsl #10
	beq	.L145
	ldr	r3, [r4, #20]
	add	lr, r3, r1
	sub	lr, lr, #1
	ldrb	r6, [ip, lr, lsl #10]	@ zero_extendqisi2
	cmp	r6, #0
	add	ip, ip, lr, lsl #10
	bne	.L156
.L145:
	mov	r0, #0
.L142:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L156:
	add	r5, r5, #4096
	ldrb	lr, [r5]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L145
	sub	ip, ip, #4096
	ldrb	ip, [ip]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L145
	ldr	ip, .L157+8
	add	r5, ip, #24
	ldm	r5, {r5, lr}
	str	lr, [sp, #12]
	add	ip, ip, #8
	ldm	ip, {ip, lr}
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	ldr	r5, .L157+12
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L145
	ldr	r3, .L157+16
	ldr	r2, [r3, #12]
	add	r0, r3, #24
	ldr	r1, [r3, #8]
	ldm	r0, {r0, ip}
	sub	r3, r2, #3
	str	r0, [sp, #8]
	str	r3, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp]
	add	r0, r4, #8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L145
	ldr	r3, .L157+20
	ldr	r0, [r3, #28]
	ldr	r1, [r3, #24]
	ldr	r2, [r3, #12]
	ldr	r3, [r3, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r4, #8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r5
	rsbs	r0, r0, #1
	movcc	r0, #0
	b	.L142
.L158:
	.align	2
.L157:
	.word	player
	.word	collisionMap
	.word	driller
	.word	collision
	.word	baller
	.word	boss
	.size	canMoveRight, .-canMoveRight
	.align	2
	.global	canMoveUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveUp, %function
canMoveUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L162
	ldr	r3, .L162+4
	ldr	r2, [r1, #12]
	ldr	ip, [r1, #8]
	ldr	r3, [r3]
	sub	r2, r2, r0
	add	r3, r3, ip
	ldrb	r0, [r3, r2, lsl #10]	@ zero_extendqisi2
	cmp	r0, #0
	add	r3, r3, r2, lsl #10
	bxeq	lr
	ldr	r0, [r1, #16]
	add	r3, r3, r0
	ldrb	r0, [r3, #-1]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L163:
	.align	2
.L162:
	.word	player
	.word	collisionMap
	.size	canMoveUp, .-canMoveUp
	.align	2
	.global	gravity
	.syntax unified
	.arm
	.fpu softvfp
	.type	gravity, %function
gravity:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L196
	push	{r4, lr}
	ldr	r0, .L196+4
	ldr	ip, [r1, #20]
	ldr	r3, [r1, #12]
	ldr	r2, [r1, #8]
	ldr	r0, [r0]
	add	r3, r3, ip
	add	r3, r3, #3
	add	lr, r0, r2
	ldr	ip, [r1, #16]
	ldrb	r4, [lr, r3, lsl #10]	@ zero_extendqisi2
	add	r2, r2, ip
	cmp	r4, #0
	sub	r2, r2, #1
	lsl	ip, r3, #10
	beq	.L165
	add	r4, r0, r2
	ldrb	r3, [r4, r3, lsl #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L165
	ldr	r3, [r1, #4]
	add	r3, r3, #4
	str	r3, [r1, #4]
	pop	{r4, lr}
	bx	lr
.L165:
	sub	r3, ip, #1024
	ldrb	r4, [lr, r3]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L167
	add	r4, r0, r2
	ldrb	r3, [r4, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L167
	ldr	r3, [r1, #4]
	add	r3, r3, #3
	str	r3, [r1, #4]
	pop	{r4, lr}
	bx	lr
.L167:
	sub	r3, ip, #2048
	ldrb	r4, [lr, r3]	@ zero_extendqisi2
	cmp	r4, #0
	bne	.L195
.L168:
	sub	ip, ip, #3072
	ldrb	r3, [lr, ip]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L169
	add	r2, r0, r2
	ldrb	r3, [r2, ip]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L169
	ldr	r3, [r1, #4]
	add	r3, r3, #1
	str	r3, [r1, #4]
	pop	{r4, lr}
	bx	lr
.L195:
	add	r4, r0, r2
	ldrb	r3, [r4, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L168
	ldr	r3, [r1, #4]
	add	r3, r3, #2
	str	r3, [r1, #4]
	pop	{r4, lr}
	bx	lr
.L169:
	mov	r3, #1
	pop	{r4, lr}
	str	r3, [r1, #56]
	bx	lr
.L197:
	.align	2
.L196:
	.word	player
	.word	collisionMap
	.size	gravity, .-gravity
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Driller health: %d\000"
	.align	2
.LC1:
	.ascii	"Baller health: %d\000"
	.align	2
.LC2:
	.ascii	"Boss health: %d\000"
	.text
	.align	2
	.global	attack
	.syntax unified
	.arm
	.fpu softvfp
	.type	attack, %function
attack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #1
	mov	r2, #0
	ldr	r4, .L245
	sub	r3, r0, #1
	cmp	r3, r8
	mov	r5, r0
	str	r0, [r4, #40]
	str	r2, [r4, #68]
	str	r2, [r4, #76]
	str	r8, [r4, #64]
	sub	sp, sp, #16
	bls	.L234
	cmp	r0, #3
	beq	.L235
	cmp	r0, #4
	beq	.L236
	ldr	r6, .L245+4
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r4, #96
	ldm	r0, {r0, r1, r2, r3}
	ldr	r7, .L245+8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L237
.L201:
	ldr	r6, .L245+12
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r4, #96
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L209
	mov	r3, #1
	cmp	r5, r3
	str	r3, [r6, #64]
	ldr	r1, [r6, #44]
	beq	.L238
	cmp	r5, #2
	beq	.L239
	cmp	r5, #3
	beq	.L240
	cmp	r5, #4
	bne	.L211
	ldr	r3, [r4, #120]
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #2
	add	r3, r3, #40
	sub	r1, r1, r3
	str	r1, [r6, #44]
	b	.L211
.L240:
	ldr	r3, [r4, #120]
	add	r3, r3, r3, lsl #1
	lsl	r3, r3, #2
	add	r3, r3, #25
	sub	r1, r1, r3
	str	r1, [r6, #44]
.L211:
	ldr	r0, .L245+16
	ldr	r3, .L245+20
	mov	lr, pc
	bx	r3
.L209:
	ldr	r6, .L245+24
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r4, #96
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L214
	mov	r3, #1
	cmp	r5, r3
	str	r3, [r6, #64]
	ldr	r1, [r6, #44]
	beq	.L241
	cmp	r5, #2
	beq	.L242
	cmp	r5, #3
	beq	.L243
	cmp	r5, #4
	bne	.L216
	ldr	r3, [r4, #120]
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #2
	add	r3, r3, #40
	sub	r1, r1, r3
	str	r1, [r6, #44]
	b	.L216
.L243:
	ldr	r3, [r4, #120]
	add	r3, r3, r3, lsl #1
	lsl	r3, r3, #2
	add	r3, r3, #25
	sub	r1, r1, r3
	str	r1, [r6, #44]
.L216:
	ldr	r0, .L245+28
	ldr	r3, .L245+20
	mov	lr, pc
	bx	r3
.L214:
	ldr	r3, .L245+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L198
	ldr	r0, .L245+36
	mov	r3, #0
	mov	r2, r0
.L221:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L244
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #36
	bne	.L221
.L198:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L234:
	ldr	r3, .L245+40
	ldr	r1, [r3]
	ldr	r6, .L245+4
	ldr	r3, .L245+44
	sub	r1, r1, #100
	ldr	r0, .L245+48
	mov	lr, pc
	bx	r3
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r4, #96
	ldm	r0, {r0, r1, r2, r3}
	ldr	r7, .L245+8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L201
	ldr	r3, [r4, #120]
	cmp	r5, #1
	ldr	r1, [r6, #44]
	lsleq	r3, r3, #1
	addne	r3, r3, r3, lsl #2
	addeq	r3, r3, #5
	addne	r3, r3, #10
	sub	r1, r1, r3
	str	r8, [r6, #64]
	str	r1, [r6, #44]
.L208:
	ldr	r0, .L245+52
	ldr	r3, .L245+20
	mov	lr, pc
	bx	r3
	b	.L201
.L236:
	ldr	r3, .L245+56
	ldr	r1, [r3]
	ldr	r6, .L245+4
	ldr	r3, .L245+44
	sub	r1, r1, #100
	ldr	r0, .L245+60
	mov	lr, pc
	bx	r3
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r4, #96
	ldm	r0, {r0, r1, r2, r3}
	ldr	r7, .L245+8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L201
	ldr	r3, [r4, #120]
	add	r3, r3, r3, lsl #2
	ldr	r1, [r6, #44]
	lsl	r3, r3, #2
	add	r3, r3, #40
	sub	r1, r1, r3
	str	r8, [r6, #64]
	str	r1, [r6, #44]
	b	.L208
.L244:
	mov	ip, #1
	ldr	r2, [r4, #8]
	ldr	lr, [r4, #4]
	add	r3, r3, r3, lsl #3
	add	r2, r2, #7
	str	r2, [r0, r3, lsl #2]
	add	r3, r0, r3, lsl #2
	str	r1, [r3, #16]
	str	lr, [r3, #4]
	str	ip, [r3, #24]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L241:
	ldr	r3, [r4, #120]
	lsl	r3, r3, #1
	add	r3, r3, #5
	sub	r1, r1, r3
	str	r1, [r6, #44]
	b	.L216
.L238:
	ldr	r3, [r4, #120]
	lsl	r3, r3, #1
	add	r3, r3, #5
	sub	r1, r1, r3
	str	r1, [r6, #44]
	b	.L211
.L235:
	ldr	r3, .L245+64
	ldr	r1, [r3]
	ldr	r6, .L245+4
	ldr	r3, .L245+44
	sub	r1, r1, #100
	ldr	r0, .L245+68
	mov	lr, pc
	bx	r3
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r4, #96
	ldm	r0, {r0, r1, r2, r3}
	ldr	r7, .L245+8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L201
	ldr	r3, [r4, #120]
	add	r3, r3, r3, lsl #1
	ldr	r1, [r6, #44]
	lsl	r3, r3, #2
	add	r3, r3, #25
	sub	r1, r1, r3
	str	r8, [r6, #64]
	str	r1, [r6, #44]
	b	.L208
.L239:
	ldr	r3, [r4, #120]
	add	r3, r3, r3, lsl #2
	add	r3, r3, #10
	sub	r1, r1, r3
	str	r1, [r6, #44]
	b	.L211
.L242:
	ldr	r3, [r4, #120]
	add	r3, r3, r3, lsl #2
	add	r3, r3, #10
	sub	r1, r1, r3
	str	r1, [r6, #44]
	b	.L216
.L237:
	str	r8, [r6, #64]
	ldr	r1, [r6, #44]
	b	.L208
.L246:
	.align	2
.L245:
	.word	player
	.word	driller
	.word	collision
	.word	baller
	.word	.LC1
	.word	mgba_printf
	.word	boss
	.word	.LC2
	.word	cheatActive
	.word	crescents
	.word	swordhit_length
	.word	playSoundB
	.word	swordhit_data
	.word	.LC0
	.word	swordstab_length
	.word	swordstab_data
	.word	swordtriplehit_length
	.word	swordtriplehit_data
	.size	attack, .-attack
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L414
	ldm	r4, {r2, r3}
	sub	sp, sp, #16
	add	r3, r3, #2
	add	r1, r2, #5
	add	r2, r2, #10
	str	r2, [r4, #96]
	str	r3, [r4, #12]
	str	r3, [r4, #100]
	str	r1, [r4, #8]
	bl	gravity
	mov	r3, #1
	ldr	r2, [r4, #112]
	cmp	r2, #0
	str	r3, [r4, #116]
	beq	.L248
	ldr	r6, .L414+4
	ldr	r5, [r6]
	cmp	r5, #29
	bgt	.L249
	cmp	r5, #7
	str	r3, [r4, #80]
	bgt	.L250
	bl	canMoveLeft
	cmp	r0, #0
	ldrne	r3, [r4]
	subne	r3, r3, #4
	strne	r3, [r4]
.L250:
	add	r5, r5, #1
	str	r5, [r6]
.L248:
	ldr	r7, .L414+8
	ldrh	r3, [r7]
	ldr	r6, .L414+12
	tst	r3, #1
	ldrh	r3, [r6]
	beq	.L251
	tst	r3, #1
	beq	.L404
.L251:
	tst	r3, #32
	and	r5, r3, #16
	bne	.L253
	bl	canMoveLeft
	cmp	r0, #0
	beq	.L254
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L254
	ldr	r3, [r4, #112]
	cmp	r3, #0
	bne	.L254
	mov	r1, #5
	ldr	r2, [r4]
	ldr	r0, [r4, #24]
	cmp	r5, #0
	sub	r2, r2, r0
	str	r3, [r4, #116]
	str	r2, [r4]
	str	r1, [r4, #40]
	bne	.L256
.L255:
	bl	canMoveRight
	cmp	r0, #0
	beq	.L260
.L257:
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L260
	ldr	r3, [r4, #112]
	cmp	r3, #0
	bne	.L260
	mov	r1, #5
	ldr	r2, [r4]
	ldr	r0, [r4, #24]
	add	r2, r2, r0
	str	r3, [r4, #116]
	str	r2, [r4]
	str	r1, [r4, #40]
	b	.L256
.L253:
	mov	r3, #1
	cmp	r5, #0
	str	r3, [r4, #116]
	beq	.L255
.L258:
	mov	r3, #1
	str	r3, [r4, #116]
.L256:
	ldrh	r3, [r7]
	tst	r3, #64
	beq	.L261
	ldrh	r2, [r6]
	tst	r2, #64
	bne	.L261
	ldr	r2, [r4, #56]
	cmp	r2, #0
	bne	.L405
.L261:
	tst	r3, #2
	ldr	r3, [r4, #84]
	beq	.L402
	ldrh	r2, [r6]
	tst	r2, #2
	bne	.L402
	cmp	r3, #0
	bne	.L406
	ldr	r1, [r4, #112]
	cmp	r1, #0
	beq	.L398
	ldr	r5, .L414+16
	ldr	r8, .L414+20
	b	.L265
.L254:
	mov	r3, #1
	cmp	r5, #0
	str	r3, [r4, #116]
	bne	.L256
	bl	canMoveRight
	cmp	r0, #0
	bne	.L257
	b	.L260
.L249:
	mov	r3, #0
	str	r3, [r6]
	str	r3, [r4, #112]
	str	r3, [r4, #80]
	b	.L248
.L404:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.L251
	ldr	r2, [r4, #76]
	cmp	r2, #0
	beq	.L251
	ldr	r5, [r4, #112]
	cmp	r5, #0
	bne	.L251
	ldr	r0, [r4, #72]
	add	r0, r0, #1
	str	r0, [r4, #72]
	bl	attack
	ldr	r3, [r4, #72]
	cmp	r3, #4
	streq	r5, [r4, #72]
	ldrh	r3, [r6]
	b	.L251
.L260:
	ldrh	r3, [r6]
	tst	r3, #32
	beq	.L256
	b	.L258
.L402:
	ldr	r8, .L414+20
.L262:
	cmp	r3, #0
	bne	.L271
	ldr	r5, .L414+16
.L265:
	mov	r3, #0
	str	r3, [r4, #84]
	str	r3, [r5]
.L276:
	ldr	r5, [r4, #56]
	cmp	r5, #0
	bne	.L312
	ldr	r7, [r4, #60]
	mov	r0, r7
	bl	canMoveUp
	subs	r6, r0, #0
	beq	.L278
	mov	r0, #1
	bl	canMoveUp
	cmp	r0, #0
	bne	.L407
.L278:
	cmp	r7, #0
	bgt	.L283
	b	.L312
.L282:
	bl	canMoveUp
	mov	r6, r0
.L283:
	cmp	r6, #0
	beq	.L280
	mov	r0, #3
	bl	canMoveUp
	cmp	r0, #0
	bne	.L408
.L280:
	add	r5, r5, #1
	cmp	r7, r5
	sub	r0, r7, r5
	bne	.L282
.L279:
	sub	r3, r7, #1
.L311:
	str	r3, [r4, #60]
.L312:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L285
	ldr	r2, [r4, #40]
	cmp	r2, #2
	ldr	r3, [r4, #68]
	ldr	r1, [r4, #76]
	bgt	.L286
	ldr	r2, [r4, #44]
	cmp	r2, #2
	beq	.L409
.L287:
	cmp	r1, #0
	addne	r3, r3, #1
	strne	r3, [r4, #68]
	cmp	r3, #30
	ble	.L285
	mov	r3, #0
	str	r3, [r4, #68]
	str	r3, [r4, #64]
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	r3, [r4, #72]
.L285:
	ldr	r3, [r4, #120]
	cmp	r3, #0
	beq	.L294
	ldr	r5, .L414+24
	ldr	r3, [r5]
	add	r3, r3, #1
	cmp	r3, #65
	str	r3, [r5]
	beq	.L410
	cmp	r3, #250
	beq	.L411
.L294:
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L298
	ldr	r2, .L414+24
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #400
	moveq	r3, #0
	strne	r3, [r2]
	streq	r3, [r2]
	streq	r3, [r8]
.L298:
	ldr	r2, [r4]
	cmp	r2, #0
	movlt	r3, #0
	ldr	r1, [r4, #4]
	movlt	r2, r3
	strlt	r3, [r4]
	cmp	r1, #0
	movlt	r3, #0
	movlt	r1, r3
	strlt	r3, [r4, #4]
	ldr	r3, [r4, #16]
	rsb	r3, r3, #1024
	cmp	r3, r2
	movlt	r2, r3
	strlt	r3, [r4]
	ldr	r3, [r4, #32]
	rsb	r3, r3, #256
	cmp	r3, r1
	strlt	r3, [r4, #4]
	ldr	r3, [r4, #28]
	ldr	r0, .L414+28
	add	r3, r3, r3, lsr #31
	add	r1, r2, r3, asr #1
	cmp	r1, #120
	ldr	r1, [r0]
	subgt	ip, r1, #27
	subgt	r2, r2, ip, lsl #8
	asr	r3, r3, #1
	ldrle	ip, .L414+32
	ldrgt	ip, .L414+32
	subgt	r2, r2, #120
	addgt	r3, r2, r3
	ldrle	r3, [ip]
	strgt	r3, [ip]
	cmp	r1, #30
	beq	.L412
	cmp	r3, #256
	ble	.L308
	mov	lr, #67108864
	add	r1, r1, #1
	lsl	r2, r1, #24
	orr	r2, r2, #1073741824
	orr	r2, r2, #262144
	lsr	r2, r2, #16
	sub	r3, r3, #256
	str	r1, [r0]
	str	r3, [ip]
	strh	r2, [lr, #10]	@ movhi
.L309:
	mov	r2, #67108864
	ldr	r1, [r4, #116]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	r1, #0
	strh	r3, [r2, #20]	@ movhi
	beq	.L247
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L247
	ldr	r3, [r4, #64]
	cmp	r3, #0
	streq	r3, [r4, #40]
.L247:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L406:
	ldr	r8, .L414+20
.L271:
	ldr	r5, .L414+16
	ldr	r6, [r5]
	cmp	r6, #29
	bgt	.L265
	cmp	r6, #7
	bgt	.L272
	ldr	r3, [r4, #88]
	cmp	r3, #0
	bne	.L413
	bl	canMoveLeft
	cmp	r0, #0
	beq	.L275
.L313:
	ldr	r3, [r4]
	sub	r3, r3, #4
	str	r3, [r4]
.L272:
	cmp	r6, #15
	movgt	r3, #0
	strgt	r3, [r4, #80]
.L275:
	add	r6, r6, #1
	str	r6, [r5]
	b	.L276
.L412:
	cmp	r3, #16
	movgt	r3, #16
	strgt	r3, [ip]
	bgt	.L309
.L308:
	cmp	r3, #0
	bgt	.L309
	mov	lr, #67108864
	sub	r1, r1, #1
	lsl	r2, r1, #24
	orr	r2, r2, #1073741824
	orr	r2, r2, #262144
	lsr	r2, r2, #16
	add	r3, r3, #256
	str	r1, [r0]
	str	r3, [ip]
	strh	r2, [lr, #10]	@ movhi
	b	.L309
.L286:
	cmp	r2, #3
	bne	.L290
	ldr	r2, [r4, #44]
	cmp	r2, #6
	bne	.L287
	add	r3, r3, #1
	cmp	r3, #5
	str	r3, [r4, #68]
	bne	.L287
	cmp	r1, #0
	strne	r2, [r4, #68]
	bne	.L285
.L291:
	mov	r3, #1
	str	r3, [r4, #76]
	str	r3, [r4, #68]
	b	.L285
.L407:
	ldr	r3, [r4, #4]
	cmp	r7, #0
	sub	r3, r3, r7
	str	r3, [r4, #4]
	ble	.L312
	b	.L279
.L405:
	ldr	r2, [r4, #76]
	cmp	r2, #0
	beq	.L261
	ldr	r2, [r4, #112]
	cmp	r2, #0
	moveq	r1, #10
	streq	r2, [r4, #56]
	streq	r1, [r4, #60]
	b	.L261
.L290:
	cmp	r2, #4
	bne	.L287
	ldr	r2, [r4, #44]
	cmp	r2, #6
	bne	.L287
	add	r3, r3, #1
	cmp	r3, #20
	str	r3, [r4, #68]
	bne	.L287
	cmp	r1, #0
	movne	r3, #21
	strne	r3, [r4, #68]
	bne	.L285
	b	.L291
.L409:
	add	r3, r3, #1
	cmp	r3, #5
	str	r3, [r4, #68]
	bne	.L287
	cmp	r1, #0
	movne	r3, #6
	strne	r3, [r4, #68]
	bne	.L285
	b	.L291
.L408:
	sub	r3, r7, #1
	cmp	r3, r5
	moveq	r3, #0
	ldr	r2, [r4, #4]
	sub	r7, r2, r7
	str	r7, [r4, #4]
	streq	r3, [r4, #60]
	bne	.L311
	b	.L312
.L410:
	ldr	r3, .L414+36
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	cmp	r3, #250
	bne	.L294
.L411:
	mov	ip, #0
	mov	lr, #1
	str	ip, [r5]
	mov	r3, #16384
	ldr	r5, .L414+40
	mov	r0, #3
	ldr	r2, .L414+44
	ldr	r1, .L414+48
	str	ip, [r4, #120]
	str	lr, [r8]
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L414+52
	mov	lr, pc
	bx	r5
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L414+56
	ldr	r1, .L414+60
	mov	lr, pc
	bx	r5
	b	.L294
.L398:
	mov	r5, #1
	mov	lr, #4096
	add	r3, r4, #16
	ldm	r3, {r3, ip}
	str	ip, [sp, #12]
	str	r3, [sp, #8]
	ldr	ip, [r4, #12]
	ldr	r3, [r4, #8]
	lsr	r2, r2, #4
	str	ip, [sp, #4]
	str	r3, [sp]
	ldr	r0, .L414+64
	ldr	ip, .L414+68
	eor	r2, r2, r5
	and	r2, r2, r5
	ldr	r3, [r0, #20]
	str	r2, [r4, #88]
	str	r1, [r4, #40]
	ldr	r2, [r0, #16]
	str	r1, [r4, #68]
	str	r1, [r4, #64]
	str	r1, [r4, #44]
	str	r1, [r4, #72]
	strh	lr, [ip, #4]	@ movhi
	ldm	r0, {r0, r1}
	ldr	r6, .L414+72
	str	r5, [r4, #84]
	str	r5, [r4, #80]
	str	r5, [r4, #76]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldr	r8, .L414+20
	beq	.L266
	ldr	r2, [r4, #120]
	ldr	r3, [r8]
	orrs	r2, r3, r2
	bne	.L266
	ldr	r3, .L414+76
	ldr	r3, [r3]
	sub	r3, r3, #120
	cmp	r3, #14
	bhi	.L266
	ldr	r3, .L414+80
	ldr	r1, [r3]
	ldr	r0, .L414+84
	sub	r1, r1, #200
	ldr	r3, .L414+88
	str	r5, [r4, #120]
	mov	lr, pc
	bx	r3
	ldr	r3, .L414+92
	mov	lr, pc
	bx	r3
	ldr	r5, .L414+40
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L414+44
	ldr	r1, .L414+96
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L414+100
	mov	lr, pc
	bx	r5
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L414+56
	ldr	r1, .L414+104
	mov	lr, pc
	bx	r5
.L266:
	ldr	r0, .L414+108
	ldr	ip, [r4, #16]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, [r4, #20]
	ldr	lr, [r4, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4, #8]
	str	r5, [sp, #12]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L267
	ldr	r3, .L414+112
	ldr	r3, [r3]
	sub	r3, r3, #100
	cmp	r3, #14
	bhi	.L267
	ldr	r3, [r8]
	ldr	r2, [r4, #120]
	orrs	r2, r3, r2
	bne	.L267
	mov	ip, #1
	ldr	r3, .L414+80
	ldr	r1, [r3]
	ldr	r0, .L414+84
	sub	r1, r1, #200
	ldr	r3, .L414+88
	str	ip, [r4, #120]
	mov	lr, pc
	bx	r3
	ldr	r3, .L414+92
	mov	lr, pc
	bx	r3
	ldr	r5, .L414+40
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L414+44
	ldr	r1, .L414+96
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L414+100
	mov	lr, pc
	bx	r5
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L414+56
	ldr	r1, .L414+104
	mov	lr, pc
	bx	r5
.L267:
	ldr	r0, .L414+116
	ldr	ip, [r4, #16]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, [r4, #20]
	ldr	lr, [r4, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4, #8]
	str	r5, [sp, #12]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L403
	ldr	r2, [r8]
	ldr	r3, [r4, #120]
	orrs	r3, r2, r3
	bne	.L403
	ldr	r3, .L414+120
	ldr	r3, [r3]
	sub	r1, r3, #150
	sub	r2, r3, #180
	cmp	r2, #14
	cmphi	r1, #14
	bls	.L270
	sub	r3, r3, #210
	cmp	r3, #14
	bhi	.L403
.L270:
	mov	ip, #1
	ldr	r3, .L414+80
	ldr	r1, [r3]
	mov	r2, #0
	sub	r1, r1, #200
	ldr	r3, .L414+88
	ldr	r0, .L414+84
	str	ip, [r4, #120]
	mov	lr, pc
	bx	r3
	ldr	r3, .L414+92
	mov	lr, pc
	bx	r3
	ldr	r5, .L414+40
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L414+44
	ldr	r1, .L414+96
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L414+100
	mov	lr, pc
	bx	r5
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L414+56
	ldr	r1, .L414+104
	mov	lr, pc
	bx	r5
.L403:
	ldr	r3, [r4, #84]
	b	.L262
.L413:
	bl	canMoveRight
	cmp	r0, #0
	beq	.L274
	ldr	r3, [r4]
	add	r3, r3, #4
	str	r3, [r4]
	ldr	r6, [r5]
	b	.L272
.L274:
	bl	canMoveLeft
	cmp	r0, #0
	ldr	r6, [r5]
	beq	.L272
	b	.L313
.L415:
	.align	2
.L414:
	.word	player
	.word	hitTime
	.word	oldButtons
	.word	buttons
	.word	dodgeTime
	.word	overdriveCooldown
	.word	overdriveTimer
	.word	screenBlock
	.word	hOff
	.word	unpauseA
	.word	DMANow
	.word	100679680
	.word	tilesetTiles
	.word	tilesetPal
	.word	83886112
	.word	foregroundPal+32
	.word	driller
	.word	shadowOAM
	.word	collision
	.word	drillerTimer
	.word	overdriven_length
	.word	overdriven_data
	.word	playSoundB
	.word	pauseA
	.word	tilesetinvertTiles
	.word	tilesetinvertPal
	.word	foregroundPal+64
	.word	baller
	.word	ballerTimer
	.word	boss
	.word	bossTimer
	.size	updatePlayer, .-updatePlayer
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Player Health: %d\000"
	.text
	.align	2
	.global	updateDriller
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDriller, %function
updateDriller:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L448
	push	{r4, r5, lr}
	ldr	r4, .L448+4
	ldr	ip, [r0]
	ldr	r2, [r0, #4]
	ldr	r1, [r4, #8]
	add	r3, r2, #8
	add	lr, ip, #13
	str	r3, [r0, #52]
	sub	r3, lr, r1
	add	r2, r2, #6
	cmp	r3, #240
	movgt	r1, #1
	str	r2, [r0, #12]
	str	ip, [r0, #48]
	str	lr, [r0, #8]
	sub	sp, sp, #20
	bgt	.L417
	sub	r1, r1, lr
	cmp	r1, #240
	movle	r1, #0
	movgt	r1, #1
.L417:
	ldr	r3, [r0, #44]
	cmp	r3, #0
	str	r1, [r0, #32]
	movle	r1, #1
	movle	r3, #0
	strle	r1, [r0, #32]
	ldr	r1, .L448+8
	strle	r3, [r0]
	strle	r3, [r0, #4]
	ldr	r3, [r0, #28]
	ldr	ip, [r1]
	add	r2, r2, r3
	add	r2, r2, #3
	add	r5, ip, lr
	ldrb	r1, [r5, r2, lsl #10]	@ zero_extendqisi2
	ldr	r3, [r0, #24]
	cmp	r1, #0
	add	r3, lr, r3
	lsl	r1, r2, #10
	sub	r3, r3, #1
	beq	.L419
	add	lr, ip, r3
	ldrb	r2, [lr, r2, lsl #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L419
	ldr	r3, [r0, #4]
	add	r3, r3, #4
	str	r3, [r0, #4]
.L420:
	ldr	r1, [r4, #120]
	ldr	r2, .L448+12
	cmp	r1, #0
	ldr	ip, .L448+16
	ldr	r3, [r2]
	beq	.L421
	ldr	r1, [ip]
	add	r1, r1, #1
	cmp	r1, #2
	str	r1, [ip]
	beq	.L446
.L422:
	sub	r1, r3, #80
	cmp	r1, #39
	movls	r3, #1
	strls	r3, [r0, #36]
	bls	.L416
	sub	r1, r3, #120
	cmp	r1, #14
	movls	r3, #1
	strls	r3, [r0, #40]
	bls	.L416
	sub	r1, r3, #135
	cmp	r1, #14
	bhi	.L426
	mov	r3, #2
	cmp	r1, #4
	str	r3, [r0, #40]
	bls	.L447
.L416:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L419:
	sub	r2, r1, #3072
	ldrb	r1, [r5, r2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L420
	add	r3, ip, r3
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r0, #4]
	addne	r3, r3, #1
	strne	r3, [r0, #4]
	b	.L420
.L421:
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [ip]
	b	.L422
.L446:
	mov	r1, #0
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [ip]
	b	.L422
.L426:
	cmp	r3, #149
	movgt	r3, #0
	strgt	r3, [r2]
	strgt	r3, [r0, #36]
	strgt	r3, [r0, #40]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L447:
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r0, #48
	ldm	r0, {r0, r1, r2, r3}
	ldr	r5, .L448+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L416
	ldr	r2, [r4, #112]
	ldr	r3, [r4, #80]
	orrs	r2, r2, r3
	bne	.L416
	mov	ip, #1
	ldr	r1, .L448+24
	ldr	r3, [r4, #92]
	ldr	r1, [r1]
	sub	r3, r3, #40
	str	r3, [r4, #92]
	sub	r1, r1, #100
	ldr	r3, .L448+28
	ldr	r0, .L448+32
	str	ip, [r4, #112]
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #92]
	ldr	r0, .L448+36
	ldr	r3, .L448+40
	mov	lr, pc
	bx	r3
	b	.L416
.L449:
	.align	2
.L448:
	.word	driller
	.word	player
	.word	collisionMap
	.word	drillerTimer
	.word	drillerCounter
	.word	collision
	.word	hitsound_length
	.word	playSoundB
	.word	hitsound_data
	.word	.LC3
	.word	mgba_printf
	.size	updateDriller, .-updateDriller
	.align	2
	.global	updateBaller
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBaller, %function
updateBaller:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L488
	push	{r4, r5, lr}
	ldr	r4, .L488+4
	ldr	ip, [r0]
	ldr	r1, [r4, #8]
	add	lr, ip, #10
	ldr	r2, [r0, #4]
	sub	r3, lr, r1
	cmp	r3, #240
	sub	ip, ip, #4
	add	r3, r2, #8
	add	r2, r2, #7
	movgt	r1, #1
	str	ip, [r0, #48]
	str	lr, [r0, #8]
	str	r3, [r0, #52]
	str	r2, [r0, #12]
	sub	sp, sp, #20
	bgt	.L451
	sub	r1, r1, lr
	cmp	r1, #240
	movle	r1, #0
	movgt	r1, #1
.L451:
	ldr	r3, [r0, #44]
	cmp	r3, #0
	str	r1, [r0, #32]
	movle	r1, #1
	movle	r3, #0
	strle	r1, [r0, #32]
	ldr	r1, .L488+8
	strle	r3, [r0]
	strle	r3, [r0, #4]
	ldr	r3, [r0, #28]
	ldr	ip, [r1]
	add	r2, r2, r3
	add	r2, r2, #3
	add	r5, ip, lr
	ldrb	r1, [r5, r2, lsl #10]	@ zero_extendqisi2
	ldr	r3, [r0, #24]
	cmp	r1, #0
	add	r3, lr, r3
	lsl	r1, r2, #10
	sub	r3, r3, #1
	beq	.L453
	add	lr, ip, r3
	ldrb	r2, [lr, r2, lsl #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L453
	ldr	r3, [r0, #4]
	add	r3, r3, #4
	str	r3, [r0, #4]
.L454:
	ldr	r1, [r4, #120]
	ldr	r2, .L488+12
	cmp	r1, #0
	ldr	ip, .L488+16
	ldr	r3, [r2]
	beq	.L455
	ldr	r1, [ip]
	add	r1, r1, #1
	cmp	r1, #2
	str	r1, [ip]
	beq	.L486
.L456:
	sub	r1, r3, #60
	cmp	r1, #39
	movls	r3, #1
	strls	r3, [r0, #40]
	bls	.L450
	sub	r1, r3, #100
	cmp	r1, #14
	movls	r3, #2
	strls	r3, [r0, #40]
	bls	.L450
	sub	r1, r3, #115
	cmp	r1, #14
	bhi	.L460
	ldr	r2, [r4, #8]
	ldr	r3, [r0, #8]
	sub	r3, r3, r2
	cmp	r3, #60
	ble	.L461
	ldr	r3, .L488+20
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L462
	ldr	r2, [r3, #56]
	cmp	r2, #0
	beq	.L465
	ldr	r2, [r3, #88]
	cmp	r2, #0
	beq	.L487
.L450:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L453:
	sub	r2, r1, #3072
	ldrb	r1, [r5, r2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L454
	add	r3, ip, r3
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r0, #4]
	addne	r3, r3, #1
	strne	r3, [r0, #4]
	b	.L454
.L455:
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [ip]
	b	.L456
.L486:
	mov	r1, #0
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [ip]
	b	.L456
.L460:
	cmp	r3, #159
	movgt	r3, #0
	strgt	r3, [r2]
	strgt	r3, [r0, #40]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L461:
	mov	r3, #3
	cmp	r1, #4
	str	r3, [r0, #40]
	bhi	.L450
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r3, [r4, #12]
	str	r2, [sp]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp, #4]
	add	r0, r0, #48
	ldm	r0, {r0, r1, r2, r3}
	ldr	r5, .L488+24
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L450
	ldr	r3, [r4, #112]
	ldr	r2, [r4, #80]
	orrs	r2, r3, r2
	bne	.L450
	mov	ip, #1
	ldr	r1, .L488+28
	ldr	r3, [r4, #92]
	ldr	r1, [r1]
	sub	r3, r3, #50
	str	r3, [r4, #92]
	sub	r1, r1, #100
	ldr	r3, .L488+32
	ldr	r0, .L488+36
	str	ip, [r4, #112]
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #92]
	ldr	r0, .L488+40
	ldr	r3, .L488+44
	mov	lr, pc
	bx	r3
	b	.L450
.L487:
	mov	r2, #2
.L462:
	mov	r4, #1
	mov	lr, #0
	ldr	ip, [r0]
	ldr	r1, [r0, #4]
	add	r0, ip, #8
	str	r0, [r3, r2, lsl #5]
	add	r1, r1, #20
	add	r3, r3, r2, lsl #5
	str	r1, [r3, #4]
	str	r4, [r3, #24]
	str	lr, [r3, #16]
	b	.L450
.L465:
	mov	r2, #1
	b	.L462
.L489:
	.align	2
.L488:
	.word	baller
	.word	player
	.word	collisionMap
	.word	ballerTimer
	.word	ballerCounter
	.word	bullets
	.word	collision
	.word	hitsound_length
	.word	playSoundB
	.word	hitsound_data
	.word	.LC3
	.word	mgba_printf
	.size	updateBaller, .-updateBaller
	.align	2
	.global	updateBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoss, %function
updateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L536
	push	{r4, r5, lr}
	ldr	r4, .L536+4
	ldr	ip, [r0]
	ldr	r2, [r0, #4]
	ldr	r1, [r4, #8]
	add	r3, r2, #11
	add	lr, ip, #31
	str	r3, [r0, #52]
	sub	r3, lr, r1
	add	r2, r2, #10
	cmp	r3, #240
	movgt	r1, #1
	str	r2, [r0, #12]
	str	ip, [r0, #48]
	str	lr, [r0, #8]
	sub	sp, sp, #20
	bgt	.L491
	sub	r1, r1, lr
	cmp	r1, #240
	movle	r1, #0
	movgt	r1, #1
.L491:
	ldr	r3, [r0, #44]
	cmp	r3, #0
	str	r1, [r0, #32]
	movle	r1, #1
	movle	r3, #0
	strle	r1, [r0, #32]
	ldr	r1, .L536+8
	strle	r3, [r0]
	strle	r3, [r0, #4]
	ldr	r3, [r0, #28]
	ldr	ip, [r1]
	add	r2, r2, r3
	add	r2, r2, #3
	add	r5, ip, lr
	ldrb	r1, [r5, r2, lsl #10]	@ zero_extendqisi2
	ldr	r3, [r0, #24]
	cmp	r1, #0
	add	r3, lr, r3
	lsl	r1, r2, #10
	sub	r3, r3, #1
	beq	.L493
	add	lr, ip, r3
	ldrb	r2, [lr, r2, lsl #10]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L493
	ldr	r3, [r0, #4]
	add	r3, r3, #4
	str	r3, [r0, #4]
.L494:
	ldr	r1, [r4, #120]
	ldr	r2, .L536+12
	cmp	r1, #0
	ldr	ip, .L536+16
	ldr	r3, [r2]
	beq	.L495
	ldr	r1, [ip]
	add	r1, r1, #1
	cmp	r1, #2
	str	r1, [ip]
	beq	.L532
.L496:
	sub	r1, r3, #100
	cmp	r1, #49
	bhi	.L497
.L533:
	mov	r2, #20
	mov	r3, #8
	str	r2, [r0, #36]
	str	r3, [r0, #40]
.L490:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L493:
	sub	r2, r1, #3072
	ldrb	r1, [r5, r2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L494
	add	r3, ip, r3
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r0, #4]
	addne	r3, r3, #1
	strne	r3, [r0, #4]
	b	.L494
.L495:
	add	r3, r3, #1
	str	r1, [ip]
	sub	r1, r3, #100
	cmp	r1, #49
	str	r3, [r2]
	bls	.L533
.L497:
	sub	r1, r3, #150
	cmp	r1, #14
	bhi	.L499
.L503:
	mov	r2, #20
	mov	r3, #16
	str	r2, [r0, #36]
	str	r3, [r0, #40]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L499:
	sub	r1, r3, #165
	cmp	r1, #14
	bls	.L534
	sub	r1, r3, #180
	cmp	r1, #14
	bls	.L503
	sub	r1, r3, #195
	cmp	r1, #14
	bls	.L535
	sub	r1, r3, #210
	cmp	r1, #14
	bls	.L503
	sub	r1, r3, #225
	cmp	r1, #14
	bhi	.L505
	mov	r2, #20
	mov	r3, #24
	cmp	r1, #4
	str	r2, [r0, #36]
	str	r3, [r0, #40]
	bhi	.L490
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r0, #48
	ldm	r0, {r0, r1, r2, r3}
	ldr	r5, .L536+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L490
	ldr	r2, [r4, #112]
	ldr	r3, [r4, #80]
	orrs	r3, r2, r3
	bne	.L490
	ldr	r2, .L536+24
	ldr	r3, [r4, #92]
	ldr	r1, [r2]
	mov	ip, #1
	mov	r2, #0
	sub	r3, r3, #30
	sub	r1, r1, #100
	b	.L531
.L532:
	mov	r1, #0
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [ip]
	b	.L496
.L534:
	mov	r2, #20
	mov	r3, #24
	cmp	r1, #4
	str	r2, [r0, #36]
	str	r3, [r0, #40]
	bhi	.L490
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r0, #48
	ldm	r0, {r0, r1, r2, r3}
	ldr	r5, .L536+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L490
	ldr	r2, [r4, #112]
	ldr	r3, [r4, #80]
	orrs	r2, r2, r3
	bne	.L490
.L530:
	mov	ip, #1
	ldr	r1, .L536+24
	ldr	r3, [r4, #92]
	ldr	r1, [r1]
	sub	r3, r3, #30
	sub	r1, r1, #100
.L531:
	str	r3, [r4, #92]
	ldr	r0, .L536+28
	ldr	r3, .L536+32
	str	ip, [r4, #112]
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #92]
	ldr	r0, .L536+36
	ldr	r3, .L536+40
	mov	lr, pc
	bx	r3
	b	.L490
.L535:
	mov	r2, #20
	mov	r3, #24
	cmp	r1, #4
	str	r2, [r0, #36]
	str	r3, [r0, #40]
	bhi	.L490
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r0, #48
	ldm	r0, {r0, r1, r2, r3}
	ldr	r5, .L536+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L490
	ldr	r3, [r4, #112]
	ldr	r2, [r4, #80]
	orrs	r2, r3, r2
	bne	.L490
	b	.L530
.L505:
	sub	r1, r3, #240
	cmp	r1, #59
	bhi	.L506
	mov	r2, #12
	mov	r3, #18
	str	r2, [r0, #36]
	str	r3, [r0, #40]
	b	.L490
.L506:
	cmp	r3, #300
	movge	r3, #0
	strge	r3, [r2]
	b	.L490
.L537:
	.align	2
.L536:
	.word	boss
	.word	player
	.word	collisionMap
	.word	bossTimer
	.word	bossCounter
	.word	collision
	.word	hitsound_length
	.word	hitsound_data
	.word	playSoundB
	.word	.LC3
	.word	mgba_printf
	.size	updateBoss, .-updateBoss
	.align	2
	.global	spawnBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnBullet, %function
spawnBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L549
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L539
	ldr	r2, [r3, #56]
	cmp	r2, #0
	beq	.L541
	ldr	r2, [r3, #88]
	cmp	r2, #0
	moveq	r2, #2
	bxne	lr
.L539:
	str	lr, [sp, #-4]!
	mov	ip, #0
	mov	lr, #1
	ldr	r1, .L549+4
	ldm	r1, {r0, r1}
	add	r0, r0, #8
	str	r0, [r3, r2, lsl #5]
	add	r1, r1, #20
	add	r3, r3, r2, lsl #5
	str	lr, [r3, #24]
	str	r1, [r3, #4]
	str	ip, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L541:
	mov	r2, #1
	b	.L539
.L550:
	.align	2
.L549:
	.word	bullets
	.word	baller
	.size	spawnBullet, .-spawnBullet
	.align	2
	.global	spawnCrescent
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnCrescent, %function
spawnCrescent:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L561
	mov	r3, #0
	mov	r2, r0
	b	.L554
.L552:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #36
	bxeq	lr
.L554:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L552
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	ip, .L561+4
	ldr	r2, [ip, #8]
	add	r3, r3, r3, lsl #3
	ldr	ip, [ip, #4]
	add	r2, r2, #7
	str	r2, [r0, r3, lsl #2]
	add	r3, r0, r3, lsl #2
	str	lr, [r3, #24]
	str	r1, [r3, #16]
	str	ip, [r3, #4]
	ldr	lr, [sp], #4
	bx	lr
.L562:
	.align	2
.L561:
	.word	crescents
	.word	player
	.size	spawnCrescent, .-spawnCrescent
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #16
	beq	.L564
	ldr	r5, .L589
	ldr	r0, [r0]
	ldr	r3, [r5, #8]
	sub	r2, r0, r3
	cmp	r2, #240
	movgt	r2, #1
	ble	.L585
	ldr	r1, [r5, #120]
	cmp	r1, #0
	str	r2, [r4, #16]
	bne	.L586
.L566:
	ldr	r2, [r4, #20]
	sub	r0, r0, r2
	str	r0, [r4]
.L567:
	add	r1, r5, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r5, #12]
	str	r3, [sp]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	ldr	r6, .L589+4
	ldmib	r4, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L568
	ldr	r2, [r5, #112]
	ldr	r3, [r5, #80]
	orrs	r2, r2, r3
	beq	.L587
.L568:
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L569
	ldr	r3, [r5, #84]
	cmp	r3, #0
	beq	.L569
	ldr	r3, [r5, #80]
	cmp	r3, #0
	beq	.L569
	ldr	r2, .L589+8
	ldr	r3, [r5, #120]
	ldr	r2, [r2]
	orrs	r2, r2, r3
	beq	.L588
.L569:
	ldr	r3, .L589+12
	ldr	r1, [r4, #4]
	ldr	r3, [r3]
	ldr	r2, [r4]
	add	r3, r3, r1, lsl #10
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	streq	r3, [r4, #24]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L564:
	mov	r2, #1
	str	r3, [r0]
	str	r3, [r0, #4]
	str	r2, [r0, #16]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L586:
	ldr	r2, [r4, #28]
	add	r2, r2, #1
	cmp	r2, #2
	str	r2, [r4, #28]
	bne	.L567
	mov	r2, #0
	ldr	r1, [r4, #20]
	sub	r0, r0, r1
	str	r0, [r4]
	str	r2, [r4, #28]
	b	.L567
.L585:
	sub	r2, r3, r0
	cmp	r2, #240
	movle	r2, #0
	movgt	r2, #1
	ldr	r1, [r5, #120]
	cmp	r1, #0
	str	r2, [r4, #16]
	beq	.L566
	b	.L586
.L587:
	mov	ip, #1
	ldr	r1, .L589+16
	ldr	r3, [r5, #92]
	ldr	r1, [r1]
	sub	r3, r3, #20
	str	r3, [r5, #92]
	sub	r1, r1, #100
	ldr	r3, .L589+20
	ldr	r0, .L589+24
	str	ip, [r5, #112]
	mov	lr, pc
	bx	r3
	ldr	r1, [r5, #92]
	ldr	r0, .L589+28
	ldr	r3, .L589+32
	mov	lr, pc
	bx	r3
	b	.L569
.L588:
	mov	ip, #1
	ldr	r3, .L589+36
	ldr	r1, [r3]
	ldr	r0, .L589+40
	sub	r1, r1, #200
	ldr	r3, .L589+20
	str	ip, [r5, #120]
	mov	lr, pc
	bx	r3
	ldr	r3, .L589+44
	mov	lr, pc
	bx	r3
	ldr	r5, .L589+48
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L589+52
	ldr	r1, .L589+56
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L589+60
	mov	lr, pc
	bx	r5
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L589+64
	ldr	r1, .L589+68
	mov	lr, pc
	bx	r5
	b	.L569
.L590:
	.align	2
.L589:
	.word	player
	.word	collision
	.word	overdriveCooldown
	.word	collisionMap
	.word	hitsound_length
	.word	playSoundB
	.word	hitsound_data
	.word	.LC3
	.word	mgba_printf
	.word	overdriven_length
	.word	overdriven_data
	.word	pauseA
	.word	DMANow
	.word	100679680
	.word	tilesetinvertTiles
	.word	tilesetinvertPal
	.word	83886112
	.word	foregroundPal+64
	.size	updateBullets, .-updateBullets
	.align	2
	.global	updateCrescents
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCrescents, %function
updateCrescents:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #24]
	cmp	r2, #0
	bne	updateCrescents.part.0
.L592:
	mov	r1, #1
	str	r2, [r0]
	str	r2, [r0, #4]
	str	r1, [r0, #16]
	bx	lr
	.size	updateCrescents, .-updateCrescents
	.align	2
	.global	updateLasers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLasers, %function
updateLasers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L619
	mov	r4, r0
	ldr	r2, [r5, #8]
	ldr	r0, [r0]
	sub	r3, r0, r2
	cmp	r3, #240
	movgt	r3, #1
	sub	sp, sp, #16
	bgt	.L594
	sub	r3, r2, r0
	cmp	r3, #240
	movle	r3, #0
	movgt	r3, #1
.L594:
	ldr	r1, [r5, #120]
	str	r3, [r4, #24]
	ldr	r3, [r4, #16]
	cmp	r1, #0
	addeq	r3, r3, #1
	streq	r3, [r4, #16]
	beq	.L596
	ldr	r1, [r4, #28]
	add	r1, r1, #1
	cmp	r1, #2
	str	r1, [r4, #28]
	moveq	r1, #0
	addeq	r3, r3, #1
	streq	r3, [r4, #16]
	streq	r1, [r4, #28]
.L596:
	cmp	r3, #10
	movle	r3, #0
	strle	r3, [r4, #20]
	ble	.L593
	sub	r1, r3, #11
	cmp	r1, #9
	movls	r3, #1
	strls	r3, [r4, #20]
	bls	.L593
	sub	r1, r3, #21
	cmp	r1, #9
	movls	r3, #2
	strls	r3, [r4, #20]
	bls	.L593
	sub	r3, r3, #31
	cmp	r3, #19
	movhi	r3, #0
	strhi	r3, [r4, #16]
	bls	.L617
.L593:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L617:
	mov	lr, #3
	add	r1, r5, #16
	ldm	r1, {r1, ip}
	ldr	r3, [r5, #12]
	str	r2, [sp]
	str	lr, [r4, #20]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp, #4]
	ldr	r6, .L619+4
	ldmib	r4, {r1, r2, r3}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L602
	ldr	r2, [r5, #112]
	ldr	r3, [r5, #80]
	orrs	r2, r2, r3
	beq	.L618
.L602:
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L593
	ldr	r3, [r5, #84]
	cmp	r3, #0
	beq	.L593
	ldr	r3, [r5, #80]
	cmp	r3, #0
	beq	.L593
	ldr	r3, .L619+8
	ldr	r2, [r5, #120]
	ldr	r3, [r3]
	orrs	r2, r3, r2
	bne	.L593
	mov	ip, #1
	ldr	r3, .L619+12
	ldr	r1, [r3]
	ldr	r0, .L619+16
	sub	r1, r1, #200
	ldr	r3, .L619+20
	str	ip, [r5, #120]
	mov	lr, pc
	bx	r3
	ldr	r3, .L619+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L619+28
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L619+32
	ldr	r1, .L619+36
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L619+40
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L619+44
	ldr	r1, .L619+48
	mov	lr, pc
	bx	r4
	b	.L593
.L618:
	mov	ip, #1
	ldr	r1, .L619+52
	ldr	r3, [r5, #92]
	ldr	r1, [r1]
	sub	r3, r3, #70
	str	r3, [r5, #92]
	sub	r1, r1, #100
	ldr	r3, .L619+20
	ldr	r0, .L619+56
	str	ip, [r5, #112]
	mov	lr, pc
	bx	r3
	ldr	r1, [r5, #92]
	ldr	r0, .L619+60
	ldr	r3, .L619+64
	mov	lr, pc
	bx	r3
	b	.L593
.L620:
	.align	2
.L619:
	.word	player
	.word	collision
	.word	overdriveCooldown
	.word	overdriven_length
	.word	overdriven_data
	.word	playSoundB
	.word	pauseA
	.word	DMANow
	.word	100679680
	.word	tilesetinvertTiles
	.word	tilesetinvertPal
	.word	83886112
	.word	foregroundPal+64
	.word	hitsound_length
	.word	hitsound_data
	.word	.LC3
	.word	mgba_printf
	.size	updateLasers, .-updateLasers
	.align	2
	.global	updateBlade
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBlade, %function
updateBlade:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L630
	ldr	r0, [r3, #20]
	ldr	r1, [r3, #16]
	ldr	r2, [r3, #12]
	ldr	r3, [r3, #8]
	sub	sp, sp, #20
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r4, .L630+4
	ldr	r5, .L630+8
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L621
	ldr	r3, .L630+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L621
	mov	r3, #1
	ldr	r2, .L630+16
	ldr	r0, .L630+20
	ldr	r1, .L630+24
	ldr	ip, .L630+28
	strh	r0, [r2, #120]	@ movhi
	strh	r1, [r2, #184]	@ movhi
	ldr	r2, [ip]
	cmp	r2, #0
	str	r3, [r4, #32]
	str	r3, [r4, #16]
	beq	.L629
.L621:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L629:
	ldr	r1, .L630+32
	ldr	r1, [r1]
	ldr	r4, .L630+36
	sub	r1, r1, #100
	ldr	r0, .L630+40
	str	r3, [ip]
	mov	lr, pc
	bx	r4
	b	.L621
.L631:
	.align	2
.L630:
	.word	player
	.word	blade
	.word	collision
	.word	cheatActive
	.word	100726784
	.word	4108
	.word	4109
	.word	demonMode
	.word	demonmode_length
	.word	playSoundB
	.word	demonmode_data
	.size	updateBlade, .-updateBlade
	.align	2
	.global	updateHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHealth, %function
updateHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L638
	ldr	r1, .L638+4
	ldr	r2, [r3, #16]
	ldr	r1, [r1, #92]
	cmp	r2, r1
	movle	r2, #0
	ldr	r0, [r3]
	strle	r2, [r3, #20]
	ble	.L634
	ldr	ip, [r3, #20]
	add	ip, ip, #1
	tst	ip, #1
	str	ip, [r3, #20]
	bne	.L634
	sub	r1, r2, r1
	cmp	r1, #40
	ble	.L635
	sub	r2, r2, #6
	sub	r0, r0, #3
	str	r2, [r3, #16]
	str	r0, [r3]
.L634:
	cmn	r0, #49
	movlt	r2, #1
	strlt	r2, [r3, #24]
	bx	lr
.L635:
	cmp	r1, #20
	subgt	r2, r2, #4
	subgt	r0, r0, #2
	suble	r2, r2, #2
	suble	r0, r0, #1
	str	r2, [r3, #16]
	str	r0, [r3]
	b	.L634
.L639:
	.align	2
.L638:
	.word	health
	.word	player
	.size	updateHealth, .-updateHealth
	.align	2
	.global	updateEnemyHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyHealth, %function
updateEnemyHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L714
	ldr	r2, [r0]
	cmp	r2, #0
	push	{r4, r5, r6, lr}
	bne	.L641
	ldr	r3, .L714+4
	ldr	ip, .L714+8
	ldr	r1, [r3, #16]
	ldr	ip, [ip, #44]
	cmp	r1, ip
	bgt	.L708
	str	r2, [r3, #20]
.L649:
	ldr	r1, .L714+12
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L640
	ldr	ip, .L714+16
	ldr	r3, [ip]
	cmp	r3, #1
	ble	.L706
.L640:
	pop	{r4, r5, r6, lr}
	bx	lr
.L708:
	ldr	lr, [r3, #20]
	add	lr, lr, #1
	tst	lr, #1
	str	lr, [r3, #20]
	bne	.L649
	ldr	lr, .L714+20
	sub	r6, r1, ip
	cmp	r6, #40
	ldr	r4, [lr]
	ldr	r5, [r3]
	ble	.L644
	sub	r1, r1, #9
	add	r5, r5, #3
	add	r4, r4, #3
	str	r1, [r3, #16]
	str	r5, [r3]
	str	r4, [lr]
.L645:
	cmp	r4, #239
	movgt	r4, #1
	movle	r4, #0
	cmp	ip, #0
	movgt	r4, #0
	cmp	r4, #0
	beq	.L649
	mov	lr, #0
	mov	r2, #1
	ldr	r1, .L714+12
	ldr	ip, [r1]
	cmp	ip, lr
	ldr	ip, .L714+16
	str	r2, [r0]
	str	lr, [r3, #20]
	ldr	r0, [ip]
	beq	.L647
.L648:
	cmp	r0, #1
	ble	.L706
.L672:
	ldr	r0, [ip]
.L660:
	cmp	r0, #1
	bls	.L640
	ldr	r3, .L714+4
	ldr	r1, .L714+24
	ldr	r2, [r3, #16]
	ldr	r0, [r1, #44]
	cmp	r2, r0
	ble	.L665
	ldr	r1, [r3, #20]
	add	r1, r1, #1
	tst	r1, #1
	str	r1, [r3, #20]
	bne	.L640
	ldr	lr, .L714+20
	sub	r4, r2, r0
	cmp	r4, #40
	ldr	r1, [lr]
	ldr	ip, [r3]
	ble	.L666
	sub	r2, r2, #30
	add	ip, ip, #3
	add	r1, r1, #3
	str	r2, [r3, #16]
	str	ip, [r3]
	str	r1, [lr]
.L667:
	cmp	r1, #239
	bgt	.L709
	cmp	r0, #0
	movle	r2, #240
	strle	r2, [lr]
	strle	r2, [r3]
	b	.L640
.L641:
	ldr	ip, .L714+16
	ldr	r0, [ip]
	cmp	r0, #0
	ble	.L710
	ldr	r1, .L714+12
	ldr	r3, [r1]
	cmp	r3, #0
	bne	.L648
.L674:
	ldr	r3, .L714+4
	ldr	ip, .L714+28
	ldr	r2, [r3, #16]
	ldr	lr, [ip, #44]
	cmp	r2, lr
	ble	.L665
	ldr	ip, [r3, #20]
	add	ip, ip, #1
	tst	ip, #1
	str	ip, [r3, #20]
	bne	.L640
	ldr	r5, .L714+20
	sub	r6, r2, lr
	cmp	r6, #40
	ldr	ip, [r5]
	ldr	r4, [r3]
	ble	.L657
	sub	r2, r2, #9
	add	r4, r4, #3
	add	ip, ip, #3
	str	r2, [r3, #16]
	str	r4, [r3]
	str	ip, [r5]
.L658:
	cmp	ip, #239
	movgt	ip, #1
	movle	ip, #0
	cmp	lr, #0
	movgt	ip, #0
	cmp	ip, #0
	beq	.L640
	mov	ip, #1
	mov	r2, #0
	str	ip, [r1]
	str	r2, [r3, #20]
	b	.L660
.L710:
	ldr	lr, .L714+20
	ldr	r3, [lr, #20]
	cmp	r3, #100
	addne	r3, r3, #1
	strne	r3, [lr, #20]
	beq	.L711
.L653:
	ldr	r1, .L714+12
	ldr	r3, [r1]
	cmp	r3, #0
	bne	.L671
.L647:
	cmp	r0, #0
	bne	.L674
	pop	{r4, r5, r6, lr}
	bx	lr
.L706:
	ldr	lr, .L714+20
.L671:
	ldr	r3, [lr, #20]
	cmp	r3, #50
	beq	.L712
.L662:
	add	r3, r3, #1
	str	r3, [lr, #20]
.L664:
	cmp	r2, #0
	beq	.L640
	ldr	r3, [r1]
	cmp	r3, #0
	bne	.L672
	b	.L640
.L711:
	ldr	r3, [lr]
	cmp	r3, #160
	bgt	.L713
	mov	r0, #0
	mov	r5, #1
	ldr	r1, .L714+12
	ldr	r4, .L714+28
	ldr	r3, [r1]
	ldr	r4, [r4, #44]
	cmp	r3, r0
	ldr	r3, .L714+4
	str	r5, [ip]
	str	r4, [r3, #16]
	str	r0, [lr, #20]
	beq	.L665
	mov	r3, r0
	b	.L662
.L709:
	cmp	r0, #0
	bgt	.L640
.L665:
	mov	r2, #0
	pop	{r4, r5, r6, lr}
	str	r2, [r3, #20]
	bx	lr
.L644:
	cmp	r6, #20
	subgt	r1, r1, #6
	addgt	r5, r5, #2
	addgt	r4, r4, #2
	suble	r1, r1, #3
	addle	r5, r5, #1
	addle	r4, r4, #1
	str	r1, [r3, #16]
	str	r5, [r3]
	str	r4, [lr]
	b	.L645
.L712:
	ldr	r3, [lr]
	cmp	r3, #140
	ble	.L663
	ldr	r4, .L714+4
	ldr	r0, [r4]
	sub	r3, r3, #1
	sub	r0, r0, #1
	str	r3, [lr]
	str	r0, [r4]
	b	.L664
.L713:
	ldr	r4, .L714+4
	ldr	r1, [r4]
	sub	r3, r3, #1
	sub	r1, r1, #1
	str	r3, [lr]
	str	r1, [r4]
	b	.L653
.L663:
	mov	r5, #2
	mov	r3, #0
	ldr	r4, .L714+24
	ldr	r0, .L714+4
	ldr	r4, [r4, #44]
	str	r5, [ip]
	str	r4, [r0, #16]
	str	r3, [lr, #20]
	b	.L664
.L657:
	cmp	r6, #20
	subgt	r2, r2, #6
	addgt	r4, r4, #2
	addgt	ip, ip, #2
	suble	r2, r2, #3
	addle	r4, r4, #1
	addle	ip, ip, #1
	str	r2, [r3, #16]
	str	r4, [r3]
	str	ip, [r5]
	b	.L658
.L666:
	cmp	r4, #20
	subgt	r2, r2, #20
	addgt	ip, ip, #2
	addgt	r1, r1, #2
	suble	r2, r2, #10
	addle	ip, ip, #1
	addle	r1, r1, #1
	str	r2, [r3, #16]
	str	ip, [r3]
	str	r1, [lr]
	b	.L667
.L715:
	.align	2
.L714:
	.word	drillerDead
	.word	lowerHealth
	.word	driller
	.word	ballerDead
	.word	regenBar
	.word	upperHealth
	.word	boss
	.word	baller
	.size	updateEnemyHealth, .-updateEnemyHealth
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L742
	ldr	r4, .L742+4
	ldr	r1, [r2]
	ldr	r3, [r4, #40]
	cmp	r3, r1
	beq	.L739
	mov	r1, #0
	str	r3, [r2]
	str	r1, [r4, #44]
	str	r1, [r4, #36]
.L716:
	pop	{r4, lr}
	bx	lr
.L739:
	cmp	r3, #0
	beq	.L740
	cmp	r3, #5
	beq	.L741
	cmp	r3, #1
	beq	.L736
	cmp	r3, #2
	beq	.L736
	cmp	r3, #3
	beq	.L738
	cmp	r3, #4
	bne	.L716
.L738:
	ldr	r3, [r4, #36]
	cmp	r3, #2
	add	r3, r3, #1
	bne	.L732
	mov	r2, #0
	ldr	r3, [r4, #44]
	cmp	r3, #5
	str	r2, [r4, #36]
	bgt	.L716
.L733:
	add	r3, r3, #1
	str	r3, [r4, #44]
	b	.L716
.L740:
	ldr	r2, [r4, #36]
	cmp	r2, #9
	add	r2, r2, #1
	strne	r2, [r4, #36]
	bne	.L716
	ldr	r0, [r4, #44]
	ldr	r2, .L742+8
	ldr	r1, [r4, #48]
	str	r3, [r4, #36]
	add	r0, r0, #1
	mov	lr, pc
	bx	r2
	str	r1, [r4, #44]
	b	.L716
.L736:
	ldr	r3, [r4, #36]
	cmp	r3, #2
	add	r3, r3, #1
	beq	.L727
.L732:
	str	r3, [r4, #36]
	b	.L716
.L741:
	ldr	r3, [r4, #36]
	cmp	r3, #3
	add	r3, r3, #1
	bne	.L732
	mov	r2, #0
	ldr	r0, [r4, #44]
	ldr	r3, .L742+8
	ldr	r1, [r4, #48]
	str	r2, [r4, #36]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
	b	.L716
.L727:
	mov	r2, #0
	ldr	r3, [r4, #44]
	cmp	r3, #1
	str	r2, [r4, #36]
	bgt	.L716
	b	.L733
.L743:
	.align	2
.L742:
	.word	oldAni
	.word	player
	.word	__aeabi_idivmod
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	animateFlame
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateFlame, %function
animateFlame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L748
	ldr	r4, .L748+4
	ldr	r2, [r2, #8]
	ldr	r3, [r4]
	sub	r3, r3, r2
	cmp	r3, #240
	movle	r3, #0
	movgt	r3, #1
	ldr	r2, [r4, #28]
	cmp	r2, #4
	str	r3, [r4, #16]
	beq	.L745
	add	r2, r2, #1
	str	r2, [r4, #28]
	pop	{r4, lr}
	bx	lr
.L745:
	mov	r2, #0
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #24]
	str	r2, [r4, #28]
	ldr	r3, .L748+8
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #20]
	pop	{r4, lr}
	bx	lr
.L749:
	.align	2
.L748:
	.word	player
	.word	flame
	.word	__aeabi_idivmod
	.size	animateFlame, .-animateFlame
	.align	2
	.global	animateBlade
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBlade, %function
animateBlade:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L760
	ldr	r4, .L760+4
	ldr	r3, [r3, #8]
	ldr	r2, [r4]
	sub	r1, r2, r3
	cmp	r1, #240
	bgt	.L751
	sub	r3, r3, r2
	cmp	r3, #240
	ble	.L752
.L751:
	mov	r3, #1
	str	r3, [r4, #16]
.L753:
	ldr	r3, [r4, #28]
	cmp	r3, #4
	add	r3, r3, #1
	strne	r3, [r4, #28]
	bne	.L750
	mov	r2, #0
	ldr	r0, [r4, #20]
	ldr	r3, .L760+8
	ldr	r1, [r4, #24]
	str	r2, [r4, #28]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #20]
.L750:
	pop	{r4, lr}
	bx	lr
.L752:
	ldr	r3, .L760+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L753
	ldr	r3, [r4, #32]
	cmp	r3, #0
	streq	r3, [r4, #16]
	b	.L753
.L761:
	.align	2
.L760:
	.word	player
	.word	blade
	.word	__aeabi_idivmod
	.word	cheatActive
	.size	animateBlade, .-animateBlade
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r7, .L785
	ldr	r3, .L785+4
	ldr	r2, [r7, #120]
	sub	sp, sp, #20
	str	r2, [r3]
	bl	updatePlayer
	bl	animatePlayer
	bl	animateFlame
	bl	updateDriller
	bl	updateBaller
	bl	updateBlade
	bl	animateBlade
	bl	updateHealth
	bl	updateEnemyHealth
	bl	updateBoss
	ldr	r0, .L785+8
	bl	updateBullets
	ldr	r4, .L785+12
	ldr	r0, .L785+16
	bl	updateBullets
	ldr	r0, .L785+20
	bl	updateBullets
	mov	r6, #1
	add	r5, r4, #360
	b	.L765
.L782:
	mov	r0, r4
	add	r4, r4, #36
	bl	updateCrescents.part.0
	cmp	r4, r5
	beq	.L781
.L765:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L782
	str	r6, [r4, #16]
	str	r3, [r4]
	str	r3, [r4, #4]
	add	r4, r4, #36
	cmp	r4, r5
	bne	.L765
.L781:
	ldr	r4, .L785+24
	add	r5, r4, #256
.L766:
	mov	r0, r4
	add	r4, r4, #32
	bl	updateLasers
	cmp	r4, r5
	bne	.L766
	ldr	r3, [r7, #92]
	cmp	r3, #0
	ble	.L783
.L767:
	ldr	r3, .L785+28
	ldr	r3, [r3, #44]
	cmp	r3, #0
	ble	.L784
.L768:
	ldr	r3, .L785+32
	ldrh	r3, [r3]
	tst	r3, #768
	bne	.L762
	ldr	r2, .L785+36
	ldr	r3, [r2]
	cmp	r3, #0
	moveq	r0, #1
	ldreq	r1, .L785+40
	streq	r0, [r2]
	streq	r3, [r1, #16]
.L762:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L783:
	ldr	r3, .L785+44
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L767
	mov	r2, #1
	ldr	r3, .L785+48
	str	r2, [r3]
	b	.L768
.L784:
	ldr	r3, .L785+52
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r7, #8
	ldm	r0, {r0, r1, r2, r3}
	ldr	r4, .L785+56
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L785+60
	strne	r2, [r3]
	b	.L768
.L786:
	.align	2
.L785:
	.word	player
	.word	overdriving
	.word	bullets
	.word	crescents
	.word	bullets+32
	.word	bullets+64
	.word	lasers
	.word	driller
	.word	buttons
	.word	cheatActive
	.word	blade
	.word	health
	.word	loseState
	.word	flame
	.word	collision
	.word	winState
	.size	updateGame, .-updateGame
	.comm	boss,72,4
	.comm	lowerHealth,24,4
	.comm	upperHealth,28,4
	.comm	health,28,4
	.comm	song,12,4
	.comm	blade,36,4
	.comm	lasers,256,4
	.comm	crescents,360,4
	.comm	bullets,96,4
	.comm	baller,72,4
	.comm	flame,32,4
	.comm	driller,72,4
	.comm	player,124,4
	.comm	collisionMap,4,4
	.comm	overdriving,4,4
	.comm	demonMode,4,4
	.comm	cheatActive,4,4
	.comm	regenBar,4,4
	.comm	ballerDead,4,4
	.comm	drillerDead,4,4
	.comm	screenBlock,4,4
	.comm	loseState,4,4
	.comm	winState,4,4
	.comm	bossCounter,4,4
	.comm	ballerCounter,4,4
	.comm	drillerCounter,4,4
	.comm	overdriveCooldown,4,4
	.comm	overdriveTimer,4,4
	.comm	bossTimer,4,4
	.comm	ballerTimer,4,4
	.comm	drillerTimer,4,4
	.comm	hitTime,4,4
	.comm	dodgeTime,4,4
	.comm	oldAni,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
