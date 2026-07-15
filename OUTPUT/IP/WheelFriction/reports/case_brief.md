## Case Brief

- case_name: IP_WheelFriction
- c_path: QCP_examples/LLM_bench/Engineering/WheelFriction/IP_WheelFriction.c
- target_function: WheelFriction
- proof_type: direct-proof (simplified model)
- output_path: SeparationLogic/examples/LLM_bench/Engineering/WheelFriction
- platform: Windows
- verification_date: 2026-07-09
- current_phase: done (simplified)

### Simplifications Applied

- float64 -> unint32 (QCP不支持浮点)
- 指针展平 (para->kf -> sMWCtrl.kf)
- 循环展开 (for i=0..3 -> 4x if/else)
- Sgn2() + 浮点公式 -> 抽象函数 WheelFricComp(kf,cut,vf0)
- TRUE32/FALSE32 展开为字面量 3952088175/0

### Witness Summary

- 151 safety witnesses (proof_auto.v, Admitted)
- 2 manual witnesses (proof_manual.v, 1 Admitted + 1 Abort)
