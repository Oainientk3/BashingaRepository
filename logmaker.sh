#!/bin/bash

#appends the log file whenever a file is logged in or out of the repository
log(file) {
	if [$logoutstatus=1]
		cat >> file " was logged out"
	fi
	if [$logoutstatus=0]
		cat >> file " was logged in"
	fi
}
