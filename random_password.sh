#!/bin/bash
	 
	# Script to Generate a Random Password
	 
	# Function to generate a random password
	generate_password() {
	    local length=$1
	    local password=""
	    local characters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-+=<>?{}"
	 
	    # Loop to generate random characters
	    for ((i=0; i<$length; i++)); do
	        # Generate a random index within the range of characters
	        local index=$((RANDOM % ${#characters}))
	        # Append the character at the random index to the password
	        password+=${characters:index:1}
	    done
	 
	    echo "$password"
	}
	 
	# Main program
	main() {
	    local length=$1
	 
	    # Check if length argument is provided
	    if [[ -z $length ]]; then
	        echo "Error: Please provide the length of the password."
	        exit 1
	    fi
	 
	    # Check if length is a positive integer
	    if ! [[ $length =~ ^[0-9]+$ ]] || [[ $length -lt 1 ]]; then
	        echo "Error: Length must be a positive integer."
	        exit 1
	    fi
	 
	    # Generate the password
	    local password=$(generate_password $length)
	 
	    echo "Generated Password: $password"
	}
	 
	# Call the main function with the provided length argument
	main "$@"
