vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "0"
vim.bo.commentstring = "; %s"
local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.add_rule(Rule("$","$","ncl"))
npairs.add_rule(Rule("(/","/","ncl"))
