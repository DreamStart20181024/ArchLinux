--[[

    标签模块

--]]

local awful = require("awful");

local _M = {};

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

    tags = {};

    awful.screen.connect_for_each_screen(function(s)
        tags[s] = awful.tag(
          -- RC.layouts[1] 调用的是布局模块中的数组。
            {"壹", "贰", "叁", "肆", "伍", "陆", "柒"},s,RC.layouts[1]
            )
     end)

  return tags;
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
  {},
  { __call = function(_, ...) return _M.get(...) end }
)
