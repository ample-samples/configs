# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import pwd

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook
import subprocess

# Startup hook


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])


def get_username():
    return pwd.getpwuid(os.getuid())[0]


uname = get_username()


# pywal
colors = []
cache = '/home/{}/.cache/wal/colors'.format(uname)


def load_colors(cache):
    with open(cache, 'r') as file:
        for i in range(8):
            colors.append(file.readline().strip())
    colors.append('#ffffff')
    lazy.reload()


load_colors(cache)

# foreground = colors[7]
foreground = '#ebdbb2'
background = colors[0]

mod = "mod4"
terminal = guess_terminal()

keys = [
    # programs
    Key([mod], "w", lazy.spawn("vivaldi-stable"), desc="launches browser"),
    Key([mod], "r", lazy.spawn("alacritty -e ranger"), desc="launches ranger"),
    # volume keys
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "amixer -c 0 sset Master 1- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "amixer -c 0 sset Master 1+ unmute")),
    # screenshot
    Key([], "Print", lazy.spawn('scrot ss/telatiro-"$%y%m%d-%H%M-%S.png"')),
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "d", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc="Toggle the focused window between floating and stacked states"),
    # Custom keybinds
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([mod, "control"], "o", lazy.spawn('obsidian')),
    Key([mod], "e", lazy.spawn('alacritty -e nvim')),
    # Key([mod, "shift"], "e", lazy.spawn('exo-open /usr/share/applications/neovide.desktop')),
    Key([mod], "b", lazy.hide_show_bar(position="top")),
    Key([mod, "shift"], "s", lazy.spawn('flameshot gui')),
    # Key([mod, "shift"], "е", lazy.spawn('setxkbmap -layout gb')),
    # Key([mod, "shift"], "r", lazy.spawn('setxkbmap -layout ru -variant phonetic')),


]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

UNIVERSAL_MARGINS = 5
UM = UNIVERSAL_MARGINS

layouts = [
    layout.Columns(
        margin=UM,
        border_width=4,
        border_focus=foreground,
        border_normal='#282828',
        # corner_radius=16
        ),
    # layout.MonadTall(margin=5, border_width=2, border_focus=foreground, border_normal=background),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(margin=5, border_width=2, border_focus=foreground, border_normal=background),
    # layout.Matrix(),
    # layout.MonadTall(margin=5, border_width=2, border_focus=foreground, border_normal=background),
    # layout.MonadWide(margin=5, border_width=2, border_focus=foreground, border_normal=background),
    # layout.RatioTile(),
    # layout.Tile(margin=5, border_width=2, border_focus=foreground, border_normal=background),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    layout.Floating(
        border_width=4, border_focus=colors[1], border_normal=colors[0]),
]

widget_defaults = dict(
    font="DroidSansMono Nerd Font",
    fontsize=14,
    padding=3,
    foreground=foreground,

)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayoutIcon(
                #     custom_icon_paths = [
                #         os.path.expanduser("~/.config/qtile/icons")
                #         ]
                #     ),
                # widget.CurrentLayout(),
                # widget.Prompt(
                #     font="DroidSansMono Nerd Font",
                #     cursor_color=foreground
                # ),
                widget.GroupBox(
                    rounded=False,
                    hide_unused=True,
                    inactive=foreground,
                    active=foreground,
                    highlight_method="text",
                    urgent_border=colors[1],
                    this_current_screen_border=colors[5],
                ),
                widget.WindowName(max_chars=60, format='{name}'),
                widget.TextBox(text=" "),
                # widget.TextBox(text=""),
                # widget.TextBox(text=" "),
                widget.Battery(
                    charge_char=' ',
                    discharge_char=' ',
                    full_char=' ',
                    format='{char} {percent:2.0%} {hour:d}:{min:02d}',
                    low_foreground=colors[1],
                    show_short_text=False
                ),
                widget.TextBox(text=" "),
                widget.TextBox(text=" "),
                widget.TextBox(text=" "),
                # widget.TextBox(text=" "),
                widget.TextBox(text=" "),
                widget.Volume(),
                widget.TextBox(text=" "),
                widget.TextBox(text=" "),
                widget.Wlan(interface="wlp3s0"),
                widget.TextBox(text=" "),
                widget.Systray(),
                widget.TextBox(text=" "),
                widget.Clock(format="%Y/%m/%d %H:%M ", foreground=colors[5]),
            ],
            24,
            background='#282828',
            margin=[UM, UM, 0, UM],
            opacity=0.85,
            x11_drag_polling_rate=72,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(border_width=0, border_focus=foreground, border_normal=background,
                                  float_rules=[
                                      # Run the utility of `xprop` to see the wm class and name of an X client.
                                      *layout.Floating.default_float_rules,
                                      Match(wm_class="confirmreset"),  # gitk
                                      Match(wm_class="makebranch"),  # gitk
                                      Match(wm_class="maketag"),  # gitk
                                      # ssh-askpass
                                      Match(wm_class="ssh-askpass"),
                                      Match(title="branchdialog"),  # gitk
                                      # GPG key password entry
                                      Match(title="pinentry"),
                                      Match(title="Ulauncher"),
                                  ]
                                  )
auto_fullscreen = True
focus_on_window_activation = "smart"
# reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"


x11_drag_polling_rate = 72
