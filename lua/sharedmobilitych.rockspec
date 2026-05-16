package = "voxgig-sdk-sharedmobilitych"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/sharedmobilitych-sdk.git"
}
description = {
  summary = "Sharedmobilitych SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["sharedmobilitych_sdk"] = "sharedmobilitych_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
