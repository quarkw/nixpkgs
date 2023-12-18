local wezterm = require 'wezterm'
local io = require 'io'
local os = require 'os'
local act = wezterm.action

-- wezterm.background_child_process()

wezterm.on('quarkw-edit-config', function(window, pane)
  local home = os.getenv("HOME")
  window:perform_action(
    act.SpawnCommandInNewTab {
      args = { '/usr/bin/vim', '-c', 'autocmd VimLeave * !exit', home .. "/.config/wezterm/wezterm.lua" },
    },
    pane
  )
  window:active_tab():set_title('WezTerm Preferences')
end)

wezterm.on('trigger-vim-with-visible-text', function(window, pane)
  -- Retrieve the current viewport's text.
  --
  -- Note: You could also pass an optional number of lines (eg: 2000) to
  -- retrieve that number of lines starting from the bottom of the viewport.
  local dimensions = pane:get_dimensions()
  local cursorPosition = pane:get_cursor_position()
  local viewport_text = pane:get_logical_lines_as_text(dimensions.scrollback_rows)

  -- Create a temporary file to pass to vim
  local name = os.tmpname()
  local f = io.open(name, 'w+')
  f:write(viewport_text)
  f:flush()
  f:close()

  -- Open a new window running vim and tell it to open the file
  window:perform_action(
    act.SpawnCommandInNewTab {
      -- args = { '/opt/homebrew/bin/vimpager', name, '-N', dimensions.scrollback_rows },
      args = { '/opt/homebrew/bin/nvim', '-R', name, '-c',
        'normal ' .. dimensions.scrollback_rows .. 'G' .. cursorPosition.x .. ' zb' .. '/' },
    },
    pane
  )

  -- Wait "enough" time for vim to read the file before we remove it.
  -- The window creation and process spawn are asynchronous wrt. running
  -- this script and are not awaitable, so we just pick a number.
  --
  -- Note: We don't strictly need to remove this file, but it is nice
  -- to avoid cluttering up the temporary directory.
  wezterm.sleep_ms(1000)
  os.remove(name)
end)

return {
  front_end = "WebGpu",
  window_background_opacity = 0.8,
  keys = {
    {
      key = 'e',
      mods = 'CTRL',
      action = act.EmitEvent 'trigger-vim-with-visible-text',
    },
    {
      key = ',',
      mods = 'CMD',
      action = act.EmitEvent 'quarkw-edit-config',
    },
  },
}
