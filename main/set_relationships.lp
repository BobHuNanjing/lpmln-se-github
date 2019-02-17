set_op(here_model, there_model, subseteq, true).

% 集合运算公理集

% 两个集合同一运算的结果不能不同
 :- set_op(S1, S2, OP, Result1), set_op(S1, S2, OP, Result2), Result1 != Result2.

% 关于相交的推导结论

% 交换律
set_op(S2, S1, intersection, Result) :- set_op(S1, S2, intersection, Result).

set_op(S1, S2, subseteq, false) :- set_op(S1, S2, intersection, empty), set_op(S1, empty_set, equal, false). 
set_op(S2, S1, subseteq, false) :- set_op(S1, S2, intersection, empty), set_op(S2, empty_set, equal, false). 



% 集合相等
set_op(S1, S2, equal, true) :- set_op(S2, S1, equal, true).
set_op(S1, S3, equal, true) :- set_op(S1, S2, equal, true), set_op(S2, S3, equal, true).
set_op(S, S, equal, true) :- set(S).

set_op(S3, S2, Op, Result) :- set_op(S1, S2, Op, Result), set_op(S1, S3, equal, true).
set_op(S1, S3, Op, Result) :- set_op(S1, S2, Op, Result), set_op(S2, S3, equal, true).

% set_op(S1, S2, intersection, non_empty) :- set_op(S1, S2, equal, true). 
% set_op(S1, S2, subseteq, true) :- set_op(S1, S2, equal, true). 
% set_op(S2, S1, subseteq, true) :- set_op(S1, S2, equal, true). 

% set_op(S1, S2, equal, true) :- set_op(S1, S2, subseteq, true), set_op(S2, S1, subseteq, true).

% 空集和全集情况
set_op(empty_set, S, intersection, empty) :- set(S).
set_op(empty_set, S, subseteq, true) :- set(S).
set_op(empty_set, S, subset, true) :- set(S), set_op(S, empty_set, equal, false).

set_op(S, full_set, subseteq, true) :- set(S). 
set_op(S, full_set, intersection, non_empty) :- set(S), set_op(S, empty_set, equal, false).


set_op(empty_set, full_set, intersection, empty).
set_op(empty_set, full_set, subseteq, true).
% set_op(empty_set, full_set, subset, true).

set_op(empty_set, empty_set, equal, true).
set_op(full_set, full_set, equal, true).

% 包含

% set_op(S1, S2, intersection, non_empty) :- set_op(S1, S2, subseteq, true), S1 != empty_set, S2 != empty_set. 
set_op(S2, S3, intersection, non_empty) :- set_op(S1, S2, subseteq, true), set_op(S1, S3, intersection, non_empty). 
% set_op(S1, S2, intersection, non_empty):- set_op(S1, S2, subseteq, true), set_op(S1, empty_set, equal, false). 

% set_op(S1, S2, subset, true) | set_op(S1, S2, equal, true) :- set_op(S1, S2, subseteq, true).

set_op(S1, S2, subseteq, true) :- set_op(S1, S2, subset, true). 
set_op(S1, S2, equal, false) :- set_op(S1, S2, subset, true). 