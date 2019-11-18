#!/bin/bash -x

#Author-Prince Singh
#Date-18 Nov 2019
#Purpose-Use case 4 [ Display Board ]

echo "Welcome to TicTacToe"

#constants
NUM_OFROWS=3
NUM_OFCOLUMNS=3
EMPTY=-1
SYMBOL_1=x
SYMBOL_2=0

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

function assigningSymbol(){
   if [ $(( RANDOM%2 )) -eq 1 ]
   then
      PLAYER_SYM=SYMBOL_1
      COMP_SYM=SYMBOL_2
   else
      COMP_SYM=SYMBOL_1
      PLAYER_SYM=SYMBOL_2
   fi
}

function toss()
{
   if [ $(( RANDOM%2 )) -eq 1 ]
   then
      echo "Player's turn" 
   else
      echo "Computer's turn"
   fi
}

function displayBoard()
{
   for ((i=0; i<NUM_OFROWS; i++))
   do
      for ((j=0; j<NUM_OFCOLUMNS; j++))
      do
         echo -n "| ${board[$i,$j]} |"
      done
	 printf "\n"
	 echo "---------------------------"
   done


}

resetBoard
assigningSymbol
toss
echo
displayBoard
