return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  cond = os.getenv("TMUX") ~= nil,
}
