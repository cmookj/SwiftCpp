//
//  AppDelegate.swift
//  SwiftCpp
//
//  Created by Changmook Chun on 7/30/24.
//

import Cocoa
import ContactsLib

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var currentIndex: Int = -1
       
    @IBOutlet var window: NSWindow!

    @IBOutlet var nameField: NSTextField!
    @IBOutlet var phoneNumberField: NSTextField!
    @IBOutlet var addressField: NSTextField!
    
    @IBOutlet var nextButton: NSButton!
    @IBOutlet var previousButton: NSButton!
    
    @IBOutlet var indexField: NSTextField!
    
    @IBAction func showNext(sender: NSButton) {
        saveCurrentContact()
        currentIndex+=1
        loadContactAtCurrentIndex()
        updateControls()
    }

    @IBAction func showPrevious(sender: NSButton) {
        saveCurrentContact()
        currentIndex-=1
        loadContactAtCurrentIndex()
        updateControls()
    }
    
    @IBAction func newContact(sender: NSButton) {
        if currentIndex >= 0 {
            saveCurrentContact()
        }
        currentIndex = Int(countContacts())
        
        nameField.stringValue = String()
        addressField.stringValue = String()
        phoneNumberField.stringValue = String()
        
        let name = nameField.stringValue
        let address = addressField.stringValue
        let phoneNumber = phoneNumberField.intValue
        
        addContact(name, address, UInt64(phoneNumber))
        updateControls()
    }

    func updateControls() {
        setEnabledNavigationButtons()
        setIndexField()
    }
    
    func setIndexField() {
        let count = Int(countContacts())
        indexField.stringValue = String(currentIndex + 1) + " / " + String(count)
    }
    
    func setEnabledNavigationButtons() {
        let count = Int(countContacts())
        
        if count == 0 || count == 1 {
            nextButton.isEnabled = false
            previousButton.isEnabled = false
            
            if count > 0 {
                nameField.isEnabled = true
                addressField.isEnabled = true
                phoneNumberField.isEnabled = true
            }
            return
        }
        
        if currentIndex == 0 {
            previousButton.isEnabled = false
            nextButton.isEnabled = true
            return
        }
        
        if currentIndex == count - 1 {
            nextButton.isEnabled = false
            previousButton.isEnabled = true
            return
        }
        
        nextButton.isEnabled = true
        previousButton.isEnabled = true
    }
    
    func saveCurrentContact() {
        let name = nameField.stringValue
        setNameAt(UInt32(currentIndex), name)
        
        let address = addressField.stringValue
        setAddressAt(UInt32(currentIndex), address)
        
        let phoneNumber = phoneNumberField.stringValue
        setPhoneNumberAt(UInt32(currentIndex), UInt64(phoneNumber) ?? 0)
    }
    
    func loadContactAtCurrentIndex() {
        let name = String(cString: nameAt(UInt32(currentIndex)))
        let address = String(cString: addressAt(UInt32(currentIndex)))
        let phoneNumber = String(phoneNumberAt(UInt32(currentIndex)))
        
        nameField.stringValue = name
        addressField.stringValue = address
        phoneNumberField.stringValue = phoneNumber
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        nameField.isEnabled = false
        addressField.isEnabled = false
        phoneNumberField.isEnabled = false
        
        nextButton.isEnabled = false
        previousButton.isEnabled = false
        
        let result = createContacts()
        if result != 0 {
            print("Failed to create contacts DB")
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}
