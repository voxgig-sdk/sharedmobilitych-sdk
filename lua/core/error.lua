-- Sharedmobilitych SDK error

local SharedmobilitychError = {}
SharedmobilitychError.__index = SharedmobilitychError


function SharedmobilitychError.new(code, msg, ctx)
  local self = setmetatable({}, SharedmobilitychError)
  self.is_sdk_error = true
  self.sdk = "Sharedmobilitych"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function SharedmobilitychError:error()
  return self.msg
end


function SharedmobilitychError:__tostring()
  return self.msg
end


return SharedmobilitychError
