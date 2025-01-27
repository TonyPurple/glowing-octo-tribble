#!/bin/bash

# Prompt for encrypted file name
echo "Enter the name of the encrypted file to decrypt:"
read encrypted_file

# Check if the encrypted file exists
if [[ ! -f $encrypted_file ]]; then
  echo "File '$encrypted_file' does not exist. Please provide a valid file name."
  exit 1
fi

# Prompt for output file name
echo "Enter the name of the output file for the decrypted content:"
read output_file

# Prompt for passphrase
echo "Enter the passphrase for decryption:"
read -s passphrase

# Decrypt the file
gpg --decrypt --passphrase "$passphrase" --batch --output "$output_file" "$encrypted_file"

# Check if the decryption was successful
if [[ $? -eq 0 ]]; then
  echo "File decrypted successfully. Output saved to '$output_file'."
else
  echo "Decryption failed. Please check the passphrase and try again."
fi
