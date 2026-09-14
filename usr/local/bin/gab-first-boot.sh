#!/bin/bash
if [ ! -f /etc/gab-os-installed ]; then
    # Nome utente amministratore predefinito di GAB OS
    ADMIN_USER="gab"
    
    # Controlla se l'utente esiste già, altrimenti lo crea
    if ! id "$ADMIN_USER" &>/dev/null; then
        useradd -m -s /bin/bash -G sudo "$ADMIN_USER"
        echo "Imposta la password per l'amministratore ($ADMIN_USER):"
        passwd "$ADMIN_USER"
    fi

    # Installa i pacchetti salvati nella cartella packages
    dpkg -i /packages/*.deb

    # Segna l'installazione come completata
    touch /etc/gab-os-installed
fi
