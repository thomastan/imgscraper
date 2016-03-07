#!/usr/bin/env bash

if [ $# -eq 2 ]; then
	WEBSITE=$2
	RECURSIONDEPTH=$1
else
	WEBSITE=$1
	RECURSIONDEPTH=4
fi

declare -A imgs    # array of url's of images found (no duplicates)
declare -A visited # array of url's of pages visited (so no multi page visits)

# recurse function with depth and URL as $1 and $2 parameters respectively
function visitpage() {
	local pgdepth=$1
	local url=$2

	if [ $pgdepth -eq $RECURSIONDEPTH ]; then
		return
	fi

	# save each img url only once by using an associative array
	for imgsrc in $(perl get.pl $url img); do
		imgs[$imgsrc]=$url  # the page containing the img is saved as the value
	done

	# get links on page using Perl script
	for website in $(perl get.pl $url a); do
		[[ "${visited[$website]}" && : ]] || visitpage $(expr $1 + 1) $website
		visited[$website]=$website
	done
}

# start crawling
visitpage 0 $WEBSITE

if [ ${#imgs[@]} -gt 0 ]; then
	echo "<html>"
	echo "<body>"

	for i in "${!imgs[@]}"; do
		echo '<img src="'$i'" width="25%" />'
	done

	echo "</body>"
	echo "</html>"
fi
