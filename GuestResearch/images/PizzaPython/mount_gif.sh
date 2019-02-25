#!/bin/bash

# Create the gifs for the pizza and code
convert -dispose 2 -delay 4 -loop 0 Pizza_frames/*.png Pizza.gif
convert -dispose 2 -delay 4 -loop 0 Code_frames/*.png Code.gif

# Join them together
convert -dispose 2 -alpha set Pizza.gif -repage 512x96 -background none \
        -coalesce null: \( Code.gif -coalesce \) -geometry +256+0 \
        -layers Composite PizzaAndCode.gif

# Add the nerd
convert -dispose 2 -alpha set PizzaAndCode.gif -repage 512x96 -background none \
        -coalesce null: \( Nerd.png -coalesce -resize 96x96 \) -geometry +208+0 \
        -layers Composite Animation.gif

# Crop the gif
convert Animation.gif -crop 256x96+128+0 +repage AnimationCrop.gif