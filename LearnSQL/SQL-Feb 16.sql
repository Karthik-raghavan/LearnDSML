/* 1. AS scalability increases,  Performance decreases 
PARTITIONING 
CREATING INDEXES 
USER DEFINED FUNCTIONS
STORED PROCEDURES*/


# Data does not get stored in chronological order when getting stored in database(We have to order the data).

# PARTITIONING
  # Based on logical grouping, divide the dataset
  # not related to Window Functions
  # PARTITIONING BY RANGE - RANGE --> Range of Dates 
  # PARTITIONING BY LIST - Lists --> Group by user given Lists/Value
  # No idea on which column to PARTITION - PARTITION BY Hash Value --> Group By Remainders
  # To ensure earching becomes easier.

# CREATING INDEXES 
  # Purely for fast Searching using a Value
  # Memory Address
  # Trade off between speed and memory

# USER DEFINED FUNCTIONS:
  # function is a logic taking an input and giving an output
  # f(x) = y
  # f(x,y) = z
  # one/more input and one output

# STORED PROCEDURES
  # Similar to function
  # definition
  # Call
  
