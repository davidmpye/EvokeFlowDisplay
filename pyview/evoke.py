#!/usr/bin/python3

import pygame
from math import pi
import string
import sys

# Initialize the game engine
pygame.init()
# Define the colors we will use in RGB format
BLACK = (  0,   0,   0)
WHITE = (255, 255, 0)

size = [ 128*4, 64*4 ]
pixel  = [ 4, 4]
screen = pygame.display.set_mode(size)
 
pygame.display.set_caption("Pure evolve SPI data display")

screen.fill(BLACK)

page = 0
column = 0

while True:

    row = 0
    col = 0
    collow = "0"
    colhigh ="0"

    while True:

        line = sys.stdin.readline().strip()

        if line == "DATA":
            break

        if line == "CMD":
            continue
        
        splitline = line.split(" ")
        for chunk in splitline:
            if len(chunk) != 2:
                continue

            if chunk[0] == 'B':
                page = chunk[1]
                row = int(page, base=16) * 8
            if chunk[0] == '1':
                colhigh = chunk[1]
                col = colhigh + collow
                column = int (col,base=16)
    
            if chunk [1] =='0':
                collow = chunk[1]
                col = colhigh + collow
                column = int (col,base=16)
    
    while True:
        line = sys.stdin.readline().strip()
        if line == "CMD":
            break
        if line == "DATA": 
            continue

        try:

            b = bytearray.fromhex(line)
        except:
            print (line)
            continue
        bit_mask = int('000000001', 2)
    
        for byte in b:
            for i in range(8):
                if ((bit_mask << i) & byte) != 0:
                    screen.fill(WHITE, [column*4,(row+i)*4, 4,4])
                else: 
                    screen.fill(BLACK, [column*4,(row+i)*4, 4,4])
            column = column + 1
        # Go ahead and update the screen with what we've drawn.
        # This MUST happen after all the other drawing commands.
        
        pygame.display.flip()
 
# Be IDLE friendly
pygame.quit()
