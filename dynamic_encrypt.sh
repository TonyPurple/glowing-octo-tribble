#!/bin/bash

# Prompt for input file name
echo "Enter the name of the plaintext file to encrypt:"
read plaintext_file

# Check if the file exists
if [[ ! -f $plaintext_file ]]; then
  echo "File '$plaintext_file' does not exist. Creating it..."
  echo "Enter content for the new file:"
  read file_content
  echo "$file_content" > "$plaintext_file"
  echo "File '$plaintext_file' created."
fi

# Prompt for output file name
echo "Enter the name of the encrypted file to create:"
read encrypted_file

# Prompt for passphrase
echo "Enter a passphrase for encryption:"
read -s passphrase

# Encrypt the file
gpg --symmetric --cipher-algo AES256 --passphrase "$passphrase" --batch --output "$encrypted_file" "$plaintext_file" && echo "File encrypted to '$encrypted_file'."
