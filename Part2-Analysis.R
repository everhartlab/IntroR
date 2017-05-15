# 
# Let's Practice!
# ===============
# 
# In this section we will cover:
# 
#  1. Working directories
#  2. Reading in data
#  3. Finding help
#  4. Basic data manipulation (renaming, subsetting, rotating)
#  
#  
# Part 1: Working Directories
# ---------------------------
# 
# A working directory is the folder on your computer where you are currently
# working. You can find out your current working directory by typing `getwd()`

getwd()

# If you've downloaded and un-zipped this directory to your desktop, you might 
# see something like `/Users/<yourname>/Desktop/IntroR`. This is the default 
# place where R will begin reading and writing files. For example, you can use 
# the function `list.files()` to view the files in your current working 
# directory. These are the same files that we downloaded earlier. If you're 
# using Rstudio, you can compare the file list with the "Files" tab in the
# bottom right panel. 
# 
# In order to use `list.files()`, we should provide it with a file path. We can
# provide it a ".", which means "here" to most computer programs.

list.files(".")

# You can see that the first entry in here is "data". This is where we've placed
# the fungicide example data. 

list.files("data")

#
# Part II: Reading in Data
# ------------------------
# 
# 
# We can use the `read.table()` function to read these data in to R. It's
# important to remember that while in R, these data are simply a copy kept *in
# memory*, not on the disk, so we don't have to worry too much about
# accidentally deleting the data :).
# 
# So, how do we actually USE the `read.table()` function? A good first step to
# figuring out how you can use a function is to look at it's help page. The way
# you can do that is by typing either help("function_name") or ?function_name.

if (interactive()) readline("

Type ?read.table and answer these three questions:
     
     1. What does it do? (Description)
     2. What are the first three arguments and their defaults? (Usage/Arguments)
     3. What does it return? (Value)
     
     hit ENTER to continue ")

# 
# In order to read our data into R, we will need to provide three things:
# 
#  1. The path to the data set                 : data/FungicideExample.csv
#  2. If the first row are column names        : yes
#  3. The separator for each cell in the data  : comma
#
# Now that we have these elements, we can read the data into a variable, which
# we can call "fungicide". Once we do this, we can check the dimensions to make
# sure that we have all of the data.

fungicide <- read.csv("data/FungicideExample.csv", header = TRUE, sep = ",")
nrow(fungicide)
ncol(fungicide)

# We can print the data to screen by simply typing its name

fungicide

# We can also use the `str()` function (short for "structure") to have a broad
# overview of what our data looks like. This is useful for data frames with many
# columns.

str(fungicide)

#
# Part III: Finding the right tool for the job
# --------------------------------------------
# 
# 