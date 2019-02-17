non_equivalent(program((P1, original)), program((P2, original))) :- satisfy(here_model, program((P1, reduced))), -satisfy(here_model, program((P2, reduced))), program((P1, reduced)), program((P2, reduced)), P1 != P2, set(here_model).
non_equivalent(program((P1, original)), program((P2, original))) :- -satisfy(here_model, program((P1, reduced))), satisfy(here_model, program((P2, reduced))), program((P1, reduced)), program((P2, reduced)), P1 != P2, set(here_model).
equivalent(program((P1, original)), program((P2, original))) :- satisfy(here_model, program((P1, reduced))), satisfy(here_model, program((P2, reduced))), program((P1, reduced)), program((P2, reduced)), P1 != P2, set(here_model).
equivalent(program((P1, original)), program((P2, original))) :- -satisfy(here_model, program((P1, reduced))), -satisfy(here_model, program((P2, reduced))), program((P1, reduced)), program((P2, reduced)), P1 != P2, set(here_model).

-satisfy(here_model, program((1,reduced))) | satisfy(here_model, program((1, reduced))).
satisfy(here_model, program((2, reduced))) | -satisfy(here_model, program((2, reduced))).

% satisfy(here_model, program((2, reduced))) :- satisfy(here_model, program((1, reduced))).
% -satisfy(here_model, program((2, reduced))) :- -satisfy(here_model, program((1, reduced))).