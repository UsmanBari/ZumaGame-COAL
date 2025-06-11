# 🎯 Zuma Game - COAL Project

This is a simplified and animated version of the **Zuma Game** built entirely in **Assembly Language (x86)** using `Irvine32` and `Emu8086`/`MASM`. The project was developed as a final term submission for the **Computer Organization and Assembly Language (COAL)** course at FAST Islamabad.

---

## 🧩 Game Features

- 🎮 Interactive Menu
  - Welcome screen with name input
  - Options: Instructions, High Score, Start Game
- 🧵 Game Logic
  - Aim and shoot mechanism using bullets
  - Colliding bullets with matching color balls removes them
  - Level progression (Level 1 and Level 2)
- 🧠 Power-Ups
  - Level 2 introduces power-up balls like **Slow Down**
- 🧠 Scoring System
  - Score multiplier increases with chain hits
  - Displayed live on screen
- 🖥 Console-Based UI
  - Rendered using ASCII characters and cursor movement
  - Smooth animations with delays

---

## 📁 File Details

- `COAL Project Zuma.asm` – Main source code (~10,000+ lines)
- Uses:
  - `Irvine32.inc` – Assembly library (standard for MASM)
  - `macros.inc` – Contains text macros and screen controls

---

## ⌨️ Controls

| Key | Action |
|-----|--------|
| `W` | Move up |
| `S` | Move down |
| `A` | Rotate aim left |
| `D` | Rotate aim right |
| `SPACE` | Fire bullet |
| `C` | Switch bullet color |
| `ESC` | Pause game |
| Any key | Resume or navigate |

---

## ⚙️ Requirements

- **Assembler**: MASM / Emu8086
- **Library**: `Irvine32.inc` (must be installed)
- **Platform**: Windows console (DOS-style execution)

---

## 🚀 How to Run

1. Open the `.asm` file in Emu8086 or MASM.
2. Ensure that `Irvine32.inc` and `macros.inc` are properly included and configured.
3. Assemble and run the code.
4. Play the game directly in the console!

---

## 🏫 Course Info

- **Subject**: COAL – Computer Organization and Assembly Language
- **Institution**: FAST – National University of Computer and Emerging Sciences
- **Semester**: Spring/Fall 2024–25


---

## 📜 License

This project is for **educational and academic purposes only**.  
Do not redistribute or commercialize without permission.

---

## 🙌 Credits

- Developed by **Usman Bari**


