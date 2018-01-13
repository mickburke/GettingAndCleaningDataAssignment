# Cookbook

## Original cookbook data from features.txt

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## Additional information regarding the changes in run_analysis.R

Of the set of variables in the original cookbook data above, run_analysis.R filters out all except the columns containing mean() and std() representing the mean value and standard deviation.

A mapping is performed to rename the remaining columns headings as outlined below:

Braces are deleted
Hyphens are replaced by underscores
The initials "t" and "f" are replaced by "Time_" and "Frequency_"
The duplicated "BodyBody" is tidied to "Body"
"Acc" => "_Accelerometer"
"Gyro" => "_Gyroscope"
"Mag" => "_Magnitude"
"Jerk" => "_Jerk"
"_mean" => "_Mean"
"_MeanFreq" => "_MeanFrequency"
"_std" => "_StandardDeviation"
"_X" => "_X_axis"
"_Y" => "_Y_axis"
"_Z" => "_Z_axis"

This leaves the following columns headings:

 [1] "SubjectId"                                                    
 [2] "Activity"                                                     
 [3] "Time_Body_Accelerometer_Mean_X_axis"                          
 [4] "Time_Body_Accelerometer_Mean_Y_axis"                          
 [5] "Time_Body_Accelerometer_Mean_Z_axis"                          
 [6] "Time_Body_Accelerometer_StandardDeviation_X_axis"             
 [7] "Time_Body_Accelerometer_StandardDeviation_Y_axis"             
 [8] "Time_Body_Accelerometer_StandardDeviation_Z_axis"             
 [9] "Time_Gravity_Accelerometer_Mean_X_axis"                       
[10] "Time_Gravity_Accelerometer_Mean_Y_axis"                       
[11] "Time_Gravity_Accelerometer_Mean_Z_axis"                       
[12] "Time_Gravity_Accelerometer_StandardDeviation_X_axis"          
[13] "Time_Gravity_Accelerometer_StandardDeviation_Y_axis"          
[14] "Time_Gravity_Accelerometer_StandardDeviation_Z_axis"          
[15] "Time_Body_Accelerometer_Jerk_Mean_X_axis"                     
[16] "Time_Body_Accelerometer_Jerk_Mean_Y_axis"                     
[17] "Time_Body_Accelerometer_Jerk_Mean_Z_axis"                     
[18] "Time_Body_Accelerometer_Jerk_StandardDeviation_X_axis"        
[19] "Time_Body_Accelerometer_Jerk_StandardDeviation_Y_axis"        
[20] "Time_Body_Accelerometer_Jerk_StandardDeviation_Z_axis"        
[21] "Time_Body_Gyroscope_Mean_X_axis"                              
[22] "Time_Body_Gyroscope_Mean_Y_axis"                              
[23] "Time_Body_Gyroscope_Mean_Z_axis"                              
[24] "Time_Body_Gyroscope_StandardDeviation_X_axis"                 
[25] "Time_Body_Gyroscope_StandardDeviation_Y_axis"                 
[26] "Time_Body_Gyroscope_StandardDeviation_Z_axis"                 
[27] "Time_Body_Gyroscope_Jerk_Mean_X_axis"                         
[28] "Time_Body_Gyroscope_Jerk_Mean_Y_axis"                         
[29] "Time_Body_Gyroscope_Jerk_Mean_Z_axis"                         
[30] "Time_Body_Gyroscope_Jerk_StandardDeviation_X_axis"            
[31] "Time_Body_Gyroscope_Jerk_StandardDeviation_Y_axis"            
[32] "Time_Body_Gyroscope_Jerk_StandardDeviation_Z_axis"            
[33] "Time_Body_Accelerometer_Magnitude_Mean"                       
[34] "Time_Body_Accelerometer_Magnitude_StandardDeviation"          
[35] "Time_Gravity_Accelerometer_Magnitude_Mean"                    
[36] "Time_Gravity_Accelerometer_Magnitude_StandardDeviation"       
[37] "Time_Body_Accelerometer_Jerk_Magnitude_Mean"                  
[38] "Time_Body_Accelerometer_Jerk_Magnitude_StandardDeviation"     
[39] "Time_Body_Gyroscope_Magnitude_Mean"                           
[40] "Time_Body_Gyroscope_Magnitude_StandardDeviation"              
[41] "Time_Body_Gyroscope_Jerk_Magnitude_Mean"                      
[42] "Time_Body_Gyroscope_Jerk_Magnitude_StandardDeviation"         
[43] "Frequency_Body_Accelerometer_Mean_X_axis"                     
[44] "Frequency_Body_Accelerometer_Mean_Y_axis"                     
[45] "Frequency_Body_Accelerometer_Mean_Z_axis"                     
[46] "Frequency_Body_Accelerometer_StandardDeviation_X_axis"        
[47] "Frequency_Body_Accelerometer_StandardDeviation_Y_axis"        
[48] "Frequency_Body_Accelerometer_StandardDeviation_Z_axis"        
[49] "Frequency_Body_Accelerometer_MeanFrequency_X_axis"            
[50] "Frequency_Body_Accelerometer_MeanFrequency_Y_axis"            
[51] "Frequency_Body_Accelerometer_MeanFrequency_Z_axis"            
[52] "Frequency_Body_Accelerometer_Jerk_Mean_X_axis"                
[53] "Frequency_Body_Accelerometer_Jerk_Mean_Y_axis"                
[54] "Frequency_Body_Accelerometer_Jerk_Mean_Z_axis"                
[55] "Frequency_Body_Accelerometer_Jerk_StandardDeviation_X_axis"   
[56] "Frequency_Body_Accelerometer_Jerk_StandardDeviation_Y_axis"   
[57] "Frequency_Body_Accelerometer_Jerk_StandardDeviation_Z_axis"   
[58] "Frequency_Body_Accelerometer_Jerk_MeanFrequency_X_axis"       
[59] "Frequency_Body_Accelerometer_Jerk_MeanFrequency_Y_axis"       
[60] "Frequency_Body_Accelerometer_Jerk_MeanFrequency_Z_axis"       
[61] "Frequency_Body_Gyroscope_Mean_X_axis"                         
[62] "Frequency_Body_Gyroscope_Mean_Y_axis"                         
[63] "Frequency_Body_Gyroscope_Mean_Z_axis"                         
[64] "Frequency_Body_Gyroscope_StandardDeviation_X_axis"            
[65] "Frequency_Body_Gyroscope_StandardDeviation_Y_axis"            
[66] "Frequency_Body_Gyroscope_StandardDeviation_Z_axis"            
[67] "Frequency_Body_Gyroscope_MeanFrequency_X_axis"                
[68] "Frequency_Body_Gyroscope_MeanFrequency_Y_axis"                
[69] "Frequency_Body_Gyroscope_MeanFrequency_Z_axis"                
[70] "Frequency_Body_Accelerometer_Magnitude_Mean"                  
[71] "Frequency_Body_Accelerometer_Magnitude_StandardDeviation"     
[72] "Frequency_Body_Accelerometer_Magnitude_MeanFrequency"         
[73] "Frequency_Body_Accelerometer_Jerk_Magnitude_Mean"             
[74] "Frequency_Body_Accelerometer_Jerk_Magnitude_StandardDeviation"
[75] "Frequency_Body_Accelerometer_Jerk_Magnitude_MeanFrequency"    
[76] "Frequency_Body_Gyroscope_Magnitude_Mean"                      
[77] "Frequency_Body_Gyroscope_Magnitude_StandardDeviation"         
[78] "Frequency_Body_Gyroscope_Magnitude_MeanFrequency"             
[79] "Frequency_Body_Gyroscope_Jerk_Magnitude_Mean"                 
[80] "Frequency_Body_Gyroscope_Jerk_Magnitude_StandardDeviation"    
[81] "Frequency_Body_Gyroscope_Jerk_Magnitude_MeanFrequency"

These values are then summarized to output the mean value for each of these 81 variables for each SubjectId and Activity.