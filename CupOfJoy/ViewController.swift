//
//  ViewController.swift
//  CupOfJoy
//
//  Created by Arushi Gupta on 9/6/21.
//

import UIKit

class ViewController: UIViewController {

    // want to create an outlet for our table view
    // this outlet will control the table view on the storyboard
    // black circle next to IBOutlet confirms that there is a connection between the UI component and this view controller
    @IBOutlet var tableView: UITableView!
    // a label for saying no Coffee Orders when you first open the app
    @IBOutlet var label: UILabel!
    
    // create an array in order to hold all the coffee orders an individual has placed and track where they went
    // will be an array of strings
    // first this task array will be empty
    // var orders = [String]()
    var orders: [(shop: String, information: String)] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // When the view loads, we want to showcase all the current/past orders that the user has saved
        title = "Coffee"
        
        // table views delegate itself and the tableView is the data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // need to set up original user defaults if there are 0 coffee orders and user is using this for first time
        
        //if !UserDefaults().bool(forKey: "setup") {
            // only want to come into this if statement once
        //    UserDefaults().set(true, forKey: "setup")
        //    UserDefaults().set(0, forKey: "count")
        //}
        //updateOrders()
    }
    
    //func updateOrders() {
        //orders.removeAll()
        
        //guard let count = UserDefaults().value(forKey: "count") as? Int else {
            //return
        //}
        
        // iterate from 0 to inclusive count
        // get each order and add it to an order array
        //for x in 0..<count {
        //    if let order = UserDefaults().value(forKey: "order_\(x+1)") as? String {
        //        if let info = UserDefaults().value(forKey: "info_\(x+1)") as? String {
        //            orders.append((order, info))
        //        }
        //    }
        //}
        //tableView.reloadData()
    
    //}
    
    
    //handles when we click on "Add New Order" Button
    //show another view controller that allows the user to make a new coffee entry
    @IBAction func didTapAdd() {
        guard let viewController = storyboard?.instantiateViewController(identifier: "entry") as? EntryViewController else {
            return
        }
        viewController.title = "A New Cup"
        viewController.navigationItem.largeTitleDisplayMode = .never
        viewController.completion = {shopName, moreInfo in
            self.navigationController?.popToRootViewController(animated: true)
            self.orders.append((shop: shopName, information: moreInfo))
            self.label.isHidden = true
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
        
        //viewController.update = {
            // every time that we call update we want to reload the table view
            // Use Dispatch in order to prioritize this
        //    DispatchQueue.main.async {
        //        self.updateOrders()
        //    }
        //}
        // we now want to push a new view controller so we will do that manually inside this navigation view
        navigationController?.pushViewController(viewController, animated: true)
    }
}


// now want to implement how we handle interactions with different data cells
// will be done with extensions
// add a delegate and data source

// delegate will handle taps on the cell
    // before starting this, moving back to storyboard (where we actually create the UI for this app)

    extension ViewController: UITableViewDelegate{
        func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // after we select a specific coffee order, we then want it to be deselected with an animation
            tableView.deselectRow(at: indexPath, animated: true)
            
            // have to connect the order view controller
            let order = orders[indexPath.row]
            // copied code from didTapAdd that will work on screen that can delete a coffee order
            guard let viewController = storyboard?.instantiateViewController(identifier: "order") as? OrderViewController else {
                return
            }
            
            // cleaning up the code
            viewController.navigationItem.largeTitleDisplayMode = .never
            
            viewController.title = "A New Cup"

            //need to ensure you are using the same IBOutlet "shop" in both the EntryViewController and OrderViewController
            //viewController.shop = orders[indexPath.row]
            // No need for lines 93-99 as we will nt be using update
            //viewController.update = {
                // every time that we call update we want to reload the table view
                // Use Dispatch in order to prioritize this
                //DispatchQueue.main.async {
                    //self.updateOrders()
                //}
            //}
            viewController.shopName = order.shop
            viewController.moreInfo = order.information
                
            // we now want to push a new view controller so we will do that manually inside this navigation view
            navigationController?.pushViewController(viewController, animated: true)
            
        }
    }
    
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //number of orders the user has placed in the past
            return orders.count
        }
        
        // now we want to return the cell for the given row that the user has clicked on
        // cellforrowatindexpath
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // need to dequeue a cell
            // this allows us to essentially reuse the cell but only swap out the text and this allows us to do that
            // use identifier that I made in Main.storyboard
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            
            //changing the actual text to be what the coffee order is
            //indexPath.row represents the actual position of the cell1 in the table view
            cell1.textLabel?.text = orders[indexPath.row].shop
            // will add sort of a subheading
            cell1.detailTextLabel?.text = orders[indexPath.row].information

            return cell1
        }
    }
