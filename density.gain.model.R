# Create a formula to estimate the density of snow based on the gain reading 
# from a snow gauge
# > parameter table: a matrix or data.frame class object with the first column
#   containing density data and the second column containing gain measurements
#   from the calibration run experiment

density.gain.model = function(table){
  # Obtain the density and gain information from a supplied table
  density = table[,1]
  gain = table[,2]
  
  # Create Model
  model = lm(log(gain) ~ density)
  
  # Obtain estimates
  options(digits=3)
  beta0.hat = unname(model$coef[1])
  beta1.hat = unname(model$coef[2])
  
  # Print the formula to the console
  cat("\n Estimated Density = ( log(gain) -", 
      beta0.hat, ") / (", beta1.hat, ")\n ")
}