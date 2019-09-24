Desmontagem da seção .init:

00000000000007b8 <_init>:
 7b8:	48 83 ec 08          	sub    $0x8,%rsp
 7bc:	48 8b 05 25 28 20 00 	mov    0x202825(%rip),%rax        # 202fe8 <__gmon_start__>
 7c3:	48 85 c0             	test   %rax,%rax
 7c6:	74 02                	je     7ca <_init+0x12>
 7c8:	ff d0                	callq  *%rax
 7ca:	48 83 c4 08          	add    $0x8,%rsp
 7ce:	c3                   	retq   

Desmontagem da seção .plt:

00000000000007d0 <.plt>:
 7d0:	ff 35 92 27 20 00    	pushq  0x202792(%rip)        # 202f68 <_GLOBAL_OFFSET_TABLE_+0x8>
 7d6:	ff 25 94 27 20 00    	jmpq   *0x202794(%rip)        # 202f70 <_GLOBAL_OFFSET_TABLE_+0x10>
 7dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000007e0 <putchar@plt>:
 7e0:	ff 25 92 27 20 00    	jmpq   *0x202792(%rip)        # 202f78 <putchar@GLIBC_2.2.5>
 7e6:	68 00 00 00 00       	pushq  $0x0
 7eb:	e9 e0 ff ff ff       	jmpq   7d0 <.plt>

00000000000007f0 <fread@plt>:
 7f0:	ff 25 8a 27 20 00    	jmpq   *0x20278a(%rip)        # 202f80 <fread@GLIBC_2.2.5>
 7f6:	68 01 00 00 00       	pushq  $0x1
 7fb:	e9 d0 ff ff ff       	jmpq   7d0 <.plt>

0000000000000800 <clock@plt>:
 800:	ff 25 82 27 20 00    	jmpq   *0x202782(%rip)        # 202f88 <clock@GLIBC_2.2.5>
 806:	68 02 00 00 00       	pushq  $0x2
 80b:	e9 c0 ff ff ff       	jmpq   7d0 <.plt>

0000000000000810 <strlen@plt>:
 810:	ff 25 7a 27 20 00    	jmpq   *0x20277a(%rip)        # 202f90 <strlen@GLIBC_2.2.5>
 816:	68 03 00 00 00       	pushq  $0x3
 81b:	e9 b0 ff ff ff       	jmpq   7d0 <.plt>

0000000000000820 <__stack_chk_fail@plt>:
 820:	ff 25 72 27 20 00    	jmpq   *0x202772(%rip)        # 202f98 <__stack_chk_fail@GLIBC_2.4>
 826:	68 04 00 00 00       	pushq  $0x4
 82b:	e9 a0 ff ff ff       	jmpq   7d0 <.plt>

0000000000000830 <printf@plt>:
 830:	ff 25 6a 27 20 00    	jmpq   *0x20276a(%rip)        # 202fa0 <printf@GLIBC_2.2.5>
 836:	68 05 00 00 00       	pushq  $0x5
 83b:	e9 90 ff ff ff       	jmpq   7d0 <.plt>

0000000000000840 <fgets@plt>:
 840:	ff 25 62 27 20 00    	jmpq   *0x202762(%rip)        # 202fa8 <fgets@GLIBC_2.2.5>
 846:	68 06 00 00 00       	pushq  $0x6
 84b:	e9 80 ff ff ff       	jmpq   7d0 <.plt>

0000000000000850 <fprintf@plt>:
 850:	ff 25 5a 27 20 00    	jmpq   *0x20275a(%rip)        # 202fb0 <fprintf@GLIBC_2.2.5>
 856:	68 07 00 00 00       	pushq  $0x7
 85b:	e9 70 ff ff ff       	jmpq   7d0 <.plt>

0000000000000860 <ftell@plt>:
 860:	ff 25 52 27 20 00    	jmpq   *0x202752(%rip)        # 202fb8 <ftell@GLIBC_2.2.5>
 866:	68 08 00 00 00       	pushq  $0x8
 86b:	e9 60 ff ff ff       	jmpq   7d0 <.plt>

0000000000000870 <fseek@plt>:
 870:	ff 25 4a 27 20 00    	jmpq   *0x20274a(%rip)        # 202fc0 <fseek@GLIBC_2.2.5>
 876:	68 09 00 00 00       	pushq  $0x9
 87b:	e9 50 ff ff ff       	jmpq   7d0 <.plt>

0000000000000880 <fopen@plt>:
 880:	ff 25 42 27 20 00    	jmpq   *0x202742(%rip)        # 202fc8 <fopen@GLIBC_2.2.5>
 886:	68 0a 00 00 00       	pushq  $0xa
 88b:	e9 40 ff ff ff       	jmpq   7d0 <.plt>

0000000000000890 <fwrite@plt>:
 890:	ff 25 3a 27 20 00    	jmpq   *0x20273a(%rip)        # 202fd0 <fwrite@GLIBC_2.2.5>
 896:	68 0b 00 00 00       	pushq  $0xb
 89b:	e9 30 ff ff ff       	jmpq   7d0 <.plt>

Desmontagem da seção .plt.got:

00000000000008a0 <__cxa_finalize@plt>:
 8a0:	ff 25 52 27 20 00    	jmpq   *0x202752(%rip)        # 202ff8 <__cxa_finalize@GLIBC_2.2.5>
 8a6:	66 90                	xchg   %ax,%ax

Desmontagem da seção .text:

00000000000008b0 <_start>:
     8b0:	31 ed                	xor    %ebp,%ebp
     8b2:	49 89 d1             	mov    %rdx,%r9
     8b5:	5e                   	pop    %rsi
     8b6:	48 89 e2             	mov    %rsp,%rdx
     8b9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
     8bd:	50                   	push   %rax
     8be:	54                   	push   %rsp
     8bf:	4c 8d 05 1a 15 00 00 	lea    0x151a(%rip),%r8        # 1de0 <__libc_csu_fini>
     8c6:	48 8d 0d a3 14 00 00 	lea    0x14a3(%rip),%rcx        # 1d70 <__libc_csu_init>
     8cd:	48 8d 3d 80 13 00 00 	lea    0x1380(%rip),%rdi        # 1c54 <main>
     8d4:	ff 15 06 27 20 00    	callq  *0x202706(%rip)        # 202fe0 <__libc_start_main@GLIBC_2.2.5>
     8da:	f4                   	hlt    
     8db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000008e0 <deregister_tm_clones>:
     8e0:	48 8d 3d 29 27 20 00 	lea    0x202729(%rip),%rdi        # 203010 <stdin@@GLIBC_2.2.5>
     8e7:	55                   	push   %rbp
     8e8:	48 8d 05 21 27 20 00 	lea    0x202721(%rip),%rax        # 203010 <stdin@@GLIBC_2.2.5>
     8ef:	48 39 f8             	cmp    %rdi,%rax
     8f2:	48 89 e5             	mov    %rsp,%rbp
     8f5:	74 19                	je     910 <deregister_tm_clones+0x30>
     8f7:	48 8b 05 da 26 20 00 	mov    0x2026da(%rip),%rax        # 202fd8 <_ITM_deregisterTMCloneTable>
     8fe:	48 85 c0             	test   %rax,%rax
     901:	74 0d                	je     910 <deregister_tm_clones+0x30>
     903:	5d                   	pop    %rbp
     904:	ff e0                	jmpq   *%rax
     906:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     90d:	00 00 00 
     910:	5d                   	pop    %rbp
     911:	c3                   	retq   
     912:	0f 1f 40 00          	nopl   0x0(%rax)
     916:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     91d:	00 00 00 

0000000000000920 <register_tm_clones>:
     920:	48 8d 3d e9 26 20 00 	lea    0x2026e9(%rip),%rdi        # 203010 <stdin@@GLIBC_2.2.5>
     927:	48 8d 35 e2 26 20 00 	lea    0x2026e2(%rip),%rsi        # 203010 <stdin@@GLIBC_2.2.5>
     92e:	55                   	push   %rbp
     92f:	48 29 fe             	sub    %rdi,%rsi
     932:	48 89 e5             	mov    %rsp,%rbp
     935:	48 c1 fe 03          	sar    $0x3,%rsi
     939:	48 89 f0             	mov    %rsi,%rax
     93c:	48 c1 e8 3f          	shr    $0x3f,%rax
     940:	48 01 c6             	add    %rax,%rsi
     943:	48 d1 fe             	sar    %rsi
     946:	74 18                	je     960 <register_tm_clones+0x40>
     948:	48 8b 05 a1 26 20 00 	mov    0x2026a1(%rip),%rax        # 202ff0 <_ITM_registerTMCloneTable>
     94f:	48 85 c0             	test   %rax,%rax
     952:	74 0c                	je     960 <register_tm_clones+0x40>
     954:	5d                   	pop    %rbp
     955:	ff e0                	jmpq   *%rax
     957:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     95e:	00 00 
     960:	5d                   	pop    %rbp
     961:	c3                   	retq   
     962:	0f 1f 40 00          	nopl   0x0(%rax)
     966:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     96d:	00 00 00 

0000000000000970 <__do_global_dtors_aux>:
     970:	80 3d a1 26 20 00 00 	cmpb   $0x0,0x2026a1(%rip)        # 203018 <completed.7697>
     977:	75 2f                	jne    9a8 <__do_global_dtors_aux+0x38>
     979:	48 83 3d 77 26 20 00 	cmpq   $0x0,0x202677(%rip)        # 202ff8 <__cxa_finalize@GLIBC_2.2.5>
     980:	00 
     981:	55                   	push   %rbp
     982:	48 89 e5             	mov    %rsp,%rbp
     985:	74 0c                	je     993 <__do_global_dtors_aux+0x23>
     987:	48 8b 3d 7a 26 20 00 	mov    0x20267a(%rip),%rdi        # 203008 <__dso_handle>
     98e:	e8 0d ff ff ff       	callq  8a0 <__cxa_finalize@plt>
     993:	e8 48 ff ff ff       	callq  8e0 <deregister_tm_clones>
     998:	c6 05 79 26 20 00 01 	movb   $0x1,0x202679(%rip)        # 203018 <completed.7697>
     99f:	5d                   	pop    %rbp
     9a0:	c3                   	retq   
     9a1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
     9a8:	f3 c3                	repz retq 
     9aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000009b0 <frame_dummy>:
     9b0:	55                   	push   %rbp
     9b1:	48 89 e5             	mov    %rsp,%rbp
     9b4:	5d                   	pop    %rbp
     9b5:	e9 66 ff ff ff       	jmpq   920 <register_tm_clones>

00000000000009ba <ehFim>:
     9ba:	55                   	push   %rbp
     9bb:	48 89 e5             	mov    %rsp,%rbp
     9be:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
     9c2:	66 c7 45 fe 01 00    	movw   $0x1,-0x2(%rbp)
     9c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     9cc:	0f b6 00             	movzbl (%rax),%eax
     9cf:	3c 46                	cmp    $0x46,%al
     9d1:	75 1e                	jne    9f1 <ehFim+0x37>
     9d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     9d7:	48 83 c0 01          	add    $0x1,%rax
     9db:	0f b6 00             	movzbl (%rax),%eax
     9de:	3c 49                	cmp    $0x49,%al
     9e0:	75 0f                	jne    9f1 <ehFim+0x37>
     9e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     9e6:	48 83 c0 02          	add    $0x2,%rax
     9ea:	0f b6 00             	movzbl (%rax),%eax
     9ed:	3c 4d                	cmp    $0x4d,%al
     9ef:	74 06                	je     9f7 <ehFim+0x3d>
     9f1:	66 c7 45 fe 00 00    	movw   $0x0,-0x2(%rbp)
     9f7:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
     9fb:	5d                   	pop    %rbp
     9fc:	c3                   	retq   

00000000000009fd <find>:
     9fd:	55                   	push   %rbp
     9fe:	48 89 e5             	mov    %rsp,%rbp
     a01:	48 83 ec 40          	sub    $0x40,%rsp
     a05:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
     a09:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
     a0d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
     a11:	66 c7 45 e0 00 00    	movw   $0x0,-0x20(%rbp)
     a17:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     a1b:	48 89 c7             	mov    %rax,%rdi
     a1e:	e8 ed fd ff ff       	callq  810 <strlen@plt>
     a23:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     a27:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     a2b:	48 89 c7             	mov    %rax,%rdi
     a2e:	e8 dd fd ff ff       	callq  810 <strlen@plt>
     a33:	89 45 ec             	mov    %eax,-0x14(%rbp)
     a36:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
     a3d:	66 c7 45 e2 01 00    	movw   $0x1,-0x1e(%rbp)
     a43:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     a4a:	00 
     a4b:	e9 a5 00 00 00       	jmpq   af5 <find+0xf8>
     a50:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     a54:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     a58:	48 01 d0             	add    %rdx,%rax
     a5b:	0f b6 10             	movzbl (%rax),%edx
     a5e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     a62:	0f b6 00             	movzbl (%rax),%eax
     a65:	38 c2                	cmp    %al,%dl
     a67:	75 6a                	jne    ad3 <find+0xd6>
     a69:	66 83 7d e2 00       	cmpw   $0x0,-0x1e(%rbp)
     a6e:	74 63                	je     ad3 <find+0xd6>
     a70:	66 c7 45 e0 01 00    	movw   $0x1,-0x20(%rbp)
     a76:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%rbp)
     a7c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
     a83:	eb 46                	jmp    acb <find+0xce>
     a85:	8b 45 e8             	mov    -0x18(%rbp),%eax
     a88:	48 63 d0             	movslq %eax,%rdx
     a8b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     a8f:	48 01 d0             	add    %rdx,%rax
     a92:	48 89 c2             	mov    %rax,%rdx
     a95:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     a99:	48 01 d0             	add    %rdx,%rax
     a9c:	0f b6 10             	movzbl (%rax),%edx
     a9f:	8b 45 e8             	mov    -0x18(%rbp),%eax
     aa2:	48 63 c8             	movslq %eax,%rcx
     aa5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     aa9:	48 01 c8             	add    %rcx,%rax
     aac:	0f b6 00             	movzbl (%rax),%eax
     aaf:	38 c2                	cmp    %al,%dl
     ab1:	74 0e                	je     ac1 <find+0xc4>
     ab3:	66 c7 45 e0 00 00    	movw   $0x0,-0x20(%rbp)
     ab9:	8b 45 ec             	mov    -0x14(%rbp),%eax
     abc:	89 45 e8             	mov    %eax,-0x18(%rbp)
     abf:	eb 06                	jmp    ac7 <find+0xca>
     ac1:	66 c7 45 e2 01 00    	movw   $0x1,-0x1e(%rbp)
     ac7:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
     acb:	8b 45 e8             	mov    -0x18(%rbp),%eax
     ace:	3b 45 ec             	cmp    -0x14(%rbp),%eax
     ad1:	7c b2                	jl     a85 <find+0x88>
     ad3:	66 83 7d e0 00       	cmpw   $0x0,-0x20(%rbp)
     ad8:	74 16                	je     af0 <find+0xf3>
     ada:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ade:	89 c2                	mov    %eax,%edx
     ae0:	8b 45 ec             	mov    -0x14(%rbp),%eax
     ae3:	01 d0                	add    %edx,%eax
     ae5:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     ae8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     aec:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     af0:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
     af5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     af9:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
     afd:	0f 8c 4d ff ff ff    	jl     a50 <find+0x53>
     b03:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     b07:	8b 55 e4             	mov    -0x1c(%rbp),%edx
     b0a:	89 10                	mov    %edx,(%rax)
     b0c:	0f b7 45 e0          	movzwl -0x20(%rbp),%eax
     b10:	c9                   	leaveq 
     b11:	c3                   	retq   

0000000000000b12 <limpandoEntrada>:
     b12:	55                   	push   %rbp
     b13:	48 89 e5             	mov    %rsp,%rbp
     b16:	48 83 ec 30          	sub    $0x30,%rsp
     b1a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
     b1e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
     b22:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     b29:	00 00 
     b2b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     b2f:	31 c0                	xor    %eax,%eax
     b31:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     b35:	48 89 c7             	mov    %rax,%rdi
     b38:	e8 d3 fc ff ff       	callq  810 <strlen@plt>
     b3d:	89 45 f4             	mov    %eax,-0xc(%rbp)
     b40:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
     b47:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
     b4e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     b55:	48 8d 55 e4          	lea    -0x1c(%rbp),%rdx
     b59:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     b5d:	48 8d 35 a0 12 00 00 	lea    0x12a0(%rip),%rsi        # 1e04 <TAMmenor+0x4>
     b64:	48 89 c7             	mov    %rax,%rdi
     b67:	e8 91 fe ff ff       	callq  9fd <find>
     b6c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     b6f:	48 63 d0             	movslq %eax,%rdx
     b72:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     b76:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
     b7a:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
     b7e:	48 89 c2             	mov    %rax,%rdx
     b81:	48 8d 35 83 12 00 00 	lea    0x1283(%rip),%rsi        # 1e0b <TAMmenor+0xb>
     b88:	48 89 cf             	mov    %rcx,%rdi
     b8b:	e8 6d fe ff ff       	callq  9fd <find>
     b90:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     b93:	89 45 f0             	mov    %eax,-0x10(%rbp)
     b96:	eb 27                	jmp    bbf <limpandoEntrada+0xad>
     b98:	8b 45 f0             	mov    -0x10(%rbp),%eax
     b9b:	48 63 d0             	movslq %eax,%rdx
     b9e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     ba2:	48 01 d0             	add    %rdx,%rax
     ba5:	8b 55 ec             	mov    -0x14(%rbp),%edx
     ba8:	48 63 ca             	movslq %edx,%rcx
     bab:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
     baf:	48 01 ca             	add    %rcx,%rdx
     bb2:	0f b6 00             	movzbl (%rax),%eax
     bb5:	88 02                	mov    %al,(%rdx)
     bb7:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
     bbb:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
     bbf:	8b 45 e8             	mov    -0x18(%rbp),%eax
     bc2:	39 45 f0             	cmp    %eax,-0x10(%rbp)
     bc5:	7c d1                	jl     b98 <limpandoEntrada+0x86>
     bc7:	90                   	nop
     bc8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     bcc:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
     bd3:	00 00 
     bd5:	74 05                	je     bdc <limpandoEntrada+0xca>
     bd7:	e8 44 fc ff ff       	callq  820 <__stack_chk_fail@plt>
     bdc:	c9                   	leaveq 
     bdd:	c3                   	retq   

0000000000000bde <removerTags>:
     bde:	55                   	push   %rbp
     bdf:	48 89 e5             	mov    %rsp,%rbp
     be2:	53                   	push   %rbx
     be3:	48 83 ec 38          	sub    $0x38,%rsp
     be7:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
     beb:	66 c7 45 dc 01 00    	movw   $0x1,-0x24(%rbp)
     bf1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
     bf8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
     bff:	eb 62                	jmp    c63 <removerTags+0x85>
     c01:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     c04:	48 63 d0             	movslq %eax,%rdx
     c07:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     c0b:	48 01 d0             	add    %rdx,%rax
     c0e:	0f b6 00             	movzbl (%rax),%eax
     c11:	3c 3c                	cmp    $0x3c,%al
     c13:	75 06                	jne    c1b <removerTags+0x3d>
     c15:	66 c7 45 dc 01 00    	movw   $0x1,-0x24(%rbp)
     c1b:	66 83 7d dc 00       	cmpw   $0x0,-0x24(%rbp)
     c20:	75 23                	jne    c45 <removerTags+0x67>
     c22:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     c25:	48 63 d0             	movslq %eax,%rdx
     c28:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     c2c:	48 01 d0             	add    %rdx,%rax
     c2f:	8b 55 e0             	mov    -0x20(%rbp),%edx
     c32:	48 63 ca             	movslq %edx,%rcx
     c35:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     c39:	48 01 ca             	add    %rcx,%rdx
     c3c:	0f b6 00             	movzbl (%rax),%eax
     c3f:	88 02                	mov    %al,(%rdx)
     c41:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
     c45:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     c48:	48 63 d0             	movslq %eax,%rdx
     c4b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     c4f:	48 01 d0             	add    %rdx,%rax
     c52:	0f b6 00             	movzbl (%rax),%eax
     c55:	3c 3e                	cmp    $0x3e,%al
     c57:	75 06                	jne    c5f <removerTags+0x81>
     c59:	66 c7 45 dc 00 00    	movw   $0x0,-0x24(%rbp)
     c5f:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
     c63:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     c66:	48 63 d8             	movslq %eax,%rbx
     c69:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     c6d:	48 89 c7             	mov    %rax,%rdi
     c70:	e8 9b fb ff ff       	callq  810 <strlen@plt>
     c75:	48 39 c3             	cmp    %rax,%rbx
     c78:	72 87                	jb     c01 <removerTags+0x23>
     c7a:	8b 45 e0             	mov    -0x20(%rbp),%eax
     c7d:	48 63 d0             	movslq %eax,%rdx
     c80:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     c84:	48 01 d0             	add    %rdx,%rax
     c87:	c6 00 00             	movb   $0x0,(%rax)
     c8a:	66 c7 45 de 00 00    	movw   $0x0,-0x22(%rbp)
     c90:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
     c97:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     c9e:	eb 62                	jmp    d02 <removerTags+0x124>
     ca0:	8b 45 ec             	mov    -0x14(%rbp),%eax
     ca3:	48 63 d0             	movslq %eax,%rdx
     ca6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     caa:	48 01 d0             	add    %rdx,%rax
     cad:	0f b6 00             	movzbl (%rax),%eax
     cb0:	3c 26                	cmp    $0x26,%al
     cb2:	75 06                	jne    cba <removerTags+0xdc>
     cb4:	66 c7 45 de 01 00    	movw   $0x1,-0x22(%rbp)
     cba:	66 83 7d de 00       	cmpw   $0x0,-0x22(%rbp)
     cbf:	75 23                	jne    ce4 <removerTags+0x106>
     cc1:	8b 45 ec             	mov    -0x14(%rbp),%eax
     cc4:	48 63 d0             	movslq %eax,%rdx
     cc7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     ccb:	48 01 d0             	add    %rdx,%rax
     cce:	8b 55 e8             	mov    -0x18(%rbp),%edx
     cd1:	48 63 ca             	movslq %edx,%rcx
     cd4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     cd8:	48 01 ca             	add    %rcx,%rdx
     cdb:	0f b6 00             	movzbl (%rax),%eax
     cde:	88 02                	mov    %al,(%rdx)
     ce0:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
     ce4:	8b 45 ec             	mov    -0x14(%rbp),%eax
     ce7:	48 63 d0             	movslq %eax,%rdx
     cea:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     cee:	48 01 d0             	add    %rdx,%rax
     cf1:	0f b6 00             	movzbl (%rax),%eax
     cf4:	3c 3b                	cmp    $0x3b,%al
     cf6:	75 06                	jne    cfe <removerTags+0x120>
     cf8:	66 c7 45 de 00 00    	movw   $0x0,-0x22(%rbp)
     cfe:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
     d02:	8b 45 ec             	mov    -0x14(%rbp),%eax
     d05:	48 63 d8             	movslq %eax,%rbx
     d08:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     d0c:	48 89 c7             	mov    %rax,%rdi
     d0f:	e8 fc fa ff ff       	callq  810 <strlen@plt>
     d14:	48 39 c3             	cmp    %rax,%rbx
     d17:	72 87                	jb     ca0 <removerTags+0xc2>
     d19:	8b 45 e8             	mov    -0x18(%rbp),%eax
     d1c:	48 63 d0             	movslq %eax,%rdx
     d1f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     d23:	48 01 d0             	add    %rdx,%rax
     d26:	c6 00 00             	movb   $0x0,(%rax)
     d29:	90                   	nop
     d2a:	48 83 c4 38          	add    $0x38,%rsp
     d2e:	5b                   	pop    %rbx
     d2f:	5d                   	pop    %rbp
     d30:	c3                   	retq   

0000000000000d31 <procurarItens>:
     d31:	55                   	push   %rbp
     d32:	48 89 e5             	mov    %rsp,%rbp
     d35:	41 54                	push   %r12
     d37:	53                   	push   %rbx
     d38:	48 83 ec 40          	sub    $0x40,%rsp
     d3c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
     d40:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
     d44:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
     d48:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
     d4c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     d53:	00 00 
     d55:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     d59:	31 c0                	xor    %eax,%eax
     d5b:	66 c7 45 d6 00 00    	movw   $0x0,-0x2a(%rbp)
     d61:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
     d65:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     d69:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     d6d:	48 89 ce             	mov    %rcx,%rsi
     d70:	48 89 c7             	mov    %rax,%rdi
     d73:	e8 85 fc ff ff       	callq  9fd <find>
     d78:	66 89 45 d6          	mov    %ax,-0x2a(%rbp)
     d7c:	66 83 7d d6 00       	cmpw   $0x0,-0x2a(%rbp)
     d81:	74 21                	je     da4 <procurarItens+0x73>
     d83:	8b 45 d8             	mov    -0x28(%rbp),%eax
     d86:	48 63 d0             	movslq %eax,%rdx
     d89:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     d8d:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
     d91:	48 8d 55 dc          	lea    -0x24(%rbp),%rdx
     d95:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     d99:	48 89 c6             	mov    %rax,%rsi
     d9c:	48 89 cf             	mov    %rcx,%rdi
     d9f:	e8 59 fc ff ff       	callq  9fd <find>
     da4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
     dab:	66 83 7d d6 00       	cmpw   $0x0,-0x2a(%rbp)
     db0:	74 67                	je     e19 <procurarItens+0xe8>
     db2:	8b 45 d8             	mov    -0x28(%rbp),%eax
     db5:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     db8:	eb 27                	jmp    de1 <procurarItens+0xb0>
     dba:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     dbd:	48 63 d0             	movslq %eax,%rdx
     dc0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     dc4:	48 01 d0             	add    %rdx,%rax
     dc7:	8b 55 e0             	mov    -0x20(%rbp),%edx
     dca:	48 63 ca             	movslq %edx,%rcx
     dcd:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
     dd1:	48 01 ca             	add    %rcx,%rdx
     dd4:	0f b6 00             	movzbl (%rax),%eax
     dd7:	88 02                	mov    %al,(%rdx)
     dd9:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
     ddd:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
     de1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     de4:	48 63 d8             	movslq %eax,%rbx
     de7:	8b 55 d8             	mov    -0x28(%rbp),%edx
     dea:	8b 45 dc             	mov    -0x24(%rbp),%eax
     ded:	01 d0                	add    %edx,%eax
     def:	4c 63 e0             	movslq %eax,%r12
     df2:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     df6:	48 89 c7             	mov    %rax,%rdi
     df9:	e8 12 fa ff ff       	callq  810 <strlen@plt>
     dfe:	49 29 c4             	sub    %rax,%r12
     e01:	4c 89 e0             	mov    %r12,%rax
     e04:	48 39 c3             	cmp    %rax,%rbx
     e07:	72 b1                	jb     dba <procurarItens+0x89>
     e09:	8b 45 e0             	mov    -0x20(%rbp),%eax
     e0c:	48 63 d0             	movslq %eax,%rdx
     e0f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     e13:	48 01 d0             	add    %rdx,%rax
     e16:	c6 00 00             	movb   $0x0,(%rax)
     e19:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     e1d:	48 89 c7             	mov    %rax,%rdi
     e20:	e8 b9 fd ff ff       	callq  bde <removerTags>
     e25:	0f b7 45 d6          	movzwl -0x2a(%rbp),%eax
     e29:	48 8b 5d e8          	mov    -0x18(%rbp),%rbx
     e2d:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
     e34:	00 00 
     e36:	74 05                	je     e3d <procurarItens+0x10c>
     e38:	e8 e3 f9 ff ff       	callq  820 <__stack_chk_fail@plt>
     e3d:	48 83 c4 40          	add    $0x40,%rsp
     e41:	5b                   	pop    %rbx
     e42:	41 5c                	pop    %r12
     e44:	5d                   	pop    %rbp
     e45:	c3                   	retq   

0000000000000e46 <consertarCapacidade>:
     e46:	55                   	push   %rbp
     e47:	48 89 e5             	mov    %rsp,%rbp
     e4a:	53                   	push   %rbx
     e4b:	48 83 ec 28          	sub    $0x28,%rsp
     e4f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
     e53:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
     e5a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     e61:	eb 4f                	jmp    eb2 <consertarCapacidade+0x6c>
     e63:	8b 45 ec             	mov    -0x14(%rbp),%eax
     e66:	48 63 d0             	movslq %eax,%rdx
     e69:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     e6d:	48 01 d0             	add    %rdx,%rax
     e70:	0f b6 00             	movzbl (%rax),%eax
     e73:	3c 2c                	cmp    $0x2c,%al
     e75:	74 37                	je     eae <consertarCapacidade+0x68>
     e77:	8b 45 ec             	mov    -0x14(%rbp),%eax
     e7a:	48 63 d0             	movslq %eax,%rdx
     e7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     e81:	48 01 d0             	add    %rdx,%rax
     e84:	0f b6 00             	movzbl (%rax),%eax
     e87:	3c 2e                	cmp    $0x2e,%al
     e89:	74 23                	je     eae <consertarCapacidade+0x68>
     e8b:	8b 45 ec             	mov    -0x14(%rbp),%eax
     e8e:	48 63 d0             	movslq %eax,%rdx
     e91:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     e95:	48 01 d0             	add    %rdx,%rax
     e98:	8b 55 e8             	mov    -0x18(%rbp),%edx
     e9b:	48 63 ca             	movslq %edx,%rcx
     e9e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
     ea2:	48 01 ca             	add    %rcx,%rdx
     ea5:	0f b6 00             	movzbl (%rax),%eax
     ea8:	88 02                	mov    %al,(%rdx)
     eaa:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
     eae:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
     eb2:	8b 45 ec             	mov    -0x14(%rbp),%eax
     eb5:	48 63 d8             	movslq %eax,%rbx
     eb8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     ebc:	48 89 c7             	mov    %rax,%rdi
     ebf:	e8 4c f9 ff ff       	callq  810 <strlen@plt>
     ec4:	48 39 c3             	cmp    %rax,%rbx
     ec7:	72 9a                	jb     e63 <consertarCapacidade+0x1d>
     ec9:	8b 45 e8             	mov    -0x18(%rbp),%eax
     ecc:	48 63 d0             	movslq %eax,%rdx
     ecf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     ed3:	48 01 d0             	add    %rdx,%rax
     ed6:	c6 00 00             	movb   $0x0,(%rax)
     ed9:	90                   	nop
     eda:	48 83 c4 28          	add    $0x28,%rsp
     ede:	5b                   	pop    %rbx
     edf:	5d                   	pop    %rbp
     ee0:	c3                   	retq   

0000000000000ee1 <printar>:
     ee1:	55                   	push   %rbp
     ee2:	48 89 e5             	mov    %rsp,%rbp
     ee5:	53                   	push   %rbx
     ee6:	48 83 ec 28          	sub    $0x28,%rsp
     eea:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
     eee:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     ef5:	eb 1e                	jmp    f15 <printar+0x34>
     ef7:	8b 45 ec             	mov    -0x14(%rbp),%eax
     efa:	48 63 d0             	movslq %eax,%rdx
     efd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     f01:	48 01 d0             	add    %rdx,%rax
     f04:	0f b6 00             	movzbl (%rax),%eax
     f07:	0f be c0             	movsbl %al,%eax
     f0a:	89 c7                	mov    %eax,%edi
     f0c:	e8 cf f8 ff ff       	callq  7e0 <putchar@plt>
     f11:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
     f15:	8b 45 ec             	mov    -0x14(%rbp),%eax
     f18:	48 63 d8             	movslq %eax,%rbx
     f1b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     f1f:	48 89 c7             	mov    %rax,%rdi
     f22:	e8 e9 f8 ff ff       	callq  810 <strlen@plt>
     f27:	48 39 c3             	cmp    %rax,%rbx
     f2a:	72 cb                	jb     ef7 <printar+0x16>
     f2c:	48 8d 3d e1 0e 00 00 	lea    0xee1(%rip),%rdi        # 1e14 <TAMmenor+0x14>
     f33:	b8 00 00 00 00       	mov    $0x0,%eax
     f38:	e8 f3 f8 ff ff       	callq  830 <printf@plt>
     f3d:	90                   	nop
     f3e:	48 83 c4 28          	add    $0x28,%rsp
     f42:	5b                   	pop    %rbx
     f43:	5d                   	pop    %rbp
     f44:	c3                   	retq   

0000000000000f45 <ordenarData>:
     f45:	55                   	push   %rbp
     f46:	48 89 e5             	mov    %rsp,%rbp
     f49:	53                   	push   %rbx
     f4a:	48 83 ec 38          	sub    $0x38,%rsp
     f4e:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
     f52:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
     f59:	00 00 
     f5b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     f5f:	31 c0                	xor    %eax,%eax
     f61:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f65:	0f b6 00             	movzbl (%rax),%eax
     f68:	88 45 e4             	mov    %al,-0x1c(%rbp)
     f6b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f6f:	0f b6 40 01          	movzbl 0x1(%rax),%eax
     f73:	88 45 e5             	mov    %al,-0x1b(%rbp)
     f76:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f7a:	0f b6 40 02          	movzbl 0x2(%rax),%eax
     f7e:	88 45 e6             	mov    %al,-0x1a(%rbp)
     f81:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f85:	0f b6 40 03          	movzbl 0x3(%rax),%eax
     f89:	88 45 e7             	mov    %al,-0x19(%rbp)
     f8c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f90:	0f b6 40 05          	movzbl 0x5(%rax),%eax
     f94:	88 45 e0             	mov    %al,-0x20(%rbp)
     f97:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f9b:	0f b6 40 06          	movzbl 0x6(%rax),%eax
     f9f:	88 45 e1             	mov    %al,-0x1f(%rbp)
     fa2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     fa6:	0f b6 40 08          	movzbl 0x8(%rax),%eax
     faa:	88 45 e2             	mov    %al,-0x1e(%rbp)
     fad:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     fb1:	0f b6 40 09          	movzbl 0x9(%rax),%eax
     fb5:	88 45 e3             	mov    %al,-0x1d(%rbp)
     fb8:	0f b6 55 e2          	movzbl -0x1e(%rbp),%edx
     fbc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     fc0:	88 10                	mov    %dl,(%rax)
     fc2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     fc6:	48 8d 50 01          	lea    0x1(%rax),%rdx
     fca:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
     fce:	88 02                	mov    %al,(%rdx)
     fd0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     fd4:	48 83 c0 02          	add    $0x2,%rax
     fd8:	c6 00 2f             	movb   $0x2f,(%rax)
     fdb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     fdf:	48 8d 50 03          	lea    0x3(%rax),%rdx
     fe3:	0f b6 45 e0          	movzbl -0x20(%rbp),%eax
     fe7:	88 02                	mov    %al,(%rdx)
     fe9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     fed:	48 8d 50 04          	lea    0x4(%rax),%rdx
     ff1:	0f b6 45 e1          	movzbl -0x1f(%rbp),%eax
     ff5:	88 02                	mov    %al,(%rdx)
     ff7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     ffb:	48 83 c0 05          	add    $0x5,%rax
     fff:	c6 00 2f             	movb   $0x2f,(%rax)
    1002:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1006:	48 8d 50 06          	lea    0x6(%rax),%rdx
    100a:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
    100e:	88 02                	mov    %al,(%rdx)
    1010:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1014:	48 8d 50 07          	lea    0x7(%rax),%rdx
    1018:	0f b6 45 e5          	movzbl -0x1b(%rbp),%eax
    101c:	88 02                	mov    %al,(%rdx)
    101e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1022:	48 8d 50 08          	lea    0x8(%rax),%rdx
    1026:	0f b6 45 e6          	movzbl -0x1a(%rbp),%eax
    102a:	88 02                	mov    %al,(%rdx)
    102c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1030:	48 8d 50 09          	lea    0x9(%rax),%rdx
    1034:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    1038:	88 02                	mov    %al,(%rdx)
    103a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    103e:	48 83 c0 0a          	add    $0xa,%rax
    1042:	c6 00 00             	movb   $0x0,(%rax)
    1045:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
    104c:	eb 48                	jmp    1096 <ordenarData+0x151>
    104e:	83 7d d4 02          	cmpl   $0x2,-0x2c(%rbp)
    1052:	74 3e                	je     1092 <ordenarData+0x14d>
    1054:	83 7d d4 05          	cmpl   $0x5,-0x2c(%rbp)
    1058:	74 38                	je     1092 <ordenarData+0x14d>
    105a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    105d:	48 63 d0             	movslq %eax,%rdx
    1060:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1064:	48 01 d0             	add    %rdx,%rax
    1067:	0f b6 00             	movzbl (%rax),%eax
    106a:	3c 2f                	cmp    $0x2f,%al
    106c:	7e 14                	jle    1082 <ordenarData+0x13d>
    106e:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    1071:	48 63 d0             	movslq %eax,%rdx
    1074:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1078:	48 01 d0             	add    %rdx,%rax
    107b:	0f b6 00             	movzbl (%rax),%eax
    107e:	3c 39                	cmp    $0x39,%al
    1080:	7e 10                	jle    1092 <ordenarData+0x14d>
    1082:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    1085:	48 63 d0             	movslq %eax,%rdx
    1088:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    108c:	48 01 d0             	add    %rdx,%rax
    108f:	c6 00 30             	movb   $0x30,(%rax)
    1092:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
    1096:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    1099:	48 63 d8             	movslq %eax,%rbx
    109c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    10a0:	48 89 c7             	mov    %rax,%rdi
    10a3:	e8 68 f7 ff ff       	callq  810 <strlen@plt>
    10a8:	48 39 c3             	cmp    %rax,%rbx
    10ab:	72 a1                	jb     104e <ordenarData+0x109>
    10ad:	0f b6 45 e2          	movzbl -0x1e(%rbp),%eax
    10b1:	0f be c0             	movsbl %al,%eax
    10b4:	8d 50 d0             	lea    -0x30(%rax),%edx
    10b7:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
    10bb:	0f be c0             	movsbl %al,%eax
    10be:	83 e8 30             	sub    $0x30,%eax
    10c1:	01 d0                	add    %edx,%eax
    10c3:	89 45 d8             	mov    %eax,-0x28(%rbp)
    10c6:	0f b6 45 e0          	movzbl -0x20(%rbp),%eax
    10ca:	0f be c0             	movsbl %al,%eax
    10cd:	8d 50 d0             	lea    -0x30(%rax),%edx
    10d0:	0f b6 45 e1          	movzbl -0x1f(%rbp),%eax
    10d4:	0f be c0             	movsbl %al,%eax
    10d7:	83 e8 30             	sub    $0x30,%eax
    10da:	01 d0                	add    %edx,%eax
    10dc:	89 45 dc             	mov    %eax,-0x24(%rbp)
    10df:	83 7d d8 1f          	cmpl   $0x1f,-0x28(%rbp)
    10e3:	7f 06                	jg     10eb <ordenarData+0x1a6>
    10e5:	83 7d dc 0c          	cmpl   $0xc,-0x24(%rbp)
    10e9:	7e 28                	jle    1113 <ordenarData+0x1ce>
    10eb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    10ef:	c6 00 30             	movb   $0x30,(%rax)
    10f2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    10f6:	48 83 c0 01          	add    $0x1,%rax
    10fa:	c6 00 30             	movb   $0x30,(%rax)
    10fd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1101:	48 83 c0 03          	add    $0x3,%rax
    1105:	c6 00 30             	movb   $0x30,(%rax)
    1108:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    110c:	48 83 c0 04          	add    $0x4,%rax
    1110:	c6 00 30             	movb   $0x30,(%rax)
    1113:	90                   	nop
    1114:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1118:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    111f:	00 00 
    1121:	74 05                	je     1128 <ordenarData+0x1e3>
    1123:	e8 f8 f6 ff ff       	callq  820 <__stack_chk_fail@plt>
    1128:	48 83 c4 38          	add    $0x38,%rsp
    112c:	5b                   	pop    %rbx
    112d:	5d                   	pop    %rbp
    112e:	c3                   	retq   

000000000000112f <resolverDatas>:
    112f:	55                   	push   %rbp
    1130:	48 89 e5             	mov    %rsp,%rbp
    1133:	53                   	push   %rbx
    1134:	48 83 ec 38          	sub    $0x38,%rsp
    1138:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    113c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1143:	00 00 
    1145:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1149:	31 c0                	xor    %eax,%eax
    114b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    1152:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    1159:	e9 9f 00 00 00       	jmpq   11fd <resolverDatas+0xce>
    115e:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1161:	48 63 d0             	movslq %eax,%rdx
    1164:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1168:	48 01 d0             	add    %rdx,%rax
    116b:	0f b6 00             	movzbl (%rax),%eax
    116e:	3c 28                	cmp    $0x28,%al
    1170:	0f 85 83 00 00 00    	jne    11f9 <resolverDatas+0xca>
    1176:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%rbp)
    117d:	eb 63                	jmp    11e2 <resolverDatas+0xb3>
    117f:	8b 55 dc             	mov    -0x24(%rbp),%edx
    1182:	8b 45 e0             	mov    -0x20(%rbp),%eax
    1185:	01 d0                	add    %edx,%eax
    1187:	48 63 d0             	movslq %eax,%rdx
    118a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    118e:	48 01 d0             	add    %rdx,%rax
    1191:	8b 55 d8             	mov    -0x28(%rbp),%edx
    1194:	48 63 ca             	movslq %edx,%rcx
    1197:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    119b:	48 01 ca             	add    %rcx,%rdx
    119e:	0f b6 00             	movzbl (%rax),%eax
    11a1:	88 02                	mov    %al,(%rdx)
    11a3:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
    11a7:	8b 55 dc             	mov    -0x24(%rbp),%edx
    11aa:	8b 45 e0             	mov    -0x20(%rbp),%eax
    11ad:	01 d0                	add    %edx,%eax
    11af:	48 63 d0             	movslq %eax,%rdx
    11b2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    11b6:	48 01 d0             	add    %rdx,%rax
    11b9:	0f b6 00             	movzbl (%rax),%eax
    11bc:	3c 29                	cmp    $0x29,%al
    11be:	75 1e                	jne    11de <resolverDatas+0xaf>
    11c0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    11c4:	48 89 c7             	mov    %rax,%rdi
    11c7:	e8 44 f6 ff ff       	callq  810 <strlen@plt>
    11cc:	89 45 e0             	mov    %eax,-0x20(%rbp)
    11cf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    11d3:	48 89 c7             	mov    %rax,%rdi
    11d6:	e8 35 f6 ff ff       	callq  810 <strlen@plt>
    11db:	89 45 dc             	mov    %eax,-0x24(%rbp)
    11de:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
    11e2:	8b 45 e0             	mov    -0x20(%rbp),%eax
    11e5:	48 63 d8             	movslq %eax,%rbx
    11e8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    11ec:	48 89 c7             	mov    %rax,%rdi
    11ef:	e8 1c f6 ff ff       	callq  810 <strlen@plt>
    11f4:	48 39 c3             	cmp    %rax,%rbx
    11f7:	72 86                	jb     117f <resolverDatas+0x50>
    11f9:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
    11fd:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1200:	48 63 d8             	movslq %eax,%rbx
    1203:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1207:	48 89 c7             	mov    %rax,%rdi
    120a:	e8 01 f6 ff ff       	callq  810 <strlen@plt>
    120f:	48 39 c3             	cmp    %rax,%rbx
    1212:	0f 82 46 ff ff ff    	jb     115e <resolverDatas+0x2f>
    1218:	8b 45 d8             	mov    -0x28(%rbp),%eax
    121b:	48 98                	cltq   
    121d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    1221:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1225:	48 01 d0             	add    %rdx,%rax
    1228:	c6 00 00             	movb   $0x0,(%rax)
    122b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    122f:	48 89 c7             	mov    %rax,%rdi
    1232:	e8 0e fd ff ff       	callq  f45 <ordenarData>
    1237:	90                   	nop
    1238:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    123c:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1243:	00 00 
    1245:	74 05                	je     124c <resolverDatas+0x11d>
    1247:	e8 d4 f5 ff ff       	callq  820 <__stack_chk_fail@plt>
    124c:	48 83 c4 38          	add    $0x38,%rsp
    1250:	5b                   	pop    %rbx
    1251:	5d                   	pop    %rbp
    1252:	c3                   	retq   

0000000000001253 <insertionSorting>:
    1253:	55                   	push   %rbp
    1254:	48 89 e5             	mov    %rsp,%rbp
    1257:	48 83 ec 20          	sub    $0x20,%rsp
    125b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    125f:	89 75 f4             	mov    %esi,-0xc(%rbp)
    1262:	89 55 f0             	mov    %edx,-0x10(%rbp)
    1265:	89 4d ec             	mov    %ecx,-0x14(%rbp)
    1268:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    126c:	7e 18                	jle    1286 <insertionSorting+0x33>
    126e:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1271:	8d 48 ff             	lea    -0x1(%rax),%ecx
    1274:	8b 55 f0             	mov    -0x10(%rbp),%edx
    1277:	8b 75 f4             	mov    -0xc(%rbp),%esi
    127a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    127e:	48 89 c7             	mov    %rax,%rdi
    1281:	e8 cd ff ff ff       	callq  1253 <insertionSorting>
    1286:	90                   	nop
    1287:	c9                   	leaveq 
    1288:	c3                   	retq   

0000000000001289 <ORQUESTRADOR>:
    1289:	55                   	push   %rbp
    128a:	48 89 e5             	mov    %rsp,%rbp
    128d:	41 57                	push   %r15
    128f:	41 56                	push   %r14
    1291:	41 55                	push   %r13
    1293:	41 54                	push   %r12
    1295:	53                   	push   %rbx
    1296:	48 81 ec f8 01 00 00 	sub    $0x1f8,%rsp
    129d:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
    12a4:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
    12ab:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    12b2:	00 00 
    12b4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    12b8:	31 c0                	xor    %eax,%eax
    12ba:	48 89 e0             	mov    %rsp,%rax
    12bd:	48 89 85 08 fe ff ff 	mov    %rax,-0x1f8(%rbp)
    12c4:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    12cb:	48 8d 35 47 0b 00 00 	lea    0xb47(%rip),%rsi        # 1e19 <TAMmenor+0x19>
    12d2:	48 89 c7             	mov    %rax,%rdi
    12d5:	e8 a6 f5 ff ff       	callq  880 <fopen@plt>
    12da:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    12de:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    12e3:	48 83 e8 01          	sub    $0x1,%rax
    12e7:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    12eb:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    12f0:	49 89 c4             	mov    %rax,%r12
    12f3:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    12f9:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    12fe:	49 89 c6             	mov    %rax,%r14
    1301:	41 bf 00 00 00 00    	mov    $0x0,%r15d
    1307:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    130c:	48 89 c2             	mov    %rax,%rdx
    130f:	b8 10 00 00 00       	mov    $0x10,%eax
    1314:	48 83 e8 01          	sub    $0x1,%rax
    1318:	48 01 d0             	add    %rdx,%rax
    131b:	bb 10 00 00 00       	mov    $0x10,%ebx
    1320:	ba 00 00 00 00       	mov    $0x0,%edx
    1325:	48 f7 f3             	div    %rbx
    1328:	48 6b c0 10          	imul   $0x10,%rax,%rax
    132c:	48 29 c4             	sub    %rax,%rsp
    132f:	48 89 e0             	mov    %rsp,%rax
    1332:	48 83 c0 00          	add    $0x0,%rax
    1336:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    133a:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    133f:	48 83 e8 01          	sub    $0x1,%rax
    1343:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    1347:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    134c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
    1353:	48 c7 85 48 ff ff ff 	movq   $0x0,-0xb8(%rbp)
    135a:	00 00 00 00 
    135e:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1363:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
    136a:	48 c7 85 38 ff ff ff 	movq   $0x0,-0xc8(%rbp)
    1371:	00 00 00 00 
    1375:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    137a:	48 89 c2             	mov    %rax,%rdx
    137d:	b8 10 00 00 00       	mov    $0x10,%eax
    1382:	48 83 e8 01          	sub    $0x1,%rax
    1386:	48 01 d0             	add    %rdx,%rax
    1389:	bb 10 00 00 00       	mov    $0x10,%ebx
    138e:	ba 00 00 00 00       	mov    $0x0,%edx
    1393:	48 f7 f3             	div    %rbx
    1396:	48 6b c0 10          	imul   $0x10,%rax,%rax
    139a:	48 29 c4             	sub    %rax,%rsp
    139d:	48 89 e0             	mov    %rsp,%rax
    13a0:	48 83 c0 00          	add    $0x0,%rax
    13a4:	48 89 45 90          	mov    %rax,-0x70(%rbp)
    13a8:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    13ad:	48 89 c6             	mov    %rax,%rsi
    13b0:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
    13b4:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    13b8:	48 89 c1             	mov    %rax,%rcx
    13bb:	ba 01 00 00 00       	mov    $0x1,%edx
    13c0:	e8 2b f4 ff ff       	callq  7f0 <fread@plt>
    13c5:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
    13c9:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    13cd:	48 89 d6             	mov    %rdx,%rsi
    13d0:	48 89 c7             	mov    %rax,%rdi
    13d3:	e8 3a f7 ff ff       	callq  b12 <limpandoEntrada>
    13d8:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    13dd:	48 98                	cltq   
    13df:	48 89 85 e0 fe ff ff 	mov    %rax,-0x120(%rbp)
    13e6:	48 c7 85 e8 fe ff ff 	movq   $0x0,-0x118(%rbp)
    13ed:	00 00 00 00 
    13f1:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    13f6:	48 98                	cltq   
    13f8:	48 83 e8 01          	sub    $0x1,%rax
    13fc:	48 89 45 88          	mov    %rax,-0x78(%rbp)
    1400:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1405:	48 98                	cltq   
    1407:	48 89 85 d0 fe ff ff 	mov    %rax,-0x130(%rbp)
    140e:	48 c7 85 d8 fe ff ff 	movq   $0x0,-0x128(%rbp)
    1415:	00 00 00 00 
    1419:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    141e:	48 63 d8             	movslq %eax,%rbx
    1421:	48 89 9d e0 fe ff ff 	mov    %rbx,-0x120(%rbp)
    1428:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    142d:	48 98                	cltq   
    142f:	48 89 85 c0 fe ff ff 	mov    %rax,-0x140(%rbp)
    1436:	48 c7 85 c8 fe ff ff 	movq   $0x0,-0x138(%rbp)
    143d:	00 00 00 00 
    1441:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1446:	48 98                	cltq   
    1448:	48 83 e8 01          	sub    $0x1,%rax
    144c:	48 89 45 80          	mov    %rax,-0x80(%rbp)
    1450:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1455:	48 98                	cltq   
    1457:	48 89 85 b0 fe ff ff 	mov    %rax,-0x150(%rbp)
    145e:	48 c7 85 b8 fe ff ff 	movq   $0x0,-0x148(%rbp)
    1465:	00 00 00 00 
    1469:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    146e:	48 98                	cltq   
    1470:	48 01 c0             	add    %rax,%rax
    1473:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
    147a:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    147f:	48 98                	cltq   
    1481:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
    1488:	48 c7 85 a8 fe ff ff 	movq   $0x0,-0x158(%rbp)
    148f:	00 00 00 00 
    1493:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1498:	48 98                	cltq   
    149a:	48 83 e8 01          	sub    $0x1,%rax
    149e:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
    14a5:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    14aa:	48 98                	cltq   
    14ac:	48 89 85 90 fe ff ff 	mov    %rax,-0x170(%rbp)
    14b3:	48 c7 85 98 fe ff ff 	movq   $0x0,-0x168(%rbp)
    14ba:	00 00 00 00 
    14be:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    14c3:	48 63 d0             	movslq %eax,%rdx
    14c6:	48 89 d0             	mov    %rdx,%rax
    14c9:	48 01 c0             	add    %rax,%rax
    14cc:	4c 8d 3c 10          	lea    (%rax,%rdx,1),%r15
    14d0:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    14d5:	48 98                	cltq   
    14d7:	48 89 85 80 fe ff ff 	mov    %rax,-0x180(%rbp)
    14de:	48 c7 85 88 fe ff ff 	movq   $0x0,-0x178(%rbp)
    14e5:	00 00 00 00 
    14e9:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    14ee:	48 98                	cltq   
    14f0:	48 83 e8 01          	sub    $0x1,%rax
    14f4:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
    14fb:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1500:	48 98                	cltq   
    1502:	48 89 85 70 fe ff ff 	mov    %rax,-0x190(%rbp)
    1509:	48 c7 85 78 fe ff ff 	movq   $0x0,-0x188(%rbp)
    1510:	00 00 00 00 
    1514:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1519:	48 98                	cltq   
    151b:	48 8d 34 85 00 00 00 	lea    0x0(,%rax,4),%rsi
    1522:	00 
    1523:	48 89 b5 40 ff ff ff 	mov    %rsi,-0xc0(%rbp)
    152a:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    152f:	48 98                	cltq   
    1531:	48 89 85 60 fe ff ff 	mov    %rax,-0x1a0(%rbp)
    1538:	48 c7 85 68 fe ff ff 	movq   $0x0,-0x198(%rbp)
    153f:	00 00 00 00 
    1543:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1548:	48 98                	cltq   
    154a:	48 83 e8 01          	sub    $0x1,%rax
    154e:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
    1555:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    155a:	48 98                	cltq   
    155c:	48 89 85 50 fe ff ff 	mov    %rax,-0x1b0(%rbp)
    1563:	48 c7 85 58 fe ff ff 	movq   $0x0,-0x1a8(%rbp)
    156a:	00 00 00 00 
    156e:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1573:	48 63 d0             	movslq %eax,%rdx
    1576:	48 89 d0             	mov    %rdx,%rax
    1579:	48 c1 e0 02          	shl    $0x2,%rax
    157d:	4c 8d 34 10          	lea    (%rax,%rdx,1),%r14
    1581:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1586:	48 98                	cltq   
    1588:	48 89 85 40 fe ff ff 	mov    %rax,-0x1c0(%rbp)
    158f:	48 c7 85 48 fe ff ff 	movq   $0x0,-0x1b8(%rbp)
    1596:	00 00 00 00 
    159a:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    159f:	48 98                	cltq   
    15a1:	48 83 e8 01          	sub    $0x1,%rax
    15a5:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
    15ac:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    15b1:	48 98                	cltq   
    15b3:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
    15ba:	48 c7 85 38 fe ff ff 	movq   $0x0,-0x1c8(%rbp)
    15c1:	00 00 00 00 
    15c5:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    15ca:	48 63 d0             	movslq %eax,%rdx
    15cd:	48 89 d0             	mov    %rdx,%rax
    15d0:	48 01 c0             	add    %rax,%rax
    15d3:	48 01 d0             	add    %rdx,%rax
    15d6:	48 01 c0             	add    %rax,%rax
    15d9:	49 89 c5             	mov    %rax,%r13
    15dc:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    15e1:	48 98                	cltq   
    15e3:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
    15ea:	48 c7 85 28 fe ff ff 	movq   $0x0,-0x1d8(%rbp)
    15f1:	00 00 00 00 
    15f5:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    15fa:	48 98                	cltq   
    15fc:	48 83 e8 01          	sub    $0x1,%rax
    1600:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    1604:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1609:	48 98                	cltq   
    160b:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
    1612:	48 c7 85 18 fe ff ff 	movq   $0x0,-0x1e8(%rbp)
    1619:	00 00 00 00 
    161d:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1622:	48 98                	cltq   
    1624:	48 8d 50 01          	lea    0x1(%rax),%rdx
    1628:	48 89 d0             	mov    %rdx,%rax
    162b:	48 c1 e0 03          	shl    $0x3,%rax
    162f:	48 29 d0             	sub    %rdx,%rax
    1632:	49 89 c4             	mov    %rax,%r12
    1635:	49 83 e4 f8          	and    $0xfffffffffffffff8,%r12
    1639:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    163e:	48 98                	cltq   
    1640:	48 8d 50 01          	lea    0x1(%rax),%rdx
    1644:	48 89 d0             	mov    %rdx,%rax
    1647:	48 c1 e0 03          	shl    $0x3,%rax
    164b:	48 29 d0             	sub    %rdx,%rax
    164e:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
    1655:	48 c7 85 28 ff ff ff 	movq   $0x0,-0xd8(%rbp)
    165c:	00 00 00 00 
    1660:	48 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%rax
    1667:	48 8b 95 28 ff ff ff 	mov    -0xd8(%rbp),%rdx
    166e:	48 89 c1             	mov    %rax,%rcx
    1671:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    1675:	48 89 8d 10 ff ff ff 	mov    %rcx,-0xf0(%rbp)
    167c:	48 89 d1             	mov    %rdx,%rcx
    167f:	83 e1 00             	and    $0x0,%ecx
    1682:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
    1689:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
    1690:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
    1697:	48 83 c0 08          	add    $0x8,%rax
    169b:	48 83 d2 00          	adc    $0x0,%rdx
    169f:	48 89 c6             	mov    %rax,%rsi
    16a2:	48 89 d7             	mov    %rdx,%rdi
    16a5:	48 89 f0             	mov    %rsi,%rax
    16a8:	48 89 fa             	mov    %rdi,%rdx
    16ab:	48 0f a4 c2 03       	shld   $0x3,%rax,%rdx
    16b0:	48 c1 e0 03          	shl    $0x3,%rax
    16b4:	48 83 c0 3f          	add    $0x3f,%rax
    16b8:	48 83 d2 00          	adc    $0x0,%rdx
    16bc:	48 89 c6             	mov    %rax,%rsi
    16bf:	48 83 e6 c0          	and    $0xffffffffffffffc0,%rsi
    16c3:	48 89 b5 f0 fd ff ff 	mov    %rsi,-0x210(%rbp)
    16ca:	48 89 d1             	mov    %rdx,%rcx
    16cd:	80 e5 ff             	and    $0xff,%ch
    16d0:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
    16d7:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    16dc:	48 98                	cltq   
    16de:	48 83 c0 01          	add    $0x1,%rax
    16e2:	48 c1 e0 03          	shl    $0x3,%rax
    16e6:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    16eb:	48 98                	cltq   
    16ed:	48 8d 50 01          	lea    0x1(%rax),%rdx
    16f1:	48 89 d0             	mov    %rdx,%rax
    16f4:	48 c1 e0 03          	shl    $0x3,%rax
    16f8:	48 29 d0             	sub    %rdx,%rax
    16fb:	48 89 85 00 ff ff ff 	mov    %rax,-0x100(%rbp)
    1702:	48 c7 85 08 ff ff ff 	movq   $0x0,-0xf8(%rbp)
    1709:	00 00 00 00 
    170d:	48 8b 85 00 ff ff ff 	mov    -0x100(%rbp),%rax
    1714:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
    171b:	48 89 c6             	mov    %rax,%rsi
    171e:	48 83 e6 f8          	and    $0xfffffffffffffff8,%rsi
    1722:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
    1729:	48 89 d1             	mov    %rdx,%rcx
    172c:	83 e1 00             	and    $0x0,%ecx
    172f:	48 89 8d f8 fe ff ff 	mov    %rcx,-0x108(%rbp)
    1736:	48 8b 85 f0 fe ff ff 	mov    -0x110(%rbp),%rax
    173d:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
    1744:	48 83 c0 08          	add    $0x8,%rax
    1748:	48 83 d2 00          	adc    $0x0,%rdx
    174c:	48 89 c6             	mov    %rax,%rsi
    174f:	48 89 d7             	mov    %rdx,%rdi
    1752:	48 89 f0             	mov    %rsi,%rax
    1755:	48 89 fa             	mov    %rdi,%rdx
    1758:	48 0f a4 c2 03       	shld   $0x3,%rax,%rdx
    175d:	48 c1 e0 03          	shl    $0x3,%rax
    1761:	48 83 c0 3f          	add    $0x3f,%rax
    1765:	48 83 d2 00          	adc    $0x0,%rdx
    1769:	48 89 c6             	mov    %rax,%rsi
    176c:	48 83 e6 c0          	and    $0xffffffffffffffc0,%rsi
    1770:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
    1777:	48 89 d1             	mov    %rdx,%rcx
    177a:	80 e5 ff             	and    $0xff,%ch
    177d:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
    1784:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    1789:	48 98                	cltq   
    178b:	48 8d 50 01          	lea    0x1(%rax),%rdx
    178f:	48 89 d0             	mov    %rdx,%rax
    1792:	48 c1 e0 03          	shl    $0x3,%rax
    1796:	48 29 d0             	sub    %rdx,%rax
    1799:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    179d:	48 83 c0 08          	add    $0x8,%rax
    17a1:	48 8d 50 07          	lea    0x7(%rax),%rdx
    17a5:	b8 10 00 00 00       	mov    $0x10,%eax
    17aa:	48 83 e8 01          	sub    $0x1,%rax
    17ae:	48 01 d0             	add    %rdx,%rax
    17b1:	b9 10 00 00 00       	mov    $0x10,%ecx
    17b6:	ba 00 00 00 00       	mov    $0x0,%edx
    17bb:	48 f7 f1             	div    %rcx
    17be:	48 6b c0 10          	imul   $0x10,%rax,%rax
    17c2:	48 29 c4             	sub    %rax,%rsp
    17c5:	48 89 e0             	mov    %rsp,%rax
    17c8:	48 83 c0 07          	add    $0x7,%rax
    17cc:	48 c1 e8 03          	shr    $0x3,%rax
    17d0:	48 c1 e0 03          	shl    $0x3,%rax
    17d4:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    17d8:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
    17dc:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    17e0:	48 89 d1             	mov    %rdx,%rcx
    17e3:	48 8d 15 32 06 00 00 	lea    0x632(%rip),%rdx        # 1e1c <TAMmenor+0x1c>
    17ea:	48 8d 35 36 06 00 00 	lea    0x636(%rip),%rsi        # 1e27 <TAMmenor+0x27>
    17f1:	48 89 c7             	mov    %rax,%rdi
    17f4:	e8 38 f5 ff ff       	callq  d31 <procurarItens>
    17f9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    17fd:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
    1801:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    1805:	48 89 d1             	mov    %rdx,%rcx
    1808:	48 8d 15 0d 06 00 00 	lea    0x60d(%rip),%rdx        # 1e1c <TAMmenor+0x1c>
    180f:	48 8d 35 1b 06 00 00 	lea    0x61b(%rip),%rsi        # 1e31 <TAMmenor+0x31>
    1816:	48 89 c7             	mov    %rax,%rdi
    1819:	e8 13 f5 ff ff       	callq  d31 <procurarItens>
    181e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1822:	48 8b 9d 30 ff ff ff 	mov    -0xd0(%rbp),%rbx
    1829:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
    182d:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    1831:	48 89 d1             	mov    %rdx,%rcx
    1834:	48 8d 15 e1 05 00 00 	lea    0x5e1(%rip),%rdx        # 1e1c <TAMmenor+0x1c>
    183b:	48 8d 35 f8 05 00 00 	lea    0x5f8(%rip),%rsi        # 1e3a <TAMmenor+0x3a>
    1842:	48 89 c7             	mov    %rax,%rdi
    1845:	e8 e7 f4 ff ff       	callq  d31 <procurarItens>
    184a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    184e:	49 8d 14 07          	lea    (%r15,%rax,1),%rdx
    1852:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    1856:	48 89 d1             	mov    %rdx,%rcx
    1859:	48 8d 15 bc 05 00 00 	lea    0x5bc(%rip),%rdx        # 1e1c <TAMmenor+0x1c>
    1860:	48 8d 35 da 05 00 00 	lea    0x5da(%rip),%rsi        # 1e41 <TAMmenor+0x41>
    1867:	48 89 c7             	mov    %rax,%rdi
    186a:	e8 c2 f4 ff ff       	callq  d31 <procurarItens>
    186f:	66 85 c0             	test   %ax,%ax
    1872:	75 25                	jne    1899 <ORQUESTRADOR+0x610>
    1874:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1878:	49 8d 14 07          	lea    (%r15,%rax,1),%rdx
    187c:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    1880:	48 89 d1             	mov    %rdx,%rcx
    1883:	48 8d 15 92 05 00 00 	lea    0x592(%rip),%rdx        # 1e1c <TAMmenor+0x1c>
    188a:	48 8d 35 bb 05 00 00 	lea    0x5bb(%rip),%rsi        # 1e4c <TAMmenor+0x4c>
    1891:	48 89 c7             	mov    %rax,%rdi
    1894:	e8 98 f4 ff ff       	callq  d31 <procurarItens>
    1899:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    189d:	48 8b 9d 40 ff ff ff 	mov    -0xc0(%rbp),%rbx
    18a4:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
    18a8:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    18ac:	48 89 d1             	mov    %rdx,%rcx
    18af:	48 8d 15 66 05 00 00 	lea    0x566(%rip),%rdx        # 1e1c <TAMmenor+0x1c>
    18b6:	48 8d 35 97 05 00 00 	lea    0x597(%rip),%rsi        # 1e54 <TAMmenor+0x54>
    18bd:	48 89 c7             	mov    %rax,%rdi
    18c0:	e8 6c f4 ff ff       	callq  d31 <procurarItens>
    18c5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    18c9:	49 8d 14 06          	lea    (%r14,%rax,1),%rdx
    18cd:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    18d1:	48 89 d1             	mov    %rdx,%rcx
    18d4:	48 8d 15 41 05 00 00 	lea    0x541(%rip),%rdx        # 1e1c <TAMmenor+0x1c>
    18db:	48 8d 35 79 05 00 00 	lea    0x579(%rip),%rsi        # 1e5b <TAMmenor+0x5b>
    18e2:	48 89 c7             	mov    %rax,%rdi
    18e5:	e8 47 f4 ff ff       	callq  d31 <procurarItens>
    18ea:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    18ee:	49 8d 54 05 00       	lea    0x0(%r13,%rax,1),%rdx
    18f3:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    18f7:	48 89 d1             	mov    %rdx,%rcx
    18fa:	48 8d 15 1b 05 00 00 	lea    0x51b(%rip),%rdx        # 1e1c <TAMmenor+0x1c>
    1901:	48 8d 35 5c 05 00 00 	lea    0x55c(%rip),%rsi        # 1e64 <TAMmenor+0x64>
    1908:	48 89 c7             	mov    %rax,%rdi
    190b:	e8 21 f4 ff ff       	callq  d31 <procurarItens>
    1910:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    1914:	48 89 c7             	mov    %rax,%rdi
    1917:	e8 44 ef ff ff       	callq  860 <ftell@plt>
    191c:	48 89 c1             	mov    %rax,%rcx
    191f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    1923:	ba 02 00 00 00       	mov    $0x2,%edx
    1928:	48 89 ce             	mov    %rcx,%rsi
    192b:	48 89 c7             	mov    %rax,%rdi
    192e:	e8 3d ef ff ff       	callq  870 <fseek@plt>
    1933:	4c 89 e0             	mov    %r12,%rax
    1936:	48 c1 e8 03          	shr    $0x3,%rax
    193a:	48 89 c3             	mov    %rax,%rbx
    193d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    1941:	48 89 c7             	mov    %rax,%rdi
    1944:	e8 17 ef ff ff       	callq  860 <ftell@plt>
    1949:	48 89 c2             	mov    %rax,%rdx
    194c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1950:	48 89 14 d8          	mov    %rdx,(%rax,%rbx,8)
    1954:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1958:	4c 01 f0             	add    %r14,%rax
    195b:	48 89 c7             	mov    %rax,%rdi
    195e:	e8 e3 f4 ff ff       	callq  e46 <consertarCapacidade>
    1963:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1967:	4c 01 e8             	add    %r13,%rax
    196a:	48 89 c7             	mov    %rax,%rdi
    196d:	e8 bd f7 ff ff       	callq  112f <resolverDatas>
    1972:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1976:	48 89 c7             	mov    %rax,%rdi
    1979:	e8 63 f5 ff ff       	callq  ee1 <printar>
    197e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1982:	48 03 85 e0 fe ff ff 	add    -0x120(%rbp),%rax
    1989:	48 89 c7             	mov    %rax,%rdi
    198c:	e8 50 f5 ff ff       	callq  ee1 <printar>
    1991:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1995:	4c 01 e8             	add    %r13,%rax
    1998:	48 89 c7             	mov    %rax,%rdi
    199b:	e8 41 f5 ff ff       	callq  ee1 <printar>
    19a0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    19a4:	48 03 85 30 ff ff ff 	add    -0xd0(%rbp),%rax
    19ab:	48 89 c7             	mov    %rax,%rdi
    19ae:	e8 2e f5 ff ff       	callq  ee1 <printar>
    19b3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    19b7:	4c 01 f0             	add    %r14,%rax
    19ba:	48 89 c7             	mov    %rax,%rdi
    19bd:	e8 1f f5 ff ff       	callq  ee1 <printar>
    19c2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    19c6:	4c 01 f8             	add    %r15,%rax
    19c9:	48 89 c7             	mov    %rax,%rdi
    19cc:	e8 10 f5 ff ff       	callq  ee1 <printar>
    19d1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    19d5:	48 03 85 40 ff ff ff 	add    -0xc0(%rbp),%rax
    19dc:	48 89 c7             	mov    %rax,%rdi
    19df:	e8 fd f4 ff ff       	callq  ee1 <printar>
    19e4:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    19eb:	48 89 c7             	mov    %rax,%rdi
    19ee:	e8 ee f4 ff ff       	callq  ee1 <printar>
    19f3:	4c 89 e2             	mov    %r12,%rdx
    19f6:	48 c1 ea 03          	shr    $0x3,%rdx
    19fa:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    19fe:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
    1a02:	48 89 c6             	mov    %rax,%rsi
    1a05:	48 8d 3d 60 04 00 00 	lea    0x460(%rip),%rdi        # 1e6c <TAMmenor+0x6c>
    1a0c:	b8 00 00 00 00       	mov    $0x0,%eax
    1a11:	e8 1a ee ff ff       	callq  830 <printf@plt>
    1a16:	4c 89 e2             	mov    %r12,%rdx
    1a19:	48 c1 ea 03          	shr    $0x3,%rdx
    1a1d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1a21:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
    1a25:	48 8b 85 50 ff ff ff 	mov    -0xb0(%rbp),%rax
    1a2c:	48 89 10             	mov    %rdx,(%rax)
    1a2f:	48 8b a5 08 fe ff ff 	mov    -0x1f8(%rbp),%rsp
    1a36:	90                   	nop
    1a37:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1a3b:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1a42:	00 00 
    1a44:	74 05                	je     1a4b <ORQUESTRADOR+0x7c2>
    1a46:	e8 d5 ed ff ff       	callq  820 <__stack_chk_fail@plt>
    1a4b:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
    1a4f:	5b                   	pop    %rbx
    1a50:	41 5c                	pop    %r12
    1a52:	41 5d                	pop    %r13
    1a54:	41 5e                	pop    %r14
    1a56:	41 5f                	pop    %r15
    1a58:	5d                   	pop    %rbp
    1a59:	c3                   	retq   

0000000000001a5a <SORT>:
    1a5a:	55                   	push   %rbp
    1a5b:	48 89 e5             	mov    %rsp,%rbp
    1a5e:	41 57                	push   %r15
    1a60:	41 56                	push   %r14
    1a62:	41 55                	push   %r13
    1a64:	41 54                	push   %r12
    1a66:	53                   	push   %rbx
    1a67:	48 83 ec 68          	sub    $0x68,%rsp
    1a6b:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    1a6f:	89 75 84             	mov    %esi,-0x7c(%rbp)
    1a72:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1a79:	00 00 
    1a7b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    1a7f:	31 c0                	xor    %eax,%eax
    1a81:	48 89 e0             	mov    %rsp,%rax
    1a84:	48 89 c3             	mov    %rax,%rbx
    1a87:	48 8d 35 e7 03 00 00 	lea    0x3e7(%rip),%rsi        # 1e75 <TAMmenor+0x75>
    1a8e:	48 8d 3d e3 03 00 00 	lea    0x3e3(%rip),%rdi        # 1e78 <TAMmenor+0x78>
    1a95:	e8 e6 ed ff ff       	callq  880 <fopen@plt>
    1a9a:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    1a9e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    1aa2:	48 89 c1             	mov    %rax,%rcx
    1aa5:	ba 07 00 00 00       	mov    $0x7,%edx
    1aaa:	be 01 00 00 00       	mov    $0x1,%esi
    1aaf:	48 8d 3d e2 03 00 00 	lea    0x3e2(%rip),%rdi        # 1e98 <TAMmenor+0x98>
    1ab6:	e8 d5 ed ff ff       	callq  890 <fwrite@plt>
    1abb:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1ac0:	48 83 e8 01          	sub    $0x1,%rax
    1ac4:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    1ac8:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1acd:	49 89 c6             	mov    %rax,%r14
    1ad0:	41 bf 00 00 00 00    	mov    $0x0,%r15d
    1ad6:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1adb:	49 89 c4             	mov    %rax,%r12
    1ade:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    1ae4:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1ae9:	48 c1 e0 03          	shl    $0x3,%rax
    1aed:	48 8d 50 07          	lea    0x7(%rax),%rdx
    1af1:	b8 10 00 00 00       	mov    $0x10,%eax
    1af6:	48 83 e8 01          	sub    $0x1,%rax
    1afa:	48 01 d0             	add    %rdx,%rax
    1afd:	b9 10 00 00 00       	mov    $0x10,%ecx
    1b02:	ba 00 00 00 00       	mov    $0x0,%edx
    1b07:	48 f7 f1             	div    %rcx
    1b0a:	48 6b c0 10          	imul   $0x10,%rax,%rax
    1b0e:	48 29 c4             	sub    %rax,%rsp
    1b11:	48 89 e0             	mov    %rsp,%rax
    1b14:	48 83 c0 07          	add    $0x7,%rax
    1b18:	48 c1 e8 03          	shr    $0x3,%rax
    1b1c:	48 c1 e0 03          	shl    $0x3,%rax
    1b20:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    1b24:	8b 45 84             	mov    -0x7c(%rbp),%eax
    1b27:	48 98                	cltq   
    1b29:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    1b30:	00 
    1b31:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1b35:	48 01 c2             	add    %rax,%rdx
    1b38:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    1b3c:	48 89 d6             	mov    %rdx,%rsi
    1b3f:	48 89 c7             	mov    %rax,%rdi
    1b42:	e8 42 f7 ff ff       	callq  1289 <ORQUESTRADOR>
    1b47:	83 45 84 01          	addl   $0x1,-0x7c(%rbp)
    1b4b:	e8 b0 ec ff ff       	callq  800 <clock@plt>
    1b50:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    1b54:	e8 a7 ec ff ff       	callq  800 <clock@plt>
    1b59:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    1b5d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    1b61:	48 2b 45 b0          	sub    -0x50(%rbp),%rax
    1b65:	48 89 c1             	mov    %rax,%rcx
    1b68:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    1b6f:	de 1b 43 
    1b72:	48 89 c8             	mov    %rcx,%rax
    1b75:	48 f7 ea             	imul   %rdx
    1b78:	48 c1 fa 12          	sar    $0x12,%rdx
    1b7c:	48 89 c8             	mov    %rcx,%rax
    1b7f:	48 c1 f8 3f          	sar    $0x3f,%rax
    1b83:	48 29 c2             	sub    %rax,%rdx
    1b86:	48 89 d0             	mov    %rdx,%rax
    1b89:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
    1b8e:	f2 0f 11 45 c0       	movsd  %xmm0,-0x40(%rbp)
    1b93:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    1b97:	48 8d 15 02 03 00 00 	lea    0x302(%rip),%rdx        # 1ea0 <TAMmenor+0xa0>
    1b9e:	48 8d 35 07 03 00 00 	lea    0x307(%rip),%rsi        # 1eac <TAMmenor+0xac>
    1ba5:	48 89 c7             	mov    %rax,%rdi
    1ba8:	b8 00 00 00 00       	mov    $0x0,%eax
    1bad:	e8 9e ec ff ff       	callq  850 <fprintf@plt>
    1bb2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    1bb6:	48 8d 15 f3 02 00 00 	lea    0x2f3(%rip),%rdx        # 1eb0 <TAMmenor+0xb0>
    1bbd:	48 8d 35 e8 02 00 00 	lea    0x2e8(%rip),%rsi        # 1eac <TAMmenor+0xac>
    1bc4:	48 89 c7             	mov    %rax,%rdi
    1bc7:	b8 00 00 00 00       	mov    $0x0,%eax
    1bcc:	e8 7f ec ff ff       	callq  850 <fprintf@plt>
    1bd1:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
    1bd5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    1bd9:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
    1be0:	f2 0f 10 85 78 ff ff 	movsd  -0x88(%rbp),%xmm0
    1be7:	ff 
    1be8:	48 8d 35 cf 02 00 00 	lea    0x2cf(%rip),%rsi        # 1ebe <TAMmenor+0xbe>
    1bef:	48 89 c7             	mov    %rax,%rdi
    1bf2:	b8 01 00 00 00       	mov    $0x1,%eax
    1bf7:	e8 54 ec ff ff       	callq  850 <fprintf@plt>
    1bfc:	48 89 dc             	mov    %rbx,%rsp
    1bff:	90                   	nop
    1c00:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1c04:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1c0b:	00 00 
    1c0d:	74 05                	je     1c14 <SORT+0x1ba>
    1c0f:	e8 0c ec ff ff       	callq  820 <__stack_chk_fail@plt>
    1c14:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
    1c18:	5b                   	pop    %rbx
    1c19:	41 5c                	pop    %r12
    1c1b:	41 5d                	pop    %r13
    1c1d:	41 5e                	pop    %r14
    1c1f:	41 5f                	pop    %r15
    1c21:	5d                   	pop    %rbp
    1c22:	c3                   	retq   

0000000000001c23 <consertarFgets>:
    1c23:	55                   	push   %rbp
    1c24:	48 89 e5             	mov    %rsp,%rbp
    1c27:	48 83 ec 20          	sub    $0x20,%rsp
    1c2b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1c2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1c33:	48 89 c7             	mov    %rax,%rdi
    1c36:	e8 d5 eb ff ff       	callq  810 <strlen@plt>
    1c3b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1c3e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1c41:	48 98                	cltq   
    1c43:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    1c47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1c4b:	48 01 d0             	add    %rdx,%rax
    1c4e:	c6 00 00             	movb   $0x0,(%rax)
    1c51:	90                   	nop
    1c52:	c9                   	leaveq 
    1c53:	c3                   	retq   

0000000000001c54 <main>:
    1c54:	55                   	push   %rbp
    1c55:	48 89 e5             	mov    %rsp,%rbp
    1c58:	53                   	push   %rbx
    1c59:	48 83 ec 28          	sub    $0x28,%rsp
    1c5d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1c64:	00 00 
    1c66:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1c6a:	31 c0                	xor    %eax,%eax
    1c6c:	48 89 e0             	mov    %rsp,%rax
    1c6f:	48 89 c3             	mov    %rax,%rbx
    1c72:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1c77:	48 83 e8 01          	sub    $0x1,%rax
    1c7b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    1c7f:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1c84:	48 89 c6             	mov    %rax,%rsi
    1c87:	bf 00 00 00 00       	mov    $0x0,%edi
    1c8c:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1c91:	48 89 c2             	mov    %rax,%rdx
    1c94:	b9 00 00 00 00       	mov    $0x0,%ecx
    1c99:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1c9e:	48 89 c2             	mov    %rax,%rdx
    1ca1:	b8 10 00 00 00       	mov    $0x10,%eax
    1ca6:	48 83 e8 01          	sub    $0x1,%rax
    1caa:	48 01 d0             	add    %rdx,%rax
    1cad:	b9 10 00 00 00       	mov    $0x10,%ecx
    1cb2:	ba 00 00 00 00       	mov    $0x0,%edx
    1cb7:	48 f7 f1             	div    %rcx
    1cba:	48 6b c0 10          	imul   $0x10,%rax,%rax
    1cbe:	48 29 c4             	sub    %rax,%rsp
    1cc1:	48 89 e0             	mov    %rsp,%rax
    1cc4:	48 83 c0 00          	add    $0x0,%rax
    1cc8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1ccc:	48 8b 15 3d 13 20 00 	mov    0x20133d(%rip),%rdx        # 203010 <stdin@@GLIBC_2.2.5>
    1cd3:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1cd8:	89 c1                	mov    %eax,%ecx
    1cda:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1cde:	89 ce                	mov    %ecx,%esi
    1ce0:	48 89 c7             	mov    %rax,%rdi
    1ce3:	e8 58 eb ff ff       	callq  840 <fgets@plt>
    1ce8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
    1cef:	eb 47                	jmp    1d38 <main+0xe4>
    1cf1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1cf5:	48 89 c7             	mov    %rax,%rdi
    1cf8:	e8 26 ff ff ff       	callq  1c23 <consertarFgets>
    1cfd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d01:	8b 55 d4             	mov    -0x2c(%rbp),%edx
    1d04:	89 d6                	mov    %edx,%esi
    1d06:	48 89 c7             	mov    %rax,%rdi
    1d09:	e8 4c fd ff ff       	callq  1a5a <SORT>
    1d0e:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
    1d12:	bf 0a 00 00 00       	mov    $0xa,%edi
    1d17:	e8 c4 ea ff ff       	callq  7e0 <putchar@plt>
    1d1c:	48 8b 15 ed 12 20 00 	mov    0x2012ed(%rip),%rdx        # 203010 <stdin@@GLIBC_2.2.5>
    1d23:	b8 40 42 0f 00       	mov    $0xf4240,%eax
    1d28:	89 c1                	mov    %eax,%ecx
    1d2a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d2e:	89 ce                	mov    %ecx,%esi
    1d30:	48 89 c7             	mov    %rax,%rdi
    1d33:	e8 08 eb ff ff       	callq  840 <fgets@plt>
    1d38:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d3c:	48 89 c7             	mov    %rax,%rdi
    1d3f:	e8 76 ec ff ff       	callq  9ba <ehFim>
    1d44:	66 85 c0             	test   %ax,%ax
    1d47:	74 a8                	je     1cf1 <main+0x9d>
    1d49:	b8 00 00 00 00       	mov    $0x0,%eax
    1d4e:	48 89 dc             	mov    %rbx,%rsp
    1d51:	48 8b 5d e8          	mov    -0x18(%rbp),%rbx
    1d55:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
    1d5c:	00 00 
    1d5e:	74 05                	je     1d65 <main+0x111>
    1d60:	e8 bb ea ff ff       	callq  820 <__stack_chk_fail@plt>
    1d65:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    1d69:	c9                   	leaveq 
    1d6a:	c3                   	retq   
    1d6b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001d70 <__libc_csu_init>:
    1d70:	41 57                	push   %r15
    1d72:	41 56                	push   %r14
    1d74:	49 89 d7             	mov    %rdx,%r15
    1d77:	41 55                	push   %r13
    1d79:	41 54                	push   %r12
    1d7b:	4c 8d 25 de 0f 20 00 	lea    0x200fde(%rip),%r12        # 202d60 <__frame_dummy_init_array_entry>
    1d82:	55                   	push   %rbp
    1d83:	48 8d 2d de 0f 20 00 	lea    0x200fde(%rip),%rbp        # 202d68 <__init_array_end>
    1d8a:	53                   	push   %rbx
    1d8b:	41 89 fd             	mov    %edi,%r13d
    1d8e:	49 89 f6             	mov    %rsi,%r14
    1d91:	4c 29 e5             	sub    %r12,%rbp
    1d94:	48 83 ec 08          	sub    $0x8,%rsp
    1d98:	48 c1 fd 03          	sar    $0x3,%rbp
    1d9c:	e8 17 ea ff ff       	callq  7b8 <_init>
    1da1:	48 85 ed             	test   %rbp,%rbp
    1da4:	74 20                	je     1dc6 <__libc_csu_init+0x56>
    1da6:	31 db                	xor    %ebx,%ebx
    1da8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1daf:	00 
    1db0:	4c 89 fa             	mov    %r15,%rdx
    1db3:	4c 89 f6             	mov    %r14,%rsi
    1db6:	44 89 ef             	mov    %r13d,%edi
    1db9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
    1dbd:	48 83 c3 01          	add    $0x1,%rbx
    1dc1:	48 39 dd             	cmp    %rbx,%rbp
    1dc4:	75 ea                	jne    1db0 <__libc_csu_init+0x40>
    1dc6:	48 83 c4 08          	add    $0x8,%rsp
    1dca:	5b                   	pop    %rbx
    1dcb:	5d                   	pop    %rbp
    1dcc:	41 5c                	pop    %r12
    1dce:	41 5d                	pop    %r13
    1dd0:	41 5e                	pop    %r14
    1dd2:	41 5f                	pop    %r15
    1dd4:	c3                   	retq   
    1dd5:	90                   	nop
    1dd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1ddd:	00 00 00 

0000000000001de0 <__libc_csu_fini>:
    1de0:	f3 c3                	repz retq 

Desmontagem da seção .fini:

0000000000001de4 <_fini>:
    1de4:	48 83 ec 08          	sub    $0x8,%rsp
    1de8:	48 83 c4 08          	add    $0x8,%rsp
    1dec:	c3                   	retq   
