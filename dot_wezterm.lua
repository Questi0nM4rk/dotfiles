local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Color scheme
config.color_scheme = 'Shades of Purple (base16)'

-- Font configuration
config.font = wezterm.font('Hack Nerd Font Mono')
config.font_size = 12.0

-- Window configuration
config.window_background_opacity = 0.90
config.window_decorations = "TITLE | RESIZE"  -- Allow dragging and resizing
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Remove tab bar
config.enable_tab_bar = false

-- Use zsh as default shell
config.default_prog = { '/bin/zsh' }

-- Custom startup screen
config.initial_rows = 34
config.initial_cols = 90

-- Cursor style
config.default_cursor_style = 'BlinkingUnderline'

-- Enable ligatures
config.harfbuzz_features = { 'calt', 'clig', 'liga' }

-- Scrollback
config.scrollback_lines = 10000

-- Bell
config.audible_bell = "Disabled"

-- Custom tab bar (hidden by default, but can be toggled)
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Custom right status
config.status_update_interval = 1000

-- Background image (uncomment and adjust path if desired)
-- config.background = {
--   {
--     source = { File = os.getenv("HOME") .. "/path/to/your/image.png" },
--     opacity = 0.2,
--     hsb = { brightness = 0.8 },
--   },
-- }

-- Window close confirmation
config.window_close_confirmation = 'AlwaysPrompt'

-- URL launcher
config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
  regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
  format = 'https://github.com/$1/$3',
})

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}

return config
