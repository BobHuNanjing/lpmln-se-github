rule(1..3).
%set(x). 

{reduced_rule(R) : rule(R)}.

%program(1). 
%has_rule(1, 1..3).

% satisfy(x, head(1)).
% -satisfy(x, negative_body(1)).
% -satisfy(x, rule(2)).
% -satisfy(x, program(1)).

% -satisfy(x, program(1)).

%#show satisfy/2.
%#show -satisfy/2.
%#show unknown_satisfy/2.
