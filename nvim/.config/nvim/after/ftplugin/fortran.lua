-- formatexpr会覆盖掉formatprg选项，所以需要把formatexpr置为空值，
-- 但是lsp会自动把formatexpr设置为lsp，
-- 所以还需修改lvim.lsp.buffer_options={formatexpr = ""}
vim.opt.formatprg = "fprettify --silent"
vim.opt.formatexpr = ""
-- lvim.lsp.buffer_options={formatexpr = ""}
vim.opt.tabstop=3
vim.opt.shiftwidth=3
vim.g.fortran_free_source=1      -- 无法生效，需要添加到config.lua中
vim.keymap.set("v", "=", "gq")   -- 多行使用fprettify
vim.keymap.set("n", "==", "vgq") -- 单行使用fprettify

-- set a formatter, this will override the language server formatting capabilities (if it exists)
-- 但是不能只format选中的行，所以还是使用formatprg实现
--
-- local formatters = require("")
-- formatters.setup {
--   { command = "fprettify" },
-- }
