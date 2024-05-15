#!/bin/bash

# Initialize variables
points=0
multiplier=1
upgrade_cost=10
upgrade_level=0

# Function to display player's current status
display_status() {
    clear
    echo "Idle Incremental Bash Game"
    echo "--------------------------"
    echo "Points: $points"
    echo "Multiplier: $multiplier"
    echo "Upgrade Level: $upgrade_level"
    echo "Upgrade Cost: $upgrade_cost points"
    echo "--------------------------"
}

# Function to earn points
earn_points() {
    ((points += multiplier))
}

# Function to upgrade multiplier
upgrade_multiplier() {
    if ((points >= upgrade_cost)); then
        ((points -= upgrade_cost))
        ((multiplier *= 2))
        ((upgrade_level++))
        ((upgrade_cost *= 3))
        echo "Multiplier upgraded! You are now earning $multiplier points per cycle."
        read -n 1 -s -r -p "Press any key to continue..."
    else
        echo "Insufficient points to upgrade multiplier."
        read -n 1 -s -r -p "Press any key to continue..."
    fi
}

# Main game loop
while true; do
    display_status
    earn_points
    read -t 1 -n 1 input
    case $input in
        u) upgrade_multiplier;;
        q) echo "Thanks for playing!"; exit;;
    esac
done
