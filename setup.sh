#!/bin/bash
set -e

# Update package lists and install prerequisites
echo "Updating package lists and installing prerequisites..."
apt-get update && apt-get install -y curl gnupg

# Check if gcloud CLI is already installed
if ! command -v gcloud &> /dev/null; then
    echo "Installing Google Cloud SDK (gcloud CLI)..."
    curl -sSL https://sdk.cloud.google.com | bash

    # Reload the shell environment to update PATH for gcloud
    exec -l $SHELL
else
    echo "gcloud CLI is already installed."
fi

# Initialize gcloud in quiet mode to prevent interactive prompts
echo "Initializing gcloud CLI..."
gcloud init --quiet || echo "gcloud init failed - please run 'gcloud init' manually if needed."

echo "Setup complete. Your Codespace now includes GitHub Copilot and the configured gcloud CLI."