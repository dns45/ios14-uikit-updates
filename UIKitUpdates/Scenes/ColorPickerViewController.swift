//
//  ColorPickerViewController.swift
//  UIKitUpdates
//
//  Created by Teply, Daniel
//

import UIKit

class ColorPickerViewController: UIViewController {
    private let defaultColor = UIColor.red

    @IBOutlet weak var colorSampleView: UIView! {
        didSet {
            colorSampleView.backgroundColor = defaultColor
            colorSampleView.layer.cornerRadius = 8.0
        }
    }

    @IBOutlet weak var pickColorButton: UIButton! {
        didSet {
            pickColorButton.tintColor = defaultColor
        }
    }

    @IBAction func pickColorTapped(_ sender: UIButton) {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        picker.selectedColor = colorSampleView.backgroundColor ?? .black
        picker.supportsAlpha = false
        present(picker, animated: true, completion: nil)
    }
}

extension ColorPickerViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorSampleView.backgroundColor = viewController.selectedColor
        pickColorButton.tintColor = viewController.selectedColor
    }
}
