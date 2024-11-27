if true then
  return {}
end
return {
  "ThePrimeagen/git-worktree.nvim",
  event = "VeryLazy",
  opts = {
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "e .",
    clearjumps_on_change = true,
    autopush = false
  },
  init = function()
    require("telescope").load_extension("git_worktree")
    vim.keymap.set("n", "<leader>wt", function()
        require("telescope").extensions.git_worktree.git_worktrees()
      end,
      { desc = "Worktree fuzzy finder" }
    )
  end,
}
