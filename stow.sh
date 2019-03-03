#!/bin/bash

for var in "$@"
do
	if false; then
		echo "TODO: fill in with special cases"
	else
		stow --stow --target=${HOME} $var
	fi
done
