# 
# Let's get familiar with R 
# =========================
# 
# In this section we will investigate the following questions:
#  [[  How does R understand data?  ]]
#
#  1. How to use this script and R
#  2. Creating objects
#  3. Sequences and vectors (1-D)
#  4. Matrices and dataframes (2-D)
#  
# Part 1: How to use this R scrpt
# -------------------------------
# 
# A script is a text document that contains instructions and commands The # 
# symbol is used to leave comments, which R will not try to interpret as a 
# command.
# 
# The console (below) is for submitting commands to be interpreted in R. To run 
# a command in the console, you can copy+paste it into the console and press 
# enter.
# 
# Copy and paste the following into the console and run it:

    print("the instructor's name is Sydney")  

#Run a single line of your script in the console by placing your cursor on the 
#line you want to submit and use your cursor to press the "Run" button at the 
#top right. You can also use the shortcut key strokes cmd+enter (mac) or 
#ctrl+enter (PC) to run a single line at a time.
#
#The two other most important keyboard shortcuts that you'll want to use are the
#*Tab* key to auto-complete your typing at the command line and ctrl+up arrow or
#cmd+up arrow to access the most recently typed commands.
#
#You can also select only part of a line to have it run on the console.  Try
#running the following command without copy+paste:   print("my name is _____")
#
#R can also be used to perform calculations, such as the following:

5+1/3

# What rules does R apply for the order of operations and how do you find out?
# 
# Let's modify the statement above to see if adding parentheses changes the
# result:

(5+1)/3

# Does it matter if there are spaces added into this?
#
 ( 5 + 1 ) / 3

# That shows us that the spaces did not matter for the calculation.
#
# R also has some pre-defined matematical terms that you can use, such as pi.
#
# What is pi times pi ?

pi*pi

pi^2   # this does the same thing because ^ is, here, interpreted as "taken to the exponent"

# 
# Part 2: Creating objects -------------------------
# 
# Objects are like shortcuts.  They are a way to store data without having to 
# re-type them.  By virtue, objects are only created once something has been 
# assigned to them.  Anything can be stored in an object, including figures!

# Let's repeat our simple math calculation above, this time using objects. It we
# want to calculate (5+1)/3 using objects, it needs to look like this: (a+b)/c
# The objects a, b, and c do not exist yet, so we need to assign values to them
# in order to create them. R interprets the less than symbol and dash as
# "assign".  So we need to do the following:

a <- 5   # assign the number 5 to a
b <- 1   # assign number 1 to b
c <- 3   # assign 3 to c

# As you are assigning these numbers to objects, they appear in your environment
# (top right).  These objects are not being saved to a hard drive, they are
# stored in memory of your computer only.
#
# **DANGER** if you assign something to an object that already exists, R will do
# what you tell it and overwrite that obect with the new assignment.
#
# Now we can execute our calculation using objects instead of numbers.  Try it!

(a+b)/c

# Avoid creating object names that start with a numnber because R will look at
# the first character and try to enterpret the entire name as a mathematical
# term.  Try this:

2foxes <- 1   

# The error here tells us that something went wrong and R cannot proceed.
#
# If we want to assign (a+b)/c to a new object called 'answer' -- what will the
# object contain?  Find out:

answer <- (a+b)/c

# Take a look at the object 'answer' by typing the name into the command line:

answer

# What would you get if you multiplied answer by 2?

answer*2

# The examples above dealt with numeric values assigned to objects.  We can also
# store character data in objects.  Since some words and phrases can contain 
# spaces or other punctuation, we need to place our words and phrases inside 
# quotation marks.
# 
# Let's use my name for this exercise.  Let's create two objects, one for my
# first name and another for my last name.  

first.name <- "Sydney"
last.name <- 'Everhart'  # Single quotes work too!

# We now have those two objects.  Let's look at them.

first.name
last.name

# Since we each have a first name and a family name, I want you to modify these
# objects so that instead of my name, they contain your name. 

first.name <- "Sydney"  #Replace my name with your own name
last.name <- "Everhart"

# Did this work?  Let's look at the two objects:

first.name
last.name

# Using a function c() we can tell R to *combine* these two objects.  This
# function will combine values from the first object with the second object and
# return them as a single observation.  Let's try it:

c(first.name, last.name)

# Notice how the names are returned inside quotation marks, which tells us that
# these are interpreted as character data in R. You'll also notice that each
# name is placed inside quotes and that's because c() combined names into a
# single vector that contains two items, your first and your last name.  This
# brings us to the next part in our introduction, vectors.
#

# Part 3: Vectors and sequences -----------------------------
# 
# Up to here, the objects we've created only contained a single item. You can 
# store more than one item in an object.  However, R likes to help you keep 
# these items organized.
# 
# Let's create an object that is a vector of our first and last names using the
# two objects that we created previously.
# 
# *Avoid re-typing your commands.* Since the last command that we ran contained 
# what we want, we can simply use the up arrow to access the most recently 
# submitted command and modify it. You can also access the *History* tab in the 
# top right panel of RStudio or, at the command line, access a list of the most 
# recent commands using the cmd + up arrow OR the ctrl + up arrow.

name <- c(first.name, last.name)

# We can inspect this object by typing *name* at the command line. We can
# inspect the structure of this object using the function str() on name.

str(name)

# This shows us that this is a vector because the items in it are ordered from 1
# to 2 as shown by the [1:2]. This also tells us that this list is a *character*
# list, which is indicated by the *chr* label. We also see the two items in this
# vector, which is your first and last name.
#
# What is the length of your name?  We can find out using the function lenght()

length(name)

# Let's compare this to a vector that contains only numeric data. For this
# example, let's use today's date represented in numbers for the month (05), day
# (18), and year (2017).  

today <- c(05, 18, 2017)

# Inspect this object by typing the name *today* at the command line. You'll see
# that R has eliminated the zero that preceeds the 5 and has kept the order we
# provided for these items in the vector.  Let's take a look at the structure of today.

str(today)

# You'll notice that the vector has three items [1:3] and it contains only 
# numeric data.
# 
# Let's re-code the date using names for the month and see how that changes our
# vector.

today <- c("May", 18, 2017)

str(today)

# Notice how R is trying to keep our list organized.  Rather than coding this
# vector as containing numbers and characters, it has decided that because it
# can't call everything in our vector a number that it will call everything
# characters.
# 

# Let's say that we have 5 fungicide concentrations that were used in an 
# experiment: 0.5, 1.0, 1.5, 2.0, and 10.  We can store these items in an 
# object.  Let's use a name that is short and easy to remember.




# It is easier to understand objects if we are working on a real problem.  The
# PI in your lab group wants you to

#Let's say we have a new fungicide for control of wheat stipe rust.  We want to 
#determine the amount of fungicide needed to control disease, first conducted in
#a greenhouse experiment. the fungicide in a greenhouse experiment


#We have obtained data from an experiment that was designed to assess the best
#method for control of stripe rust disease. Fungicides can be used help reduce
#disease.
#
#Anne was the scientist performing this experiment had field plots in a single
#location. She rated stripe rust disease severity on the wheat cultivar 'Cutter'
#that was either treated with fungicide or *not* treated with fungicide. Her
#ratings for disease were made nine times during the growing season.  Here are
#her disease severity data from the experiment.
#
#'Cutter' without fungicide: 1.15, 3.62, 17.89 'Cutter' with fungicide: 1.79,
#2.4, 6.21
#
#Anne is summarizing her data and wants to know how much fungicide application
#was able to reduce the disease severity.  She wants to know this for each day
#and also for the cumulative disease severity rating.
#
#How would you accomplish this if you were using Excel or some other tool?
#
#
#This is a small data set, so let's create two vectors for this comparison. 
#Vectors are simply a contiguous set of cells that contain data of the same
#type, so in this case we want to keep our data as numeric.  Let's create two
#vectors and assign them to be stored inside two objects, one called 'cut.fung'
#and 'cut.none'.
#
#Here we've used the c() function to *combine* data together

cut.fung <- c(0, 0, 0, 0, 0, 0, 0, 1.15, 3.62, 17.89)
cut.none <- c(0, 0, 0, 0, 0, 0, 1.79, 2.4, 6.21)

# 
# 

# 
# Part 4: Matricies and evaluating a matrix
# -----------------------------------------
# 
