#!/usr/bin/env bash
# CanControls — image assets downloader
# Run from the assets/ folder:  bash download.sh
#
# Requires: curl (preinstalled on macOS/Linux). On Windows, use PowerShell:
#   foreach ($l in Get-Content urls.txt) { $p=$l.Split(' '); curl.exe -o $p[0] $p[1] }

set -e
mkdir -p "$(dirname "$0")"
cd "$(dirname "$0")"

download() {
  local out="$1" url="$2"
  echo "→ $out"
  curl -fsSL -o "$out" "$url" || echo "  ✗ failed: $url"
}

download "CCLogo.png"               "https://www.cancontrols.com/wp-content/uploads/General/CCLogo.png"
download "Gesichtsanalyse.jpg"      "https://www.cancontrols.com/wp-content/uploads/2016/04/Gesichtsanalyse_kl.jpg"
download "Gestenanalyse.jpg"        "https://www.cancontrols.com/wp-content/uploads/2015/11/Gestenanalyse_klein.jpg"
download "Personenanalyse.jpg"      "https://www.cancontrols.com/wp-content/uploads/2016/04/Personenanalyse_kl.jpg"
download "Oberflaechenanalyse.jpg"  "https://www.cancontrols.com/wp-content/uploads/2015/11/Oberfl%C3%A4chenanalyse_klein.jpg"
download "Automobilbau.jpg"         "https://www.cancontrols.com/wp-content/uploads/2015/11/Automobilbau_klein.jpg"
download "Luft-und-Raumfahrt.jpg"   "https://www.cancontrols.com/wp-content/uploads/2015/11/Luft-und-Raumfahrt_klein.jpg"
download "Medizin.jpg"              "https://www.cancontrols.com/wp-content/uploads/2015/11/Medizin_klein.jpg"
download "Strassenwesen.jpg"        "https://www.cancontrols.com/wp-content/uploads/2015/11/Strassenwesen_klein.jpg"
download "Unterhaltung.jpg"         "https://www.cancontrols.com/wp-content/uploads/2015/11/Unterhaltung_klein.jpg"
download "Exponate.jpg"             "https://www.cancontrols.com/wp-content/uploads/2015/11/Exponate_klein.jpg"
download "Sicherheit.jpg"           "https://www.cancontrols.com/wp-content/uploads/2015/11/Sicherheit_klein.jpg"

echo
echo "Done."
