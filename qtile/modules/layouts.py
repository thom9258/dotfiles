from libqtile import layout
from libqtile.config import Match

layout_theme = {
    #"border_focus": '#ffffff',
    "border_focus": '#ff0000',
    "border_normal": '#000000',
    "border_width": 4,
    "margin": 0,
    "grow_amount": 1,
    "margin_on_single": 4,
    "border_on_single": True,
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.TreeTab(**layout_theme),
    layout.Max(**layout_theme),
    #layout.Bsp(**layout_theme),
    #layout.Max(),

    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.VerticalTile(),
     #layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
