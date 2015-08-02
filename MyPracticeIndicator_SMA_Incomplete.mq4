//+------------------------------------------------------------------+
//|                                     Basic Indicator Template.mq4 |
//|                                     Copyright © 2015, Lucas Liew |
//|                                 http://blackalgotechnologies.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2015, Lucas Liew"
#property link      "http://blackalgotechnologies.com"

//--- Property Area ---

#property indicator_chart_window // Alternative: indicator_separate_window
#property indicator_buffers 1 // Number of Buffers. Aka number of lines/chart objects to be drawn
#property indicator_color1 Red // If you have more than 1 buffers, add indicator_color2, indicator_color3 etc

//--- Extern Variables ---
extern int period = 20;

//--- Buffers (Arrays to store the indicator data) ---
double ExtMapBuffer1[]; 

// TDL 3: Declare required Variables
int limit, i;



//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init() // Runs once when indicator is executed on chart
  {
//--- Set Indicator(s) details. See http://docs.mql4.com/customind
   SetIndexStyle(0, DRAW_LINE, 0, 1);
   SetIndexBuffer(0,ExtMapBuffer1);
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit() // Runs once when indicator is removed from chart
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start() // Runs on every tick
  {

   int counted_bars=IndicatorCounted(); // IndicatorCounted returns number of bars not changed since the indicator had been launched last
//----
   if(counted_bars<0) return(-1); // To check for errors
   if(counted_bars>0) counted_bars--; // Minus 1 so as to always recount the last bar. Last bar may be formed incompletely
   limit=Bars-counted_bars; // Bars represent number of bars in the chart. 
   
      /* Explanation of Limit: 
      
      1) We want to find limit. Limit is the number for bars in which we need to run the indicator for.
      2) However, we do not want to recount the bars which we already executed the indicator on (when we last switched on our MT4)
      3) Thus, limit = Number of bars in chart - number of bars that we already executed the indicator on (when we last open our MT4)
      
      */
      
   for(i=limit; i>=0; i--) { // This is where we calculate our Indicator value and place them in our Buffer(s)
         
         // TDL 1: Sum the closing prices of past X bars (X is an extern variable)





         
         // TDL 2: Divide the Sum by X. Then assign the values to the buffer. 
         ExtMapBuffer1[i]=                            // Sum of prices divided number of bars gives us the SMA on closing price 
         
   }
 
//----
   return(0);
  }
//+------------------------------------------------------------------+