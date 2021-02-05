//
//  MyPizzaTableViewController.swift
//  myPizza
//
//  Created by  zholon on 03.01.2021.
//

import UIKit

class MyPizzaTableViewController: UITableViewController {
    @IBOutlet weak var labelBay: UILabel!
    var pizzaMenuList = [pizzaMenu(namePizza: "1assorti", imagePizza: "1assorti.jpg"), pizzaMenu(namePizza: "bavarskaya", imagePizza: "bavarskaya.jpg"), pizzaMenu(namePizza: "gavayskaya", imagePizza: "gavayskaya.jpg"), pizzaMenu(namePizza: "margarita", imagePizza: "margarita.jpg"), pizzaMenu(namePizza: "myunhenskaya", imagePizza: "myunhenskaya.jpg"), pizzaMenu(namePizza: "pepperoni", imagePizza: "pepperoni.jpg"), pizzaMenu(namePizza: "pitstsa-chetyre-sezona", imagePizza: "pitstsa-chetyre-sezona.jpg")]
    

    var pizzaBay = [pizzaMenu]()
    var pizzawantToBuy = [Bool](repeatElement(false, count: 15))
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    // MARK: - Table view data source

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pizzaMenuList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyPizzaTableViewCell

        cell.thumbanailImageView.image = UIImage(named: pizzaMenuList[indexPath.row].imagePizza)
        cell.thumbanailImageView.layer.cornerRadius = 32.5
        cell.thumbanailImageView.clipsToBounds = true
        cell.nameLabel.text = pizzaMenuList[indexPath.row].namePizza
        
        cell.accessoryType = self.pizzawantToBuy[indexPath.row] ? .checkmark : .none
        
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pizzaBay.insert(pizzaMenuList[indexPath.row], at: 0)
      // add element in array
        let ac = UIAlertController(title: "Купить 🛒", message: "Добавить в корзину 🍕 \(pizzaMenuList[indexPath.row].namePizza)", preferredStyle: .actionSheet)
        
        let call = UIAlertAction(title: "Купить 🛍", style: .default) {
          (action: UIAlertAction) -> Void in
            
            
          // second alert controller inside first action
          let alertC = UIAlertController(title: nil, message: "Товар доданий в корзину", preferredStyle: .alert)
          // second alert controller action
          let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
          // add action to second alert controller
          alertC.addAction(ok)
          // present second alert controler
          self.present(alertC, animated: true, completion: nil)
        }
        let wantToBuyTitle = self.pizzawantToBuy[indexPath.row] ? "Не хочу покпать 🍕" : "Хочу купить 🍕"
        let wantToBuy = UIAlertAction(title: wantToBuyTitle, style: .default) { (action) in
            let cell = tableView.cellForRow(at: indexPath)
            self.pizzawantToBuy[indexPath.row] = !self.pizzawantToBuy[indexPath.row]
            cell?.accessoryType = self.pizzawantToBuy[indexPath.row] ? .checkmark : .none
        }
        let cansel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        ac.addAction(call)
        ac.addAction(cansel)
        ac.addAction(wantToBuy)
        present(ac, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as?  binTableViewController else {return}
        dvc.myBay = pizzaBay
    }

    @IBAction func shopActionButton(_ sender: Any) {
        labelBay.text = String(pizzaBay.count)
        
    }

}
