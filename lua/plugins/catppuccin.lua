return { 
    "catppuccin/nvim", 
    name = "catppuccin-mocha", 
    priority = 1000 , 
    config = function() 
        vim.cmd.colorscheme "catppuccin-mocha" 
    end 
}

return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  }
}
