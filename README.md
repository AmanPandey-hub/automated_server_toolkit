#Automated Server Toolkit 

A lightweight, modular **Bash-based utility** designed to streamline routine Linux system administration tasks. Built as a foundational tool for cloud engineering workflows, this toolkit provides automated system health monitoring and reliable file backups out of the box.



## Features

*   **System Health Monitoring (`--monitor`)**: 
    *   Tracks real-time CPU load and RAM utilization percentages.
    *   Includes built-in threshold checking to trigger warning logs when resource usage crosses predefined limits (e.g., high memory consumption).
*   **Automated Backups (`--backup`)**: 
    *   Securely compresses target directories into timestamped `.tar.gz` archives (`YYYY-MM-DD_HH-MM-SS`).
    *   Validates directory existence and checks exit statuses to ensure reliable, error-free archiving.
*   **Modular CLI Design**: Built using robust case-statement routing and command-line flags for clean execution.

---

##  Prerequisites

*   A Linux environment (Ubuntu, Debian, CentOS, or WSL2 on Windows).
*   Standard command-line utilities (`top`, `free`, `awk`, `tar`, `bc`).

---

##  Installation & Setup

1. Clone or download the repository:
   ```bash
   git clone [https://github.com/AmanPandey-hub/automated_server_toolkit.git](https://github.com/your-username/automated-server-toolkit.git)
   cd automated_server_toolkit

2. Make the script executable:
 
Bash
chmod +x toolkit.sh




## Usage
The toolkit operates via simple command-line flags:

1. Run the System Monitor
Checks current CPU load, memory utilization, and runs threshold evaluations.

Bash
./toolkit.sh --monitor

2. Run the Automated Backup
Compresses your designated source directory and safely stores the archive in your backup destination folder.

Bash
./toolkit.sh --backup




## Configuration
You can customize the source and destination paths for the backup module directly inside toolkit.sh:

Bash
# Path to the directory you want to back up
SOURCE_DIR="$HOME/my_folder_to_backup"

# Path where compressed archives will be saved
BACKUP_DIR="$HOME/backups"
