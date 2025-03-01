#!/bin/bash

DEBUG="n"

green=$(echo -en "\e[92m")
yellow=$(echo -en "\e[93m")
magenta=$(echo -en "\e[35m")
red=$(echo -en "\e[91m")
cyan=$(echo -en "\e[96m")
default=$(echo -en "\e[39m")

ensure_venv() {
  OBICO_ENV="${HOME}/moonraker-obico-env"
  if [ ! -f "${OBICO_ENV}/bin/activate" ] ; then
    report_status "Creating python virtual environment for moonraker-obico..."
    mkdir -p "${OBICO_ENV}"
    virtualenv -p /usr/bin/python3 --system-site-packages "${OBICO_ENV}"
  fi
}

report_status() {
  echo -e "${magenta}###### $*\n${default}"
}

debug() {
  if [ $DEBUG = "y" ]; then
    echo -e "DEBUG: ${magenta}###### $*${default}"
  fi
}

banner() {
  echo -e "${cyan}"
  cat "${OBICO_DIR}/scripts/banner"
  echo -e "${default}"
}

welcome() {
  cat <<EOF
${cyan}
======================================================================================================
###                                                                                                ###
###                       Install and Configure Obico for Klipper                                  ###
###                                                                                                ###
======================================================================================================
${default}
EOF
}

oops() {
  cat <<EOF

   ____
  / __ \\
 | |  | | ___   ___   ___   ___  _ __  ___
 | |  | |/ _ \\ / _ \\ / _ \\ / _ \\| '_ \\/ __|
 | |__| | (_) | (_) | (_) | (_) | |_) \\__ \\  _   _   _
  \\____/ \\___/ \\___/ \\___/ \\___/| .__/|___/ (_) (_) (_)
                                | |
                                |_|


EOF
}

need_help() {
  cat <<EOF
Need help? Stop by:

- The Obico's help docs: https://obico.io/help/
- The Obico community: https://obico.io/discord/

EOF
}

