#!/bin/bash

# Function to display the menu
show_menu() {
    clear
    echo "========================="
    echo "  Container Management"
    echo "========================="
    echo "1. Show all containers"
    echo "2. Create a new container"
    echo "3. Delete a container"
    echo "4. Start a container"
    echo "5. Stop a running container"
    echo "6. Inspect a container"
    echo "7. View logs of a container"
    echo "8. Exit"
    echo "========================="
    echo -n "Enter your choice: "
}

# Function to show all containers
show_containers() {
    echo "Listing all containers:"
    docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"
}

# Function to create a new container
create_container() {
    echo -n "Enter the image name to create a container: "
    read image_name
    if [ -z "$image_name" ]; then
        echo "Image name cannot be empty."
    else
        echo -n "Enter a name for the container (optional): "
        read container_name
        if [ -z "$container_name" ]; then
            docker run -d "$image_name"
        else
            docker run -d --name "$container_name" "$image_name"
        fi
        echo "Container created successfully."
    fi
}

# Function to delete a container
delete_container() {
    echo "Select a container to delete:"
    docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"
    echo -n "Enter the container ID or name to delete: "
    read container_id
    if [ -z "$container_id" ]; then
        echo "Container ID/Name cannot be empty."
    else
        docker rm -f "$container_id"
        echo "Container deleted successfully."
    fi
}

# Function to start a stopped container
start_container() {
    echo "Select a stopped container to start:"
    docker ps -a --filter "status=exited" --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"
    echo -n "Enter the container ID or name to start: "
    read container_id
    if [ -z "$container_id" ]; then
        echo "Container ID/Name cannot be empty."
    else
        docker start "$container_id"
        echo "Container started successfully."
    fi
}

# Function to stop a running container
stop_container() {
    echo "Select a running container to stop:"
    docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"
    echo -n "Enter the container ID or name to stop: "
    read container_id
    if [ -z "$container_id" ]; then
        echo "Container ID/Name cannot be empty."
    else
        docker stop "$container_id"
        echo "Container stopped successfully."
    fi
}

# Function to inspect a container
inspect_container() {
    echo "Select a container to inspect:"
    docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"
    echo -n "Enter the container ID or name to inspect: "
    read container_id
    if [ -z "$container_id" ]; then
        echo "Container ID/Name cannot be empty."
    else
        docker inspect "$container_id"
    fi
}

# Function to view logs of a container
view_logs() {
    echo "Select a container to view logs:"
    docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"
    echo -n "Enter the container ID or name to view logs: "
    read container_id
    if [ -z "$container_id" ]; then
        echo "Container ID/Name cannot be empty."
    else
        docker logs "$container_id"
    fi
}

# Main script loop
while true; do
    show_menu
    read choice
    case $choice in
        1) 
            show_containers
            ;;
        2) 
            create_container
            ;;
        3) 
            delete_container
            ;;
        4) 
            start_container
            ;;
        5) 
            stop_container
            ;;
        6) 
            inspect_container
            ;;
        7) 
            view_logs
            ;;
        8) 
            echo "Exiting the program."
            exit 0
            ;;
        *) 
            echo "Invalid choice. Please try again."
            ;;
    esac
    echo -n "Press Enter to continue..."
    read
done
