//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Алексей Сергеев on 23.04.2021.
//  Copyright © 2021 Алексей Сергеев. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        let firstName           = firstNameTextField.text ?? ""
        let secondName          = secondNameTextField.text ?? ""
        let email               = emailTextField.text ?? ""
        let checkInDate         = checkInDatePicker.date
        let checkOutDate        = checkOutDatePicker.date
        let numberOfAdults      = Int(numberOfAdultsStepper.value)
        let numberOfChildren    = Int(numberOfChildrenStepper.value)
        let hasWifi             = wifiSwitch.isOn
        let roomChoice          = roomType?.name ?? "Not Set"
        
        print("DONE BUTTON WAS TAPPED")
        print("firstName: \(firstName)")
        print("secondName: \(secondName)")
        print("email: \(email)")
        print("checkInDate: \(checkInDate)")
        print("checkInDate: \(checkOutDate)")
        print("numberOfAdults: \(numberOfAdults)")
        print("numberOfChildren: \(numberOfChildren)")
        print("hasWifi: \(hasWifi)")
        print("roomChoice: \(roomChoice)")
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // pickers preparation
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        // preparation of steppers
        numberOfAdultsStepper.minimumValue      = 1
        numberOfChildrenStepper.minimumValue    = 0
        updateNumberOfGuests()
        
        updateDateViews()
        updateRoomType()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    
    private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    var roomType: RoomType?
    
    let checkInDatePickerCellIndexPath  = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    let checkInDateLabelCellIndexPath   = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath  = IndexPath(row: 2, section: 1)
    
    var isCheckInDatePickerVisible  = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    var isCheckOutDatePickerVisible = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == true:
            return 216
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == true:
            return 216
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        
            if indexPath == checkInDateLabelCellIndexPath && isCheckOutDatePickerVisible == false {
                // check-in label selected, check-out picker is not visible, toggle check-in picker
                isCheckInDatePickerVisible.toggle()
            } else if indexPath == checkOutDateLabelCellIndexPath && isCheckInDatePickerVisible == false {
                // check-out label selected, check-in picker is not visible, toggle check-out picker
                isCheckOutDatePickerVisible.toggle()
            } else if indexPath == checkInDateLabelCellIndexPath || indexPath == checkOutDateLabelCellIndexPath {
                // either label was selected, previous conditions failed meaning at least one picker is visible, toggle both
                isCheckInDatePickerVisible.toggle()
                isCheckOutDatePickerVisible.toggle()
            } else {
                return
            }
        
            tableView.beginUpdates()
            tableView.endUpdates()
    }
    
    
    private func updateDateViews() {
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        
        checkInLabel.text   = dateFormatter.string(from: checkInDatePicker.date)
        checkOutLabel.text  = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    private func updateNumberOfGuests() {
        numberOfAdultsLabel.text    = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text  = "\(Int(numberOfChildrenStepper.value))"
    }
    
    private func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeTableVC = SelectRoomTypeTableViewController(coder: coder)
        selectRoomTypeTableVC?.delegate = self
        selectRoomTypeTableVC?.roomType = roomType
        
        return selectRoomTypeTableVC
    }
    

}
