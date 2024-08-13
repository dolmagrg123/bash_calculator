#!/bin/bash

# The script should prompt the user to enter two integers.
# The script should prompt the user to choose an operation: +,-,*,/
# Use conditionals ('if`, `elif`, `else') to perform the chosen operation.
# Display the result of the operation.
# Handle division by zero with an appropriate error message.

#!/bin/bash

# Function to get a non-null input
get_input() {
    local prompt_message="$1"
    local user_input=""

    while true; do
        read -p "$prompt_message" user_input
        # Strip leading/trailing whitespace
        user_input=$(echo "$user_input" | xargs)
        if [ -z "$user_input" ]; then
            echo "You didn't enter anything. Please try again."
        else
            echo " You entered $user_input"
            return 0
        fi
    done
}

# Main script
main() {
    # Get the first value
    var1=$(get_input "Enter the first value: ")

    # Get the second value
    var2=$(get_input "Enter the second value: ")

    # Display the entered values
    echo "You entered: Value 1 = '$var1' and Value 2 = '$var2'"
}

# Call the main function
main


choose_operator(){
echo -e "Choose an operation\n0.To Quit\n1.For Addition\n2.For Subtraction\n3.For Multiplication\n4.For Division"

# Read user input
read -p "Enter your choice (0-4): " choice

}
choose_operator
# Loop until a valid choice is entered
while [[ "$choice" != "0" && "$choice" != "1" && "$choice" != "2" && "$choice" != "3" && "$choice" != "4" ]]; do
    echo "Invalid choice. Please enter a number between 0 and 4."
    choose_operator
done

# Handle the user's input
if [ "$choice" == "0" ];then
    echo "Quitting"
    exit 0
elif [ "$choice" == "1" ];then
    echo "You selected Option 1."
	result=$(($var1+$var2))
    echo "$var1 added to $var2 is $result"
elif [ "$choice" == "2" ];then
    echo "You selected Option 2."
    result=$((var1-var2))
    echo "$var1 subtract $var2 is $result"
elif [ "$choice" == "3" ];then
    echo "You selected Option 3."
	result=$((var1*var2))
	echo "$var1 multiplied by $var2 is $result"
else
    echo "You selected Option 4."
	result=$((var1/var2))
	echo "$var1 divided by $var2 is $result"
    echo "Invalid choice. Please enter a number between 1 and 4."

fi

