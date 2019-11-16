#!/bin/bash -x

#Author-Prince Singh
#Date-16 Nov 2019
#Purpose-Use case 1 [Resetting board for fresh start]

echo "Welcome to TicTacToe"

#constants
NUM_OFROWS=3
NUM_OFCOLUMNS=3
EMPTY=-1

#variables
declare -a board

function resetBoard()
{
   for ((i=0; i<NUM_OFROWS; i++))
   do
      for ((j=0; j<NUM_OFCOLUMNS; j++))
      do
         board[$i,$j]=EMPTY
      done
   done
}

resetBoard
