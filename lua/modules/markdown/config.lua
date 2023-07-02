local M = {}
M.headlines = function()
  require('headlines').setup({
    markdown = {
      headline_highlights = {"DiagnosticVirtualTextInfo", "DiagnosticVirtualTextHint" },
      codeblock_highlight = "CodeBlock",
      dash_highlight = "Dash",
      dash_string = "-",
      quote_highlight = "Quote",
      quote_string = "┃",
      fat_headlines = true,
      fat_headline_upper_string = "▃",
      fat_headline_lower_string = "🬂",
    },
  })
end

return M;
