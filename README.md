# R-Programming-Assignment-3
R Programming by Johns Hopkins University on Coursera Assignment 3

## Introduction
Unzip the data file in a directory that will serve as your working directory. When you
start up R make sure to change your working directory to the directory where you unzipped the data.

The data for this assignment come from the Hospital Compare web site (http://hospitalcompare.hhs.gov)
run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and
information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S. This dataset es-
sentially covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining
whether hospitals should be fined for not providing high quality care to patients (see http://goo.gl/jAXFX
for some background on this particular topic).

The Hospital Compare web site contains a lot of data and we will only look at a small subset for this
assignment. The zip file contains one file

• outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates
for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.

## Finding the best hospital in a state
Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should
be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals "b", "c",
and "f" are tied for best, then hospital "b" should be returned).

## Ranking hospitals by outcome in a state
Handling ties. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause
of death. In those cases ties should be broken by using the hospital name. For example, in Texas ("TX"),
the hospitals with lowest 30-day mortality rate for heart failure are shown here.

## Ranking hospitals in all states
Handling ties. The rankall function should handle ties in the 30-day mortality rates in the same way
that the rankhospital function handles ties.
