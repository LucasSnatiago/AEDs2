	.file	"QuickSortParalelo.c"
	.text
	.globl	MAX_THREADS
	.section	.rodata
	.align 4
	.type	MAX_THREADS, @object
	.size	MAX_THREADS, 4
MAX_THREADS:
	.long	1024
.LC0:
	.string	"Teste!"
	.text
	.globl	debug
	.type	debug, @function
debug:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	debug, .-debug
	.globl	criarValores
	.type	criarValores, @function
criarValores:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L3
.L4:
	call	rand@PLT
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rax, %rcx
	movl	%edx, %eax
	cltd
	idivl	-28(%rbp)
	movl	%edx, %eax
	movl	%eax, (%rcx)
	addl	$1, -4(%rbp)
.L3:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L4
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	criarValores, .-criarValores
	.globl	quickSort
	.type	quickSort, @function
quickSort:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	%edx, -64(%rbp)
	movl	%ecx, -68(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-60(%rbp), %eax
	movl	%eax, -48(%rbp)
	movl	-64(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	-60(%rbp), %edx
	movl	-64(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -40(%rbp)
	jmp	.L6
.L8:
	addl	$1, -48(%rbp)
.L7:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -40(%rbp)
	jg	.L8
	jmp	.L9
.L10:
	subl	$1, -44(%rbp)
.L9:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -40(%rbp)
	jl	.L10
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jg	.L6
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -36(%rbp)
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-56(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movl	-36(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -48(%rbp)
	subl	$1, -44(%rbp)
.L6:
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle	.L7
	cmpl	$1, -68(%rbp)
	jne	.L12
	movl	-44(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-60(%rbp), %eax
	movl	%eax, -24(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -32(%rbp)
	leaq	-32(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	leaq	quickSort._omp_fn.0(%rip), %rdi
	call	GOMP_parallel@PLT
	jmp	.L13
.L12:
	movl	-60(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jge	.L13
	movl	-44(%rbp), %edx
	movl	-60(%rbp), %esi
	movq	-56(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdi
	call	quickSort
.L13:
	cmpl	$1, -68(%rbp)
	jne	.L14
	movl	-48(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-64(%rbp), %eax
	movl	%eax, -24(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -32(%rbp)
	leaq	-32(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	leaq	quickSort._omp_fn.1(%rip), %rdi
	call	GOMP_parallel@PLT
	jmp	.L17
.L14:
	movl	-48(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jge	.L17
	movl	-64(%rbp), %edx
	movl	-48(%rbp), %esi
	movq	-56(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdi
	call	quickSort
.L17:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	quickSort, .-quickSort
	.globl	testar
	.type	testar, @function
testar:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movw	$1, -6(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L19
.L21:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L20
	movw	$0, -6(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -4(%rbp)
.L20:
	addl	$1, -4(%rbp)
.L19:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L21
	movzwl	-6(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	testar, .-testar
	.section	.rodata
	.align 8
.LC1:
	.string	"Tempo medio por ordenacao: %lf segundos, Valores ordenados: "
.LC2:
	.string	"sim!"
.LC3:
	.string	"nao!"
	.text
	.globl	escreverValores
	.type	escreverValores, @function
escreverValores:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	%xmm0, -8(%rbp)
	movl	%edi, %eax
	movw	%ax, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	cmpw	$0, -12(%rbp)
	je	.L24
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	jmp	.L26
.L24:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
.L26:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	escreverValores, .-escreverValores
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	$100000, -80(%rbp)
	movl	-80(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -56(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r8
	movl	$0, %r9d
	movslq	%eax, %rdx
	movq	%rdx, %rsi
	movl	$0, %edi
	cltq
	salq	$2, %rax
	leaq	3(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -48(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -72(%rbp)
	call	omp_get_max_threads@PLT
	movl	%eax, -76(%rbp)
	movl	$0, -84(%rbp)
	jmp	.L28
.L29:
	movq	-48(%rbp), %rax
	movl	-80(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	criarValores
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	movl	-76(%rbp), %ecx
	movl	-80(%rbp), %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	quickSort
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	subsd	-40(%rbp), %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	-72(%rbp), %xmm0
	addsd	-64(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	addl	$1, -84(%rbp)
.L28:
	cmpl	$9, -84(%rbp)
	jle	.L29
	movsd	-64(%rbp), %xmm0
	movsd	.LC5(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	movq	-48(%rbp), %rax
	movl	-80(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	testar
	movw	%ax, -86(%rbp)
	movswl	-86(%rbp), %edx
	movq	-64(%rbp), %rax
	movl	%edx, %edi
	movq	%rax, -104(%rbp)
	movsd	-104(%rbp), %xmm0
	call	escreverValores
	movq	%rbx, %rsp
	movl	$0, %eax
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.type	quickSort._omp_fn.0, @function
quickSort._omp_fn.0:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -20(%rbp)
	movq	-40(%rbp), %rax
	movl	12(%rax), %eax
	movl	%eax, -16(%rbp)
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %ecx
	movl	-20(%rbp), %edx
	movl	-12(%rbp), %esi
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	quickSort
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	quickSort._omp_fn.0, .-quickSort._omp_fn.0
	.type	quickSort._omp_fn.1, @function
quickSort._omp_fn.1:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -20(%rbp)
	movq	-40(%rbp), %rax
	movl	12(%rax), %eax
	movl	%eax, -16(%rbp)
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %ecx
	movl	-12(%rbp), %edx
	movl	-20(%rbp), %esi
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	quickSort
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	quickSort._omp_fn.1, .-quickSort._omp_fn.1
	.section	.rodata
	.align 8
.LC5:
	.long	0
	.long	1076101120
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
