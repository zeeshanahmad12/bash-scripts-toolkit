#!/bin/bash
# ─────────────────────────────────────
# Script: gsave-smart.sh
# Kaam: YML files list karo, choose karo, push karo
# Use: bash gsave-smart.sh "message"
# ─────────────────────────────────────

cd ~/openshift-automation-journey

echo "📁 Ye YML Files Hain:"
echo "─────────────────────"

files=($(ls *.yml 2>/dev/null))

if [ ${#files[@]} -eq 0 ]; then
    echo "❌ Koi YML file nahi mili!"
    exit 1
fi

for i in "${!files[@]}"; do
    echo "$((i+1)). ${files[$i]}"
done

echo "─────────────────────"
echo "0. Saari Files Push Karo"
echo "─────────────────────"

read -p "Konsi file push karni hai? (number likho): " choice

if [ "$choice" == "0" ]; then
    git add .
    git commit -m "$1"
    git push
    echo "✅ Saari Files GitHub Pe Save Ho Gayi!"
else
    selected="${files[$((choice-1))]}"
    git add "$selected"
    git commit -m "$1 - $selected"
    git push
    echo "✅ $selected GitHub Pe Save Ho Gayi!"
fi
