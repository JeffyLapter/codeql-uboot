
import cpp
from Macro f
//where f.getName() = "ntohl" or f.getName() = "ntohll" or f.getName() = "ntohs"
where f.getName() in ["ntohl", "ntohll", "ntohs"]
//where f.getName().regexpMatch(".*ntoh.*")
select f,"ntohl,ntohll,ntohs"
//select "12a3a333"