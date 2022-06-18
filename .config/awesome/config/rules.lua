local awful     = require("awful")
local beautiful = require("beautiful")
local clientkeys = require('config.keys.client')
local clientbuttons = require('config.buttons.client')

local rules = {

    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus        = awful.client.focus.filter,
            raise        = true,
            keys         = clientkeys,
            buttons      = clientbuttons,
            screen       = awful.screen.preferred,
            placement    = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },

    {
        rule_any  = {
            instance = {
                "DTA",  -- Firefox addon DownThemAll.
                "copyq",  -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",  -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
                "SimpleScreenRecorder",
                "flameshot",
                "Nitrogen",
                "Pavucontrol",
                "Qalculate-gtk",
                "File-roller",
                "zoom",
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester",  -- xev.
                "Emulator",
                "win0",
            },
            role = {
                "AlarmWindow",  -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = {
            floating = true
        },
        callback = function (c)
            awful.placement.centered(c,nil)
        end
    },

    {
        rule_any = {
            class = {
                "mpv",
                "vlc"
            }
        },
        properties = {
            fullscreen = true
        }
    }

}

return rules
