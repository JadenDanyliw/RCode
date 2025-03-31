Included is an R function that creates a formula to estimate the density of snow based on the gain reading from a snow gauge, for use by the USDA in the Sierra Nevada mountians for flood management and water supply control.  

The function density.gain.model(table) requires the specification of the table parameter. This table must contain the results of the polyethylene block experiment outlined in Section 4.3 of "Calibration Procedure for Snow Gauges" written by Jaden Danyliw and Tristan Richardson. The table must have the following specifications:
- The first column is a list of the densities (x) used in the experiment
- The second column is the measured gains (g) from the experiment
- The table must be either a matrix or data.frame class object in R

The output will print the following to the R console:

Estimated Density = ( log(gain) - beta0 ) / ( beta1 )

Where beta0 and beta1 are the estimated regression coefficients from the linear regression model x = beta0 + beta1 * log(g) + epsilon. These values are reported to three significant digits. 

An example use of this function is as follows, using the provided data analyzed in "Calibration Procedure for Snow Gauges". In this example, the experiment results are in the form of a .csv file in the same directory as the R file, however an .xlsx or .txt file can be used, among others provided the data meets the specifications above.

> table = read.csv("polyethylene_experiment.csv")

> density.gain.model(table)
### Estimated Density = ( log(gain) - 6 ) / ( -4.61 
