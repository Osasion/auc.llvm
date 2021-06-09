; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; A test for checking PR 9623
; RUN: llc -mcpu=corei7 < %s | FileCheck %s

target triple = "x86_64-apple-darwin"

define <4 x i8> @foo(<4 x i8> %x, <4 x i8> %y) {
; CHECK-LABEL: foo:
; CHECK:       ## %bb.0: ## %entry
; CHECK-NEXT:    pmulld %xmm0, %xmm1
; CHECK-NEXT:    paddd %xmm1, %xmm0
; CHECK-NEXT:    retq
entry:
 %binop = mul <4 x i8> %x, %y
 %binop6 = add <4 x i8> %binop, %x
 ret <4 x i8> %binop6
}

