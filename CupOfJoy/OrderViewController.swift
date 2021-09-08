//
//  OrderViewController.swift
//  CupOfJoy
//
//  Created by Arushi Gupta on 9/6/21.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    
    var shop: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        label1.text = shop
        // can also do a .trash icon as well which is really cool
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete Order", style: .done, target: self, action: #selector(deleteOrder))
        // Do any additional setup after loading the view.
    }
    
    @objc func deleteOrder() {
        // add a navigation item that sort of identifies where screen should go when this method is called
        //guard let orderItem = self.item else {
           // return
        }
   // }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
