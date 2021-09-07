//
//  EntryViewController.swift
//  CupOfJoy
//
//  Created by Arushi Gupta on 9/6/21.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    // it is really important to ensure that when you create a field, you also create it in your storyboard
    // otherwise this causes a fatal error
    @IBOutlet var shop: UITextField!
    
    // need to create a new function in order to update the original screen
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        shop.delegate = self

        // Do any additional setup after loading the view.
        // want to add a save button to actually save my task
        
        //selector is a way to reference this class
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save Order", style: .done, target: self, action: #selector(saveOrder))
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveOrder()
        return true
    }
    
    //objc is what it allows it to be used as a selector in Line 25
    @objc func saveOrder() {
        
        // checking to see if shopText is not empty otherwise we return
        guard let shopText = shop.text, !shopText.isEmpty else {
            return
        }
        
        // actually want to update the count of our orders
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(shopText, forKey: "order_\(newCount)")
        
        //optional so use question mark
        update?()
        //go back to the view controller
        navigationController?.popViewController(animated: true)
    }

}
