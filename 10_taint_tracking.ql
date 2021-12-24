
/**
 * @kind path-problem
 */

 //the annotation above could allow the codeql translate the result
 // to "sink path to the code" and show it in ur ide
import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr {
    NetworkByteSwap () {
      // TODO: replace <class> and <var>
      exists(MacroInvocation maci |
        maci.getMacro().getName().regexpMatch("ntoh(s|l|ll)") and 
        this=maci.getExpr()
      )
    }
  }

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  override predicate isSource(DataFlow::Node source) {
    // TODO
    source.asExpr() instanceof NetworkByteSwap
  }
  override predicate isSink(DataFlow::Node sink) {
    // TODO
    exists(FunctionCall fc | 
        fc.getTarget().getName()= "memcpy" and
        sink.asExpr()=fc.getArgument(2) and 
        not fc.getArgument(1).isConstant()
        )
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"