//+------------------------------------------------------------------+
//|                     MyPracticeScript_ArraysPractice_Solution.mq4 |
//|                                     Copyright © 2015, Lucas Liew |
//|                                 http://blackalgotechnologies.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2015, Lucas Liew"
#property link      "http://blackalgotechnologies.com"
#property version   "1.00"
#property strict

// Created by Lucas Liew

/*

NOTE: DO NOT READ THIS SCRIPT IF YOU HAVE NOT SEEN/ATTEMPTED THE ARRAY PRACTICE QUESTIONS

*/



















//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
  // Question 1: Find the highest closing price (1hr bar) of EURUSD in the last 24 hours.
  
  // ------------- QUESTION 1 SOLUTION -------------
  
  double last24hr[24]; // Use a double
  
  for(int a = 0; a < 24; a++) {   
      last24hr[a] = iClose(NULL, PERIOD_H1, a); // I'm assuming you run this script on a EURUSD chart. 
  }
  
  int indexOfMax = ArrayMaximum(last24hr,WHOLE_ARRAY,0);
  
  Print(last24hr[indexOfMax]);
  
  // Question 2: Create Array B using Array A
  
  // ------------- QUESTION 2 SOLUTION ------------- 
     
   int arrayA[3,5] = {1,2,3,4,5, 11,12,13,14,15 ,21,22,23,24,25};
   int arrayB[5,3];
   
   for (int x = 0; x < 3; x++) {
      for (int y = 0; y < 5; y++) {
         arrayB[y,x] = arrayA[x,y];
      }
   }
   
   Comment( arrayB[0][0]," ",arrayB[0][1]," ",arrayB[0][2],"\n", // \n represents next line
            arrayB[1][0]," ",arrayB[1][1]," ",arrayB[1][2],"\n",
            arrayB[2][0]," ",arrayB[2][1]," ",arrayB[2][2],"\n",
            arrayB[3][0]," ",arrayB[3][1]," ",arrayB[3][2],"\n",
            arrayB[4][0]," ",arrayB[4][1]," ",arrayB[4][2]);
   
  }
//+------------------------------------------------------------------+
