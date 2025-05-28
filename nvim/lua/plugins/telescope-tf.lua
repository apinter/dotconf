return {
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
}
