import cpp
from MacroInvocation maci
where maci.getMacro().getName().regexpMatch("ntoh(s|l|ll)")
select maci
//搜索宏定义的调用
