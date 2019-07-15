local typedefs = require "kong.db.schema.typedefs"

return {
  name = "change-url",
  fields = {
    { consumer=typedefs.no_consumer },
    { config = {
        type = "record",
        fields = {
          { ignore_addr = { type = "string",required = false, }, },
    }, }, },
  },
}
