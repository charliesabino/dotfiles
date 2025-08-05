return {
  dir = "/Users/charliesabino/Dev/backseat.nvim",
  config = function()
    require("backseat").setup({
      anthropic_api_key = vim.env.ANTHROPIC_API_KEY,
      gemini_api_key = vim.env.GEMINI_API_KEY,
      analysis_interval = 15,
      model = "gemini-2.5-flash-lite",
    })
  end,
}
