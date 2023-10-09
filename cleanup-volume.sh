## This script deletes all databases in the "h2-data" directory.
## It takes the optional parameter "older than" which deletes all files that are older than the specified number in days.
dir_to_clean="h2-data"

# Check if an "older than" parameter is provided
if [ -n "$1" ]; then
    # Calculate the date N days ago
    older_than_date=$(date -d "$1 days ago" +%s)

    # Loop through the files in the directory
    for file in "$dir_to_clean"/*; do
        # Check if the file is older than the specified date
        if [ "$(date -r "$file" +%s)" -lt "$older_than_date" ]; then
            # Delete the file
            rm -f "$file"
            echo "Deleted $file"
        fi
    done
else
    # If no "older than" parameter is provided, delete all files in the directory
    rm -f "$dir_to_clean"/*
    echo "Deleted all files in $dir_to_clean"
fi
