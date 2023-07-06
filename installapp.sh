#!/bin/bash

# Array of container IDs
container_ids=("frontend" "backend" "websocket" "queue-default" "queue-short" "queue-long" "scheduler")

# Command to execute
command_to_execute="bench get-app"

#Getting project name
echo "Enter the Project Name:"
read projectname

#Getting app name
echo "Enter the app name:"
read appname

# Loop through the container IDs and execute the command
for container_id in "${container_ids[@]}"
do
    echo "Executing command on container $container_id"
    docker compose --project-name $projectname exec $container_id $command_to_execute $appname
done
