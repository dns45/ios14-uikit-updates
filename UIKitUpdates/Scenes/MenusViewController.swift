//
//  MenusViewController.swift
//  UIKitUpdates
//
//  Created by Teply, Daniel
//

import UIKit

class MenusViewController: UIViewController {
    @IBOutlet weak var actionItem: UIBarButtonItem!
    @IBOutlet weak var tapMeButton: UIButton!
    @IBOutlet weak var deferredMenuButton: UIButton!
    @IBOutlet weak var displayInlineSwitch: UISwitch!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureActionItemMenu()
        configureTapMeButtonMenu()
        configureDeferredMenu()
    }

    @IBAction func handleActionItemTap(_ sender: Any) {
        let alert = UIAlertController(
            title: "Hello there!",
            message: "You just tapped on the bar button item!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)

    }

    @IBAction func handleTapMeButtonTap(_ sender: Any) {
        let alert = UIAlertController(
            title: "Hello there!",
            message: "You just tapped on the Tap Me button!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func handleSwitchValueChange(_ sender: UISwitch) {
        // Calling this to clear already cached async options
        configureDeferredMenu()
    }

    private func configureActionItemMenu() {
        let add = UIAction(title: "Add new...", image: UIImage(systemName: "plus.circle")) { _ in
            print("Add new action was selected")
        }
        let edit = UIAction(title: "Edit", image: UIImage(systemName: "pencil.circle")) { _ in
            print("Edit action was selected")
        }
        let delete = UIAction(
            title: "Delete",
            image: UIImage(systemName: "minus.circle"),
            attributes: .destructive
        ) { _ in
            print("Delete action was selected")
        }

        let menu = UIMenu(title: "Actions", children: [add, edit, delete])
        // Menu is displayed automatically on bar button long press
        // If no primary action is specified (`handleActionItemTap` in our case)
        // then menu is displayed immediatelly on press
        actionItem.menu = menu
    }

    private func configureTapMeButtonMenu() {
        let option1 = UIAction(title: "Option 1") { _ in
            print("Option 1 was selected")
        }
        let option2 = UIAction(title: "Option 2") { _ in
            print("Option 2 was selected")
        }
        let option3 = UIAction(title: "Option 3") { _ in
            print("Option 3 was selected")
        }

        let menu = UIMenu(title: "Your options...", children: [option1, option2, option3])
        tapMeButton.menu = menu
    }

    private func configureDeferredMenu() {
        let deferredMenuElement = UIDeferredMenuElement { menuElements in
            let asyncOption1 = UIAction(title: "Async Option 1") { _ in
                print("Async option 1 was selected")
            }

            let asyncOption2 = UIAction(title: "Async Option 2") { _ in
                print("Async option 2 was selected")
            }

            let options: UIMenu.Options = self.displayInlineSwitch.isOn ? .displayInline : []
            let deferredMenu = UIMenu(
                title: "Additional options...",
                options: options, children: [asyncOption2, asyncOption1]
            )

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                menuElements([deferredMenu])
            }
        }

        let option1 = UIAction(title: "Option 1") { _ in
            print("Option 1 was selected")
        }
        let option2 = UIAction(title: "Option 2") { _ in
            print("Option 2 was selected")
        }

        let menu = UIMenu(title: "Your options...", children: [deferredMenuElement, option2, option1])
        deferredMenuButton.menu = menu
        deferredMenuButton.showsMenuAsPrimaryAction = true
    }
}
