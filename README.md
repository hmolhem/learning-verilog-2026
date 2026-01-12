# learning-verilog-2026 🚀

[![Verilog](https://img.shields.io/badge/HDL-Verilog-blue)](https://en.wikipedia.org/wiki/Verilog)
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](https://opensource.org/licenses/MIT)

A comprehensive digital booklet and practice repository for mastering **Verilog HDL**. This project documents my learning journey, featuring modular exercises, simulation workflows, and practical experience logs for modern hardware design.

## 📖 About the Booklet
This repository serves as a "living document" of my experience with Digital Logic Design. It transitions from basic gate-level modeling to complex Finite State Machines (FSMs), all simulated using open-source tools.

## 🛠️ Development Environment (2026)
To replicate my results, I use the following setup:
*   **Editor:** [Visual Studio Code](code.visualstudio.com)
*   **Compiler:** [Icarus Verilog](steveicarus.github.io)
*   **Waveform Viewer:** [GTKWave](gtkwave.sourceforge.net)
*   **VS Code Extensions:** 
    *   `mshr-h.VerilogHDL` (Syntax & Linting)
    *   `formulahendry.code-runner` (Fast Execution)

## 📂 Repository Structure
```text
learning-verilog-2026/
├── 01_Basics/              # Simple gates, Adders, Muxes
├── 02_Sequential/          # Flip-flops, Latches, Registers
├── 03_Counters_Timers/     # Binary counters, PWM generators
├── 04_FSM_Design/          # Mealy and Moore State Machines
├── 05_Projects/            # Mini-projects (ALU, UART, etc.)
├── Booklet/                # Documentation and Experience logs
│   ├── Experience_Notes.md # My personal tips and pitfalls
│   └── Lab_Manual.pdf      # Structured practice guide
├── Scripts/                # Helper bash/batch scripts for automation
└── .gitignore              # Excludes .vcd, .vvp, and logs
