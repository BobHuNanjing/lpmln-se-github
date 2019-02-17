%region 定义规则和程序空间

rule(1..2).
program((1..2, original)).
program((1..2, reduced)).

%endregion 定义规则和程序空间


%region 定义归约程序的空间

{reduced_rule(R) : rule(R)}.
lgl_reduct_hold(there_model, rule(R)) :- reduced_rule(R), rule(R).
-lgl_reduct_hold(there_model, rule(R)) :- not reduced_rule(R), rule(R).


%endregion 定义归约程序的空间


%region 定义程序中的规则

has_rule((1, original), 1).
has_rule((2, original), 2).

has_rule((P, reduced), R) :- reduced_rule(R), has_rule((P, original), R), rule(R), program((P, reduced)).

%endregion 定义程序中的规则


%region 定义集合空间

set(there_model).
set(here_model).

model_set(there_model).
model_set(here_model).

set(empty_set).
set(full_set).

set(head(1..2)).
set(positive_body(1..2)).
set(negative_body(1..2)).

%endregion 定义集合空间

set_op(head(1), empty_set, equal, true).
set_op(positive_body(1), empty_set, equal, true).
set_op(negative_body(1), empty_set, equal, true).

set_op(head(2), negative_body(2), intersection, non_empty).