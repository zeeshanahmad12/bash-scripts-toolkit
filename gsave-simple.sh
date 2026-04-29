#!/bin/bash
# ─────────────────────────────────────
# Script: gsave-simple.sh
# Kaam: Ek command se GitHub pe save
# Use: bash gsave-simple.sh "message"
# ─────────────────────────────────────

cd ~/openshift-automation-journey
git add .
git commit -m "$1"
git push
echo "✅ GitHub Pe Save Ho Gaya!"
