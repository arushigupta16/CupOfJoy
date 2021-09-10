//
//  EntryViewController.swift
//  CupOfJoy
//
//  Created by Arushi Gupta on 9/6/21.
//

import UIKit

class EntryViewController: UIViewController {
    
    // it is really important to ensure that when you create a field, you also create it in your storyboard
    // otherwise this causes a fatal error
    @IBOutlet var shopField: UITextField!
    //@IBOutlet var informationField: UITextField!
    @IBOutlet var informationField: UITextView!
    
    // need to create a new function in order to update the original screen
    // var update: (() -> Void)?
    
    // will allow us to get this data outside of the controller
    public var completion: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // need to go over this
        // shopField.delegate = self
        shopField.becomeFirstResponder()

        // Do any additional setup after loading the view.
        // want to add a save button to actually save my task
        
        //selector is a way to reference this class
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save Order", style: .done, target: self, action: #selector(saveOrder))
    }

    //func textFieldShouldReturn(_ shopField: UITextField, informationField: UITextField) -> Bool {
    //    saveOrder()
    //    return true
    //}
    
    //objc is what it allows it to be used as a selector in Line 25
    @objc func saveOrder() {
        
        // checking to see if shopText is not empty otherwise we return
        //guard let textShop = shopField.text, !textShop.isEmpty else {
        //    return
        //}
        
        //guard let textInfo = informationField.text, !textInfo.isEmpty else {
        //    return
        //}
        
    
        // if not empty, call completion
         if let textShop = shopField.text, !textShop.isEmpty, !informationField.text.isEmpty {
        //    if let textInfo = informationField.text, !textInfo.isEmpty {
            completion?(textShop, informationField.text)
        //    }
        }
        
        // actually want to update the count of our orders
        
        //guard let count = UserDefaults().value(forKey: "count") as? Int else {
         //  return
        //}
        
        //let newCount = count + 1
        
        //UserDefaults().set(newCount, forKey: "count")
        //UserDefaults().set(shopField, forKey: "order_\(newCount)")
        //UserDefaults().set(informationField, forKey: "info_\(newCount)")
        
        //optional so use question mark
        //update?()
        //go back to the view controller
        //navigationController?.popViewController(animated: true)
    }

}
