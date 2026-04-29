#!/bin/bash
# ─────────────────────────────────────
# Script: gsave-pro.sh
# Use: bash gsave-pro.sh "repo-naam"
# ─────────────────────────────────────

REPO=$1
GITHUB_USER="zeeshanahmad12"

# Check karo repo naam diya?
if [ -z "$REPO" ]; then
    echo "❌ Repo ka naam do!"
    echo "Use: bash gsave-pro.sh 'repo-naam'"
    exit 1
fi

# Folder exist karta hai?
if [ ! -d ~/$REPO ]; then
    echo "❌ ~/$REPO folder nahi mila EC2 pe!"
    exit 1
fi

# Folder mein jao
cd ~/$REPO

# Git init karo agar nahi hai
if [ ! -d .git ]; then
    echo "🔧 Git init kar raha hoon..."
    git init
fi

# Branch fix karo
git symbolic-ref HEAD refs/heads/main 2>/dev/null
git branch -m master main 2>/dev/null

# GitHub connected hai?
if ! git remote -v | grep -q "github"; then
    echo "🔗 GitHub se connect kar raha hoon..."
    git remote add origin git@github.com:$GITHUB_USER/$REPO.git
fi

# Pull karo
git config pull.rebase false
git pull origin main --allow-unrelated-histories 2>/dev/null

# Pehli baar sab files add karo jo untracked hain
if git status | grep -q "Untracked\|untracked"; then
    echo "📦 Pehli baar saari files track kar raha hoon..."
    git add .
    git commit -m "pehli baar saari files add ki" 2>/dev/null
    git push -u origin main 2>/dev/null
fi

# Files dikhaao
echo ""
echo "📁 Ye Files Hain:"
echo "─────────────────────"

files=($(ls *.yml *.sh *.md *.yaml *.json 2>/dev/null))

if [ ${#files[@]} -eq 0 ]; then
    echo "❌ Koi file nahi mili!"
    exit 1
fi

for i in "${!files[@]}"; do
    echo "$((i+1)). ${files[$i]}"
done

echo "─────────────────────"
echo "0. Saari Files Push Karo"
echo "─────────────────────"

# Number maango
read -p "Konsi file push karni hai? (number likho): " choice

# Message maango
read -p "Commit message likho: " MESSAGE

# Push karo
if [ "$choice" == "0" ]; then
    git add .
    git commit -m "$MESSAGE"
    git push -u origin main
    echo "✅ Saari Files GitHub Pe Save Ho Gayi!"
else
    selected="${files[$((choice-1))]}"
    git add "$selected"
    git commit -m "$MESSAGE - $selected"
    git push -u origin main
    echo "✅ $selected GitHub Pe Save Ho Gayi!"
fi
