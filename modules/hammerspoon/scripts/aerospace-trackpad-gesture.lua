-- Ref: https://github.com/nikitabobko/AeroSpace/issues/448#issuecomment-2317761083

-- https://github.com/mogenson/Swipe.spoon
--
--
--


--
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--   hs.alert.show("Hello Lua!")
-- end)
--
-- Swipe = hs.loadSpoon("Swipe")
-- function aerospaceExec(cmd)
--   os.execute("nohup " .. AEROSPACE .. " " .. cmd .. " &")
-- end
--
-- -- use four finger swipe to switch workspace
-- local current_id, threshold
-- Swipe:start(4, function(direction, distance, id)
--   if id == current_id then
--     if distance > threshold then
--       threshold = math.huge -- only trigger once per swipe
--       if direction == "left" then
--         aerospaceExec("workspace --wrap-around prev")
--       elseif direction == "right" then
--         aerospaceExec("workspace --wrap-around next")
--       end
--     end
--   else
--     current_id = id
--     threshold = 0.1 -- swipe distance > 10% of trackpad
--   end
-- end)

Swipe = hs.loadSpoon("Swipe")

local config = {
  fingers = 3,
  -- 0.1 = swipe distance > 10% of trackpad
  threshold = 0.08,
  showAlert = true,
  alertDuration = 0.3
}

local AEROSPACE = "/run/current-system/sw/bin/aerospace"
function aerospaceExec(cmd)
  local command = string.format('%s list-workspaces --monitor mouse --visible | xargs %s workspace && %s workspace %s', AEROSPACE, AEROSPACE, AEROSPACE, cmd)

  hs.execute(command)
  
  if config.showAlert then
    hs.alert.show("AeroSpace: " .. cmd, config.alertDuration)
  end
end

local current_id, threshold
-- use 4-fingers swipe to switch workspace
Swipe:start(config.fingers, function(direction, distance, id)
  if id == current_id then
    if distance > threshold then
      -- only trigger once per swipe
      threshold = math.huge
      if direction == "left" then
hs.alert.show("Hello World!")
        -- aerospaceExec("next")
      elseif direction == "right" then 
        aerospaceExec("prev")
      end
    end
  else
    current_id = id
    threshold = config.threshold
  end
end)
