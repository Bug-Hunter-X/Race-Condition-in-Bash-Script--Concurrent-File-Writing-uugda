#!/bin/bash

# Create two files
touch file1.txt
touch file2.txt

# Start two processes in the background
(while true; do echo "Process 1" >> file1.txt; sleep 0.1; done) &
(while true; do echo "Process 2" >> file2.txt; sleep 0.1; done) &
pid1=$!
pid2=$!

# Wait for a short time to let the processes run
sleep 2

# Stop the background processes
kill $pid1
kill $pid2

# Wait for the processes to finish
wait $pid1
wait $pid2

# Combine the files after processes have finished
cat file1.txt file2.txt > combined.txt

echo "Combined file created: combined.txt"