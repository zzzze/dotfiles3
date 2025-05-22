return {
  "folke/ts-comments.nvim",
  event = "VeryLazy",
  opts = {
    lang = {
      javascript = {
        "// %s", -- default commentstring when no treesitter node matches
        "/* %s */",
        call_expression = "// %s", -- specific commentstring for call_expression
        jsx_attribute = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        spread_element = "// %s",
        statement_block = "// %s",
      },
      tsx = {
        "// %s", -- default commentstring when no treesitter node matches
        "/* %s */",
        call_expression = "// %s", -- specific commentstring for call_expression
        jsx_attribute = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        spread_element = "// %s",
        statement_block = "// %s",
      },
    },
  },
}
