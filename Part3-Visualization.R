# 
# Part 3: Data Transformation and Plotting
# ========================================
# 
# So far we have covered:
# 
#  - data types in R
#  - reading in data
#  - subsetting data
#  - reading documentation
#  - using functions
#  - saving data
#  
# Of course, we haven't used one of R's most powerful assets: graphics. This 
# section is dedicated to creating a plot from the data. While R has very
# powerful default plotting functions, we will be using the "ggplot2" package
# for three reasons:
# 
#  1. It relies on a consistent "grammar of graphics" that gives a clear
#     relationship between the data and the visualization 
#  2. It requires consistently "tidy" data, with one row per observaion 
#  3. It's quite popular with the kids nowadays
# 
# We will additionally include a supplementary file for creating plots in the
# default plotting system for those who are curious.
# 
# Expected Outcomes
# -----------------
# 
# After this section, you should have the tools to:
# 
#  1. create a simple plot in ggplot2
#  2. reshape data (aka pivot and unpivot)
#  3. save plots
# 
# Again, since this is a three hour workshop, we do not expect mastery, but this
# at least should give you a starting point. With that in mind, let's get 
# started!
# 
# Packages
# --------
# 
# For the tasks in this example, we will load the "tidyverse" package. This will
# load six packages (see https://tidyverse.tidyverse.org):
# 
#  - ggplot2, for data visualisation.
#  - dplyr, for data manipulation.
#  - tidyr, for data tidying.
#  - readr, for data import.
#  - purrr, for functional programming.
#  - tibble, for tibbles, a modern re-imagining of data frames.
# 
# We will be using the *ggplot2* and *tidyr* packages 

library("tidyverse")

# 
# Data
# ----
# 
# We will be using the same data as before, but we will introduce a new function
# for reading in data from the *readr* package called `read_csv()`. See 
# `?read_csv()` for help.

fungicide <- read_csv("data/FungicideExample.csv")
fungicide

# Note that this looks slightly different than the data frame we saw earlier.
# Never fear, this is still a data frame. We can confirm this with 
# `is.data.frame()`:

is.data.frame(fungicide)

# It's also a "tibble", which is a form of data frame that gives more
# information about your data (e.g. what kind of data the columns are). 
# 
# Reshaping Data
# --------------
# 
# At some point in time, you will need to reshape/rearrange data in R. This is
# a fact of life. Doing this in R is advantageous for three reasons:
# 
#  1. your original data is in tact
#  2. you have a trail of self-documenting changes
#  3. your future self will tank you
# 
# In order to use our data with ggplot2, we need to make sure it is in a "tidy"
# form where we have one observation per row. We currently have six observations
# per row. Thus, we will need to reshape this data from this
# 
#   Julian.Date TwentyOneThirtySevenWheat TwentyOneThirtySevenWheat.trt CutterWheat CutterWheat.Trt JaggerWheat JaggerWheat.Trt
# 1         139                      2.34                          1.81        1.15            1.79        1.85            2.27
# 2         146                      7.56                          7.89        3.62            2.40        6.92            5.00
# 3         154                     28.78                         15.04       17.89            6.21       47.39           20.17
# 
# To this
# 
#    Fungicide Julian.Date                  Cultivar Severity
# 1    control         139 TwentyOneThirtySevenWheat     2.34
# 2    control         146 TwentyOneThirtySevenWheat     7.56
# 3    control         154 TwentyOneThirtySevenWheat    28.78
# 4    control         139               CutterWheat     1.15
# 5    control         146               CutterWheat     3.62
# 6    control         154               CutterWheat    17.89
# 7    control         139               JaggerWheat     1.85
# 8    control         146               JaggerWheat     6.92
# 9    control         154               JaggerWheat    47.39
# 10 treatment         139 TwentyOneThirtySevenWheat     1.81
# 11 treatment         146 TwentyOneThirtySevenWheat     7.89
# 12 treatment         154 TwentyOneThirtySevenWheat    15.04
# 13 treatment         139               CutterWheat     1.79
# 14 treatment         146               CutterWheat     2.40
# 15 treatment         154               CutterWheat     6.21
# 16 treatment         139               JaggerWheat     2.27
# 17 treatment         146               JaggerWheat     5.00
# 18 treatment         154               JaggerWheat    20.17
# 
# This process will 
# 

control   <- fungicide[, c(1, 2, 4, 6)]
treatment <- fungicide[, c(1, 3, 5, 7)]

con.tidy <- gather(data = control, key = Cultivar, value = Severity, -Julian.Date)
con.tidy

colnames(treatment)
colnames(control)
colnames(treatment) <- colnames(control)

trt.tidy <- gather(data = treatment, key = Cultivar, value = Severity, -Julian.Date)

fungicide.tidy <- bind_rows(control = con.tidy, fungicide = trt.tidy, .id = "Experiment")
fungicide.tidy

(fungicide.plot <- ggplot(fungicide.tidy, aes(x = Julian.Date, y = Severity)))
(fungicide.plot <- fungicide.plot + geom_line(aes(color = Cultivar, lty = Experiment)))
(fungicide.plot <- fungicide.plot + geom_point())
(fungicide.plot <- fungicide.plot + facet_wrap(~Cultivar))
(fungicide.plot <- fungicide.plot + facet_wrap(~Cultivar, ncol = 1))
(fungicide.plot <- fungicide.plot + theme_bw(base_size = 16))
(fungicide.plot <- fungicide.plot + theme(aspect.ratio = 1/3))
(fungicide.plot <- fungicide.plot + theme(legend.position = "bottom"))
(fungicide.plot <- fungicide.plot + theme(legend.direction = "vertical"))
(fungicide.plot <- fungicide.plot + theme(panel.grid = element_blank()))
(fungicide.plot <- fungicide.plot + xlab("Calendar Date (Julian)"))
(fungicide.plot <- fungicide.plot + ylab("Disease Severity"))

fungicide.plot <- ggplot(fungicide.tidy, aes(x = Julian.Date, y = Severity)) +
  geom_line(aes(lty = Experiment), size = 1) +
  facet_wrap(~Cultivar, ncol = 1) +
  theme_bw(base_size = 16) +
  theme(aspect.ratio = 1/3) +
  theme(legend.position = "bottom") +
  theme(legend.direction = "vertical") +
  theme(panel.grid = element_blank()) +
  xlab("Calendar Date (Julian)") +
  ylab("Disease Severity")
fungicide.plot

ggsave(filename = "results/figure1.pdf", width = 88, units = "mm")
