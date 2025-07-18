-- init.lua:
return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    specs = {
      {
        "ANGkeith/telescope-terraform-doc.nvim",
        ft = { "terraform", "hcl" },
        config = function()
          require("telescope").load_extension("terraform_doc")
        end,
      },
      {
        "cappyzawa/telescope-terraform.nvim",
        ft = { "terraform", "hcl" },
        config = function()
          require("telescope").load_extension("terraform")
        end,
      },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "%.git/" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden"
        },
        find_command = { 'rg', '--hidden', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '-g', '!{.git,.svn,.hg}' }
      }
    }
  }
}
