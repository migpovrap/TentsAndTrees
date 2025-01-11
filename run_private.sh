#!/bin/bash

# Run the tests in testesParaMooshakAlunos.pl against Projeto.pl and save the output
timeout 90s swipl -s ./src/Projeto.pl -s ./tests/testesParaMooshakAlunos.pl -g "halt." > ./tests/actual_output.txt

# Compare the actual output with the expected output
if diff -q ./tests/actual_output.txt ./tests/expected_output.txt > /dev/null; then
    echo "All tests passed!"
else
    echo "Some tests failed. Differences:"
    diff ./tests/actual_output.txt ./tests/expected_output.txt > ./tests/diff_output.txt
fi