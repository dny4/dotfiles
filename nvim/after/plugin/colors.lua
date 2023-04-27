function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

    local barcolor = "#393840"
	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
    vim.api.nvim_set_hl(0, "SignColumn", {bg = "none"})
    vim.api.nvim_set_hl(0, "StatusLine", {bg =barcolor})
    vim.api.nvim_set_hl(0, "StatusLineNC", {bg =barcolor, fg="#565678"})
    vim.api.nvim_set_hl(0, "CursorLine", {bg =barcolor})
    vim.api.nvim_set_hl(0, "ColorColumn", {bg =barcolor, bold=true})
    vim.api.nvim_set_hl(0, "MsgArea", {bg="none"})

end

ColorMyPencils()
