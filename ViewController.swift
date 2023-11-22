//
//  ViewController.swift
//  HarrierApp
//
//  Created by Prathmesh Parteki on 22/11/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "Inventory Report"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()

    let addButton : UIButton = {
        let aButton = UIButton()
        aButton.setTitle("Add", for: .normal)
        aButton.backgroundColor = UIColor.blue
        aButton.tintColor = UIColor.white
        aButton.layer.cornerRadius = 20
        return aButton
    }()
    
    let sellButton : UIButton = {
        let sButton = UIButton()
        sButton.setTitle("Sell", for: .normal)
        sButton.backgroundColor = UIColor.blue
        sButton.tintColor = UIColor.white
        sButton.layer.cornerRadius = 20
        return sButton
    }()
    
    let purchaseButton : UIButton = {
        let pButton = UIButton()
        pButton.setTitle("Purchase", for: .normal)
        pButton.backgroundColor = UIColor.blue
        pButton.tintColor = UIColor.white
        pButton.layer.cornerRadius = 20
        return pButton
    }()
    
    let reportButton : UIButton = {
        let rButton = UIButton()
        rButton.setTitle("Report", for: .normal)
        rButton.backgroundColor = UIColor.blue
        rButton.tintColor = UIColor.white
        rButton.layer.cornerRadius = 20
        return rButton
    }()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        setupUI()
    }

    private func setupUI(){
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:40).isActive = true
        addButton.topAnchor.constraint(equalTo: view.topAnchor, constant:250 ).isActive = true
        addButton.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        
        view.addSubview(sellButton)
        sellButton.translatesAutoresizingMaskIntoConstraints = false
        sellButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        sellButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
        sellButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-40).isActive = true
        sellButton.topAnchor.constraint(equalTo: view.topAnchor, constant:250 ).isActive = true
        sellButton.addTarget(self, action: #selector(sellProduct), for: .touchUpInside)
        
        view.addSubview(purchaseButton)
        purchaseButton.translatesAutoresizingMaskIntoConstraints = false
        purchaseButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        purchaseButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
        purchaseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:40).isActive = true
        purchaseButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant:100 ).isActive = true
        purchaseButton.addTarget(self, action: #selector(purchaseProduct), for: .touchUpInside)
        
        view.addSubview(reportButton)
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        reportButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        reportButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
        reportButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-40).isActive = true
        reportButton.topAnchor.constraint(equalTo: sellButton.bottomAnchor, constant:100 ).isActive = true
        reportButton.addTarget(self, action: #selector(showReport), for: .touchUpInside)
        
    }
    
    // Buttons pressing methods
    
    @objc func addProduct(){
        print("product added")
//        if let product = try.context.fetch(Product.fetchRequest()).first as? Product {
//            product.count += 1
//        }
        do{
            try context.save()
            print("Count increases")
        }catch{
            print("Error")
        }
    }
    
    @objc func sellProduct(){
        print("product selled")
        let sViewController = SellViewController()
        present(sViewController, animated: true)
    }
    
    @objc func purchaseProduct(){
        print("product purchased")
        let pViewController = PurchaseViewController()
        present(pViewController, animated: true)
    }
    
    @objc func showReport(){
        print("Report will be shown")
        let reportViewController = ReportViewController()
        present(reportViewController, animated: true)
    }
}

