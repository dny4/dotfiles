-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- some color override
require("notify").setup({
  background_colour = "#3a3a3a",
})

function ColorMyPencils()
  vim.opt.termguicolors = true

  local barcolor = "#1e1e2e"
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })

  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = barcolor })

  vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#3a3a3a", bold = false })
  vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })

  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = barcolor })

  vim.api.nvim_set_hl(0, "VertSplit", { fg = barcolor })

  vim.api.nvim_set_option_value("colorcolumn", "80", {})

  -- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = barcolor, fg = "#565678" })
end

ColorMyPencils()
