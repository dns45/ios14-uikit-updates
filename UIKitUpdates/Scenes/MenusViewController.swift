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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tapMeButton.isHidden = true
        deferredMenuButton.isHidden = true

    }

    @IBAction func handleActionItemTap(_ sender: Any) {
        let alert = UIAlertController(
            title: "Hello there!",
            message: "You just tapped on the bar button item!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }

    @IBAction func handleTapMeButtonTap(_ sender: Any) {
        let alert = UIAlertController(
            title: "Hello there!",
            message: "You just tapped on the Tap Me button!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
