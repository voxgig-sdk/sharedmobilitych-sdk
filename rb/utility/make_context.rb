# Sharedmobilitych SDK utility: make_context
require_relative '../core/context'
module SharedmobilitychUtilities
  MakeContext = ->(ctxmap, basectx) {
    SharedmobilitychContext.new(ctxmap, basectx)
  }
end
