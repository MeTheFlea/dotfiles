#!/bin/bash

for var in "$@"
do
	if [ "$var" = "code" ]; then
		stow --stow --target=${HOME}/.config/Code\ -\ OSS/User $var
	else
		stow --stow --target=${HOME} $var
	fi
done
