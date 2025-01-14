; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -target-abi ilp32d -mattr=+experimental-zfa,+d < %s \
; RUN:     | FileCheck --check-prefix=RV32IDZFA %s
; RUN: llc -mtriple=riscv64 -target-abi lp64d -mattr=+experimental-zfa,+d < %s \
; RUN:     | FileCheck --check-prefix=RV64DZFA %s

declare double @llvm.minimum.f64(double, double)

define double @fminm_d(double %a, double %b) nounwind {
; RV32IDZFA-LABEL: fminm_d:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fminm.d fa0, fa0, fa1
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fminm_d:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fminm.d fa0, fa0, fa1
; RV64DZFA-NEXT:    ret
  %1 = call double @llvm.minimum.f64(double %a, double %b)
  ret double %1
}

declare double @llvm.maximum.f64(double, double)

define double @fmaxm_d(double %a, double %b) nounwind {
; RV32IDZFA-LABEL: fmaxm_d:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fmaxm.d fa0, fa0, fa1
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fmaxm_d:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fmaxm.d fa0, fa0, fa1
; RV64DZFA-NEXT:    ret
  %1 = call double @llvm.maximum.f64(double %a, double %b)
  ret double %1
}

define double @fround_d_1(double %a) nounwind {
; RV32IDZFA-LABEL: fround_d_1:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fround.d fa0, fa0, rmm
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fround_d_1:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fround.d fa0, fa0, rmm
; RV64DZFA-NEXT:    ret
  %call = tail call double @round(double %a) nounwind readnone
  ret double %call
}

declare double @round(double) nounwind readnone


define double @fround_d_2(double %a) nounwind {
; RV32IDZFA-LABEL: fround_d_2:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fround.d fa0, fa0, rup
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fround_d_2:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fround.d fa0, fa0, rup
; RV64DZFA-NEXT:    ret
  %call = tail call double @floor(double %a) nounwind readnone
  ret double %call
}

declare double @floor(double) nounwind readnone


define double @fround_d_3(double %a) nounwind {
; RV32IDZFA-LABEL: fround_d_3:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fround.d fa0, fa0, rdn
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fround_d_3:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fround.d fa0, fa0, rdn
; RV64DZFA-NEXT:    ret
  %call = tail call double @ceil(double %a) nounwind readnone
  ret double %call
}

declare double @ceil(double) nounwind readnone


define double @fround_d_4(double %a) nounwind {
; RV32IDZFA-LABEL: fround_d_4:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fround.d fa0, fa0, rtz
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fround_d_4:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fround.d fa0, fa0, rtz
; RV64DZFA-NEXT:    ret
  %call = tail call double @trunc(double %a) nounwind readnone
  ret double %call
}

declare double @trunc(double) nounwind readnone


define double @fround_d_5(double %a) nounwind {
; RV32IDZFA-LABEL: fround_d_5:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fround.d fa0, fa0
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fround_d_5:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fround.d fa0, fa0
; RV64DZFA-NEXT:    ret
  %call = tail call double @nearbyint(double %a) nounwind readnone
  ret double %call
}

declare double @nearbyint(double) nounwind readnone


define double @froundnx_d(double %a) nounwind {
; RV32IDZFA-LABEL: froundnx_d:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    froundnx.d fa0, fa0
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: froundnx_d:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    froundnx.d fa0, fa0
; RV64DZFA-NEXT:    ret
  %call = tail call double @rint(double %a) nounwind readnone
  ret double %call
}

declare double @rint(double) nounwind readnone

declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata)

define i32 @fcmp_olt_q(double %a, double %b) nounwind strictfp {
; RV32IDZFA-LABEL: fcmp_olt_q:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fltq.d a0, fa0, fa1
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fcmp_olt_q:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fltq.d a0, fa0, fa1
; RV64DZFA-NEXT:    ret
  %1 = call i1 @llvm.experimental.constrained.fcmp.f64(double %a, double %b, metadata !"olt", metadata !"fpexcept.strict") strictfp
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ole_q(double %a, double %b) nounwind strictfp {
; RV32IDZFA-LABEL: fcmp_ole_q:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fleq.d a0, fa0, fa1
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fcmp_ole_q:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fleq.d a0, fa0, fa1
; RV64DZFA-NEXT:    ret
  %1 = call i1 @llvm.experimental.constrained.fcmp.f64(double %a, double %b, metadata !"ole", metadata !"fpexcept.strict") strictfp
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i64 @fmvh_x_d(double %fa) {
; RV32IDZFA-LABEL: fmvh_x_d:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fmv.x.w a0, fa0
; RV32IDZFA-NEXT:    fmvh.x.d a1, fa0
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fmvh_x_d:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fmv.x.d a0, fa0
; RV64DZFA-NEXT:    ret
  %i = bitcast double %fa to i64
  ret i64 %i
}

define double @fmvp_d_x(i64 %a) {
; RV32IDZFA-LABEL: fmvp_d_x:
; RV32IDZFA:       # %bb.0:
; RV32IDZFA-NEXT:    fmvp.d.x fa0, a0, a1
; RV32IDZFA-NEXT:    ret
;
; RV64DZFA-LABEL: fmvp_d_x:
; RV64DZFA:       # %bb.0:
; RV64DZFA-NEXT:    fmv.d.x fa0, a0
; RV64DZFA-NEXT:    ret
  %or = bitcast i64 %a to double
  ret double %or
}
