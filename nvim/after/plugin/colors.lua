function ColorMyPencils(color)
    vim.opt.termguicolors = true

    -- color = color or "gruvbox"
    -- color = color or "rose-pine"
    -- color = color or "melange"
    -- color = color or "ayu"
    color = color or "github_dark"

    vim.cmd.colorscheme(color)

    local barcolor = "#393840"
    local barcolor = "#303446"
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = barcolor })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = barcolor, fg = "#565678" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = barcolor })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = barcolor, bold = true })
    vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })

    vim.api.nvim_set_hl(0, "VertSplit", { fg = barcolor })

end

ColorMyPencils()
