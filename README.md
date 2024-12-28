# Race Condition in Bash Script

This repository demonstrates a race condition bug in a simple bash script. Two background processes concurrently write to separate files.  The script then attempts to combine these files, which can result in data loss or corruption due to the race condition.

The `bug.sh` file contains the buggy script, while `bugSolution.sh` provides a corrected version.

## How to Reproduce

1. Clone the repository.
2. Run `bash bug.sh`.
3. Observe that `combined.txt` might be incomplete or contain errors.
4. Run `bash bugSolution.sh` to see the corrected behavior.

## Bug Explanation

A race condition occurs when the correctness of a program depends on the unpredictable order in which multiple processes execute. In this case, the `cat` command attempts to read the files while the background processes are still writing, leading to inconsistent results.

## Solution

The solution uses appropriate synchronization mechanisms to ensure that file writing operations are completed before attempting to combine them.  Specifically, we use `wait` command to wait for child processes to finish and then combine the file, preventing the race condition.