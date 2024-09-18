return {
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("competitest").setup {
        compile_command = {
          cpp = { exec = "g++", args = { "-std=c++20", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
        },
      }
    end,
  },
}
