# 🛠️ Bash Scripts Toolkit
> By: zeeshanahmad12

Ye repository meri bash scripts ka collection hai.
Inhe banaya hai taake Git ka kaam aasan ho jaye.

---

## 📋 Git Ke Zaroori Commands

| Command | Kaam |
|---|---|
| `git init` | Naya repo shuru karo |
| `git add .` | Saari files select karo |
| `git commit -m "msg"` | Snapshot lo |
| `git push` | GitHub pe bhejo |
| `git pull` | GitHub se lo |
| `git remote -v` | Connection check karo |
| `git status` | Kya badla dekho |
| `git log` | History dekho |

---

## 📁 Scripts

### 1. gsave-simple.sh
**Kaam:** Ek command se saari files GitHub pe save karo

**Use karo:**
```bash
bash gsave-simple.sh "tumhara message"
```

**Kya karta hai:**
- Folder mein jata hai
- Saari files add karta hai
- Commit karta hai
- GitHub pe push karta hai

---

### 2. gsave-smart.sh
**Kaam:** YML files list karo, choose karo, push karo

**Use karo:**
```bash
bash gsave-smart.sh "tumhara message"
```

**Kya karta hai:**
- Saari YML files number ke saath dikhata hai
- Tum number choose karo
- Sirf wahi file push hoti hai
- Ya 0 likho to saari files push ho jaati hain

---

## 🔄 Naye EC2 Pe Kaise Use Karein

```bash
# Step 1: Clone karo
git clone git@github.com:zeeshanahmad12/bash-scripts-toolkit.git

# Step 2: Folder mein jao
cd bash-scripts-toolkit

# Step 3: Script chalao
bash gsave-simple.sh "message"
```# bash-scripts-toolkit
