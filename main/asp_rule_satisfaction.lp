%region 集合X对规则中三个部分满足情况的定义

% 集合满足头部
set_op(X, head(R), intersection, non_empty) :- satisfy(X, head(R)), rule(R), model_set(X).
satisfy(X, head(R)) :- set_op(X, head(R), intersection, non_empty), rule(R), model_set(X).

% 集合不满足头部
set_op(X, head(R), intersection, empty) :- -satisfy(X, head(R)), rule(R), model_set(X).
-satisfy(X, head(R)) :- set_op(X, head(R), intersection, empty), rule(R), model_set(X).


% 集合满足正体部
set_op(positive_body(R), X, subseteq, true) :- satisfy(X, positive_body(R)), rule(R), model_set(X).
satisfy(X, positive_body(R)) :- set_op(positive_body(R), X, subseteq, true), rule(R), model_set(X).

% 集合不满足正体部
set_op(positive_body(R), X, subseteq, false) :- -satisfy(X, positive_body(R)), rule(R), model_set(X).
-satisfy(X, positive_body(R)) :- set_op(positive_body(R), X, subseteq, false), rule(R), model_set(X).

% 集合满足负体部
set_op(negative_body(R), X, intersection, empty) :- satisfy(X, negative_body(R)), rule(R), model_set(X).
satisfy(X, negative_body(R)) :- set_op(negative_body(R), X, intersection, empty), rule(R), model_set(X).

% 集合不满足负体部
set_op(negative_body(R), X, intersection, non_empty) :- -satisfy(X, negative_body(R)), rule(R), model_set(X).
-satisfy(X, negative_body(R)) :- set_op(negative_body(R), X, intersection, non_empty), rule(R), model_set(X).

% 集合满足体部
satisfy(X, body(R)) :- satisfy(X, positive_body(R)), satisfy(X, negative_body(R)), rule(R), model_set(X).
satisfy(X, negative_body(R)) :- satisfy(X, body(R)), rule(R), model_set(X).
satisfy(X, positive_body(R)) :- satisfy(X, body(R)), rule(R), model_set(X).


% 集合不满足体部
-satisfy(X, body(R)) :- -satisfy(X, positive_body(R)), rule(R), model_set(X).
-satisfy(X, body(R)) :- -satisfy(X, negative_body(R)), rule(R), model_set(X).

not_satisfy_body_case(X, body(R), 1) | not_satisfy_body_case(X, body(R), 2) | not_satisfy_body_case(X, body(R), 3) :- -satisfy(X, body(R)), rule(R), model_set(X).

satisfy(X, positive_body(R)) :- not_satisfy_body_case(X, body(R), 1), rule(R), model_set(X).
-satisfy(X, negative_body(R)) :- not_satisfy_body_case(X, body(R), 1), rule(R), model_set(X).

-satisfy(X, positive_body(R)) :- not_satisfy_body_case(X, body(R), 2), rule(R), model_set(X).
satisfy(X, negative_body(R)) :- not_satisfy_body_case(X, body(R), 2), rule(R), model_set(X).

-satisfy(X, positive_body(R)) :- not_satisfy_body_case(X, body(R), 3), rule(R), model_set(X).
-satisfy(X, negative_body(R)) :- not_satisfy_body_case(X, body(R), 3), rule(R), model_set(X).


%endregion 集合X对规则中三个部分满足情况的定义 ------%%


%region 集合X对规则的满足情况定义

% 集合满足ASP规则
satisfy(X, rule(R)) :- satisfy(X, head(R)), rule(R), model_set(X).
satisfy(X, rule(R)) :- -satisfy(X, body(R)), rule(R), model_set(X).

satisfy_rule_case(X, rule(R), 1) | satisfy_rule_case(X, rule(R), 2) | satisfy_rule_case(X, rule(R), 3) :- satisfy(X, rule(R)), rule(R), model_set(X).

satisfy(X, head(R)) :- satisfy_rule_case(X, rule(R), 1), rule(R), model_set(X). 
satisfy(X, body(R)) :- satisfy_rule_case(X, rule(R), 1), rule(R), model_set(X). 

-satisfy(X, body(R)) :- satisfy_rule_case(X, rule(R), 2), rule(R), model_set(X). 
satisfy(X, head(R)) :- satisfy_rule_case(X, rule(R), 2), rule(R), model_set(X). 

-satisfy(X, head(R)) :- satisfy_rule_case(X, rule(R), 3), rule(R), model_set(X). 
-satisfy(X, body(R)) :- satisfy_rule_case(X, rule(R), 3), rule(R), model_set(X). 

% 集合不满足ASP规则
-satisfy(X, head(R)) :- -satisfy(X, rule(R)), rule(R), model_set(X).
satisfy(X, body(R)) :- -satisfy(X, rule(R)), rule(R), model_set(X).

-satisfy(X, rule(R)) :- satisfy(X, body(R)), -satisfy(X, head(R)), rule(R), model_set(X).


%endregion 集合X对规则的满足情况定义


%region 集合X对ASP程序的满足情况定义

% 集合满足ASP程序
%unknown_satisfy(X, rule(R)) :- not satisfy(X, rule(R)), not -satisfy(X, rule(R)), rule(R), model_set(X).
%unknown_satisfy(X, program(P)) :- unknown_satisfy(X, rule(R)), not -satisfy(X, program(P)), has_rule(P, R), program(P), rule(R), model_set(X).

satisfy(X, program(P)) :- not -satisfy(X, program(P)), program(P), model_set(X).
satisfy(X, rule(R)) :- satisfy(X, program(P)), has_rule(P, R), program(P), rule(R), model_set(X).

% 集合不满足ASP程序
-satisfy(X, program(P)) :- -satisfy(X, rule(R)), has_rule(P, R), program(P), rule(R), model_set(X).

1 {-satisfy(X, rule(R)) : has_rule(P, R)} :- -satisfy(X, program(P)), program(P), model_set(X).

satisfy(X, rule(R)) :- has_rule(P, R), -satisfy(X, program(P)), not -satisfy(X, rule(R)), program(P), rule(R), model_set(X).

%endregion 集合X对ASP程序的满足情况定义