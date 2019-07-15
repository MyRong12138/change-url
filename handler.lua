local BasePlugin = require "kong.plugins.base_plugin"
local ChangeUrl = BasePlugin:extend()
local kong = kong

ChangeUrl.PRIORITY = 800
ChangeUrl.VERSION="0.1.0"

function ChangeUrl:new()
  ChangeUrl.super.new(self, "change-url")
end

function segmentationString(str,mstring)
  if type(str)~="nil" then
    local index=string.find(mstring,str,1,true)
    if type(index)~="nil" then
       return string.sub(mstring,(index+string.len(str)))
    else
       return mstring
    end
  else
    return mstring
  end
end


function ChangeUrl:access(conf)
  ChangeUrl.super.access(self)
  local request_uri = segmentationString(conf.ignore_addr,ngx.var.request_uri)
  local upstream_uri = ngx.var.upstream_uri
  local uri=upstream_uri..request_uri
  ngx.var.upstream_uri=uri
end

return ChangeUrl
