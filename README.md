# COMPARISON OF IMPUTATION TECHNIQUES FOR RECONSTRUCTION OF BIOMEDICAL SIGNALS
## Introduction<br/>
In this project, the missing data of the biomedical signals is reconstructed using imputation techniques and the comparison is made by finding the errors between the original signal and the reconstructed signal. Handling missing data in real time is very important but difficult for the researchers to find different ways to solve the problem. To handle the missing data 4 techniques are used in this project.<br/>
1. Linear interpolation<br/>
2. Cubic spline interpolation<br/>
3. Last Observation Carried Forward (LOCF)<br/>
4. Autoregressive model<br/>

The reconstructed signal using 4 techniques are compared by finding the error between the original signal and the reconstructed signal. Two experiments are performed to find the average error. One uses random missing values starting from random point and the other experiments uses consecutive missing values starting from a random point. The graphs for the different techniques and for the average errors are plot in the MATLAB software.<br/>

<img src="Images/Case-1.png" width=80%><br/>

Error calculation:<br/>
                <img src="Images/Error formula.png" width=50%><br/>
Where,<br/>
𝑥_𝑔 [𝑛]  = Original signal<br/>
𝑥_𝑟 [𝑛]  = Reconstructed signal<br/>
𝑇 = length of the signal 𝑥_𝑔 [𝑛]<br/>
𝑁 = number of removed random points
	where, 𝑁∈[1,𝑇/3]

### Calculating RMS error using 300 trials for random and consecutive missing data
<img src="Images/300 trials random start random values.png" width=50%><img src="Images/300 trials consecutive missing values.png" width=50%><br/>

### Calculating RMS error using 3000 trials for random and consecutive missing data
<img src="Images/3000 trials random missing values.png" width=50%><img src="Images/3000 trials consecutive missing values.png" width=50%><br/>

### Calculating the error for different imputation techniques with 10 iterations
<img src="Images/Error graph.png" width=80%><br/>

## Conclusion<br/>
* Average error is increasing as the number of missing samples increase<br/>
* Average error for missing samples is lower than for missing intervals (with the same number of missing samples)<br/>
* When the missing samples are randomly distributed, linear and cubic interpolations provide better results and slower error growing rate<br/>
* Linear interpolation is the best for randomly missing samples and for short missing intervals, while autoregressive model is better for longer (than 25 samples) missing intervals<br/>
* For long missing intervals, cubic spline has unpredicted behavior and error is higher than with the other methods<br/>

## Important applications<br/>
* Recognizing variability of heart activity in clinical decision making (Alfaouri et al., 2008);
* Estimating diastolic and systolic blood pressure using photoplethysmography (PPG) signals (Mousavi et al., 2018);
* Analyzing beat-to-beat changes in features such as P waves, QRS complexes, and T waves from single-lead ECGs (Langley et al., 2010).

## **References**<br/>
* Alfaouri, Mikhled, and Khaled Daqrouq. “ECG Signal Denoising By Wavelet Transform Thresholding.” American Journal of Applied Sciences, vol. 5, no. 3, pp. 276–281, 2008<br/>
* Hamer, Robert M., and Pippa M. Simpson. “Last Observation Carried Forward Versus Mixed Models in the Analysis of Psychiatric Clinical Trials.” American Journal of Psychiatry, vol. 166, no. 6, pp. 639–641, 2009.<br/>
* Lambers, James V., and Amber C. Sumner. Explorations in Numerical Analysis. World Scientific Publishing, 2018.<br/>
* Langley, P., et al. “Principal Component Analysis as a Tool for Analyzing Beat-to-Beat Changes in ECG Features: Application to ECG-Derived Respiration.” IEEE Transactions on Biomedical Engineering, vol. 57, no. 4, pp. 821–829, 2010.<br/>
* Mousavi, Seyedeh Somayyeh, et al. “Blood Pressure Estimation from Appropriate and Inappropriate PPG Signals Using A Whole-Based Method.” Biomedical Signal Processing and Control, vol. 47, pp. 196–206, 2018.<br/>

