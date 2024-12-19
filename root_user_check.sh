#!/bin/bash

root(){
  sudo grep -a "root" $file
}

read -p "Please enter file path: " file

root
