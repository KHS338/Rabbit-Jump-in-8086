# Rabbit Jump 

##Introduction

This game is a semester project for the course EE2003-Computer Organization & Assembly Language (COAL). It was written in 16-bit x86 assembly.   

##Install

You need to download [NASM Assembler](https://www.nasm.us/) to assemble the code and [DOSBox](https://www.dosbox.com/download.php?main=1) to emulate real mode.  

Follow these Steps to run the game.

1. Install NASM and add it to the `ENVIRONMENT` variable.
2. Install DOSBox
3. Open `cmd` and navigate to the `src` folder.
4. Assemble the program using `nasm`
```bat
    nasm game.asm -o game.com -l game.lst
```
5. Open DOSBox, mount the drive and naviagte to where `game.com` is present.
6. Run the game by typing :
```bat
    game.com
```
