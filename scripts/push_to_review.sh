#!/bin/bash
dir=$1

if [ $dir == '']; then
	echo "Parameter for repository directory missing! Using $KMVAR_GIT_PATH_TO_REPO."
	# exit
	dir=$KMVAR_GIT_PATH_TO_REPO
fi
if [ ! -d $dir ]; then
	echo "Directory $dir not found!"
	exit -1
fi

echo "Switching to repository: " $dir
cd $dir
work_branch=$(git branch | sed -n 's/^\* \(.*\)/\1/p')
review_branch=$(git branch | sed -n 's/^\* \(.*\)/\1/p' | sed -n 's/^work/review/p')
echo "Working branch: " $work_branch
echo "New branch: " $review_branch
echo "Pushing!"
git push origin $work_branch:$review_branch
