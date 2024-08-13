#!/bin/bash

# The script should prompt the user to enter two integers.
# The script should prompt the user to choose an operation: +,-,*,/
# Use conditionals ('if`, `elif`, `else') to perform the chosen operation.
# Display the result of the operation.
# Handle division by zero with an appropriate error message.

calculator(){
    line="--------------------------------------------"
    main() {
        # Function to get a value with error handling
        get_value() {
            #assigns the value of the first argument passed to the function 
            prompt="$1"
            #assigns the value of the second argument passed to the function 
            var_name="$2"
            input=""

            #loop until user enters a value
            while true; do
                read -p "$prompt" input #print the message until valid input
                if [[ -z "$input" ]]; then #check if input is null or not using -z, -z return true if string is empty
                    echo "Error: Input cannot be empty. Please try again."
                else
                    eval "$var_name='$input'" # Uses eval to dynamically assign the value of input to the variable named by var_name
                    break
                fi
            done
        }

        # Get the first value, call function get_value with first argument as message and second argument var1
        get_value "Enter First Value: " var1

        # Get the second value, call function get_value with first argument as message and second argument var2
        get_value "Enter Second Value: " var2

        # Display the values entered
        echo "$line"
        echo "You Entered First value: $var1"
        echo "You Entered Second value: $var2"
        echo "$line"
    }

    main #call the main function

    #Function to read input for operator Choice
    choose_operator(){
    echo -e "Choose an operation\n0.To Quit\n1.For Addition\n2.For Subtraction\n3.For Multiplication\n4.For Division\n"
    echo "$line"
    echo "$line"

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
        exit 0 # exit 0 since the program is exiting without any erros
    elif [ "$choice" == "1" ];then
        echo "You selected Option 1."
        echo "$line"
        result=$(($var1+$var2))
        echo "$var1 added to $var2 is $result"
    elif [ "$choice" == "2" ];then
        echo "You selected Option 2."
        echo "$line"
        result=$((var1-var2))
        echo "$var1 subtract $var2 is $result"
    elif [ "$choice" == "3" ];then
        echo "You selected Option 3."
        echo "$line"
        result=$((var1*var2))
        echo "$var1 multiplied by $var2 is $result"
    else
        echo "You selected Option 4."
        #condition to check if value is 0
        if [[ "$var2" == 0 ]];then
            echo "$line"
            echo "Error: Division by zero not allowed"
        else
            result=$((var1/var2))
            echo "$line"
            echo "$var1 divided by $var2 is $result"
        fi

    fi
}

calculator

#loop until it reaches exit statement
while true;do
    echo "$line"
    read -p "Please enter 'Y' to calculate again, or any other key to EXIT: " answer
    echo "$line"
    if [[ $answer == "Y" || $answer == "y" ]];then
        calculator
    else
        echo "GOODBYE!!! Thank you for using our calculator"
        exit 0
    fi
done


