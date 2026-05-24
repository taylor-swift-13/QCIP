CURRENT_DIR=.
COQBIN=

-include CONFIGURE

# Platform-specific settings
ifeq ($(shell uname),Darwin)
	DATE = gdate
else
	DATE = date
endif

# Timing utility
timeit = @printf "%-70s" $(1); t0=$$($(DATE) +%s%3N); $(2); t1=$$($(DATE) +%s%3N); echo "$$((t1 - t0)) ms"

COQC=$(COQBIN)coqc$(SUF)
COQDEP=$(COQBIN)coqdep$(SUF)

DIRS = \
	Common auxlibs compcert_lib SeparationLogic sets unifysl StrategyLib fixedpoints MonadLib examples MaxMinLib GraphLib listlib
 
COQ_FLAG = -R SeparationLogic SimpleC.SL -R unifysl Logic -R sets SetsClass -R compcert_lib compcert.lib -R auxlibs AUXLib -R examples SimpleC.EE -R StrategyLib SimpleC.StrategyLib -R Common SimpleC.Common -R fixedpoints FP -R MonadLib MonadLib -R listlib ListLib -R MaxMinLib MaxMinLib -R GraphLib GraphLib 

DEP_FLAG = -R SeparationLogic SimpleC.SL -R unifysl Logic -R sets SetsClass -R compcert_lib compcert.lib -R auxlibs AUXLib -R examples SimpleC.EE -R StrategyLib SimpleC.StrategyLib -R Common SimpleC.Common -R fixedpoints FP -R MonadLib MonadLib -R listlib ListLib -R MaxMinLib MaxMinLib -R GraphLib GraphLib 

Common_FILES = \
  CTypes.v COps.v Notations.v

Compcertlib_FILES = \
  Coqlib.v Integers.v Zbits.v

ListLib_FILES = \
	Base/Positional.v Base/Inductive.v \
	General/Length.v General/Presuffix.v General/Forall.v General/IndexedElements.v General/NoDup.v 

MaxMinLib_FILES = \
	MaxMin.v Interface.v 

GraphLib_BASE_FILES = graph_basic.v Syntax.v GraphLib.v

GraphLib_REACHABLE_FILES = \
	reachable/reachable_basic.v reachable/reachable_restricted.v \
	reachable/path_basic.v reachable/path.v \
	reachable/vpath.v reachable/epath.v \
	reachable/Zweight.v reachable/eweight.v

GraphLib_DIRECTED_FILES = directed/rootedtree.v directed/dfstree.v

GraphLib_SUBGRAPH_FILES = subgraph/subgraph.v

GraphLib_UNDIRECTED_FILES = undirected/undirected_basic.v undirected/tree.v

GraphLib_EXAMPLES_FILES = examples/floyd.v examples/dijkstra.v examples/prim.v examples/kruskal.v examples/dfs.v examples/tarjan.v 

GraphLib_FILES = \
	$(GraphLib_BASE_FILES) \
 	$(GraphLib_REACHABLE_FILES) \
 	$(GraphLib_DIRECTED_FILES) \
 	$(GraphLib_SUBGRAPH_FILES) \
 	$(GraphLib_UNDIRECTED_FILES) \
 	$(GraphLib_EXAMPLES_FILES)

Auxlibs_FILES = \
  int_auto.v Idents.v Feq.v Axioms.v VMap.v relations.v ListLib.v \
  OrdersDecFact.v BinaryTree.v EqDec.v Bool.v Tactics.v Vec.v

Sets_FILES = \
  SetsClass.v SetsClass_AxiomFree.v SetsDomain.v SetElement.v SetElementProperties.v RelsDomain.v SetProd.v SetsDomain_Classic.v

Unify_FILES = \
   Interface.v 

FIXPOINT_FILES = \
  Coqlib.v LiftConstructors.v  PartialOrder_Setoid.v  KnasterTarski.v  BourbakiWitt.v AllFramework.v SetsFixedpoints.v

ListMonad_Files = \
	 ListMonad.v ListBasic.v

OptionMonad_Files = \
	 OptionMonad.v OptionBasic.v

SetMonad_Files = \
	SetBasic.v SetHoare.v FixpointLib.v SetMonad.v

StateRelMonad_Files = \
	StateRelBasic.v StateRelHoare.v FixpointLib.v safeexec_lib.v StateRelMonad.v

MonadErr_Files = \
	MonadErrBasic.v MonadErrLoop.v MonadErrHoare.v MonadErrHoarePartial.v monadesafe_lib.v StateRelMonadErr.v

MonadExample_FILES = \
	kmp.v mergesort.v 
  
MONAD_FILES = \
	MonadLib/MonadLib.v \
	MonadLib/Monad.v \
	$(ListMonad_Files:%.v=MonadLib/ListMonad/%.v) \
	$(OptionMonad_Files:%.v=MonadLib/OptionMonad/%.v) \
	$(SetMonad_Files:%.v=MonadLib/SetMonad/%.v) \
	$(StateRelMonad_Files:%.v=MonadLib/StateRelMonad/%.v) \
	$(MonadErr_Files:%.v=MonadLib/MonadErr/%.v) \
	$(MonadExample_FILES:%.v=MonadLib/Examples/%.v) \

SL_FILES = \
  CommonAssertion.v Assertion.v Mem.v ConAssertion.v \
  NestedCriticalSTS.v CriticalSTS.v \
  IntLib.v ArrayLib.v ArrayLibCore.v StoreAux.v pocv02.v SeparationLogic.v CNotation.v MapLib.v StringLib.v

StrategyLib_FILES = \
  DepList.v Mapping.v

QCP_DEMO_Example_Lib_FILES = \
	poly_sll_lib.v sll_lib.v sll_insert_sort_lib.v functional_queue_lib.v dll_queue_lib.v sll_queue_lib.v simple_arith/Apos_lib.v simple_arith/PDiv_lib.v bst_lib.v bst_fp_lib.v swap_lib.v eval_lib.v avl_shape.v sll_shape_lib.v dll_shape_lib.v \
	sll_merge_rel_lib.v kmp_lib.v kmp_rel_lib.v int_array_merge_rel_lib.v \

LLM_FRIENDLY_CASES_Lib_FILES = \
	poly_sll_lib.v sll_lib.v sll_insert_sort_lib.v functional_queue_lib.v dll_queue_lib.v sll_queue_lib.v simple_arith/Apos_lib.v simple_arith/PDiv_lib.v bst_lib.v bst_fp_lib.v swap_lib.v eval_lib.v avl_shape.v sll_shape_lib.v dll_shape_lib.v \
	sll_merge_rel_lib.v kmp_lib.v kmp_rel_lib.v int_array_merge_rel_lib.v \
	majorityElement_lib.v sortArray_lib.v zephyr_slist_lib.v \

LLM_BENCH_Lib_FILES = \
	Algorithms/split_array_largest_sum/split_array_largest_sum_lib.v \
	Engineering/string/string_lib.v \
	Engineering/string/memchr_lib.v \
	Engineering/string/search_lib.v \
	Engineering/string/strcat_lib.v \
	Engineering/string/strcmp_lib.v \
	Engineering/string/strcpy_lib.v

APPLICATION_Lib_FILES = \
	fme/algorithm.v fme/implement.v fme/implement_lemma.v fme/fme_lib.v typeinfer/repr_subst_prop.v typeinfer/sol_prop.v typeinfer/sound_pv.v typeinfer/type_infer_lib.v typeinfer/typeinfer_lib.v \
	minigmp/GmpAux.v minigmp/GmpNumber.v minigmp/GmpMulAux.v cnf_trans/cnf_trans_lib.v cnf_trans/smt_lang_lib.v alpha_equiv/ast_lib.v \
	malloc.v super_poly_sll2.v mergeablelist/sll_project_lib.v

QCP_DEMO_EXAMPLE_FILE_NAME = \
	poly_sll sll sll_insert_sort functional_queue dll_queue sll_queue simple_arith/abs simple_arith/add simple_arith/max3 simple_arith/gcd simple_arith/Always_pos simple_arith/div_test simple_arith/exgcd \
	sum bst_insert bst_insert_rec bst_fp_insert bst_fp_delete swap eval bst_delete_rec bst_delete_rec2 avl_insert sll_auto dll_auto array_auto chars \
	kmp_rel int_array_merge_rel sll_merge_rel sll_split_while

LLM_FRIENDLY_CASES_EXAMPLE_FILE_NAME = \
	poly_sll sll sll_insert_sort functional_queue dll_queue sll_queue simple_arith/abs simple_arith/add simple_arith/max3 simple_arith/gcd simple_arith/Always_pos simple_arith/div_test simple_arith/exgcd \
	sum bst_insert bst_insert_rec bst_fp_insert bst_fp_delete swap eval bst_delete_rec bst_delete_rec2 avl_insert sll_auto dll_auto array_auto chars \
	kmp_rel int_array_merge_rel sll_merge_rel sll_split_while majorityElement sortArray sortArray2 sortArray3 array_cases

LLM_BENCH_EXAMPLE_FILE_NAME = \
	Algorithms/split_array_largest_sum/split_array_largest_sum \
	Engineering/string/memchr \
	Engineering/string/memory \
	Engineering/string/search \
	Engineering/string/strcat \
	Engineering/string/strcmp \
	Engineering/string/strcpy

LLM_BENCH_STRATEGY_FILE_NAME = \
	Engineering/string/string

APPLICATION_FILE_NAME = \
	LiteOS/Get_Set_Value LiteOS/GetSortLinkNextExpireTime LiteOS/List_Add LiteOS/LOS_ListDelete LiteOS/LOS_ListDelInit LiteOS/LOS_ListEmpty LiteOS/LOS_ListInit LiteOS/OsAdd2SortLink LiteOS/OsDeleteNodeSortLink \
	LiteOS/OsDeleteSortLink LiteOS/OsGetNextExpireTime LiteOS/OsGetSortLinkAttribute LiteOS/OsSortLinkGetNextExpireTime LiteOS/OsSortLinkGetRemainTime LiteOS/OsSortLinkGetTargetExpireTime \
	LiteOS/OsSortLinkInit LiteOS/OsSortLinkResponseTimeConvertFreq \
	typeinfer/typeinfer alpha_equiv/alpha_equiv alpha_equiv/subst alpha_equiv/thm_apply cnf_trans/cnf_trans fme/fme minigmp/gmp mergeablelist/sll_project

APPLICATION_PROOF_SPLIT_FILES = \
	minigmp/gmp_proof_manual_part1.v \
	minigmp/gmp_proof_manual_part2.v \
	minigmp/gmp_proof_manual_part3.v \
	minigmp/gmp_proof_manual_part4.v \
	minigmp/gmp_proof_manual_part5.v \
	minigmp/gmp_proof_manual_part6.v \
	cnf_trans/cnf_trans_proof_manual1.v \
	cnf_trans/cnf_trans_proof_manual2.v \
	cnf_trans/cnf_trans_proof_manual3.v

QCP_DEMO_Examples_FILES = \
	$(addsuffix _goal.v, $(QCP_DEMO_EXAMPLE_FILE_NAME:%=QCP_demos_human/%)) \
	$(addsuffix _goal_check.v, $(QCP_DEMO_EXAMPLE_FILE_NAME:%=QCP_demos_human/%)) \
	$(addsuffix _proof_auto.v, $(QCP_DEMO_EXAMPLE_FILE_NAME:%=QCP_demos_human/%)) \
	$(addsuffix _proof_manual.v, $(QCP_DEMO_EXAMPLE_FILE_NAME:%=QCP_demos_human/%)) \
	$(QCP_DEMO_Example_Lib_FILES:%=QCP_demos_human/%)

APPLICATION_Examples_FILES = \
	$(addsuffix _goal.v, $(APPLICATION_FILE_NAME:%=Applications_human/%)) \
	$(addsuffix _goal_check.v, $(APPLICATION_FILE_NAME:%=Applications_human/%)) \
	$(addsuffix _proof_auto.v, $(APPLICATION_FILE_NAME:%=Applications_human/%)) \
	$(addsuffix _proof_manual.v, $(APPLICATION_FILE_NAME:%=Applications_human/%)) \
	$(APPLICATION_Lib_FILES:%=Applications_human/%) \
	$(APPLICATION_PROOF_SPLIT_FILES:%=Applications_human/%)

LLM_FRIENDLY_CASES_Examples_FILES = \
	$(addsuffix _goal.v, $(LLM_FRIENDLY_CASES_EXAMPLE_FILE_NAME:%=QCP_demos_LLM/%)) \
	$(addsuffix _goal_check.v, $(LLM_FRIENDLY_CASES_EXAMPLE_FILE_NAME:%=QCP_demos_LLM/%)) \
	$(addsuffix _proof_auto.v, $(LLM_FRIENDLY_CASES_EXAMPLE_FILE_NAME:%=QCP_demos_LLM/%)) \
	$(addsuffix _proof_manual.v, $(LLM_FRIENDLY_CASES_EXAMPLE_FILE_NAME:%=QCP_demos_LLM/%)) \
	$(LLM_FRIENDLY_CASES_Lib_FILES:%=QCP_demos_LLM/%)

LLM_BENCH_Examples_FILES = \
	$(LLM_BENCH_Lib_FILES:%=LLM_bench/%) \
	$(addsuffix _strategy_goal.v, $(LLM_BENCH_STRATEGY_FILE_NAME:%=LLM_bench/%)) \
	$(addsuffix _strategy_proof.v, $(LLM_BENCH_STRATEGY_FILE_NAME:%=LLM_bench/%)) \
	$(addsuffix _goal.v, $(LLM_BENCH_EXAMPLE_FILE_NAME:%=LLM_bench/%)) \
	$(addsuffix _proof_auto.v, $(LLM_BENCH_EXAMPLE_FILE_NAME:%=LLM_bench/%)) \
	$(addsuffix _proof_manual.v, $(LLM_BENCH_EXAMPLE_FILE_NAME:%=LLM_bench/%)) \
	$(addsuffix _goal_check.v, $(LLM_BENCH_EXAMPLE_FILE_NAME:%=LLM_bench/%))

QCP_DEMO_EXAMPLE_ONLY = \
	$(QCP_DEMO_Examples_FILES:%.v=examples/%.v) \
	$(QCP_DEMO_StrategyProof_FILES:%.v=examples/%.v) \

APPLICATION_EXAMPLE_ONLY = \
	$(APPLICATION_Examples_FILES:%.v=examples/%.v) \
	$(APPLICATION_StrategyProof_FILES:%.v=examples/%.v) \
	$(LiteOS_FILE:%.v=examples/%.v) \

LLM_FRIENDLY_CASES_EXAMPLE_ONLY = \
	$(LLM_FRIENDLY_CASES_Examples_FILES:%.v=examples/%.v) \
	$(LLM_FRIENDLY_CASES_StrategyProof_FILES:%.v=examples/%.v) \

LLM_BENCH_EXAMPLE_ONLY = \
	$(LLM_BENCH_Examples_FILES:%.v=examples/%.v) \

Examples_FILES = \
	$(QCP_DEMO_Examples_FILES) \
	$(APPLICATION_Examples_FILES) \
	$(LLM_FRIENDLY_CASES_Examples_FILES) \
	$(LLM_BENCH_Examples_FILES)

QCP_DEMO_STRATEGY_FILE_NAME = \
	common poly_sll sll_shape sll dll_queue functional_queue sll_queue int_array undef_uint_array uint_array array_shape bst bst_fp eval char_array avl dll_shape safeexec safeexecE

LLM_FRIENDLY_CASES_STRATEGY_FILE_NAME = \
	common poly_sll sll_shape sll dll_queue functional_queue sll_queue int_array undef_uint_array uint_array array_shape bst bst_fp eval char_array avl dll_shape safeexec safeexecE

APPLICATION_STRATEGY_FILE_NAME = \
	fme/fme typeinfer/typeinfer minigmp/gmp mergeablelist/sll_project
  
QCP_DEMO_StrategyProof_FILES = \
	$(addsuffix _strategy_goal.v, $(QCP_DEMO_STRATEGY_FILE_NAME:%=QCP_demos_human/%)) \
	$(addsuffix _strategy_goal_check.v, $(QCP_DEMO_STRATEGY_FILE_NAME:%=QCP_demos_human/%)) \
	$(addsuffix _strategy_proof.v, $(QCP_DEMO_STRATEGY_FILE_NAME:%=QCP_demos_human/%))

APPLICATION_StrategyProof_FILES = \
	$(addsuffix _strategy_goal.v, $(APPLICATION_STRATEGY_FILE_NAME:%=Applications_human/%)) \
	$(addsuffix _strategy_goal_check.v, $(APPLICATION_STRATEGY_FILE_NAME:%=Applications_human/%)) \
	$(addsuffix _strategy_proof.v, $(APPLICATION_STRATEGY_FILE_NAME:%=Applications_human/%))

LLM_FRIENDLY_CASES_StrategyProof_FILES = \
	$(addsuffix _strategy_goal.v, $(LLM_FRIENDLY_CASES_STRATEGY_FILE_NAME:%=QCP_demos_LLM/%)) \
	$(addsuffix _strategy_goal_check.v, $(LLM_FRIENDLY_CASES_STRATEGY_FILE_NAME:%=QCP_demos_LLM/%)) \
	$(addsuffix _strategy_proof.v, $(LLM_FRIENDLY_CASES_STRATEGY_FILE_NAME:%=QCP_demos_LLM/%))

StrategyProof_FILES = \
	$(QCP_DEMO_StrategyProof_FILES) \
	$(APPLICATION_StrategyProof_FILES) \
	$(LLM_FRIENDLY_CASES_StrategyProof_FILES) \

LiteOS_Lib_FILES = \
	dll sortlink tick_backup glob_vars_and_defs tick Los_Verify_State_def

LiteOS_Strategy_FILE_NAME = \
	los_sortlink


LiteOS_FILE = \
	$(LiteOS_Lib_FILES:%=Applications_human/LiteOS/lib/%.v) \
	$(LiteOS_Strategy_FILE_NAME:%=Applications_human/%_strategy_goal.v) \
	$(LiteOS_Strategy_FILE_NAME:%=Applications_human/%_strategy_goal_check.v) \
	$(LiteOS_Strategy_FILE_NAME:%=Applications_human/%_strategy_proof.v) \

EXAMPLE = \
	$(SL_FILES:%.v=SeparationLogic/%.v) \
	$(FIXPOINT_FILES:%.v=fixedpoints/%.v) \
	$(Common_FILES:%.v=Common/%.v) \
	$(MONAD_FILES:%.v=%.v) \
	$(ListLib_FILES:%.v=listlib/%.v) \
	$(MaxMinLib_FILES:%.v=MaxMinLib/%.v) \
	$(GraphLib_FILES:%.v=GraphLib/%.v) \
	$(Sets_FILES:%.v=sets/%.v) \
	$(Unify_FILES:%.v=unifysl/LogicGenerator/demo932/%.v) \
	$(Examples_FILES:%.v=examples/%.v) \
	$(StrategyProof_FILES:%.v=examples/%.v) \
	$(Compcertlib_FILES:%.v=compcert_lib/%.v) \
	$(Auxlibs_FILES:%.v=auxlibs/%.v) \
	$(LiteOS_FILE:%.v=examples/%.v) \

CORE_EXAMPLE = \
	$(SL_FILES:%.v=SeparationLogic/%.v) \
	$(FIXPOINT_FILES:%.v=fixedpoints/%.v) \
	$(Common_FILES:%.v=Common/%.v) \
	$(MONAD_FILES:%.v=%.v) \
	$(ListLib_FILES:%.v=listlib/%.v) \
	$(MaxMinLib_FILES:%.v=MaxMinLib/%.v) \
	$(GraphLib_FILES:%.v=GraphLib/%.v) \
	$(Sets_FILES:%.v=sets/%.v) \
	$(Unify_FILES:%.v=unifysl/LogicGenerator/demo932/%.v) \
	$(Compcertlib_FILES:%.v=compcert_lib/%.v) \
	$(Auxlibs_FILES:%.v=auxlibs/%.v) \

EXAMPLE_ONLY = \
	$(APPLICATION_EXAMPLE_ONLY) \
	$(QCP_DEMO_EXAMPLE_ONLY) \
	$(LLM_FRIENDLY_CASES_EXAMPLE_ONLY) \
	$(LLM_BENCH_EXAMPLE_ONLY) \

CORE_OUTPUTS = \
	$(CORE_EXAMPLE:%.v=%.glob) \
	$(CORE_EXAMPLE:%.v=%.vo) \
	$(CORE_EXAMPLE:%.v=%.vok) \
	$(CORE_EXAMPLE:%.v=%.vos) \

APPLICATION_OUTPUTS = \
	$(APPLICATION_EXAMPLE_ONLY:%.v=%.glob) \
	$(APPLICATION_EXAMPLE_ONLY:%.v=%.vo) \
	$(APPLICATION_EXAMPLE_ONLY:%.v=%.vok) \
	$(APPLICATION_EXAMPLE_ONLY:%.v=%.vos) \

QCP_DEMO_OUTPUTS = \
	$(QCP_DEMO_EXAMPLE_ONLY:%.v=%.glob) \
	$(QCP_DEMO_EXAMPLE_ONLY:%.v=%.vo) \
	$(QCP_DEMO_EXAMPLE_ONLY:%.v=%.vok) \
	$(QCP_DEMO_EXAMPLE_ONLY:%.v=%.vos) \

LLM_FRIENDLY_CASES_OUTPUTS = \
	$(LLM_FRIENDLY_CASES_EXAMPLE_ONLY:%.v=%.glob) \
	$(LLM_FRIENDLY_CASES_EXAMPLE_ONLY:%.v=%.vo) \
	$(LLM_FRIENDLY_CASES_EXAMPLE_ONLY:%.v=%.vok) \
	$(LLM_FRIENDLY_CASES_EXAMPLE_ONLY:%.v=%.vos) \

LLM_BENCH_OUTPUTS = \
	$(LLM_BENCH_EXAMPLE_ONLY:%.v=%.glob) \
	$(LLM_BENCH_EXAMPLE_ONLY:%.v=%.vo) \
	$(LLM_BENCH_EXAMPLE_ONLY:%.v=%.vok) \
	$(LLM_BENCH_EXAMPLE_ONLY:%.v=%.vos) \

EXAMPLE_OUTPUTS = \
	$(EXAMPLE_ONLY:%.v=%.glob) \
	$(EXAMPLE_ONLY:%.v=%.vo) \
	$(EXAMPLE_ONLY:%.v=%.vok) \
	$(EXAMPLE_ONLY:%.v=%.vos) \

DEPEND_TARGETS := depend depend-core depend-examples depend-examples-applications depend-examples-qcp-democases depend-examples-llm-friendly-cases depend-examples-llm-bench clean clean-core clean-examples clean-examples-applications clean-examples-qcp-democases clean-examples-llm-friendly-cases clean-examples-llm-bench clean-deps

$(EXAMPLE:%.v=%.vo): %.vo: %.v
ifeq ($(TIMING),)
	@echo "COQC $*.v"
	@$(COQC) $(COQ_FLAG) $(CURRENT_DIR)/$*.v
else
	$(call timeit, "COQC $*.v", $(COQC) $(COQ_FLAG) $(CURRENT_DIR)/$*.v)
endif

	

all: \
	$(EXAMPLE:%.v=%.vo) \

core: \
	$(CORE_EXAMPLE:%.v=%.vo) \

examples : \
	$(EXAMPLE:%.v=%.vo) 

examples-applications: \
	$(APPLICATION_EXAMPLE_ONLY:%.v=%.vo) \

examples-qcp-democases: \
	$(QCP_DEMO_EXAMPLE_ONLY:%.v=%.vo) \

examples-llm-friendly-cases: \
	$(LLM_FRIENDLY_CASES_EXAMPLE_ONLY:%.v=%.vo) \

examples-llm-bench: \
	$(LLM_BENCH_EXAMPLE_ONLY:%.v=%.vo) \

_CoqProject:
	@echo $(COQ_FLAG) > _CoqProject

depend:
	@set -e; \
	$(COQDEP) $(DEP_FLAG) $(CORE_EXAMPLE) > .depend.core.tmp; \
	mv .depend.core.tmp .depend.core; \
	$(COQDEP) $(DEP_FLAG) $(APPLICATION_EXAMPLE_ONLY) > .depend.examples.applications.tmp; \
	mv .depend.examples.applications.tmp .depend.examples.applications; \
	$(COQDEP) $(DEP_FLAG) $(QCP_DEMO_EXAMPLE_ONLY) > .depend.examples.qcp_democases.tmp; \
	mv .depend.examples.qcp_democases.tmp .depend.examples.qcp_democases; \
	$(COQDEP) $(DEP_FLAG) $(LLM_FRIENDLY_CASES_EXAMPLE_ONLY) > .depend.examples.llm_friendly_cases.tmp; \
	mv .depend.examples.llm_friendly_cases.tmp .depend.examples.llm_friendly_cases; \
	$(COQDEP) $(DEP_FLAG) $(LLM_BENCH_EXAMPLE_ONLY) > .depend.examples.llm_bench.tmp; \
	mv .depend.examples.llm_bench.tmp .depend.examples.llm_bench; \
	cat .depend.examples.applications .depend.examples.qcp_democases .depend.examples.llm_friendly_cases .depend.examples.llm_bench > .depend.examples.tmp; \
	mv .depend.examples.tmp .depend.examples; \
	cat .depend.core .depend.examples > .depend.tmp; \
	mv .depend.tmp .depend

depend-core:
	@set -e; \
	$(COQDEP) $(DEP_FLAG) $(CORE_EXAMPLE) > .depend.core.tmp; \
	mv .depend.core.tmp .depend.core

depend-examples:
	@set -e; \
	$(COQDEP) $(DEP_FLAG) $(APPLICATION_EXAMPLE_ONLY) > .depend.examples.applications.tmp; \
	mv .depend.examples.applications.tmp .depend.examples.applications; \
	$(COQDEP) $(DEP_FLAG) $(QCP_DEMO_EXAMPLE_ONLY) > .depend.examples.qcp_democases.tmp; \
	mv .depend.examples.qcp_democases.tmp .depend.examples.qcp_democases; \
	$(COQDEP) $(DEP_FLAG) $(LLM_FRIENDLY_CASES_EXAMPLE_ONLY) > .depend.examples.llm_friendly_cases.tmp; \
	mv .depend.examples.llm_friendly_cases.tmp .depend.examples.llm_friendly_cases; \
	$(COQDEP) $(DEP_FLAG) $(LLM_BENCH_EXAMPLE_ONLY) > .depend.examples.llm_bench.tmp; \
	mv .depend.examples.llm_bench.tmp .depend.examples.llm_bench; \
	cat .depend.examples.applications .depend.examples.qcp_democases .depend.examples.llm_friendly_cases .depend.examples.llm_bench > .depend.examples.tmp; \
	mv .depend.examples.tmp .depend.examples

depend-examples-applications:
	@set -e; \
	$(COQDEP) $(DEP_FLAG) $(APPLICATION_EXAMPLE_ONLY) > .depend.examples.applications.tmp; \
	mv .depend.examples.applications.tmp .depend.examples.applications

depend-examples-qcp-democases:
	@set -e; \
	$(COQDEP) $(DEP_FLAG) $(QCP_DEMO_EXAMPLE_ONLY) > .depend.examples.qcp_democases.tmp; \
	mv .depend.examples.qcp_democases.tmp .depend.examples.qcp_democases

depend-examples-llm-friendly-cases:
	@set -e; \
	$(COQDEP) $(DEP_FLAG) $(LLM_FRIENDLY_CASES_EXAMPLE_ONLY) > .depend.examples.llm_friendly_cases.tmp; \
	mv .depend.examples.llm_friendly_cases.tmp .depend.examples.llm_friendly_cases

depend-examples-llm-bench:
	@set -e; \
	$(COQDEP) $(DEP_FLAG) $(LLM_BENCH_EXAMPLE_ONLY) > .depend.examples.llm_bench.tmp; \
	mv .depend.examples.llm_bench.tmp .depend.examples.llm_bench

.depend:
	@$(MAKE) depend

clean:
	@$(MAKE) clean-core
	@$(MAKE) clean-examples
	@$(MAKE) clean-deps

clean-core:
	@rm -f $(CORE_OUTPUTS)
	@rm -f **/.*.aux
	@rm -f .depend.core .depend.core.tmp
	@rm -f .depend.tmp
	@rm -f .depend

clean-examples:
	@rm -f $(EXAMPLE_OUTPUTS)
	@rm -f **/.*.aux
	@rm -f examples/**/.*.aux examples/LiteOS/lib/.*.aux
	@rm -f .depend.examples.applications .depend.examples.applications.tmp
	@rm -f .depend.examples.qcp_democases .depend.examples.qcp_democases.tmp
	@rm -f .depend.examples.llm_friendly_cases .depend.examples.llm_friendly_cases.tmp
	@rm -f .depend.examples.llm_bench .depend.examples.llm_bench.tmp
	@rm -f .depend.examples .depend.examples.tmp
	@rm -f .depend.tmp
	@rm -f .depend

clean-examples-applications:
	@rm -f $(APPLICATION_OUTPUTS)
	@rm -f examples/**/.*.aux examples/LiteOS/lib/.*.aux
	@rm -f .depend.examples.applications .depend.examples.applications.tmp
	@rm -f .depend.examples .depend.examples.tmp
	@rm -f .depend.tmp
	@rm -f .depend

clean-examples-qcp-democases:
	@rm -f $(QCP_DEMO_OUTPUTS)
	@rm -f examples/**/.*.aux examples/LiteOS/lib/.*.aux
	@rm -f .depend.examples.qcp_democases .depend.examples.qcp_democases.tmp
	@rm -f .depend.examples .depend.examples.tmp
	@rm -f .depend.tmp
	@rm -f .depend

clean-examples-llm-friendly-cases:
	@rm -f $(LLM_FRIENDLY_CASES_OUTPUTS)
	@rm -f examples/**/.*.aux examples/LiteOS/lib/.*.aux
	@rm -f .depend.examples.llm_friendly_cases .depend.examples.llm_friendly_cases.tmp
	@rm -f .depend.examples .depend.examples.tmp
	@rm -f .depend.tmp
	@rm -f .depend

clean-examples-llm-bench:
	@rm -f $(LLM_BENCH_OUTPUTS)
	@rm -f examples/**/.*.aux examples/LiteOS/lib/.*.aux
	@rm -f .depend.examples.llm_bench .depend.examples.llm_bench.tmp
	@rm -f .depend.examples .depend.examples.tmp
	@rm -f .depend.tmp
	@rm -f .depend

clean-deps:
	@rm -f .depend.core .depend.core.tmp
	@rm -f .depend.examples.applications .depend.examples.applications.tmp
	@rm -f .depend.examples.qcp_democases .depend.examples.qcp_democases.tmp
	@rm -f .depend.examples.llm_friendly_cases .depend.examples.llm_friendly_cases.tmp
	@rm -f .depend.examples.llm_bench .depend.examples.llm_bench.tmp
	@rm -f .depend.examples .depend.examples.tmp
	@rm -f .depend.tmp
	@rm -f .depend

.PHONY: clean clean-core clean-examples clean-examples-applications clean-examples-qcp-democases clean-examples-llm-friendly-cases clean-examples-llm-bench clean-deps depend depend-core depend-examples depend-examples-applications depend-examples-qcp-democases depend-examples-llm-friendly-cases depend-examples-llm-bench core examples-applications examples-qcp-democases examples-llm-friendly-cases examples-llm-bench
.DEFAULT_GOAL := all

ifeq ($(filter $(DEPEND_TARGETS),$(MAKECMDGOALS)),)
-include .depend.core
-include .depend.examples.applications
-include .depend.examples.qcp_democases
-include .depend.examples.llm_friendly_cases
-include .depend.examples.llm_bench
-include .depend.examples
-include .depend
endif
