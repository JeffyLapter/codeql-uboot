import cpp
from FunctionCall call//, Function f
/*
where
    call.getTarget() = f and
    f.getName() = "memcpy"
select call
*/
where
    call.getTarget().getName() = "memcpy"
select call