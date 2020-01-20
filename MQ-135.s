	.cpu cortex-m4
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"MQ-135.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.global	ADC2_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfp
	.type	ADC2_Init, %function
ADC2_Init:
.LFB126:
	.file 1 "Project/Source/MQ-135.c"
	.loc 1 3 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #36
	.cfi_def_cfa_offset 40
	.loc 1 7 0
	movs	r1, #1
	mov	r0, #512
	bl	RCC_APB2PeriphClockCmd
	.loc 1 8 0
	movs	r1, #1
	movs	r0, #1
	bl	RCC_AHB1PeriphClockCmd
	.loc 1 10 0
	movs	r3, #32
	str	r3, [sp, #24]
	.loc 1 11 0
	movs	r3, #3
	strb	r3, [sp, #28]
	.loc 1 12 0
	movs	r3, #2
	strb	r3, [sp, #29]
	.loc 1 13 0
	movs	r3, #1
	strb	r3, [sp, #30]
	.loc 1 14 0
	movs	r3, #0
	strb	r3, [sp, #31]
	.loc 1 15 0
	add	r3, sp, #24
	mov	r1, r3
	ldr	r0, .L2
	bl	GPIO_Init
	.loc 1 17 0
	mov	r3, sp
	mov	r0, r3
	bl	ADC_StructInit
	.loc 1 18 0
	mov	r3, #16777216
	str	r3, [sp]
	.loc 1 19 0
	mov	r3, sp
	mov	r1, r3
	ldr	r0, .L2+4
	bl	ADC_Init
	.loc 1 20 0
	movs	r1, #1
	ldr	r0, .L2+4
	bl	ADC_Cmd
	.loc 1 21 0
	movs	r3, #6
	movs	r2, #1
	movs	r1, #5
	ldr	r0, .L2+4
	bl	ADC_RegularChannelConfig
	.loc 1 22 0
	nop
	add	sp, sp, #36
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L3:
	.align	2
.L2:
	.word	1073872896
	.word	1073815808
	.cfi_endproc
.LFE126:
	.size	ADC2_Init, .-ADC2_Init
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%3.6f\012\000"
	.text
	.align	1
	.global	MQ_135_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfp
	.type	MQ_135_read, %function
MQ_135_read:
.LFB127:
	.loc 1 24 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 32
	.loc 1 30 0
	movs	r0, #80
	bl	USART1_SendChar
	.loc 1 31 0
	ldr	r0, .L5
	bl	ADC_SoftwareStartConv
	.loc 1 32 0
	ldr	r0, .L5
	bl	ADC_GetConversionValue
	mov	r3, r0
	strh	r3, [sp, #22]	@ movhi
	.loc 1 33 0
	ldrh	r3, [sp, #22]
	vmov	s15, r3	@ int
	vcvt.f32.u32	s14, s15
	vldr.32	s13, .L5+4
	vdiv.f32	s15, s14, s13
	vldr.32	s14, .L5+8
	vmul.f32	s15, s15, s14
	vstr.32	s15, [sp, #16]
	.loc 1 35 0
	vldr.32	s15, [sp, #16]
	vcvt.f64.f32	d7, s15
	add	r0, sp, #4
	vmov	r2, r3, d7
	ldr	r1, .L5+12
	bl	sprintf
	.loc 1 36 0
	movs	r0, #76
	bl	USART1_SendChar
	.loc 1 42 0
	nop
	add	sp, sp, #28
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L6:
	.align	2
.L5:
	.word	1073815808
	.word	1149239296
	.word	1084227584
	.word	.LC0
	.cfi_endproc
.LFE127:
	.size	MQ_135_read, .-MQ_135_read
.Letext0:
	.file 2 "/usr/include/newlib/machine/_default_types.h"
	.file 3 "/usr/include/newlib/sys/_stdint.h"
	.file 4 "Libraries/CMSIS/Include/core_cm4.h"
	.file 5 "Libraries/CMSIS/Device/ST/STM32F4xx/Include/system_stm32f4xx.h"
	.file 6 "Libraries/CMSIS/Device/ST/STM32F4xx/Include/stm32f4xx.h"
	.file 7 "Libraries/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_adc.h"
	.file 8 "Libraries/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h"
	.file 9 "/usr/include/newlib/sys/lock.h"
	.file 10 "/usr/include/newlib/sys/_types.h"
	.file 11 "/usr/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h"
	.file 12 "/usr/include/newlib/sys/reent.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xcdc
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF193
	.byte	0xc
	.4byte	.LASF194
	.4byte	.LASF195
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x2b
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x39
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x4d
	.4byte	0x62
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x4f
	.4byte	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x18
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x24
	.4byte	0x45
	.uleb128 0x5
	.4byte	0xa2
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x2c
	.4byte	0x57
	.uleb128 0x5
	.4byte	0xb2
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x30
	.4byte	0x69
	.uleb128 0x5
	.4byte	0xc2
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x6fa
	.4byte	0xbd
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x5
	.byte	0x3b
	.4byte	0xc2
	.uleb128 0x8
	.byte	0x7
	.byte	0x1
	.4byte	0x37
	.byte	0x6
	.2byte	0x35b
	.4byte	0x104
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x6
	.2byte	0x35b
	.4byte	0xe9
	.uleb128 0xb
	.byte	0x50
	.byte	0x6
	.2byte	0x36c
	.4byte	0x21c
	.uleb128 0xc
	.ascii	"SR\000"
	.byte	0x6
	.2byte	0x36e
	.4byte	0xcd
	.byte	0
	.uleb128 0xc
	.ascii	"CR1\000"
	.byte	0x6
	.2byte	0x36f
	.4byte	0xcd
	.byte	0x4
	.uleb128 0xc
	.ascii	"CR2\000"
	.byte	0x6
	.2byte	0x370
	.4byte	0xcd
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF22
	.byte	0x6
	.2byte	0x371
	.4byte	0xcd
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF23
	.byte	0x6
	.2byte	0x372
	.4byte	0xcd
	.byte	0x10
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x6
	.2byte	0x373
	.4byte	0xcd
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x6
	.2byte	0x374
	.4byte	0xcd
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x6
	.2byte	0x375
	.4byte	0xcd
	.byte	0x1c
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x6
	.2byte	0x376
	.4byte	0xcd
	.byte	0x20
	.uleb128 0xc
	.ascii	"HTR\000"
	.byte	0x6
	.2byte	0x377
	.4byte	0xcd
	.byte	0x24
	.uleb128 0xc
	.ascii	"LTR\000"
	.byte	0x6
	.2byte	0x378
	.4byte	0xcd
	.byte	0x28
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x6
	.2byte	0x379
	.4byte	0xcd
	.byte	0x2c
	.uleb128 0xd
	.4byte	.LASF29
	.byte	0x6
	.2byte	0x37a
	.4byte	0xcd
	.byte	0x30
	.uleb128 0xd
	.4byte	.LASF30
	.byte	0x6
	.2byte	0x37b
	.4byte	0xcd
	.byte	0x34
	.uleb128 0xd
	.4byte	.LASF31
	.byte	0x6
	.2byte	0x37c
	.4byte	0xcd
	.byte	0x38
	.uleb128 0xd
	.4byte	.LASF32
	.byte	0x6
	.2byte	0x37d
	.4byte	0xcd
	.byte	0x3c
	.uleb128 0xd
	.4byte	.LASF33
	.byte	0x6
	.2byte	0x37e
	.4byte	0xcd
	.byte	0x40
	.uleb128 0xd
	.4byte	.LASF34
	.byte	0x6
	.2byte	0x37f
	.4byte	0xcd
	.byte	0x44
	.uleb128 0xd
	.4byte	.LASF35
	.byte	0x6
	.2byte	0x380
	.4byte	0xcd
	.byte	0x48
	.uleb128 0xc
	.ascii	"DR\000"
	.byte	0x6
	.2byte	0x381
	.4byte	0xcd
	.byte	0x4c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF36
	.byte	0x6
	.2byte	0x382
	.4byte	0x110
	.uleb128 0xe
	.4byte	0xcd
	.4byte	0x238
	.uleb128 0xf
	.4byte	0x90
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x228
	.uleb128 0xb
	.byte	0x28
	.byte	0x6
	.2byte	0x5bf
	.4byte	0x2c9
	.uleb128 0xd
	.4byte	.LASF37
	.byte	0x6
	.2byte	0x5c1
	.4byte	0xcd
	.byte	0
	.uleb128 0xd
	.4byte	.LASF38
	.byte	0x6
	.2byte	0x5c2
	.4byte	0xcd
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF39
	.byte	0x6
	.2byte	0x5c3
	.4byte	0xcd
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF40
	.byte	0x6
	.2byte	0x5c4
	.4byte	0xcd
	.byte	0xc
	.uleb128 0xc
	.ascii	"IDR\000"
	.byte	0x6
	.2byte	0x5c5
	.4byte	0xcd
	.byte	0x10
	.uleb128 0xc
	.ascii	"ODR\000"
	.byte	0x6
	.2byte	0x5c6
	.4byte	0xcd
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF41
	.byte	0x6
	.2byte	0x5c7
	.4byte	0xad
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF42
	.byte	0x6
	.2byte	0x5c8
	.4byte	0xad
	.byte	0x1a
	.uleb128 0xd
	.4byte	.LASF43
	.byte	0x6
	.2byte	0x5c9
	.4byte	0xcd
	.byte	0x1c
	.uleb128 0xc
	.ascii	"AFR\000"
	.byte	0x6
	.2byte	0x5ca
	.4byte	0x238
	.byte	0x20
	.byte	0
	.uleb128 0xa
	.4byte	.LASF44
	.byte	0x6
	.2byte	0x5cb
	.4byte	0x23d
	.uleb128 0x10
	.byte	0x18
	.byte	0x7
	.byte	0x35
	.4byte	0x332
	.uleb128 0x11
	.4byte	.LASF45
	.byte	0x7
	.byte	0x37
	.4byte	0xc2
	.byte	0
	.uleb128 0x11
	.4byte	.LASF46
	.byte	0x7
	.byte	0x39
	.4byte	0x104
	.byte	0x4
	.uleb128 0x11
	.4byte	.LASF47
	.byte	0x7
	.byte	0x3d
	.4byte	0x104
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF48
	.byte	0x7
	.byte	0x40
	.4byte	0xc2
	.byte	0x8
	.uleb128 0x11
	.4byte	.LASF49
	.byte	0x7
	.byte	0x44
	.4byte	0xc2
	.byte	0xc
	.uleb128 0x11
	.4byte	.LASF50
	.byte	0x7
	.byte	0x48
	.4byte	0xc2
	.byte	0x10
	.uleb128 0x11
	.4byte	.LASF51
	.byte	0x7
	.byte	0x4b
	.4byte	0x97
	.byte	0x14
	.byte	0
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x7
	.byte	0x4f
	.4byte	0x2d5
	.uleb128 0x12
	.byte	0x7
	.byte	0x1
	.4byte	0x37
	.byte	0x8
	.byte	0x42
	.4byte	0x363
	.uleb128 0x9
	.4byte	.LASF53
	.byte	0
	.uleb128 0x9
	.4byte	.LASF54
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF55
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF56
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF57
	.byte	0x8
	.byte	0x47
	.4byte	0x33d
	.uleb128 0x12
	.byte	0x7
	.byte	0x1
	.4byte	0x37
	.byte	0x8
	.byte	0x4f
	.4byte	0x388
	.uleb128 0x9
	.4byte	.LASF58
	.byte	0
	.uleb128 0x9
	.4byte	.LASF59
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x8
	.byte	0x52
	.4byte	0x36e
	.uleb128 0x12
	.byte	0x7
	.byte	0x1
	.4byte	0x37
	.byte	0x8
	.byte	0x5a
	.4byte	0x3b9
	.uleb128 0x9
	.4byte	.LASF61
	.byte	0
	.uleb128 0x9
	.4byte	.LASF62
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF63
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF64
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x8
	.byte	0x5f
	.4byte	0x393
	.uleb128 0x12
	.byte	0x7
	.byte	0x1
	.4byte	0x37
	.byte	0x8
	.byte	0x6e
	.4byte	0x3e4
	.uleb128 0x9
	.4byte	.LASF66
	.byte	0
	.uleb128 0x9
	.4byte	.LASF67
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF68
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF69
	.byte	0x8
	.byte	0x72
	.4byte	0x3c4
	.uleb128 0x10
	.byte	0x8
	.byte	0x8
	.byte	0x84
	.4byte	0x434
	.uleb128 0x11
	.4byte	.LASF70
	.byte	0x8
	.byte	0x86
	.4byte	0xc2
	.byte	0
	.uleb128 0x11
	.4byte	.LASF71
	.byte	0x8
	.byte	0x89
	.4byte	0x363
	.byte	0x4
	.uleb128 0x11
	.4byte	.LASF72
	.byte	0x8
	.byte	0x8c
	.4byte	0x3b9
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF73
	.byte	0x8
	.byte	0x8f
	.4byte	0x388
	.byte	0x6
	.uleb128 0x11
	.4byte	.LASF74
	.byte	0x8
	.byte	0x92
	.4byte	0x3e4
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF75
	.byte	0x8
	.byte	0x94
	.4byte	0x3ef
	.uleb128 0x13
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF76
	.byte	0x9
	.byte	0xc
	.4byte	0x89
	.uleb128 0x3
	.4byte	.LASF77
	.byte	0xa
	.byte	0x2c
	.4byte	0x62
	.uleb128 0x3
	.4byte	.LASF78
	.byte	0xa
	.byte	0x72
	.4byte	0x62
	.uleb128 0xa
	.4byte	.LASF79
	.byte	0xb
	.2byte	0x165
	.4byte	0x90
	.uleb128 0x14
	.byte	0x4
	.byte	0xa
	.byte	0xa6
	.4byte	0x48d
	.uleb128 0x15
	.4byte	.LASF80
	.byte	0xa
	.byte	0xa8
	.4byte	0x462
	.uleb128 0x15
	.4byte	.LASF81
	.byte	0xa
	.byte	0xa9
	.4byte	0x48d
	.byte	0
	.uleb128 0xe
	.4byte	0x37
	.4byte	0x49d
	.uleb128 0xf
	.4byte	0x90
	.byte	0x3
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.byte	0xa
	.byte	0xa3
	.4byte	0x4be
	.uleb128 0x11
	.4byte	.LASF82
	.byte	0xa
	.byte	0xa5
	.4byte	0x89
	.byte	0
	.uleb128 0x11
	.4byte	.LASF83
	.byte	0xa
	.byte	0xaa
	.4byte	0x46e
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF84
	.byte	0xa
	.byte	0xab
	.4byte	0x49d
	.uleb128 0x3
	.4byte	.LASF85
	.byte	0xa
	.byte	0xaf
	.4byte	0x441
	.uleb128 0x3
	.4byte	.LASF86
	.byte	0xc
	.byte	0x16
	.4byte	0x74
	.uleb128 0x16
	.4byte	.LASF91
	.byte	0x18
	.byte	0xc
	.byte	0x2f
	.4byte	0x532
	.uleb128 0x11
	.4byte	.LASF87
	.byte	0xc
	.byte	0x31
	.4byte	0x532
	.byte	0
	.uleb128 0x17
	.ascii	"_k\000"
	.byte	0xc
	.byte	0x32
	.4byte	0x89
	.byte	0x4
	.uleb128 0x11
	.4byte	.LASF88
	.byte	0xc
	.byte	0x32
	.4byte	0x89
	.byte	0x8
	.uleb128 0x11
	.4byte	.LASF89
	.byte	0xc
	.byte	0x32
	.4byte	0x89
	.byte	0xc
	.uleb128 0x11
	.4byte	.LASF90
	.byte	0xc
	.byte	0x32
	.4byte	0x89
	.byte	0x10
	.uleb128 0x17
	.ascii	"_x\000"
	.byte	0xc
	.byte	0x33
	.4byte	0x538
	.byte	0x14
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0x4df
	.uleb128 0xe
	.4byte	0x4d4
	.4byte	0x548
	.uleb128 0xf
	.4byte	0x90
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF92
	.byte	0x24
	.byte	0xc
	.byte	0x37
	.4byte	0x5c1
	.uleb128 0x11
	.4byte	.LASF93
	.byte	0xc
	.byte	0x39
	.4byte	0x89
	.byte	0
	.uleb128 0x11
	.4byte	.LASF94
	.byte	0xc
	.byte	0x3a
	.4byte	0x89
	.byte	0x4
	.uleb128 0x11
	.4byte	.LASF95
	.byte	0xc
	.byte	0x3b
	.4byte	0x89
	.byte	0x8
	.uleb128 0x11
	.4byte	.LASF96
	.byte	0xc
	.byte	0x3c
	.4byte	0x89
	.byte	0xc
	.uleb128 0x11
	.4byte	.LASF97
	.byte	0xc
	.byte	0x3d
	.4byte	0x89
	.byte	0x10
	.uleb128 0x11
	.4byte	.LASF98
	.byte	0xc
	.byte	0x3e
	.4byte	0x89
	.byte	0x14
	.uleb128 0x11
	.4byte	.LASF99
	.byte	0xc
	.byte	0x3f
	.4byte	0x89
	.byte	0x18
	.uleb128 0x11
	.4byte	.LASF100
	.byte	0xc
	.byte	0x40
	.4byte	0x89
	.byte	0x1c
	.uleb128 0x11
	.4byte	.LASF101
	.byte	0xc
	.byte	0x41
	.4byte	0x89
	.byte	0x20
	.byte	0
	.uleb128 0x19
	.4byte	.LASF102
	.2byte	0x108
	.byte	0xc
	.byte	0x4a
	.4byte	0x601
	.uleb128 0x11
	.4byte	.LASF103
	.byte	0xc
	.byte	0x4b
	.4byte	0x601
	.byte	0
	.uleb128 0x11
	.4byte	.LASF104
	.byte	0xc
	.byte	0x4c
	.4byte	0x601
	.byte	0x80
	.uleb128 0x1a
	.4byte	.LASF105
	.byte	0xc
	.byte	0x4e
	.4byte	0x4d4
	.2byte	0x100
	.uleb128 0x1a
	.4byte	.LASF106
	.byte	0xc
	.byte	0x51
	.4byte	0x4d4
	.2byte	0x104
	.byte	0
	.uleb128 0xe
	.4byte	0x43f
	.4byte	0x611
	.uleb128 0xf
	.4byte	0x90
	.byte	0x1f
	.byte	0
	.uleb128 0x16
	.4byte	.LASF107
	.byte	0x8c
	.byte	0xc
	.byte	0x55
	.4byte	0x64e
	.uleb128 0x11
	.4byte	.LASF87
	.byte	0xc
	.byte	0x56
	.4byte	0x64e
	.byte	0
	.uleb128 0x11
	.4byte	.LASF108
	.byte	0xc
	.byte	0x57
	.4byte	0x89
	.byte	0x4
	.uleb128 0x11
	.4byte	.LASF109
	.byte	0xc
	.byte	0x58
	.4byte	0x654
	.byte	0x8
	.uleb128 0x11
	.4byte	.LASF110
	.byte	0xc
	.byte	0x59
	.4byte	0x66b
	.byte	0x88
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0x611
	.uleb128 0xe
	.4byte	0x664
	.4byte	0x664
	.uleb128 0xf
	.4byte	0x90
	.byte	0x1f
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0x66a
	.uleb128 0x1b
	.uleb128 0x18
	.byte	0x4
	.4byte	0x5c1
	.uleb128 0x16
	.4byte	.LASF111
	.byte	0x8
	.byte	0xc
	.byte	0x75
	.4byte	0x696
	.uleb128 0x11
	.4byte	.LASF112
	.byte	0xc
	.byte	0x76
	.4byte	0x696
	.byte	0
	.uleb128 0x11
	.4byte	.LASF113
	.byte	0xc
	.byte	0x77
	.4byte	0x89
	.byte	0x4
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0x37
	.uleb128 0x16
	.4byte	.LASF114
	.byte	0x20
	.byte	0xc
	.byte	0x99
	.4byte	0x706
	.uleb128 0x17
	.ascii	"_p\000"
	.byte	0xc
	.byte	0x9a
	.4byte	0x696
	.byte	0
	.uleb128 0x17
	.ascii	"_r\000"
	.byte	0xc
	.byte	0x9b
	.4byte	0x89
	.byte	0x4
	.uleb128 0x17
	.ascii	"_w\000"
	.byte	0xc
	.byte	0x9c
	.4byte	0x89
	.byte	0x8
	.uleb128 0x11
	.4byte	.LASF115
	.byte	0xc
	.byte	0x9d
	.4byte	0x3e
	.byte	0xc
	.uleb128 0x11
	.4byte	.LASF116
	.byte	0xc
	.byte	0x9e
	.4byte	0x3e
	.byte	0xe
	.uleb128 0x17
	.ascii	"_bf\000"
	.byte	0xc
	.byte	0x9f
	.4byte	0x671
	.byte	0x10
	.uleb128 0x11
	.4byte	.LASF117
	.byte	0xc
	.byte	0xa0
	.4byte	0x89
	.byte	0x18
	.uleb128 0x11
	.4byte	.LASF118
	.byte	0xc
	.byte	0xa2
	.4byte	0x837
	.byte	0x1c
	.byte	0
	.uleb128 0x1c
	.4byte	0x69c
	.uleb128 0x1d
	.4byte	.LASF119
	.byte	0x60
	.byte	0xc
	.2byte	0x174
	.4byte	0x837
	.uleb128 0xd
	.4byte	.LASF120
	.byte	0xc
	.2byte	0x178
	.4byte	0x89
	.byte	0
	.uleb128 0xd
	.4byte	.LASF121
	.byte	0xc
	.2byte	0x17d
	.4byte	0xa71
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF122
	.byte	0xc
	.2byte	0x17d
	.4byte	0xa71
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF123
	.byte	0xc
	.2byte	0x17d
	.4byte	0xa71
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF124
	.byte	0xc
	.2byte	0x17f
	.4byte	0x89
	.byte	0x10
	.uleb128 0xd
	.4byte	.LASF125
	.byte	0xc
	.2byte	0x181
	.4byte	0x98a
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF126
	.byte	0xc
	.2byte	0x183
	.4byte	0x89
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF127
	.byte	0xc
	.2byte	0x185
	.4byte	0x89
	.byte	0x1c
	.uleb128 0xd
	.4byte	.LASF128
	.byte	0xc
	.2byte	0x186
	.4byte	0xbc3
	.byte	0x20
	.uleb128 0xc
	.ascii	"_mp\000"
	.byte	0xc
	.2byte	0x188
	.4byte	0xbc9
	.byte	0x24
	.uleb128 0xd
	.4byte	.LASF129
	.byte	0xc
	.2byte	0x18a
	.4byte	0xbda
	.byte	0x28
	.uleb128 0xd
	.4byte	.LASF130
	.byte	0xc
	.2byte	0x18c
	.4byte	0x89
	.byte	0x2c
	.uleb128 0xd
	.4byte	.LASF131
	.byte	0xc
	.2byte	0x18f
	.4byte	0x89
	.byte	0x30
	.uleb128 0xd
	.4byte	.LASF132
	.byte	0xc
	.2byte	0x190
	.4byte	0x98a
	.byte	0x34
	.uleb128 0xd
	.4byte	.LASF133
	.byte	0xc
	.2byte	0x192
	.4byte	0xbe0
	.byte	0x38
	.uleb128 0xd
	.4byte	.LASF134
	.byte	0xc
	.2byte	0x193
	.4byte	0xbe6
	.byte	0x3c
	.uleb128 0xd
	.4byte	.LASF135
	.byte	0xc
	.2byte	0x194
	.4byte	0x98a
	.byte	0x40
	.uleb128 0xd
	.4byte	.LASF136
	.byte	0xc
	.2byte	0x197
	.4byte	0xbf7
	.byte	0x44
	.uleb128 0xd
	.4byte	.LASF137
	.byte	0xc
	.2byte	0x19f
	.4byte	0xa36
	.byte	0x48
	.uleb128 0xd
	.4byte	.LASF138
	.byte	0xc
	.2byte	0x1a0
	.4byte	0xa71
	.byte	0x54
	.uleb128 0xd
	.4byte	.LASF139
	.byte	0xc
	.2byte	0x1a1
	.4byte	0xc03
	.byte	0x58
	.uleb128 0xd
	.4byte	.LASF140
	.byte	0xc
	.2byte	0x1a2
	.4byte	0x98a
	.byte	0x5c
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0x70b
	.uleb128 0x1c
	.4byte	0x837
	.uleb128 0x16
	.4byte	.LASF141
	.byte	0x68
	.byte	0xc
	.byte	0xb5
	.4byte	0x96c
	.uleb128 0x17
	.ascii	"_p\000"
	.byte	0xc
	.byte	0xb6
	.4byte	0x696
	.byte	0
	.uleb128 0x17
	.ascii	"_r\000"
	.byte	0xc
	.byte	0xb7
	.4byte	0x89
	.byte	0x4
	.uleb128 0x17
	.ascii	"_w\000"
	.byte	0xc
	.byte	0xb8
	.4byte	0x89
	.byte	0x8
	.uleb128 0x11
	.4byte	.LASF115
	.byte	0xc
	.byte	0xb9
	.4byte	0x3e
	.byte	0xc
	.uleb128 0x11
	.4byte	.LASF116
	.byte	0xc
	.byte	0xba
	.4byte	0x3e
	.byte	0xe
	.uleb128 0x17
	.ascii	"_bf\000"
	.byte	0xc
	.byte	0xbb
	.4byte	0x671
	.byte	0x10
	.uleb128 0x11
	.4byte	.LASF117
	.byte	0xc
	.byte	0xbc
	.4byte	0x89
	.byte	0x18
	.uleb128 0x11
	.4byte	.LASF118
	.byte	0xc
	.byte	0xbf
	.4byte	0x837
	.byte	0x1c
	.uleb128 0x11
	.4byte	.LASF142
	.byte	0xc
	.byte	0xc3
	.4byte	0x43f
	.byte	0x20
	.uleb128 0x11
	.4byte	.LASF143
	.byte	0xc
	.byte	0xc5
	.4byte	0x99c
	.byte	0x24
	.uleb128 0x11
	.4byte	.LASF144
	.byte	0xc
	.byte	0xc7
	.4byte	0x9c6
	.byte	0x28
	.uleb128 0x11
	.4byte	.LASF145
	.byte	0xc
	.byte	0xca
	.4byte	0x9ea
	.byte	0x2c
	.uleb128 0x11
	.4byte	.LASF146
	.byte	0xc
	.byte	0xcb
	.4byte	0xa04
	.byte	0x30
	.uleb128 0x17
	.ascii	"_ub\000"
	.byte	0xc
	.byte	0xce
	.4byte	0x671
	.byte	0x34
	.uleb128 0x17
	.ascii	"_up\000"
	.byte	0xc
	.byte	0xcf
	.4byte	0x696
	.byte	0x3c
	.uleb128 0x17
	.ascii	"_ur\000"
	.byte	0xc
	.byte	0xd0
	.4byte	0x89
	.byte	0x40
	.uleb128 0x11
	.4byte	.LASF147
	.byte	0xc
	.byte	0xd3
	.4byte	0xa0a
	.byte	0x44
	.uleb128 0x11
	.4byte	.LASF148
	.byte	0xc
	.byte	0xd4
	.4byte	0xa1a
	.byte	0x47
	.uleb128 0x17
	.ascii	"_lb\000"
	.byte	0xc
	.byte	0xd7
	.4byte	0x671
	.byte	0x48
	.uleb128 0x11
	.4byte	.LASF149
	.byte	0xc
	.byte	0xda
	.4byte	0x89
	.byte	0x50
	.uleb128 0x11
	.4byte	.LASF150
	.byte	0xc
	.byte	0xdb
	.4byte	0x44c
	.byte	0x54
	.uleb128 0x11
	.4byte	.LASF151
	.byte	0xc
	.byte	0xe2
	.4byte	0x4c9
	.byte	0x58
	.uleb128 0x11
	.4byte	.LASF152
	.byte	0xc
	.byte	0xe4
	.4byte	0x4be
	.byte	0x5c
	.uleb128 0x11
	.4byte	.LASF153
	.byte	0xc
	.byte	0xe5
	.4byte	0x89
	.byte	0x64
	.byte	0
	.uleb128 0x1e
	.4byte	0x89
	.4byte	0x98a
	.uleb128 0x1f
	.4byte	0x837
	.uleb128 0x1f
	.4byte	0x43f
	.uleb128 0x1f
	.4byte	0x98a
	.uleb128 0x1f
	.4byte	0x89
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0x990
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF154
	.uleb128 0x1c
	.4byte	0x990
	.uleb128 0x18
	.byte	0x4
	.4byte	0x96c
	.uleb128 0x1e
	.4byte	0x89
	.4byte	0x9c0
	.uleb128 0x1f
	.4byte	0x837
	.uleb128 0x1f
	.4byte	0x43f
	.uleb128 0x1f
	.4byte	0x9c0
	.uleb128 0x1f
	.4byte	0x89
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0x997
	.uleb128 0x18
	.byte	0x4
	.4byte	0x9a2
	.uleb128 0x1e
	.4byte	0x457
	.4byte	0x9ea
	.uleb128 0x1f
	.4byte	0x837
	.uleb128 0x1f
	.4byte	0x43f
	.uleb128 0x1f
	.4byte	0x457
	.uleb128 0x1f
	.4byte	0x89
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0x9cc
	.uleb128 0x1e
	.4byte	0x89
	.4byte	0xa04
	.uleb128 0x1f
	.4byte	0x837
	.uleb128 0x1f
	.4byte	0x43f
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0x9f0
	.uleb128 0xe
	.4byte	0x37
	.4byte	0xa1a
	.uleb128 0xf
	.4byte	0x90
	.byte	0x2
	.byte	0
	.uleb128 0xe
	.4byte	0x37
	.4byte	0xa2a
	.uleb128 0xf
	.4byte	0x90
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF155
	.byte	0xc
	.2byte	0x11f
	.4byte	0x842
	.uleb128 0x1d
	.4byte	.LASF156
	.byte	0xc
	.byte	0xc
	.2byte	0x123
	.4byte	0xa6b
	.uleb128 0xd
	.4byte	.LASF87
	.byte	0xc
	.2byte	0x125
	.4byte	0xa6b
	.byte	0
	.uleb128 0xd
	.4byte	.LASF157
	.byte	0xc
	.2byte	0x126
	.4byte	0x89
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF158
	.byte	0xc
	.2byte	0x127
	.4byte	0xa71
	.byte	0x8
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0xa36
	.uleb128 0x18
	.byte	0x4
	.4byte	0xa2a
	.uleb128 0x1d
	.4byte	.LASF159
	.byte	0x18
	.byte	0xc
	.2byte	0x13f
	.4byte	0xab9
	.uleb128 0xd
	.4byte	.LASF160
	.byte	0xc
	.2byte	0x140
	.4byte	0xab9
	.byte	0
	.uleb128 0xd
	.4byte	.LASF161
	.byte	0xc
	.2byte	0x141
	.4byte	0xab9
	.byte	0x6
	.uleb128 0xd
	.4byte	.LASF162
	.byte	0xc
	.2byte	0x142
	.4byte	0x50
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF163
	.byte	0xc
	.2byte	0x145
	.4byte	0x82
	.byte	0x10
	.byte	0
	.uleb128 0xe
	.4byte	0x50
	.4byte	0xac9
	.uleb128 0xf
	.4byte	0x90
	.byte	0x2
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF164
	.byte	0x10
	.byte	0xc
	.2byte	0x158
	.4byte	0xb0b
	.uleb128 0xd
	.4byte	.LASF165
	.byte	0xc
	.2byte	0x15b
	.4byte	0x532
	.byte	0
	.uleb128 0xd
	.4byte	.LASF166
	.byte	0xc
	.2byte	0x15c
	.4byte	0x89
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF167
	.byte	0xc
	.2byte	0x15d
	.4byte	0x532
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF168
	.byte	0xc
	.2byte	0x15e
	.4byte	0xb0b
	.byte	0xc
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0x532
	.uleb128 0x1d
	.4byte	.LASF169
	.byte	0x50
	.byte	0xc
	.2byte	0x162
	.4byte	0xbae
	.uleb128 0xd
	.4byte	.LASF170
	.byte	0xc
	.2byte	0x165
	.4byte	0x98a
	.byte	0
	.uleb128 0xd
	.4byte	.LASF171
	.byte	0xc
	.2byte	0x166
	.4byte	0x4be
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF172
	.byte	0xc
	.2byte	0x167
	.4byte	0x4be
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF173
	.byte	0xc
	.2byte	0x168
	.4byte	0x4be
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF174
	.byte	0xc
	.2byte	0x169
	.4byte	0xbae
	.byte	0x1c
	.uleb128 0xd
	.4byte	.LASF175
	.byte	0xc
	.2byte	0x16a
	.4byte	0x89
	.byte	0x24
	.uleb128 0xd
	.4byte	.LASF176
	.byte	0xc
	.2byte	0x16b
	.4byte	0x4be
	.byte	0x28
	.uleb128 0xd
	.4byte	.LASF177
	.byte	0xc
	.2byte	0x16c
	.4byte	0x4be
	.byte	0x30
	.uleb128 0xd
	.4byte	.LASF178
	.byte	0xc
	.2byte	0x16d
	.4byte	0x4be
	.byte	0x38
	.uleb128 0xd
	.4byte	.LASF179
	.byte	0xc
	.2byte	0x16e
	.4byte	0x4be
	.byte	0x40
	.uleb128 0xd
	.4byte	.LASF180
	.byte	0xc
	.2byte	0x16f
	.4byte	0x4be
	.byte	0x48
	.byte	0
	.uleb128 0xe
	.4byte	0x990
	.4byte	0xbbe
	.uleb128 0xf
	.4byte	0x90
	.byte	0x7
	.byte	0
	.uleb128 0x20
	.4byte	.LASF196
	.uleb128 0x18
	.byte	0x4
	.4byte	0xbbe
	.uleb128 0x18
	.byte	0x4
	.4byte	0xac9
	.uleb128 0x21
	.4byte	0xbda
	.uleb128 0x1f
	.4byte	0x837
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0xbcf
	.uleb128 0x18
	.byte	0x4
	.4byte	0xa77
	.uleb128 0x18
	.byte	0x4
	.4byte	0x548
	.uleb128 0x21
	.4byte	0xbf7
	.uleb128 0x1f
	.4byte	0x89
	.byte	0
	.uleb128 0x18
	.byte	0x4
	.4byte	0xbfd
	.uleb128 0x18
	.byte	0x4
	.4byte	0xbec
	.uleb128 0x18
	.byte	0x4
	.4byte	0xb11
	.uleb128 0x6
	.4byte	.LASF181
	.byte	0xc
	.2byte	0x1ca
	.4byte	0x706
	.uleb128 0x6
	.4byte	.LASF182
	.byte	0xc
	.2byte	0x1cb
	.4byte	0x706
	.uleb128 0x6
	.4byte	.LASF183
	.byte	0xc
	.2byte	0x1cc
	.4byte	0x706
	.uleb128 0x6
	.4byte	.LASF184
	.byte	0xc
	.2byte	0x32e
	.4byte	0x837
	.uleb128 0x6
	.4byte	.LASF185
	.byte	0xc
	.2byte	0x32f
	.4byte	0x83d
	.uleb128 0x6
	.4byte	.LASF186
	.byte	0xc
	.2byte	0x341
	.4byte	0x64e
	.uleb128 0x22
	.4byte	.LASF197
	.byte	0x1
	.byte	0x18
	.4byte	.LFB127
	.4byte	.LFE127-.LFB127
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc9a
	.uleb128 0x23
	.4byte	.LASF187
	.byte	0x1
	.byte	0x19
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x23
	.4byte	.LASF188
	.byte	0x1
	.byte	0x1a
	.4byte	0xc9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x24
	.ascii	"i\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x89
	.uleb128 0x23
	.4byte	.LASF189
	.byte	0x1
	.byte	0x1c
	.4byte	0xca1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF190
	.uleb128 0xe
	.4byte	0x990
	.4byte	0xcb1
	.uleb128 0xf
	.4byte	0x90
	.byte	0x9
	.byte	0
	.uleb128 0x25
	.4byte	.LASF198
	.byte	0x1
	.byte	0x3
	.4byte	.LFB126
	.4byte	.LFE126-.LFB126
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x23
	.4byte	.LASF191
	.byte	0x1
	.byte	0x4
	.4byte	0x434
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x23
	.4byte	.LASF192
	.byte	0x1
	.byte	0x5
	.4byte	0x332
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF104:
	.ascii	"_dso_handle\000"
.LASF40:
	.ascii	"PUPDR\000"
.LASF197:
	.ascii	"MQ_135_read\000"
.LASF58:
	.ascii	"GPIO_OType_PP\000"
.LASF103:
	.ascii	"_fnargs\000"
.LASF159:
	.ascii	"_rand48\000"
.LASF49:
	.ascii	"ADC_ExternalTrigConv\000"
.LASF125:
	.ascii	"_emergency\000"
.LASF195:
	.ascii	"/home/ivana/Projekt/LCD\000"
.LASF67:
	.ascii	"GPIO_PuPd_UP\000"
.LASF38:
	.ascii	"OTYPER\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF21:
	.ascii	"FunctionalState\000"
.LASF23:
	.ascii	"SMPR2\000"
.LASF179:
	.ascii	"_wcrtomb_state\000"
.LASF180:
	.ascii	"_wcsrtombs_state\000"
.LASF37:
	.ascii	"MODER\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF55:
	.ascii	"GPIO_Mode_AF\000"
.LASF72:
	.ascii	"GPIO_Speed\000"
.LASF196:
	.ascii	"__locale_t\000"
.LASF56:
	.ascii	"GPIO_Mode_AN\000"
.LASF51:
	.ascii	"ADC_NbrOfConversion\000"
.LASF17:
	.ascii	"ITM_RxBuffer\000"
.LASF177:
	.ascii	"_mbrtowc_state\000"
.LASF172:
	.ascii	"_wctomb_state\000"
.LASF93:
	.ascii	"__tm_sec\000"
.LASF31:
	.ascii	"JSQR\000"
.LASF77:
	.ascii	"_off_t\000"
.LASF10:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF147:
	.ascii	"_ubuf\000"
.LASF193:
	.ascii	"GNU C99 7.3.1 20180622 (release) [ARM/embedded-7-br"
	.ascii	"anch revision 261907] -mcpu=cortex-m4 -mthumb -mflo"
	.ascii	"at-abi=softfp -g -std=c99 -fomit-frame-pointer -fno"
	.ascii	"-strict-aliasing\000"
.LASF53:
	.ascii	"GPIO_Mode_IN\000"
.LASF95:
	.ascii	"__tm_hour\000"
.LASF191:
	.ascii	"GPIO_InitStruct\000"
.LASF138:
	.ascii	"__sf\000"
.LASF102:
	.ascii	"_on_exit_args\000"
.LASF142:
	.ascii	"_cookie\000"
.LASF137:
	.ascii	"__sglue\000"
.LASF47:
	.ascii	"ADC_ContinuousConvMode\000"
.LASF7:
	.ascii	"long int\000"
.LASF115:
	.ascii	"_flags\000"
.LASF106:
	.ascii	"_is_cxa\000"
.LASF121:
	.ascii	"_stdin\000"
.LASF166:
	.ascii	"_result_k\000"
.LASF20:
	.ascii	"ENABLE\000"
.LASF2:
	.ascii	"short int\000"
.LASF14:
	.ascii	"uint16_t\000"
.LASF36:
	.ascii	"ADC_TypeDef\000"
.LASF132:
	.ascii	"_cvtbuf\000"
.LASF150:
	.ascii	"_offset\000"
.LASF71:
	.ascii	"GPIO_Mode\000"
.LASF178:
	.ascii	"_mbsrtowcs_state\000"
.LASF189:
	.ascii	"array\000"
.LASF176:
	.ascii	"_mbrlen_state\000"
.LASF60:
	.ascii	"GPIOOType_TypeDef\000"
.LASF109:
	.ascii	"_fns\000"
.LASF39:
	.ascii	"OSPEEDR\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF62:
	.ascii	"GPIO_Medium_Speed\000"
.LASF184:
	.ascii	"_impure_ptr\000"
.LASF123:
	.ascii	"_stderr\000"
.LASF91:
	.ascii	"_Bigint\000"
.LASF94:
	.ascii	"__tm_min\000"
.LASF87:
	.ascii	"_next\000"
.LASF65:
	.ascii	"GPIOSpeed_TypeDef\000"
.LASF143:
	.ascii	"_read\000"
.LASF188:
	.ascii	"temp\000"
.LASF92:
	.ascii	"__tm\000"
.LASF110:
	.ascii	"_on_exit_args_ptr\000"
.LASF81:
	.ascii	"__wchb\000"
.LASF18:
	.ascii	"SystemCoreClock\000"
.LASF122:
	.ascii	"_stdout\000"
.LASF131:
	.ascii	"_cvtlen\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF44:
	.ascii	"GPIO_TypeDef\000"
.LASF116:
	.ascii	"_file\000"
.LASF43:
	.ascii	"LCKR\000"
.LASF118:
	.ascii	"_data\000"
.LASF157:
	.ascii	"_niobs\000"
.LASF187:
	.ascii	"data\000"
.LASF163:
	.ascii	"_rand_next\000"
.LASF45:
	.ascii	"ADC_Resolution\000"
.LASF140:
	.ascii	"_signal_buf\000"
.LASF135:
	.ascii	"_asctime_buf\000"
.LASF69:
	.ascii	"GPIOPuPd_TypeDef\000"
.LASF80:
	.ascii	"__wch\000"
.LASF79:
	.ascii	"wint_t\000"
.LASF151:
	.ascii	"_lock\000"
.LASF161:
	.ascii	"_mult\000"
.LASF165:
	.ascii	"_result\000"
.LASF66:
	.ascii	"GPIO_PuPd_NOPULL\000"
.LASF144:
	.ascii	"_write\000"
.LASF98:
	.ascii	"__tm_year\000"
.LASF182:
	.ascii	"__sf_fake_stdout\000"
.LASF24:
	.ascii	"JOFR1\000"
.LASF25:
	.ascii	"JOFR2\000"
.LASF26:
	.ascii	"JOFR3\000"
.LASF27:
	.ascii	"JOFR4\000"
.LASF70:
	.ascii	"GPIO_Pin\000"
.LASF139:
	.ascii	"_misc\000"
.LASF73:
	.ascii	"GPIO_OType\000"
.LASF198:
	.ascii	"ADC2_Init\000"
.LASF181:
	.ascii	"__sf_fake_stdin\000"
.LASF32:
	.ascii	"JDR1\000"
.LASF61:
	.ascii	"GPIO_Low_Speed\000"
.LASF34:
	.ascii	"JDR3\000"
.LASF35:
	.ascii	"JDR4\000"
.LASF75:
	.ascii	"GPIO_InitTypeDef\000"
.LASF22:
	.ascii	"SMPR1\000"
.LASF97:
	.ascii	"__tm_mon\000"
.LASF107:
	.ascii	"_atexit\000"
.LASF126:
	.ascii	"__sdidinit\000"
.LASF130:
	.ascii	"_gamma_signgam\000"
.LASF28:
	.ascii	"SQR1\000"
.LASF29:
	.ascii	"SQR2\000"
.LASF30:
	.ascii	"SQR3\000"
.LASF168:
	.ascii	"_freelist\000"
.LASF84:
	.ascii	"_mbstate_t\000"
.LASF76:
	.ascii	"_LOCK_RECURSIVE_T\000"
.LASF112:
	.ascii	"_base\000"
.LASF15:
	.ascii	"int32_t\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF158:
	.ascii	"_iobs\000"
.LASF114:
	.ascii	"__sFILE_fake\000"
.LASF100:
	.ascii	"__tm_yday\000"
.LASF111:
	.ascii	"__sbuf\000"
.LASF153:
	.ascii	"_flags2\000"
.LASF48:
	.ascii	"ADC_ExternalTrigConvEdge\000"
.LASF63:
	.ascii	"GPIO_Fast_Speed\000"
.LASF155:
	.ascii	"__FILE\000"
.LASF141:
	.ascii	"__sFILE\000"
.LASF152:
	.ascii	"_mbstate\000"
.LASF46:
	.ascii	"ADC_ScanConvMode\000"
.LASF171:
	.ascii	"_mblen_state\000"
.LASF124:
	.ascii	"_inc\000"
.LASF108:
	.ascii	"_ind\000"
.LASF19:
	.ascii	"DISABLE\000"
.LASF128:
	.ascii	"_locale\000"
.LASF129:
	.ascii	"__cleanup\000"
.LASF127:
	.ascii	"_unspecified_locale_info\000"
.LASF88:
	.ascii	"_maxwds\000"
.LASF119:
	.ascii	"_reent\000"
.LASF52:
	.ascii	"ADC_InitTypeDef\000"
.LASF160:
	.ascii	"_seed\000"
.LASF82:
	.ascii	"__count\000"
.LASF83:
	.ascii	"__value\000"
.LASF145:
	.ascii	"_seek\000"
.LASF50:
	.ascii	"ADC_DataAlign\000"
.LASF99:
	.ascii	"__tm_wday\000"
.LASF78:
	.ascii	"_fpos_t\000"
.LASF54:
	.ascii	"GPIO_Mode_OUT\000"
.LASF120:
	.ascii	"_errno\000"
.LASF154:
	.ascii	"char\000"
.LASF149:
	.ascii	"_blksize\000"
.LASF113:
	.ascii	"_size\000"
.LASF12:
	.ascii	"unsigned int\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF186:
	.ascii	"_global_atexit\000"
.LASF6:
	.ascii	"__int32_t\000"
.LASF89:
	.ascii	"_sign\000"
.LASF164:
	.ascii	"_mprec\000"
.LASF194:
	.ascii	"Project/Source/MQ-135.c\000"
.LASF170:
	.ascii	"_strtok_last\000"
.LASF105:
	.ascii	"_fntypes\000"
.LASF169:
	.ascii	"_misc_reent\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF162:
	.ascii	"_add\000"
.LASF86:
	.ascii	"__ULong\000"
.LASF175:
	.ascii	"_getdate_err\000"
.LASF192:
	.ascii	"adc_init\000"
.LASF185:
	.ascii	"_global_impure_ptr\000"
.LASF16:
	.ascii	"uint32_t\000"
.LASF59:
	.ascii	"GPIO_OType_OD\000"
.LASF41:
	.ascii	"BSRRL\000"
.LASF90:
	.ascii	"_wds\000"
.LASF156:
	.ascii	"_glue\000"
.LASF42:
	.ascii	"BSRRH\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF174:
	.ascii	"_l64a_buf\000"
.LASF68:
	.ascii	"GPIO_PuPd_DOWN\000"
.LASF136:
	.ascii	"_sig_func\000"
.LASF190:
	.ascii	"float\000"
.LASF33:
	.ascii	"JDR2\000"
.LASF85:
	.ascii	"_flock_t\000"
.LASF74:
	.ascii	"GPIO_PuPd\000"
.LASF148:
	.ascii	"_nbuf\000"
.LASF101:
	.ascii	"__tm_isdst\000"
.LASF134:
	.ascii	"_localtime_buf\000"
.LASF146:
	.ascii	"_close\000"
.LASF183:
	.ascii	"__sf_fake_stderr\000"
.LASF133:
	.ascii	"_r48\000"
.LASF57:
	.ascii	"GPIOMode_TypeDef\000"
.LASF173:
	.ascii	"_mbtowc_state\000"
.LASF167:
	.ascii	"_p5s\000"
.LASF117:
	.ascii	"_lbfsize\000"
.LASF64:
	.ascii	"GPIO_High_Speed\000"
.LASF96:
	.ascii	"__tm_mday\000"
	.ident	"GCC: (15:7-2018-q2-6) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
