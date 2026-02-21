local host = ''

return {
  default_opts = { max_length = 10 },
  update = function(tab, opts)
    local cwd_uri = tab.active_pane.current_working_dir
    if cwd_uri then
      host = cwd_uri.host
      if host and #host > opts.max_length then
        host = host:sub(1, opts.max_length - 1) .. '…'
      end
    end
    if host == 'aemolcore01' then
      host = 'core01'
    end
    if host == 'master' then
      host = 'core02'
    end
    if host == 'jwfeng-mbp' then
      host = 'MacBook-Pro'
    end
    if host == 'jwfeng-mac' then
      host = 'Mac-Mini'
    end
    if host == 'sw_hpc_60.qd.sw' then
      host = 'sw_hpc_60'
    end
    return host or require('wezterm').hostname()
  end,
}
