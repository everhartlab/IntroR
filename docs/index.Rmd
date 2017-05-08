# R for Plant Pathologists

An introduction to R for plant pathologists written by Drs. Sydney E. Everhart
and Zhian N. Kamvar

This repository is intended to serve as an additional resource for short 
workshops given at Univeristy of Nebraska and The 2017 North-Central American
Phytopathological Society Meeting. The source code can be found at 
https://github.com/everhartlab/IntroR.

## About 

This introduction to R is designed to be a companion to a workshop lasting 3 
hours introducing plant pathologists to the basics of R by using a 
[real world stripe rust example]. 

## Goals

As a result of taking this workshop you should be able to:

 - find, download, and load necessary packages for analysis
 - load tabular data into R
 - understand the basics of data manipulation in R
 - know what a data frame, vector, and function are
 - summarize data
 - visualize data
 - troubleshoot commmon problems

[real world stripe rust example]: http://www.apsnet.org/edcenter/advanced/topics/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/StripeRust.aspx "APS Education Center: Using the area under the disease progress curve to compare disease severity"

## Website

The website located at http://everhartlab.github.io/IntroR can be build via the
`make` program:

```make
make clean # run this to build the site from scratch
make
```

Note: if the README.md is changed, make will force-update the index.Rmd and in
turn force update the corresponding HTML.
