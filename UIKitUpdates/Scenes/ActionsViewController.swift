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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        createButton()
        createLabel()
        createSegmentedControl()
    }

    private func createButton() {
        let button = UIButton(type: .custom, primaryAction: UIAction(title: "Tap Me") { _ in
            print("You tapped me!")
        })

        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)

        createButtonConstraints(button)
    }

    private func createLabel() {
        label = UILabel(frame: .zero)

        label?.text = "Hello World!"
        label?.font = UIFont.systemFont(ofSize: 17)
        label?.textColor = .label

        createLabelConstraints(label)
    }

    private func createSegmentedControl() {
        let fontSize: CGFloat = 17.0
        let segmentedControl = UISegmentedControl(frame: .zero, actions: FontStyle.allCases.map { fontStyle in
            UIAction(title: fontStyle.rawValue) { _ in
                switch fontStyle {
                case .normal: self.label?.font = .systemFont(ofSize: fontSize)
                case .bold: self.label?.font = .boldSystemFont(ofSize: fontSize)
                case .italic: self.label?.font = .italicSystemFont(ofSize: fontSize)
                }
            }
        })

        segmentedControl.selectedSegmentIndex = 0

        createSegmentedControlConstraints(segmentedControl)
    }

    private func createButtonConstraints(_ button: UIButton) {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 70),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func createLabelConstraints(_ label: UILabel?) {
        guard let label = label else { return }
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func createSegmentedControlConstraints(_ segmentedControl: UISegmentedControl) {
        guard let label = label else { return }
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            segmentedControl.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -40),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
