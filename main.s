	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"main.c"
	.text
	.align	2
	.type	lose.part.2, %function
lose.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, #0
	ldr	r2, .L3
	sub	sp, sp, #84
	mov	r0, #31744
	ldr	r3, .L3+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	ip, sp
	ldr	lr, .L3+8
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2}
	ldr	r5, .L3+12
	strh	r3, [ip]	@ movhi
	mov	r2, sp
	mov	r1, r4
	ldr	r3, .L3+16
	mov	r0, #5
	mov	lr, pc
	bx	r5
	add	sp, sp, #84
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	state
	.word	fillScreen
	.word	.LC1
	.word	drawString
	.word	32767
	.size	lose.part.2, .-lose.part.2
	.set	pause.part.0,lose.part.2
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L18
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L6
	ldr	r2, .L18+4
	ldr	r0, [r2]
	ands	r0, r0, #8
	beq	.L16
.L6:
	tst	r3, #4
	beq	.L5
	ldr	r3, .L18+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L17
.L5:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L17:
	ldmfd	sp!, {r4, lr}
	b	pause.part.0
.L16:
	ldr	r3, .L18+8
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L18+12
	ldr	r3, [r4]
	str	r1, [r2]
	b	.L6
.L19:
	.align	2
.L18:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.size	pause, .-pause
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L25
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L25+4
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	lose.part.2
.L26:
	.align	2
.L25:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	stmfd	sp!, {r4, r5, lr}
	mov	r4, #0
	ldr	r1, .L30
	ldr	r2, .L30+4
	sub	sp, sp, #84
	strh	r1, [r3]	@ movhi
	mov	r0, #31744
	ldr	r3, .L30+8
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	ip, sp
	ldr	lr, .L30+12
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2}
	ldr	r5, .L30+16
	strh	r3, [ip]	@ movhi
	mov	r2, sp
	mov	r1, r4
	ldr	r3, .L30+20
	mov	r0, #5
	mov	lr, pc
	bx	r5
	add	sp, sp, #84
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	1027
	.word	state
	.word	fillScreen
	.word	.LC1
	.word	drawString
	.word	32767
	.size	initialize, .-initialize
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, #0
	sub	sp, sp, #20
	mov	r0, #0
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	mov	r3, #70
	mov	ip, #10
	mov	r5, #120
	mov	r6, #1
	mov	r0, #80
	mov	r1, #5
	mov	lr, #40
	ldr	r2, .L44+4
	str	r4, [r2]
	ldr	r2, .L44+8
	str	r4, [r2]
	ldr	r2, .L44+12
	str	r3, [r2, #8]
	ldr	r3, .L44+16
	str	ip, [r2, #12]
	ldr	ip, .L44+20
	str	r4, [r2]
	str	r4, [r2, #16]
	str	r4, [r2, #24]
	str	r5, [r2, #4]
	str	r5, [r2, #20]
	str	r5, [r3, #4]
	str	r5, [r3, #24]
	str	r1, [r3, #16]
	str	r0, [r3]
	str	r0, [r3, #20]
	str	r6, [r3, #8]
	str	r6, [r3, #12]
	mov	r2, #14
	ldr	r1, .L44+24
	mov	r0, sp
	ldr	r3, .L44+28
	str	lr, [ip]
	mov	r7, r4
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	ip, r5
	mov	r4, #8
	mov	r5, #20
	mov	lr, r6
	ldr	r8, .L44+32
	ldr	r6, .L44+36
.L33:
	mov	r1, #20
	add	r3, r0, r0, lsl #2
	add	r3, r0, r3, lsl #1
	add	r3, r8, r3, lsl #2
	add	r3, r3, #32
.L35:
	smull	r9, r2, r6, r1
	mov	r9, r1, asr #31
	add	r2, r2, r1
	rsb	r2, r9, r2, asr #2
	rsb	r2, r2, r2, lsl #3
	rsb	r2, r2, r1
	add	r9, sp, #16
	add	r2, r9, r2, lsl #1
	add	r0, r0, #1
	ldrh	r2, [r2, #-16]
	cmp	r0, #40
	str	r1, [r3, #-28]
	str	r1, [r3, #-20]
	str	lr, [r3]
	str	r7, [r3, #8]
	str	ip, [r3, #-32]
	str	r5, [r3, #-12]
	str	r4, [r3, #-16]
	str	ip, [r3, #-24]
	add	r1, r1, #22
	strh	r2, [r3, #4]	@ movhi
	beq	.L32
	cmp	r1, #240
	add	r3, r3, #44
	bne	.L35
	add	ip, ip, #10
	cmp	ip, #160
	bne	.L33
.L32:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	fillScreen
	.word	score
	.word	oldScore
	.word	paddle
	.word	ball
	.word	brickCount
	.word	.LANCHOR0
	.word	memcpy
	.word	bricks
	.word	-1840700269
	.size	initializeGame, .-initializeGame
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L53
	ldr	r3, [r3]
	tst	r3, #8
	stmfd	sp!, {r4, lr}
	beq	.L47
	ldr	r3, .L53+4
	ldr	r0, [r3]
	ands	r0, r0, #8
	beq	.L52
.L47:
	ldr	r2, .L53+8
	ldr	r3, [r2]
	add	r3, r3, #1
	mov	r0, r3
	ldr	r1, .L53+12
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldmfd	sp!, {r4, lr}
	bx	lr
.L52:
	ldr	r3, .L53+16
	mov	lr, pc
	bx	r3
	bl	initializeGame
	mov	r2, #1
	ldr	r3, .L53+20
	str	r2, [r3]
	b	.L47
.L54:
	.align	2
.L53:
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	srand
	.word	fillScreen
	.word	state
	.size	start, .-start
	.align	2
	.global	eraseBricks
	.type	eraseBricks, %function
eraseBricks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	ip, [r0, #32]
	cmp	ip, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L56
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L61
.L56:
	mov	r3, #0
	str	r3, [r4, #40]
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L61:
	add	r0, r0, #8
	ldmia	r0, {r0, r1, r2, r3}
	ldr	r5, .L62
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	b	.L56
.L63:
	.align	2
.L62:
	.word	drawRect
	.size	eraseBricks, .-eraseBricks
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r4, .L78
	sub	sp, sp, #88
	ldr	r7, .L78+4
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #16]
	add	r0, r4, #20
	ldr	r8, .L78+8
	ldmia	r0, {r0, r1}
	mov	r2, r3
	str	r5, [sp]
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #16]
	ldr	ip, .L78+12
	ldmia	r4, {r0, r1}
	ldr	r4, .L78+16
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	add	r0, r4, #16
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldmia	r0, {r0, r1}
	str	r5, [sp]
	mov	lr, pc
	bx	r8
	mov	ip, #992
	ldr	r6, .L78+20
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldmia	r4, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	cmp	r3, r5
	ldrgt	r4, .L78+24
	bgt	.L67
	b	.L68
.L66:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #44
	ble	.L77
.L67:
	ldr	r3, [r4]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L66
	ldrh	ip, [r4, #4]
	sub	r2, r4, #16
	sub	r0, r4, #32
	ldmia	r2, {r2, r3}
	ldmia	r0, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #44
	bgt	.L67
.L77:
	cmp	r3, #0
	ble	.L68
	mov	r5, #0
	ldr	r4, .L78+28
.L69:
	mov	r0, r4
	bl	eraseBricks
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #44
	bgt	.L69
.L68:
	mov	lr, pc
	bx	r7
	ldr	r3, .L78+32
	add	r0, sp, #8
	ldr	r2, [r3]
	ldr	r1, .L78+36
	ldr	r3, .L78+40
	mov	lr, pc
	bx	r3
	ldr	r4, .L78+44
	add	r2, sp, #8
	ldr	r3, .L78+48
	mov	r1, #0
	mov	r0, #2
	mov	lr, pc
	bx	r4
	add	sp, sp, #88
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	ball
	.word	waitForVblank
	.word	drawRect
	.word	1023
	.word	paddle
	.word	brickCount
	.word	bricks+32
	.word	bricks
	.word	score
	.word	.LC2
	.word	sprintf
	.word	drawString
	.word	32767
	.size	draw, .-draw
	.align	2
	.global	drawBricks
	.type	drawBricks, %function
drawBricks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	mov	ip, r0
	stmfd	sp!, {r4, lr}
	ldrh	ip, [ip, #36]
	sub	sp, sp, #8
	add	r2, r0, #16
	ldmia	r2, {r2, r3}
	ldmia	r0, {r0, r1}
	ldr	r4, .L87
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	drawRect
	.size	drawBricks, .-drawBricks
	.align	2
	.global	eraseScore
	.type	eraseScore, %function
eraseScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L91
	sub	sp, sp, #80
	ldr	r2, [r3]
	mov	r0, sp
	ldr	r1, .L91+4
	ldr	r3, .L91+8
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r2, sp
	mov	r1, r3
	mov	r0, #2
	ldr	r4, .L91+12
	mov	lr, pc
	bx	r4
	add	sp, sp, #80
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	oldScore
	.word	.LC2
	.word	sprintf
	.word	drawString
	.size	eraseScore, .-eraseScore
	.align	2
	.global	collisionCheckBrickBall
	.type	collisionCheckBrickBall, %function
collisionCheckBrickBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L101
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #16]
	ldr	r1, [r0, #4]
	stmfd	sp!, {r4, r5, r6, lr}
	add	lr, ip, r2
	cmp	lr, r1
	blt	.L93
	ldr	r4, [r3]
	ldr	lr, [r0]
	add	r2, r2, r4
	cmp	r2, lr
	blt	.L93
	ldr	r5, [r0, #16]
	add	r5, lr, r5
	cmp	r4, r5
	bgt	.L93
	ldr	r6, [r0, #20]
	add	r1, r1, r6
	cmp	ip, r1
	bgt	.L93
	mov	ip, #0
	ldr	r1, [r3, #8]
	cmp	r1, ip
	str	ip, [r0, #32]
	blt	.L100
	cmp	r2, lr
	ldr	ip, .L101+4
	mov	lr, #1
	beq	.L99
.L97:
	ldr	r2, [r3, #12]
	ldr	r1, [ip]
	rsb	r2, r2, #0
	add	r1, r1, lr
	str	lr, [r0, #40]
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r1, [ip]
	str	r2, [r3, #12]
	b	eraseScore
.L93:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L100:
	cmp	r4, r5
	mov	lr, #1
	ldr	ip, .L101+4
	bne	.L97
.L99:
	ldr	r2, [ip]
	rsb	r1, r1, #0
	add	r2, r2, lr
	str	lr, [r0, #40]
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r1, [r3, #8]
	str	r2, [ip]
	b	eraseScore
.L102:
	.align	2
.L101:
	.word	ball
	.word	score
	.size	collisionCheckBrickBall, .-collisionCheckBrickBall
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, .L132
	ldr	r6, .L132+4
	ldmia	r7, {r0, r1, r3}
	ldr	r8, .L132+8
	ldr	lr, [r6]
	ldr	ip, .L132+12
	ldr	r2, [r7, #12]
	add	r3, r0, r3
	add	r2, r1, r2
	ldr	ip, [ip]
	cmp	lr, #0
	str	r0, [r7, #20]
	ldr	lr, [r8]
	str	r1, [r7, #24]
	ldr	r0, [r8, #4]
	ldr	r1, .L132+16
	str	r3, [r7]
	str	r2, [r7, #4]
	str	lr, [r8, #16]
	str	r0, [r8, #20]
	str	ip, [r1]
	blt	.L104
	mov	r5, #0
	ldr	r4, .L132+20
	b	.L106
.L105:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #44
	blt	.L128
.L106:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L105
	mov	r0, r4
	bl	collisionCheckBrickBall
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #44
	bge	.L106
.L128:
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
.L104:
	cmp	r3, #0
	blt	.L129
.L107:
	ldr	r1, [r7, #16]
	ldr	ip, .L132
	rsb	r0, r1, #160
	cmp	r0, r3
	ldrlt	lr, [ip, #8]
	rsblt	lr, lr, #0
	movlt	r3, r0
	strlt	r0, [ip]
	strlt	lr, [ip, #8]
	cmp	r2, #0
	blt	.L130
.L109:
	rsb	r0, r1, #240
	cmp	r0, r2
	ldrlt	r2, [r7, #12]
	rsblt	r2, r2, #0
	strlt	r2, [r7, #12]
	mov	r2, #67108864
	strlt	r0, [r7, #4]
	ldr	r2, [r2, #304]
	tst	r2, #32
	bne	.L111
	ldr	r2, [r8, #4]
	ldr	r0, .L132+8
	cmp	r2, #0
	subgt	r2, r2, #2
	strgt	r2, [r0, #4]
.L111:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #16
	bne	.L112
	ldmib	r8, {r0, r2}
	rsb	r2, r2, #240
	cmp	r0, r2
	ldr	r2, .L132+8
	addlt	r0, r0, #2
	strlt	r0, [r2, #4]
.L112:
	ldr	r2, [r8, #12]
	cmp	r2, r3
	ldr	ip, .L132+8
	ble	.L103
	ldr	lr, [r7, #4]
	ldr	r0, [ip, #4]
	add	r1, r1, lr
	cmp	r1, r0
	ldr	r1, .L132
	bgt	.L131
.L115:
	cmp	r3, #0
	movle	r3, #1
	strle	r3, [r8, #24]
.L103:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L131:
	ldr	ip, [ip, #8]
	add	r0, r0, ip
	cmp	lr, r0
	ldrlt	r0, [r1, #8]
	rsblt	r0, r0, #0
	movlt	r3, r2
	strlt	r2, [r1]
	strlt	r0, [r1, #8]
	b	.L115
.L130:
	mov	ip, #0
	ldr	r0, [r7, #12]
	rsb	r0, r0, #0
	mov	r2, ip
	str	r0, [r7, #12]
	str	ip, [r7, #4]
	b	.L109
.L129:
	mov	r0, #0
	ldr	r1, [r7, #8]
	rsb	r1, r1, #0
	mov	r3, r0
	str	r1, [r7, #8]
	str	r0, [r7]
	b	.L107
.L133:
	.align	2
.L132:
	.word	ball
	.word	brickCount
	.word	paddle
	.word	score
	.word	oldScore
	.word	bricks
	.size	update, .-update
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, .L160
	sub	sp, sp, #84
	bl	update
	ldr	r3, .L160+4
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L135
	ldr	r2, .L160+8
	ldr	r1, [r2]
	ands	r5, r1, #8
	beq	.L157
.L135:
	tst	r3, #1
	beq	.L136
	ldr	r3, .L160+8
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L137
.L136:
	ldr	r3, .L160+12
	ldr	r3, [r3]
	cmp	r3, #40
	beq	.L137
	ldr	r3, .L160+16
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L158
.L139:
	ldr	r3, [r4]
	tst	r3, #4
	beq	.L134
	ldr	r3, .L160+8
	ldr	r1, [r3]
	ands	r4, r1, #4
	beq	.L159
.L134:
	add	sp, sp, #84
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L137:
	mov	r1, #3
	ldr	r2, .L160+20
	mov	r0, #992
	ldr	r3, .L160+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	ip, sp
	ldr	r3, .L160+28
	ldmia	r3, {r0, r1, r2}
	stmia	ip!, {r0, r1}
	ldr	r3, .L160+32
	strb	r2, [ip]
	mov	r1, #0
	mov	r2, sp
	mov	r0, #5
	ldr	r5, .L160+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L160+16
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L139
.L158:
	mov	r1, #2
	ldr	r2, .L160+20
	mov	r0, #31
	ldr	r3, .L160+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	ip, sp
	ldr	lr, .L160+40
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	lr, [lr]
	mov	r2, sp
	ldr	r3, .L160+32
	mov	r1, #0
	mov	r0, #120
	ldr	r5, .L160+36
	strb	lr, [ip]
	mov	lr, pc
	bx	r5
	b	.L139
.L159:
	mov	r0, #31744
	ldr	r3, .L160+24
	mov	lr, pc
	bx	r3
	mov	ip, sp
	ldr	lr, .L160+44
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2}
	ldr	r5, .L160+36
	strh	r3, [ip]	@ movhi
	mov	r2, sp
	ldr	r3, .L160+32
	mov	r1, r4
	mov	r0, #5
	mov	lr, pc
	bx	r5
	ldr	r3, .L160+20
	str	r4, [r3]
	add	sp, sp, #84
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L157:
	mov	r1, #4
	ldr	r2, .L160+20
	ldr	r0, .L160+48
	ldr	r3, .L160+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	ip, sp
	ldr	lr, .L160+52
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1}
	ldr	r3, .L160+32
	stmia	ip, {r0, r1}
	mov	r2, sp
	mov	r1, r5
	mov	r0, #5
	ldr	r5, .L160+36
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	b	.L135
.L161:
	.align	2
.L160:
	.word	oldButtons
	.word	waitForVblank
	.word	buttons
	.word	score
	.word	paddle
	.word	state
	.word	fillScreen
	.word	.LC4
	.word	32767
	.word	drawString
	.word	.LC5
	.word	.LC1
	.word	15855
	.word	.LC3
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r7, fp, lr}
	ldr	r3, .L174
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	ldr	fp, .L174+4
	ldr	r6, .L174+8
	ldr	r4, .L174+12
	ldr	r10, .L174+16
	ldr	r9, .L174+20
	ldr	r8, .L174+24
	ldr	r7, .L174+28
.L163:
	ldr	r3, [fp]
	ldr	r2, [r6]
.L164:
	str	r3, [r4]
	ldr	r3, [r5, #304]
	str	r3, [fp]
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L164
.L166:
	.word	.L165
	.word	.L167
	.word	.L168
	.word	.L168
	.word	.L170
.L168:
	mov	lr, pc
	bx	r7
	b	.L163
.L167:
	mov	lr, pc
	bx	r9
	b	.L163
.L165:
	mov	lr, pc
	bx	r10
	b	.L163
.L170:
	mov	lr, pc
	bx	r8
	b	.L163
.L175:
	.align	2
.L174:
	.word	initialize
	.word	buttons
	.word	state
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	lose
	.size	main, .-main
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	oldScore,4,4
	.comm	score,4,4
	.comm	seed,4,4
	.comm	state,4,4
	.comm	brickCount,4,4
	.comm	bricks,1760,4
	.comm	ball,28,4
	.comm	paddle,28,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	31
	.short	992
	.short	31744
	.short	31775
	.short	32736
	.short	1023
	.short	32767
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Welcome! Press START to start\000"
	.space	2
.LC2:
	.ascii	"Score: %u\000"
	.space	2
.LC3:
	.ascii	"Game paused. Press START to start again\000"
.LC4:
	.ascii	"You win!\000"
	.space	3
.LC5:
	.ascii	"Sorry. You lose.\000"
	.ident	"GCC: (devkitARM release 45) 5.3.0"
