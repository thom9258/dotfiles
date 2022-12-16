from libqtile import bar, layout, widget
from libqtile.config import Screen

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),

                # Force right allignment
                widget.Spacer(length=bar.STRETCH),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Systray(),
                widget.Battery(foreground='247052', low_percentage=0.20,
                               low_foreground='fa5e5b', update_delay=10,
                               format='{percent:.0%}'),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.DF(),
            ],
            24,
            #border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]
