local wezterm = require("wezterm")
local unixDomains = require("unixDomains")
local mux = wezterm.mux
local act = wezterm.action

local tabline = require("mytabline")
local font_size_bias = 0
local prog = {}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	prog = { "pwsh.exe", "-NoLog" }
	Window_decorations = "TITLE|RESIZE"
  font_size_bias = -4
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	prog = { "zsh", "-l" }
	Window_decorations = "TITLE|RESIZE"
  font_size_bias = 0
else
	prog = { "zsh", "-l" }
	-- Window_decorations = "TITLE|RESIZE"
	-- Window_decorations = "MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
	Window_decorations = "INTEGRATED_BUTTONS|RESIZE"
  font_size_bias = 0
end

local mouse_bindings = {
	-- 右键粘贴
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act({ PasteFrom = "Clipboard" }),
	},
	-- 选中时复制到剪贴板
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act({ CompleteSelection = "ClipboardAndPrimarySelection" }),
	},
	-- 双击选中时自动复制到剪贴板
	{
		event = { Up = { streak = 2, button = "Left" } },
		mods = "NONE",
		action = act({ CompleteSelection = "ClipboardAndPrimarySelection" }),
	},
	-- CTRL-Click打开超链接
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = "OpenLinkAtMouseCursor",
	},
}
wezterm.on('gui-startup', function(cmd)
  local args = {}
  local cwd = ''
  local screen = wezterm.gui.screens().active
  local main = wezterm.gui.screens().main
  local ratio_x = 0.1 -- 距离左上角10%
  local ratio_y = 0.1 -- 距离左上角10%
  -- wezterm.gui.screens()的所有数值基于主屏幕的最左下角, 主屏幕的左下角的坐标是(0,0)
  -- 当前屏幕的左下角的坐标screen.x, screen.y
  -- 当前屏幕的左上角的坐标(sx,sy) = (screen.x,screen.y+screen.height)
  -- 主屏幕的左上角坐标(mx,my) = (0,main.height)
  -- window:gui_window():set_position(x,y)基于主屏幕左上角，将窗口的左上角向右下方调整(x,y)个像素
  -- 注意：spawn_window{position}的效果很神秘，尽量不要用。
  -- 窗口的左上角坐标(wx,wy) = (mx,my)+(x,-y) = (x, main.height-y)
  -- 我们希望当前窗口在当前屏幕居中
  -- 即当前屏幕的左上角(sx,sy) - 窗口的左上角(wx,xy) = (-ratio_x*screen.width, ratio_y*screen.height)
  -- 有如下关系：
  -- screen.x - x = -ratio_x * screen.width
  -- screen.y+screen.height - main.height + y = ratio_y*screen.height
  -- 即：
  local x = ratio_x * screen.width + screen.x
  local y = (ratio_y-1) * screen.height - screen.y + main.height

  if cmd then
    args = cmd.args or {}
    cwd = cmd.cwd or '~'

		local remote_name = ''

    if args[1] == 'core01' then
    	remote_name = 'core01'
    	args = {}
    elseif args[1] == 'core02' then
    	remote_name = 'core02'
    	args = {}
  	end

		-- 无论如何都先启动一个本地workspace
  	local _,_,window = mux.spawn_window{
  		args = args,
  		cwd = cwd,
  		workspace = '本地'
  	}
  	window:gui_window():set_position(x,y)
  	window:gui_window():set_inner_size(screen.width*(1-2*ratio_x), screen.height*(1-2*ratio_y))

		if remote_name ~= '' then
			local space_name = '远程-' .. remote_name
			-- 远程的workspace打开两个tab
  		local tab1,_,window2 = mux.spawn_window{
  			workspace = space_name,
  			args = {'/opt/homebrew/bin/tssh', remote_name}
  		}
  		window2:spawn_tab{args = {'/opt/homebrew/bin/tssh', remote_name}}
  		tab1:activate()
  		mux.set_active_workspace(space_name)
  	end
  else
  	local _,_,window = mux.spawn_window{
  		workspace = '本地'
  	}
  	window:gui_window():set_position(x,y)
  	window:gui_window():set_inner_size(screen.width*(1-2*ratio_x), screen.height*(1-2*ratio_y))
  end

end)

local config = wezterm.config_builder()
tabline.setup({
	options = {
		component_separators = { left = wezterm.nerdfonts.md_drag_vertical, right = wezterm.nerdfonts.indent_line },
		section_separators = { left = wezterm.nerdfonts.ple_flame_thick, right = wezterm.nerdfonts.ple_flame_thick_mirrored },
		tab_separators = { left = wezterm.nerdfonts.ple_ice_waveform, right = wezterm.nerdfonts.ple_ice_waveform_mirrored },
	},
	sections = {
    tabline_a = { 'workspace' },
    tabline_b = '',
    tabline_c = '',
    tab_active = {
    	{ 'zoomed', padding = 0 },
    	{ 'index', padding = 0 },
      wezterm.nerdfonts.indent_line,
    	{ 'host', max_length = 20, padding = 0 },
      wezterm.nerdfonts.indent_line,
    	{ 'output', padding = {left = 0, right = 0} },
    },
    tab_inactive = {
    	{ 'zoomed', padding = 0 },
    	{ 'index', padding = 0 },
      wezterm.nerdfonts.indent_line,
    	{ 'host', max_length = 20, padding = 0 },
      wezterm.nerdfonts.indent_line,
    	{ 'output', padding = {left = 0, right = 0} },
    },
    tabline_x = { 'cpu', 'ram'},
    tabline_y = { 'battery' },
    tabline_z = { {'datetime', style = '%H:%M:%S',} },
	},
})
tabline.set_theme('Sonokai (Gogh)', {
	normal_mode = {
	  z = { fg = '#000000', bg = '#94e59a' },
	  y = { fg = '#000000', bg = '#ffaf7f' },
	  x = { fg = '#ffffff', bg = '#333333' },
	},
	tab = {
		active   = { fg = '#000000', bg = '#bd93f9' },
		inactive = { fg = '#ffffff', bg = '#333333'},
    inactive_hover = { fg = '#f5c2e7', bg = '#313244' },
	}
})

tabline.apply_to_config(config)

-- config.use_fancy_tab_bar = true
config.window_decorations = Window_decorations
config.show_new_tab_button_in_tab_bar = true
config.mouse_bindings = mouse_bindings
config.unix_domains = unixDomains
config.default_prog = prog
config.window_decorations = Window_decorations
config.keys = {
	{ key = "W", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "Q", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "|", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "H", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "L", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "K", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "J", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "Z", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },
	{ key = "_", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "D", mods = "CTRL|SHIFT", action = act.DetachDomain("CurrentPaneDomain") },
	{ key = 'j', mods = 'CMD|SHIFT',  action = act.SwitchWorkspaceRelative(1) },
  { key = 'k', mods = 'CMD|SHIFT',  action = act.SwitchWorkspaceRelative(-1) },
  { key = 'n', mods = 'CMD|SHIFT',  action = act.SwitchWorkspaceRelative(-1) },
  -- Promt a new window to create a new 'workspace'
  { key = 'N', mods = 'CMD|SHIFT',  action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action( act.SwitchToWorkspace { name = line, }, pane)
        end
      end),
    },
  },
}
-- 禁止bell声音, 闪烁bell
config.visual_bell = {
	fade_in_duration_ms = 75,
	fade_out_duration_ms = 75,
	target = "CursorColor",
}
config.audible_bell = "Disabled"
config.window_background_opacity = 1
config.macos_window_background_blur = 0
config.win32_system_backdrop = 'Acrylic'
config.text_background_opacity = 1.0
config.window_close_confirmation = "NeverPrompt"

-- ===== Performance =====
config.enable_scroll_bar = false
config.front_end = 'OpenGL'
config.webgpu_power_preference = 'HighPerformance'
config.animation_fps = 60
config.max_fps = 60

config.font_size = 18 + font_size_bias
config.font = wezterm.font_with_fallback({ "MesloLGS Nerd Font Mono", "手札体-简" })

config.check_for_updates = true
config.tab_bar_at_bottom = true
config.color_scheme = "Sonokai (Gogh)"
config.cursor_thickness = '1.5pt'
config.default_cursor_style = 'SteadyUnderline'
config.enable_scroll_bar = false
config.window_frame = {
  border_left_width    = '0.0cell',
  border_right_width   = '0.0cell',
  border_bottom_height = '0.0cell',
  border_top_height    = '0.0cell',
  border_left_color    = '#333333',
  border_right_color   = '#333333',
  border_bottom_color  = '#333333',
  border_top_color     = '#333333',
  -- Not working for non-fancy tab style.
  font = wezterm.font 'MesloLGS Nerd Font Mono',
  font_size = 16,
}
config.colors = {
  foreground = '#edecee',
  background = '#15141b',
	cursor_bg = "#f8f8f2",
  cursor_fg = "#000000",
  cursor_border = "#000000",
  selection_fg = '#000000',
  selection_bg = '#fffacd',
  scrollbar_thumb = "#44475a",
  split = '#FFB86C',
  compose_cursor = "#FFB86C",
}
config.window_padding = {
  left = '10px',
  right = '10px',
  top = '55px',
  bottom = '0px',
}
return config
