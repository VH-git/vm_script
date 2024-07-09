# Function to display the main menu
function Show-Menu {
    Clear-Host
    Write-Host "=== Virtual Machine Deployment ===" -ForegroundColor Green
    Write-Host "1. Create a VM"
    Write-Host "2. List the available VMs"
    Write-Host "3. Start a VM"
    Write-Host "4. Stop a VM"
    Write-Host "5. List the settings of a particular VM"
    Write-Host "6. Delete a VM"
    Write-Host "7. End the program"
}

# Function to create a new VM
function Create-VM {
    Clear-Host
    $VMName = Read-Host "Enter the name of the new virtual machine"
    $Memory = Read-Host "Enter the amount of memory for the virtual machine (in MB)"
    $VHDPath = Read-Host "Enter the path to the VHD file for the virtual machine"
    $SwitchName = Read-Host "Enter the name of the virtual switch for the virtual machine"
    $NewVM = New-VM -Name $VMName -MemoryStartupBytes $Memory -Path $VHDPath -SwitchName $SwitchName
    Write-Host "Virtual machine $VMName created successfully" -ForegroundColor Green
}

# Function to list available VMs
function List-VM {
    Clear-Host
    Get-VM | Select-Object Name
}

# Function to start a VM
function Start-VM {
    Clear-Host
    $VMName = Read-Host "Enter the name of the virtual machine to start"
    Start-VM -Name $VMName
    Write-Host "Virtual machine $VMName started successfully" -ForegroundColor Green
}

# Function to stop a VM
function Stop-VM {
    Clear-Host
    $VMName = Read-Host "Enter the name of the virtual machine to stop"
    Stop-VM -Name $VMName
    Write-Host "Virtual machine $VMName stopped successfully" -ForegroundColor Green
}

# Function to list the settings of a particular VM
function List-VMSettings {
    Clear-Host
    $VMName = Read-Host "Enter the name of the virtual machine to list the settings"
    Get-VM -Name $VMName | Format-List *
}

# Function to delete a VM
function Remove-VM {
    Clear-Host
    $VMName = Read-Host "Enter the name of the virtual machine to delete"
    Remove-VM -Name $VMName -Force
    Write-Host "Virtual machine $VMName deleted successfully" -ForegroundColor Green
}

# Main script
while ($true) {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    switch ($choice) {
        "1" { Create-VM }
        "2" { List-VM }
        "3" { Start-VM }
        "4" { Stop-VM }
        "5" { List-VMSettings }
        "6" { Remove-VM }
        "7" { 
                Write-Host Executing exit command
                exit
            }
        default { Write-Host "Invalid choice, please try again" -ForegroundColor Red }
    }
}