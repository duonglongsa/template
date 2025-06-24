#!/bin/bash

# Script to test CodeQL analysis locally
echo "Setting up CodeQL CLI for local testing..."

# Check if CodeQL CLI is installed locally or in PATH
if [ -d "codeql_cli" ] && [ -x "codeql_cli/codeql/codeql" ]; then
    export PATH=$PWD/codeql_cli/codeql:$PATH
    echo "CodeQL CLI found locally."
elif command -v codeql &> /dev/null; then
    echo "CodeQL CLI already installed in PATH."
else
    echo "CodeQL CLI not found. Installing CodeQL CLI..."
    # Download and install CodeQL CLI (for macOS in this case, adjust for other OS if needed)
    curl -L https://github.com/github/codeql-cli-binaries/releases/latest/download/codeql-osx64.zip -o codeql.zip
    unzip codeql.zip -d codeql_cli
    export PATH=$PWD/codeql_cli/codeql:$PATH
    echo "CodeQL CLI installed."
fi

# Create a CodeQL database for the project
echo "Creating CodeQL database for the project..."
codeql database create my-project-db --language=java --command="mvn clean install" --overwrite

# Run the analysis with custom queries
echo "Running CodeQL analysis with custom queries..."
codeql database analyze my-project-db --format=sarif-latest --output=codeql-results.sarif .codeql/queries/api_endpoints.ql .codeql/queries/external_calls.ql

echo "Analysis complete. Results are in codeql-results.sarif"
echo "You can view the results using a SARIF viewer or upload them to GitHub for a better UI experience."
