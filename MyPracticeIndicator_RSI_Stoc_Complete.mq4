//+------------------------------------------------------------------+
//|                                  MyPracticeIndicator_RSI_Stoc.mq4 |
//|                                     Copyright © 2015, Lucas Liew |
//|                                 http://blackalgotechnologies.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2015, Lucas Liew"
#property link      "http://blackalgotechnologies.com"

/*----- AIM -----

   Combine the RSI (1 buffer) and Stochastic Oscillator Indicators (2 buffers)

*/

//--- Property Area ---

// TDL 1: Edit Property Area
#property indicator_separate_window // Alternative: indicator_separate_window
#property indicator_buffers 3 // Number of Buffers. Aka number of lines/chart objects to be drawn
#property indicator_color1 Aqua // If you have more than 1 buffers, add indicator_color2, indicator_color3 etc
#property indicator_color2 Red
#property indicator_color3 Yellow

//--- Extern Variables ---

// TDL 2: Input Extern Variables

extern int InpRSIPeriod = 20;
extern int InpKPeriod=5; // K Period
extern int InpDPeriod=3; // D Period
extern int InpSlowing=3; // Slowing

//--- Buffers (Arrays to store the indicator data) ---

// TDL 3: Declare Buffers
double ExtRSIBufferA[]; // Name given by us
double ExtStocBufferB[];
double ExtStocBufferC[];

//--- Declare variables ---
int limit, i;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init() // Runs once when indicator is executed on chart
  {
//--- Set Buffer(s) details. See http://docs.mql4.com/customind

// TDL 4: Set settings for buffers
   SetIndexBuffer(0,ExtRSIBufferA);
   SetIndexStyle(0, DRAW_LINE, STYLE_SOLID, 1); // Optional, if not set. Then buffer will be a default width 1 line. See http://docs.mql4.com/customind/setindexstyle. 
   SetIndexBuffer(1,ExtStocBufferB);
   SetIndexStyle(1, DRAW_LINE, STYLE_SOLID, 1);
   SetIndexBuffer(2,ExtStocBufferC);
   SetIndexStyle(2, DRAW_LINE, STYLE_SOLID, 1);   
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
  
//--- Find number of bars to fill (aka find Limit) ---

   int counted_bars=IndicatorCounted(); // IndicatorCounted returns number of bars not changed since the indicator had been launched last
   if(counted_bars<0) return(-1); // To check for errors
   if(counted_bars>0) counted_bars--; // Minus 1 so as to always recount the last bar. Last bar may be formed incompletely
   
   limit=Bars-counted_bars; // Bars represent number of bars in the chart. 
   
      /* Explanation of Limit: 
      
      1) We want to find limit. Limit is the number for bars in which we need to run the indicator for.
      2) However, we do not want to recount the bars which we already executed the indicator on (when we last switched on our MT4)
      3) Thus, limit = Number of bars in chart - number of bars that we already executed the indicator on (when we last open our MT4)
      
      */

//--- Calculate and Assign Values to Buffer ---
     
// TDL 4: Calculate and Assign Values to the 3 Buffers
     
   for(i=limit; i>=0; i--) { // This is where we calculate our Indicator value and place them in our Buffer(s)

      ExtRSIBufferA[i]=iRSI(NULL, 0, InpRSIPeriod, PRICE_CLOSE, i);               
      ExtStocBufferB[i]=iStochastic(NULL, 0, InpKPeriod, InpDPeriod, InpSlowing, MODE_SMA, 0, 0, i);
      ExtStocBufferC[i]=iStochastic(NULL, 0, InpKPeriod, InpDPeriod, InpSlowing, MODE_SMA, 0, 1, i); 

   }
 
//----
   return(0);
  }
//+------------------------------------------------------------------+