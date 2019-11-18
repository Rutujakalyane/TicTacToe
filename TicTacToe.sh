#!/bin/bash -x

#Author-Prince Singh
#Date-18 Nov 2019
#Purpose-Use case 4 [ Display Board and User Input ]

echo "Welcome to TicTacToe"

#constants
NUM_OFROWS=3
NUM_OFCOLUMNS=3
EMPTY=0
PLAYER_SYM=''
COMP_SYM=''

#variables
cell=1
playerCell=''

declare -A board

function resetBoard()
{
   for ((i=0; i<NUM_OFROWS; i++))
   do
      for ((j=0; j<NUM_OFCOLUMNS; j++))
      do
         board[$i,$j]=$EMPTY
      done
   done
}

function initializeBoard()
{
   for (( x=0; x<NUM_OFROWS; x++ ))
   do
      for (( y=0; y<NUM_OFCOLUMNS; y++ ))
      do
         board[$x,$y]=$cell
         ((cell++))
      done
   done
}

function assigningSymbol(){
   if [ $(( RANDOM%2 )) -eq 1 ]
   then
      PLAYER_SYM=X
      COMP_SYM=O
   else
      COMP_SYM=X
      PLAYER_SYM=O
   fi
   echo "Player's Symbol - $PLAYER_SYM"
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
   for (( i=0; i<NUM_OFROWS; i++ ))
   do
      for (( j=0; j<NUM_OFCOLUMNS; j++ ))
      do
         echo -n "| ${board[$i,$j]} |"
      done
	 printf "\n\n"
   done
}

function inputToBoard()
{
   initializeBoard
   displayBoard
   read  -p "Choose one cell for input:" playerCell
   echo "Player Choosen cell $playerCell"

   for (( row=0; row<NUM_OFROWS; row++ ))
   do
      for (( col=0; col<NUM_OFCOLUMNS; col++ ))
      do
         if [ ${board[$row,$col]} -eq $playerCell ]
         then
         board[$row,$col]=$PLAYER_SYM
         fi
     done
   done
   displayBoard
}

resetBoard
assigningSymbol
toss
echo
inputToBoard
