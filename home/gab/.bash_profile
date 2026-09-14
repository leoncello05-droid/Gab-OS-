# Se siamo sulla prima console (tty1) e non c'è una sessione grafica attiva, avvia Xorg
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec startx
fi
