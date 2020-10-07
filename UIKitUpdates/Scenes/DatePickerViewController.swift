//
//  DatePickerViewController.swift
//  UIKitUpdates
//
//  Created by Teply, Daniel
//

import UIKit

class DatePickerViewController: UIViewController {

    var datePicker: UIDatePicker?
    var datePickerConstraints = [NSLayoutConstraint]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    @IBAction func updateDatePicker(_ sender: Any) {

    }

    func addDatePickerAsSubview() {
        guard let datePicker = datePicker else { return }
        self.view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        updateDatePickerConstraints()
    }

    func updateDatePickerConstraints() {
        guard let datePicker = datePicker else { return }

        // Remove any previously set constraints.
        self.view.removeConstraints(datePickerConstraints)
        datePickerConstraints.removeAll()

        // Set new constraints depending on the date picker style.
        datePickerConstraints.append(datePicker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor))

        if datePicker.preferredDatePickerStyle != .inline {
            datePickerConstraints.append(datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        } else {
            datePickerConstraints.append(
                datePicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8)
            )
            datePickerConstraints.append(
                datePicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
            )
        }

        // Activate all constraints.
        NSLayoutConstraint.activate(datePickerConstraints)
    }

    @objc func handleDateSelection() {
        guard let picker = datePicker else { return }
        print("Selected date/time:", picker.date)
    }

}
