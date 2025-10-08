<p align="center">
  <img src="https://img.shields.io/badge/Ruby-3.x-red?style=for-the-badge&logo=ruby" alt="Ruby Badge">
  <img src="https://img.shields.io/badge/Gosu-2D%20Game%20Library-blue?style=for-the-badge" alt="Gosu Badge">
  <img src="https://img.shields.io/badge/Platform-macOS-lightgrey?style=for-the-badge&logo=apple" alt="macOS Badge">
</p>

<h1 align="center">🪓 Darmanhammer 🎮</h1>

<p align="center">
  <b>My very first game, made in Ruby after graduating from <a href="https://www.lewagon.com/">Le Wagon</a> and before joining <a href="https://42.fr/">École 42</a>.</b><br>
  A small arcade project built with ❤️ and <a href="https://www.libgosu.org/">Gosu</a>.
</p>

---

# 🪓 Darmanhammer

**Darmanhammer** is a small **arcade game made in Ruby with Gosu**, inspired by the classic *Whack-a-Mole*.<br>
Your goal: **hammer Darmanin** as many times as you can before the timer runs out!  
Each game lasts **15 seconds**.

## ⚙️ Installation (macOS)

### 1️⃣ Install a modern Ruby (via Homebrew)

> ⚠️ The Ruby pre-installed on macOS (2.6) is too old.  
> Install the latest version through **Homebrew** instead:

```bash
brew install ruby
echo 'export PATH="$(brew --prefix ruby)/bin:$PATH"' >> ~/.zshrc
exec zsh
ruby -v   # should show Ruby 3.x
```

---

### 2️⃣ Install native libraries required by Gosu

```bash
brew install sdl2 sdl2_ttf sdl2_image sdl2_mixer mpg123 libsndfile
```

---

### 3️⃣ Install the Gosu gem

```bash
gem install gosu
```

---

### 4️⃣ Run the game

From the project folder:

```bash
ruby darmanhammer.rb
```

---