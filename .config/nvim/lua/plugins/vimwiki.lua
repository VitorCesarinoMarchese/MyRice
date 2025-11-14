return {
  {
    "vimwiki/vimwiki",
    keys = {
      { "<leader>W", desc = "vimwiki" },
      { "<leader>W<leader>", desc = "diary" },
      { "<leader>WW", "<cmd>VimwikiIndex<cr>", desc = "Vimwiki Index" },
      { "<leader>WI", "<cmd>VimwikiDiaryIndex<cr>", desc = "Vimwiki Diary" },
      { "<leader>W<leader>I", "<cmd>VimwikiDiaryGenerateLinks<cr>", desc = "Vimwiki Diary Generate Link" },
      { "<leader>W<leader>W", "<cmd>VimwikiMakeDiaryNote<cr>", desc = "New Diary Note" },
    },
    ft = { "markdown", "vimwiki" },
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          syntax = "markdown",
          ext = ".gpg",
        },
      }
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_markdown_link_ext = 1
    end,
  },
}
