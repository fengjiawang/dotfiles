return{
	{
		name = 'core01',
  	local_echo_threshold_ms = 10,
  	proxy_command = { "ssh", "-T", "core01", "wezterm", "cli", "proxy" },
	},
	{
		name = 'core02',
  	local_echo_threshold_ms = 10,
  	proxy_command = { "ssh", "-T", "core02", "wezterm", "cli", "proxy" },
	},
	{
		name = 'office',
  	local_echo_threshold_ms = 10,
  	proxy_command = { "ssh", "-T", "office", "wezterm", "cli", "proxy" },
	},

}
