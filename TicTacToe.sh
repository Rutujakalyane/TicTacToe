#!/bin/bash -x

#Author-Prince Singh
#Date-19 Nov 2019
#Purpose-Use case 5 [ Win,Tie & Loose Conditions ]

echo "Welcome to TicTacToe"

#constants
NUM_OFROWS=3
NUM_OFCOLUMNS=3
EMPTY=0
PLAYER_SYM=''
COMP_SYM=''
LENGTH=$(( $NUM_OFROWS * $NUM_OFCOLUMNS ))
WON=''

#variables
cell=1
playerCell=''
flag=''

declare -A board

function resetBoard()
{  
   local i=0
   local j=0

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

function assigningSymbol()
{
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
   local i=0
   local j=0
   for (( i=0; i<NUM_OFROWS; i++ ))
   do
      for (( j=0; j<NUM_OFCOLUMNS; j++ ))
      do
         echo -n "|   ${board[$i,$j]}   |"
      done
	 printf "\n\n"
   done
}

function inputToBoard()
{
  local rowIndex=''
  local columnIndex=''


  for (( i=0; i<$LENGTH; i++))
  do
  displayBoard
  read  -p "Choose one cell for input : " playerCell

  if [ $playerCell -gt $LENGTH ]
  then
     echo "Invalid move, Select valid cell"
     printf "\n"
     ((i--))
  else
  rowIndex=$(( $playerCell / $NUM_OFROWS ))
     if [ $(( $playerCell % $NUM_OFROWS )) -eq 0 ]
     then
        rowIndex=$(( $rowIndex - 1 ))
     fi

  columnIndex=$(( $playerCell %  $NUM_OFCOLUMNS ))
     if [ $columnIndex -eq 0 ]
     then
        columnIndex=$(( $columnIndex + 2 ))
     else
        columnIndex=$(( $columnIndex - 1 ))
     fi

     if [ "${board[$rowIndex,$columnIndex]}" == "$PLAYER_SYM" ] || [ "${board[$rowIndex,$columnIndex]}" == "$COMP_SYM" ]
     then
        echo "Invalid move, Cell already filled"
        printf "\n"
        ((i--))
     fi
     board[$rowIndex,$columnIndex]=$PLAYER_SYM

        if [ $(isCheckResult) -eq 1  ]
        then
           echo "You Won"
           return 0
        fi
  fi
  done
    echo "Match Tie"
}

function isCheckResult()
{
   if [ $((${board[0,0]})) -eq $(($playerSymbol)) ] && [ $((${board[0,1]})) -eq $(($playerSymbol)) ] && [ $((${board[0,2]})) -eq $(($playerSymbol)) ]
   then
      echo 1
   elif [ $((${board[1,0]})) -eq $(($playerSymbol)) ] && [ $((${board[1,1]})) -eq $(($playerSymbol)) ] && [ $((${board[1,2]})) -eq $(($playerSymbol)) ]
   then
      echo 1
   elif [ $((${board[2,0]})) -eq $(($playerSymbol)) ] && [ $((${board[2,1]})) -eq $(($playerSymbol)) ] && [ $((${board[2,2]})) -eq $(($playerSymbol)) ]
   then
      echo 1
   elif [ $((${board[0,0]})) -eq $(($playerSymbol)) ] && [ $((${board[1,0]})) -eq $(($playerSymbol)) ] && [ $((${board[2,0]})) -eq $(($playerSymbol)) ]
   then
      echo 1
   elif [ $((${board[0,1]})) -eq $(($playerSymbol)) ] && [ $((${board[1,1]})) -eq $(($playerSymbol)) ] && [ $((${board[2,1]})) -eq $(($playerSymbol)) ]
   then
      echo 1
   elif [ $((${board[0,2]})) -eq $(($playerSymbol)) ] && [ $((${board[1,2]})) -eq $(($playerSymbol)) ] && [ $((${board[2,2]})) -eq $(($playerSymbol)) ]
   then
      echo 1
   elif [ $((${board[0,0]})) -eq $(($playerSymbol)) ] && [ $((${board[1,1]})) -eq $(($playerSymbol)) ] && [ $((${board[2,2]})) -eq $(($playerSymbol)) ]
   then
      echo 1
   elif [ $((${board[2,0]})) -eq $(($playerSymbol)) ] && [ $((${board[1,1]})) -eq $(($playerSymbol)) ] && [ $((${board[0,2]})) -eq $(($playerSymbol)) ]
   then
      echo 1
   else
      echo 0
   fi
}

#main


#resetBoard
assigningSymbol
toss
echo
initializeBoard
inputToBoard
displayBoard 
