return {
  "mfussenegger/nvim-ansible",
  ft = {},
  keys = {
    {
      "<leader>ta",
      function()
        require("ansible").run()
      end,
      desc = "Ansible Run Playbook/Role",
      silent = true,
    },
  },
}
