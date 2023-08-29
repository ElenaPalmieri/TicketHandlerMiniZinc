% During a work shift that lasts 8 hours, the ticket handlers have to solve as many ticket as possible in order to help their colleagues.
% Every ticket has a priority and takes a known number of hours to be solved.
% The ticket that have a higher priority should be solved first if they do not take too long.
% In the case where, for example, there are still 2 hours of work left, but the only high priority ticket takes 4 hours to solve, lower priority tickets can be handled insetad.

% Including the global constraints
include "globals.mzn";

% Including the data
include "ticket_data.dzn";


% The variables are the cells of an matrix whose width is the number of tasks and whose hights is the number of agents. If the cell has value 1 it means that the ticket will be solved by that agent today.
array[1..N, 1..M] of var 0..1: X;

% The sum of the time taken to handle the tickets should not exceed the 8 hours for any of the agents.
constraint forall(i in 1..N)(sum([X[i,j]*TT[j] | j in 1..M]) <= 8);

% If a ticket is handled by one agent, it should not be handled by others.
constraint forall(j in 1..M)(sum([X[i,j] | i in 1..N]) <= 1);

% The workload should be balanced among the agents.
% Introducing a new variable K that represents the number of hours that each ticket handler actually works during the day
var 0..8: K;
% All the agents should work the same number of hours
constraint forall(i in 1..N)(sum([X[i,j]*TT[j] | j in 1..M]) = K);

% Alternative balancing method, balancing the number of tickets handled by each agent
% % The number of tickets handled should be balanced among the agents.
% % Introducing a new variable K that can assume any integer value in the interval going from 0 to the result of the division of the number of tasks by the number of agents
% var 0..(M div N): K;
% % All the agents should have the same number of tickets K to handle
% constraint forall(i in 1..N)(sum([X[i,j] | j in 1..M]) = K);

% The solution should maximize the number of tickets solved during the day, based on their priority.
solve maximize sum([X[i,j]*PT[j] | i in 1..N, j in 1..M]);
