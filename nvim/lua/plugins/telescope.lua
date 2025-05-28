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

  }
}
