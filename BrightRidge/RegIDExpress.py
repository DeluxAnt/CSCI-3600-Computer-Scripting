####################################################
#Filename: RegIDExpress.py
#Author: Anthony Vandergriff (VANDERGRIFF@ETSU.EDU)
#Created: 12/15/2022
#Goal: automaticaly assign the registration id for 
#   BrightRidge's ONTs
####################################################

import colorsys
import wmi
import ctypes, sys
import time

# selenium 4
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.edge.service import Service as EdgeService
from webdriver_manager.microsoft import EdgeChromiumDriverManager


def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False
if is_admin():

    while True:
        try:
            numID = int(input('Enter Reg ID: '))
            print(numID)
            break
        except ValueError:
            print('Please enter an integer.')
    
    # Obtain network adaptors configurations
    nic_configs = wmi.WMI().Win32_NetworkAdapterConfiguration(IPEnabled=True)

    # First network adaptor
    nic = nic_configs[0]
    print(nic.IpAddress[0])

    # IP address, subnetmask and gateway values should be unicode objects
    ip = u'192.168.100.55'
    subnetmask = u'255.255.255.0'
    gateway = u''


    # Set IP address, subnetmask and default gateway
    # Note: EnableStatic() and SetGateways() methods require *lists* of values to be passed
    nic.EnableStatic(IPAddress=[ip],SubnetMask=[subnetmask])
    nic.SetGateways(DefaultIPGateway=[gateway])
    print(nic.IpAddress[0])
    input("Press Enter to continue...")

#    if nic.IpAddress[0] == '192.168.100.100':
    driver = webdriver.Edge(service=EdgeService(EdgeChromiumDriverManager().install()))
    driver.get(r"C:\Users\Bryce\Documents\python\Scripts\BrightRidge\SmartActivate.html")            #http://192.168.100.100

    # select id name where the redID input box is
    form = driver.find_element("id", 'regidObj').send_keys(numID)
    if form.get_attribute('value') == numID:
        print("Reg ID entered SUCCESSFULLY")
    else:
        raise NameError('Reg ID not entered Successfully')


    button = driver.find_element("id", 'apply_btn')
    button.click()





#    time.sleep(10)
#    exit

    
   
else:
    # Re-run the program with admin rights
    ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, " ".join(sys.argv), None, 1)





