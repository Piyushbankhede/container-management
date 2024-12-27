# Docker Container Management Script

## Overview
This project is a **Bash script** designed to simplify Docker container management. It provides an interactive menu that allows users to perform common Docker operations without needing to remember complex commands.

---

## Features
- **Show all containers**: List all containers with their ID, name, image, and status.
- **Create a new container**: Create and optionally name a new container from a specified Docker image.
- **Delete a container**: Remove any container, running or stopped.
- **Start a stopped container**: Restart a container that is not currently running.
- **Stop a running container**: Stop a container that is actively running.
- **Inspect a container**: Display detailed information about a container in JSON format.
- **View container logs**: View logs for any container.
- **Exit**: Quit the script.

---

## Prerequisites
- **Docker Installed**: Ensure Docker is installed and configured on your system.  
  [Install Docker](https://docs.docker.com/get-docker/)  
- **Bash Shell**: The script runs in a Bash shell, available on most Unix-based systems (Linux, macOS) and Windows Subsystem for Linux (WSL).

---

## How to Use
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/docker-management-script.git
   cd docker-management-script
