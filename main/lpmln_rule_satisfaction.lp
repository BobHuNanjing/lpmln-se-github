%region LPMLN 归约

lpmln_reduct_hold(X, rule(R)) :- satisfy(X, rule(R)), rule(R), set(X).
satisfy(X, rule(R)) :- lpmln_reduct_hold(X, rule(R)), rule(R), set(X).

-lpmln_reduct_hold(X, rule(R)) :- -satisfy(X, rule(R)), rule(R), set(X).
-satisfy(X, rule(R)) :- -lpmln_reduct_hold(X, rule(R)), rule(R), set(X).

%endregion LPMLN 归约


%region GL 归约

gl_reduct_hold(X, rule(R)) :- satisfy(X, negative_body(R)), rule(R), set(X).
satisfy(X, negative_body(R)) :- gl_reduct_hold(X, rule(R)), rule(R), set(X).

-gl_reduct_hold(X, rule(R)) :- -satisfy(X, negative_body(R)), rule(R), set(X).
-satisfy(X, negative_body(R)) :- -gl_reduct_hold(X, rule(R)), rule(R), set(X).

%endregion GL 归约


%region 定义LPMLN-GL 归约

lgl_reduct_hold(X, rule(R)) :- lpmln_reduct_hold(X, rule(R)), gl_reduct_hold(X, rule(R)), rule(R), set(X).

lpmln_reduct_hold(X, rule(R)) :- lgl_reduct_hold(X, rule(R)), rule(R), set(X).
gl_reduct_hold(X, rule(R)) :- lgl_reduct_hold(X, rule(R)), rule(R), set(X).

-lgl_reduct_hold(X, rule(R)) :- -lpmln_reduct_hold(X, rule(R)), rule(R), set(X).
-lgl_reduct_hold(X, rule(R)) :- -gl_reduct_hold(X, rule(R)), rule(R), set(X).

lgl_reduct_not_hold_case(X, rule(R), 1) | lgl_reduct_not_hold_case(X, rule(R), 2) :- -lgl_reduct_hold(X, rule(R)), rule(R), set(X).

-lpmln_reduct_hold(X, rule(R)) :- lgl_reduct_not_hold_case(X, rule(R), 1), rule(R), set(X).
gl_reduct_hold(X, rule(R)) :- lgl_reduct_not_hold_case(X, rule(R), 1), rule(R), set(X).

lpmln_reduct_hold(X, rule(R)) :- lgl_reduct_not_hold_case(X, rule(R), 2), rule(R), set(X).
-gl_reduct_hold(X, rule(R)) :- lgl_reduct_not_hold_case(X, rule(R), 2), rule(R), set(X).

% 不可能的情况
% -lpmln_reduct_hold(X, rule(R)) :- lgl_reduct_not_hold_case(X, rule(R), 3), rule(R), set(X).
% -gl_reduct_hold(X, rule(R)) :- lgl_reduct_not_hold_case(X, rule(R), 3), rule(R), set(X).

%endregion 定义LPMLN-GL 归约