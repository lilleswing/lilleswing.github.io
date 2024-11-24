#!/bin/bash

# Get the current user's UID and GID
MY_UID=$(id -u)
MY_GID=$(id -g)

# Create the .env file
cat > .env <<EOF
UID=$MY_UID
GID=$MY_GID
EOF

echo ".env file created successfully."
