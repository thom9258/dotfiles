from libqtile import layout
from libqtile.config import Click, Drag, Group, Key
from libqtile.lazy import lazy

mod        = "mod4"
terminal   = "kitty"
browser    = "firefox"
menu       = "dmenu_run"
editor     = "emacsclient -c"
screenshot = "flameshot gui"
vol_up     = "amixer -D pulse sset Master 4%+"
vol_down   = "amixer -D pulse sset Master 4%-"
vol_toggle = "amixer -q -D pulse set Master toggle"

keys = [
    # Kill window
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),

    # Spawn external programs
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch browser"),
    Key([mod], "d", lazy.spawn(menu), desc="Launch menu"),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),

    Key([mod, "shift"], "h", lazy.layout.shrink_main()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "l", lazy.layout.grow_main()),

    # Next monitor
    # TODO: Fix Multimonitor setups!
    #Key([mod], ",", lazy.next_screen(), desc="Next monitor"),

    # Floating Window toggle
    Key([mod], "f", lazy.window.toggle_floating()),
    # Media keys
    Key([], 'XF86AudioMute', lazy.spawn(vol_toggle)),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(vol_up), desc="Increase volume",),
    Key([], "XF86AudioLowerVolume", lazy.spawn(vol_down), desc="Decrease volume",),
    Key([mod], "p", lazy.spawn(screenshot), desc="take screenshot",),
    Key([mod], "e", lazy.spawn(editor), desc="Spawn editor window",),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    # TODO: Figure out how to set layouts with bindings
    Key([mod], "m", lazy.group.setlayout("max"), desc="Toggle monocle mode"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),

    # Window management
    #Key([mod], ",", lazy.to_screen(0), desc="Cycle screens"),
    #Key([mod], ".", lazy.to_screen(1), desc="Cycle screens"),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

groups = [Group(i) for i in "123456789"]

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
            # mod1 + shift + letter of group = move focused window to group
             Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
                 desc="move focused window to group {}".format(i.name)),
        ]
    )
