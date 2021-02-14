//
//  MyPizzaTableViewController.swift
//  myPizza
//
//  Created by  zholon on 03.01.2021.
//

import UIKit

class MyPizzaTableViewController: UITableViewController {
    @IBOutlet weak var labelBay: UILabel!
    var pizzaMenuList = [pizzaMenu(namePizza: "Асорті", imagePizza: "Асорті.jpg", pricePizza: 9.99 ), pizzaMenu(namePizza: "Баварська", imagePizza: "Баварська.jpg", pricePizza: 9.99), pizzaMenu(namePizza: "Гавайська", imagePizza: "Гавайська.jpg", pricePizza: 9.99), pizzaMenu(namePizza: "Маргаріта", imagePizza: "Маргаріта.jpg", pricePizza: 9.99), pizzaMenu(namePizza: "Мюнхенська", imagePizza: "Мюнхенська.jpg", pricePizza: 9.99), pizzaMenu(namePizza: "Папероні", imagePizza: "Папероні.jpg", pricePizza: 9.99), pizzaMenu(namePizza: "Чотири сизони", imagePizza: "Чотири сизони.jpg", pricePizza: 9.99)]
    

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
        cell.typeLabel.text = String(pizzaMenuList[indexPath.row].pricePizza) + " $"
    
        
        

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
     
        let cansel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        ac.addAction(call)
        ac.addAction(cansel)
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
