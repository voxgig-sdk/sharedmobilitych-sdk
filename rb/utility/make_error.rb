# Sharedmobilitych SDK utility: make_error
require_relative '../core/operation'
require_relative '../core/result'
require_relative '../core/error'
module SharedmobilitychUtilities
  MakeError = ->(ctx, err) {
    if ctx.nil?
      require_relative '../core/context'
      ctx = SharedmobilitychContext.new({}, nil)
    end
    op = ctx.op || SharedmobilitychOperation.new({})
    opname = op.name
    opname = "unknown operation" if opname.empty? || opname == "_"

    result = ctx.result || SharedmobilitychResult.new({})
    result.ok = false

    err = result.err if err.nil?
    err = ctx.make_error("unknown", "unknown error") if err.nil?

    errmsg = err.is_a?(SharedmobilitychError) ? err.msg : err.to_s
    msg = "SharedmobilitychSDK: #{opname}: #{errmsg}"
    msg = ctx.utility.clean.call(ctx, msg)

    result.err = nil
    spec = ctx.spec

    if ctx.ctrl.explain
      ctx.ctrl.explain["err"] = { "message" => msg }
    end

    sdk_err = SharedmobilitychError.new("", msg, ctx)
    sdk_err.result = ctx.utility.clean.call(ctx, result)
    sdk_err.spec = ctx.utility.clean.call(ctx, spec)
    sdk_err.code = err.code if err.is_a?(SharedmobilitychError)

    ctx.ctrl.err = sdk_err

    if ctx.ctrl.throw_err == false
      return result.resdata, nil
    end
    return nil, sdk_err
  }
end
