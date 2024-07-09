import os, subprocess, time
import virtualbox

# Victor Hermes

vbox = virtualbox.VirtualBox()

#here is the menu
def menu():
    #menu options
    print("Enter Selection:\n")
    print("\t1 - Create a VM")
    print("\t2 - List the available VMs")
    print("\t3 - Start a VM")
    print("\t4 - Stop a VM")
    print("\t5 - List the settings of a particular VM")
    print("\t6 - Delete a VM")
    print("\t7 - End the program")

def create_vm():
    print("option 1")
    time.sleep(4)

def list_vms():
    print("option 2")
    time.sleep(4)

def start_vm():
    print("option 3")
    time.sleep(4)

def stop_vm():
    print("option 4")
    time.sleep(4)

def list_stats_vm():
    print("option 5")
    time.sleep(4)

def delete_vm():
    print("option 6")
    time.sleep(4)

while True:
    os.system('cls')
    #menu loads up
    menu()
    #asks user for menu selection
    usrInput = input(f"Please enter a number (1-7): ")
    #if statements for each option
    os.system('cls')
    if usrInput == "1":
        create_vm()
    elif usrInput == "2":
        list_vms()
    elif usrInput == "3":
        start_vm()
    elif usrInput == "4":
        stop_vm()
    elif usrInput == "5":
        list_stats_vm()
    elif usrInput == "6":
        delete_vm()
    elif usrInput == "7":
        print("option 7")
        print("Thank you, have a good day!")
        time.sleep(2)
        exit(0)
    else:
        os.system('cls')
        print("Not a valid input. Try again")
        time.sleep(3)