local function init(env)
  env.notifier = env.engine.context.option_update_notifier:connect(
    function(ctx, name)
      if name == "ascii_mode" then
        local ascii = ctx:get_option("ascii_mode")
        ctx:set_option("full_shape", not ascii)
      end
    end
  )
end

local function fini(env)
  if env.notifier then
    env.notifier:disconnect()
  end
end

return {
  init = init,
  fini = fini
}
