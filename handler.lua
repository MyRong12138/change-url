local BasePlugin = require "kong.plugins.base_plugin"
local ChangeUrl = BasePlugin:extend()
local kong = kong

ChangeUrl.PRIORITY = 800
ChangeUrl.VERSION="0.1.0"

function ChangeUrl:new()
  ChangeUrl.super.new(self, "change-url")
end

function ChangeUrl:access(conf)
  ChangeUrl.super.access(self)
  local request_uri = ngx.var.request_uri
  local upstream_uri = ngx.var.upstream_uri
  local url=upstream_uri..request_uri
  ngx.var.upstream_uri=url
  --return kong.response.exit(401, { message = "路径为："..tostring(ngx.var.upstream_uri)})
end

return ChangeUrl
