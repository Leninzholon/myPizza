//
//  binTableViewController.swift
//  myPizza
//
//  Created by  zholon on 04/02/2021.
//

import UIKit

class binTableViewController: UITableViewController {
    
    @IBOutlet var labelPrice: UILabel!
    var pizzaPrice = 0.0

    var myBay: [pizzaMenu]?
//
//    let namePizza: String
//    let pricePizza: String
//
//    var title: String = "\(namePizza) + \((pricePizza))"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBay!.count

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "binCell", for: indexPath)
       
        let sumBay = sumPricePizza(price: myBay![indexPath.row].pricePizza)
        print(sumBay)
       
          
        cell.imageView?.image = UIImage(named: myBay![indexPath.row].imagePizza)
        cell.imageView?.layer.cornerRadius = 32.5
        cell.imageView?.clipsToBounds = true
        cell.textLabel?.text = myBay![indexPath.row].namePizza
        cell.detailTextLabel?.text = "\(String(myBay![indexPath.row].pricePizza)) $"
        
        labelPrice.text = "Всього до сплати: \(String(sumBay)) $"
        

        return cell
    }
 
    private func sumPricePizza(price: Double) -> Double {
       
        pizzaPrice += price
        
        return pizzaPrice
    }
    

}
