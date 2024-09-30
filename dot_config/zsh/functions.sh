# Function to validate, clean, and search JSON from clipboard
json_search() {
    # Capture clipboard content (which should be JSON)
    json=$(pbpaste)

    # Function to clean JSON using jsonlint and update the clipboard
    clean_json() {
        # Try to clean the JSON using jsonlint
        cleaned_json=$(echo "$json" | jsonlint --quiet --compact 2>/dev/null)
        
        if [[ $? -ne 0 ]]; then
            echo "Invalid JSON and couldn't be automatically cleaned."
            return 1
        else
            echo "Cleaned JSON detected. Updating clipboard."
            echo "$cleaned_json" | pbcopy
            json="$cleaned_json"  # Update local json variable with cleaned version
        fi
    }

    # Validate JSON using jsonlint
    echo "$json" | jsonlint --quiet >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo "Invalid JSON detected."

        # Attempt to clean the JSON and place it back in the clipboard
        clean_json
        if [[ $? -ne 0 ]]; then
            return 1
        fi
    else
        echo "JSON is valid."
    fi

    # Pretty print the JSON using jq
    echo "Pretty JSON:"
    echo "$json" | jq .

    # Read the value to search for
    read -p "Enter value to search: " value

    # Search for the value in the JSON and print matching paths
    echo ""
    echo "Paths where value '$value' is found:"
    echo "$json" | jq --arg v "$value" 'paths(scalars) as $p | select(getpath($p) == $v) | $p'
}

# End of function

