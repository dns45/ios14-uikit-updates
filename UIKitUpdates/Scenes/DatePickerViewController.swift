//
//  DatePickerViewController.swift
//  UIKitUpdates
//
//  Created by Teply, Daniel
//

import UIKit

class DatePickerViewController: UIViewController {
    private let datePicker: UIDatePicker
    private var datePickerConstraints = [NSLayoutConstraint]()

    required init?(coder: NSCoder) {
        self.datePicker = UIDatePicker()
        super.init(coder: coder)
        configureDatePicker()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addDatePickerAsSubview()
    }

    @IBAction func segmentedControlValueChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            datePicker.preferredDatePickerStyle = .compact
        case 1:
            datePicker.preferredDatePickerStyle = .inline
        case 2:
            datePicker.preferredDatePickerStyle = .wheels
        default:
            break
        }

        updateDatePickerConstraints()
    }

    @objc func handleDateSelection() {
        print("Selected date/time:", datePicker.date)
    }

    private func configureDatePicker() {
        datePicker.date = Date()
        datePicker.locale = .current
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
    }

    private func addDatePickerAsSubview() {
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        updateDatePickerConstraints()
    }

    private func updateDatePickerConstraints() {
        // Remove any previously set constraints.
        view.removeConstraints(datePickerConstraints)
        datePickerConstraints.removeAll()

        // Set new constraints depending on the date picker style.
        datePickerConstraints.append(datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor))

        if datePicker.preferredDatePickerStyle != .inline {
            datePickerConstraints.append(datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        } else {
            datePickerConstraints.append(
                datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
            )
            datePickerConstraints.append(
                datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
            )
        }

        // Activate all constraints.
        NSLayoutConstraint.activate(datePickerConstraints)
    }
}
