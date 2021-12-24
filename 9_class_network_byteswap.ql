
import cpp
class NetworkByteSwap extends Expr {
    NetworkByteSwap () {
      // TODO: replace <class> and <var>
      exists(MacroInvocation maci |
        maci.getMacro().getName().regexpMatch("ntoh(s|l|ll)")
      )
    }
  }
  
  from NetworkByteSwap n
  select n, "Network byte swap"