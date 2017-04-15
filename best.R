best <- function(state, outcome) {
    ## Read outcome data
    outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

	## Check that state and outcome are valid
	states <- unique(outcomeData$State)
	if (!state %in% states) stop("invalid state")

    validOutcomes=c("heart attack", "heart failure", "pneumonia")
	if (!outcome %in% validOutcomes) stop("invalid outcome")

    ## Now that we have a valid state get outcomes for this state only
	stateData <- subset(outcomeData, outcomeData$State==state)
	
    ## Replace "Not Available" string with NA to avoid coercion warnings
	stateData[stateData == "Not Available"] <- NA

	## Get column number for each valid outcome
	if (outcome %in% validOutcomes[1]) {
    	colIndex <- which(colnames(stateData) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")
    } else if (outcome %in% validOutcomes[2]) {
    	colIndex <- which(colnames(stateData) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")
	} else if (outcome %in% validOutcomes[3]) {
	    colIndex <- which(colnames(stateData) == "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
	}

    ## Make the valid outcome column numeric so the min calculation will work
	stateData[,c(colIndex)] <- sapply(stateData[,c(colIndex)], as.numeric)

    ## Sort stateData alphabetically by hospital name
	##stateData <- stateData[order(stateData[, "Hospital.Name"]), ]
	## Return hospital name in that state with lowest 30-day death rate
    ##stateData[which.min(stateData[,colIndex]), "Hospital.Name"]

    ## Sort stateData by chosen outcome and then Hospital Name, remove NA values
	stateData <- stateData[order(stateData[, colIndex], stateData[, "Hospital.Name"], na.last=NA), ]
	## Return hospital name in that state with lowest 30-day death rate
    stateData[1, "Hospital.Name"]
}