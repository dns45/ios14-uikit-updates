//
//  ActionsViewController.swift
//  UIKitUpdates
//
//  Created by Teply, Daniel
//

import UIKit

class ActionsViewController: UIViewController {
    var label: UILabel?

    enum FontStyle: String, CaseIterable {
        case normal, bold, italic
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    func createButtonConstraints(_ button: UIButton) {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    func createSegmentedControlConstraints(_ segmented: UISegmentedControl) {
        guard let label = label else { return }
        self.view.addSubview(segmented)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -40).isActive = true
        segmented.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

    func createTestLabel() {
        label = UILabel(frame: .zero)
        label?.text = "Hello World!"
        label?.font = UIFont.systemFont(ofSize: 17)
        label?.textColor = .label

        self.view.addSubview(label!)
        label?.translatesAutoresizingMaskIntoConstraints = false
        label?.bottomAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100
        ).isActive = true
        label?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label?.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label?.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
