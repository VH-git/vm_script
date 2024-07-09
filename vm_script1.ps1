#Victor Hermes
#Virtulization


# This displays the main menu
function Show-Menu 
{
    Write-Host "     Virtual Machine Deployment"
    Write-Host "  1. Create a VM"
    Write-Host "  2. List the available VMs"
    Write-Host "  3. Start a VM"
    Write-Host "  4. Stop a VM"
    Write-Host "  5. List the settings of a particular VM"
    Write-Host "  6. Delete a VM"
    Write-Host "  7. End the program"
}

# this create a new VM

function CreateVM 
{
    $vmName = Read-Host "Enter the name for this new virtual machine"
    $pathToVM = Read-Host "Enter the path for this vm (use \Users\Student\Downloads as default)"
    
    New-VM -Name $vmName -Path $pathToVM

    Write-Host "VM Creation Successful" -ForegroundColor Green
}

# this lists all available VMs and a few other bits of data
function ListVM 
{
    Get-VM | Out-Host
}

# this starts a VM
function StartVM 
{
    $vmName = Read-Host "Enter the name of the virtual machine to start"
    Start-VM -Name $vmName
    Write-Host "Virtual machine $vmName started successfully" -ForegroundColor Green
}

# this stops a VM
function StopVM 
{    
    $vmName = Read-Host "Enter the name of the virtual machine to stop"
    Stop-VM -Name $vmName
    Write-Host "Virtual machine $vmName stopped successfully" -ForegroundColor Green
}

# this list the settings of a particular VM and lists a lot of other details
function ListVMSettings 
{    
    $vmName = Read-Host "Enter the name of the virtual machine to list the settings"
    Get-VM -Name $vmName | Format-List *
}

# Function to delete a VM
function RemoveVM 
{    
    
    $vmName = Read-Host "Enter the name of the virtual machine to delete"
    #i stop the vm no matter what so an error isnt thrown
    Stop-VM -Name $vmName
    Remove-VM -Name $vmName -Force
    Write-Host "Virtual machine $vmName deleted successfully" -ForegroundColor Green
    
}

# Where the script starts
while ($true)
{
    Show-Menu
    $choice = Read-Host "Enter your choice"
    switch ($choice) 
    {
        "1" { CreateVM }
        "2" { ListVM }
        "3" { StartVM }
        "4" { StopVM }
        "5" { ListVMSettings }
        "6" { RemoveVM }
        "7" { Write-Host Executing exit command
              exit}
        default { Write-Host "Invalid choice, please try again" -ForegroundColor Red }
    }
}

<# Here are the sites I used to help me.

https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/get-started/create-a-virtual-machine-in-hyper-v?tabs=hyper-v-manager
https://caiomsouza.medium.com/fix-for-powershell-script-not-digitally-signed-69f0ed518715

#>
