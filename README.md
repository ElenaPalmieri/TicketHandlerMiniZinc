# TicketHandlerMiniZinc
MiniZinc project for the PhD course "Combinatorial Decision Making and Optimization"

A ticket is a "call for help" that workers send to a specific office when they have a problem. In the ticket they describe their issue so that the ticket handlers can solve it.
During a work shift that lasts 8 hours, the ticket handlers have to solve as many ticket as possible in order to help their colleagues.
Every ticket has a priority and takes a known number of hours to be solved.
The ticket that have a higher priority should be solved first if they do not take too long.
In the case where, for example, there are still 2 hours of work left, but the only high priority ticket takes 4 hours to solve, lower priority tickets can be handled insetad.
