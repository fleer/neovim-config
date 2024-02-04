-- Dead simple plugin to center the currently focused buffer to the middle of the screen.
return {
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    cmd = { "NoNeckPain" },
    opts = {
      width = 100,
      buffers = {
        wo = {
          fillchars = "eob: ",
        },
      },
    },
  },
}
