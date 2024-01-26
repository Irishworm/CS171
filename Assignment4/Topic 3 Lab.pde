Table table; // import the table class from processing. 
  
            //Median
  float getMedianTable(Table table, String col)
{
  // we need to start off by sorting the array or column
  // we need to make an array with the same number of 
  // values as the colums. 
  // we use table.getRowCount();
  
  float tempArray[] = new float[table.getRowCount()];
  
  // now we need to take the values from the col as specified
  // and copy them into our temp array. This will allow us to 
  // sort the array into ascending order (as required by the 
  // calculation for median) 
  // We must check every value in the column 
  int i = 0; // this will be our index in the array 
  for (TableRow row : table.rows()) 
  {
     float curValue = row.getFloat(col);
     tempArray[i] = curValue;
     i = i + 1; // we must advance the index by 1 
     // to move to the next element in the array. 
  }   
      
  // we need to sort the tempArray in ascending order
  float tempSorted[] = sort(tempArray);
  // now we are ready to calculate the middle index 
  // or the 50% or the 50th percentile. 
  
  // calculate the middle index
  // between 0 and length of array - 1
  // the median is the 50 percentile 
  // so it is at 1/2 way in the sorted array. 
  int middle = (int)(tempSorted.length*0.5);

  
  float median = 0.0;
  
  // check if length of array is ODD
  if (tempSorted.length%2 == 1)
  {
    // then just assign median to the middle value
    median = tempSorted[middle];
  }
  else // array length is even
  {
    // take the sum of both middle values
    // divide by 2. 
    median = (tempSorted[middle+1] + tempSorted[middle])/2.0;
  }
  
  return median;
}
  
  
            //Q1
  
  
  float getQ1Table(Table table, String col)
{

  float tempArray[] = new float[table.getRowCount()];
  
  int i = 0; // this will be our index in the array 
  for (TableRow row : table.rows()) 
  {
     float curValue = row.getFloat(col);
     tempArray[i] = curValue;
     i = i + 1; 
  }     

  float tempSorted[] = sort(tempArray);
  // now we are ready to calculate the middle index 
  // or the 50% or the 50th percentile. 
  

  int middle = (int)(tempSorted.length*0.25);
 
  
  float median = 0.0;
  
  // check if length of array is ODD
  if (tempSorted.length%2 == 1)
  {
    median = tempSorted[middle];
  }
  else // array length is even
  {
    median = (tempSorted[middle+1] + tempSorted[middle])/2.0;
  }
  return median;
}


            //Q3
            
            
  float getQ3Table(Table table, String col)
{

  float tempArray[] = new float[table.getRowCount()];
  
  int i = 0; // this will be our index in the array 
  for (TableRow row : table.rows()) 
  {
     float curValue = row.getFloat(col);
     tempArray[i] = curValue;
     i = i + 1; 
  }     

  float tempSorted[] = sort(tempArray);
  // now we are ready to calculate the middle index 
  // or the 50% or the 50th percentile. 
  

  int middle = (int)(tempSorted.length*0.75);

  
  float median = 0.0;
  
  // check if length of array is ODD
  if (tempSorted.length%2 == 1)
  {
    median = tempSorted[middle];
  }
  else // array length is even
  {
    median = (tempSorted[middle+1] + tempSorted[middle])/2.0;
  }
  return median;
}
  
            //MEAN
            
   // calculate the mean of a column in the dataset
  float getMeanTable(Table table, String col)
  {
    // This is the current mean. 
    float theMean = 0.0;
    float total = 0.0;
    // get the length of the dataset 
    int n = table.getRowCount();
    
    // We must check every value in the column 
    for (TableRow row : table.rows())
    {
      float curValue = row.getFloat(col);
      // we add up all of the values in the column
      total = total + curValue;
    }
    theMean = total/n;
    return theMean;
  }
  
  
            //MAX VALUES
  
  float getMaxTable(Table table, String col)
  {
    // This is the largest value for Interger. 
    float curMax = Float.MIN_VALUE;
    // We must check every value in the column 
    for (TableRow row : table.rows())
    {
      if (row.getFloat(col) >curMax)
      {
        curMax = row.getFloat(col);
      }
    }
    return curMax;
  }


            //MIN VALUES
  float getMinTable(Table table, String col)
  {
    // This is the largest value for Interger. 
    float curMin = Float.MAX_VALUE;
    // We must check every value in the column 
    for (TableRow row : table.rows())
    {
      if (row.getFloat(col) <curMin)
      {
        curMin = row.getFloat(col);
      }
    }
    return curMin;
  }
  
  
        //STANDARD DEVIATION

// This is the processing code for calculation of 
// StdDev in an float array. 

float calculateStdDev(Table table, float theMean, String col)
{
   float total = 0;
   float diff = 0;
   int n = table.getRowCount(); 
   
   // we need to look at each element in the array
   // subtract the mean from each element. 
   
   for (int i = 0; i < table.getRowCount(); i++)
   
   //printlnvalue in dataarray + .getfloat
   //print value in diff
   //print the total
   {
     diff = pow((table.getFloat(i,col) - theMean), 2);
     total = total + diff; //sum of values
   }
  
  float variance = total/(n - 1);
  float stdDev = sqrt(variance);
  
  return stdDev;
}


      //TASK 1

void setup() 
{
  // LAB - 2/3 November 2020. 
  // Here we specify the file from which we will 
  // import or extract our data. We need to change the filename to
  // correspond to the names of the data files provided. 
  
  table = loadTable("small.csv", "header");

  println("Number of rows: " + table.getRowCount());

  for (TableRow row : table.rows()) 
  {
     //Grabbing the data from the rows
     
    float DataA = row.getFloat("DataA");
    float DataB = row.getFloat("DataB");


    
    
    //PRINT MAX AND MIN
    float DataAMax = getMaxTable(table,"DataA");
    float DataAMin = getMinTable(table,"DataA");
    float DataBMax = getMaxTable(table,"DataB");
    float DataBMin = getMinTable(table,"DataB");
    
    println("Min of DataA " + DataAMin);
    println("Min of DataB " + DataBMin);
    println("Max of DataA " + DataAMax);
    println("Max of DataB " + DataBMax);

    
    //PRINT MEAN
    float meanDataA = getMeanTable(table,"DataA");
    float meanDataB = getMeanTable(table,"DataB");
    
    println("Mean of DataA " + meanDataA);
    println("Mean of DataB " + meanDataB);
    
    //PRINT STDDEV
    float stdDevDataA = calculateStdDev(table, meanDataA,"DataA");
    float stdDevDataB = calculateStdDev(table, meanDataB,"DataB");
    
    println("Std Dev of DataA " + stdDevDataA);
    println("Std Dev of DataB " + stdDevDataB);
    
    //PRINT MEDIAN
    float medianDataA = getMedianTable(table,"DataA");
    float medianDataB = getMedianTable(table,"DataB");
    
    println("The median of DataA " + medianDataA);
    println("The median of DataB " + medianDataB);
    
    //PRINT Q1
    float Q1DataA = getQ1Table(table,"DataA");
    float Q1DataB = getQ1Table(table,"DataB");
    
    println("The Q1 of DataA " + Q1DataA);
    println("The Q1 of DataB " + Q1DataB);
    
    //PRINT Q3
    float Q3DataA = getQ3Table(table,"DataA");
    float Q3DataB = getQ3Table(table,"DataB");
    
    println("The Q3 of DataA " + Q3DataA);
    println("The Q3 of DataB " + Q3DataB);
   }  
}
