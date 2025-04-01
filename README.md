The density.gain.model.R file creates a formula to estimate the density of snow based on the gain reading from a snow gauge, for use by the USDA Forest Service in the Sierra Nevada mountains for flood management and water supply control.  

The function density.gain.model(table) requires the specification of the table parameter. This table must contain the results of the calibration run polyethylene block experiment outlined in Section 4.3 of "Calibration Procedure for Snow Gauges" written by Jaden Danyliw and Tristan Richardson. The table must have the following specifications:
- The first column is a list of the densities (x) used in the experiment
- The second column is the measured gains (g) from the experiment
- The table must be either a matrix or data.frame class object in R

Following the Excel file creation step ensures all of these requirements are met when reading the .xlsx file into R, meaning there needs to be no input or coding done by a lab technician, all that needs to be done is to press run on the code.

The output will print the following to the R console:

> \> Estimated Density = ( log(gain) - beta0 ) / ( beta1 )

Where beta0 and beta1 are the estimated regression coefficients from the linear regression model x = beta0 + beta1 * log(g) + epsilon. These values are reported to three significant digits. 

An example use of this function is as follows, using the provided data analyzed in "Calibration Procedure for Snow Gauges".

> install.packages("readxl")

> library("readxl")

> table = as.data.frame(table)

> table = read_excel("calibrationrun.xlsx")

> density.gain.model(table)

> \> Estimated Density = ( log(gain) - 6 ) / ( -4.61 )
