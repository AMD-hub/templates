#!/bin/bash
# Sync your LaTeX templates to multiple destinations (with a sprinkle of order)
# to run put this in terminal :  ~/latex_projects/templates/sync_templates.sh

declare -A SYNC_MAP

SYNC_MAP["$HOME/latex_projects/templates/CV_template_1col/amdresume.cls"]="
    $HOME/texmf/tex/latex/mytemplates/
    $HOME/latex_projects/Projects/CVs/
"

SYNC_MAP["$HOME/latex_projects/templates/CV_template_2cols/altacv.cls"]="
    $HOME/texmf/tex/latex/mytemplates/
"

SYNC_MAP["$HOME/latex_projects/templates/Rapport_template/insea.cls"]="
    $HOME/texmf/tex/latex/mytemplates/
    $HOME/latex_projects/Projects/Books/CPGE_Analyse/
    $HOME/latex_projects/Projects/Books/Quant_AMD/
"

# Copy each file to its assigned destinations
for src in "${!SYNC_MAP[@]}"; do
    for dest in ${SYNC_MAP[$src]}; do
        cp -f "$src" "$dest"
        echo "Copied $(basename "$src") → $dest"
    done
done

# Refresh TeX database because we’re professionals
echo "Updating TeX file database..."
texhash ~/texmf >/dev/null 2>&1

echo "Templates synchronized and TeX database updated. Civilization endures another day."
