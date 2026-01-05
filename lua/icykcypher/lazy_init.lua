local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- твои плагины
        { "williamboman/mason.nvim", config = function()
            require("mason").setup({
                PATH = "prepend",
            })
        end },
        { "williamboman/mason-lspconfig.nvim", config = function()
            require("mason-lspconfig").setup()
        end },
        { import = "icykcypher.lazy" }, -- остальные плагины из твоей конфигурации
    },
    change_detection = { notify = false },
})

