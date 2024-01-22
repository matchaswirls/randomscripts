#!/bin/zsh

# Check if a Python file is provided as an argument
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <python_script>"
    exit 1
fi

PYTHON_SCRIPT=$1

echo "Running Flake8 (Style Check)..."
flake8_output=$(flake8 $PYTHON_SCRIPT 2>&1)
flake8_status=$?

echo "Running Pylint (Code Quality Check)..."
pylint_output=$(pylint $PYTHON_SCRIPT 2>&1)
pylint_status=$?

echo "Running Bandit (Security Check)..."
bandit_output=$(bandit -r $PYTHON_SCRIPT 2>&1)
bandit_status=$?

# Function to display test result
display_result() {
    if [ $1 -eq 0 ]; then
        echo -e "\033[0;32m\u2713 Test Passed\033[0m"
        echo "$2"
    else
        echo -e "\033[0;31m\u2717 Test Failed\033[0m"
        echo "$2"
    fi
}

# Display results
echo "=== Flake8 (Style Check) ==="
display_result $flake8_status "$flake8_output"

echo "=== Pylint (Code Quality Check) ==="
display_result $pylint_status "$pylint_output"

echo "=== Bandit (Security Check) ==="
display_result $bandit_status "$bandit_output
