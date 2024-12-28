#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes in the background
(while true; do echo "Process 1" >> file1.txt; sleep 0.1; done) &
(while true; do echo "Process 2" >> file2.txt; sleep 0.1; done) &

# Wait for a short time to let the processes run
sleep 2

# Try to combine the files. If the processes are still writing,
# you may get an error or an incomplete file
cat file1.txt file2.txt > combined.txt

#Stop the processes using kill. This is important for the demo to stop the processes, otherwise it won't terminate.
kill %1
kill %2

echo "Combined file created: combined.txt"

#The result is an incomplete file because the processes might have been in the middle of writing to the files when they were combined, making combined.txt incomplete.
#The actual output varies run to run due to race condition.