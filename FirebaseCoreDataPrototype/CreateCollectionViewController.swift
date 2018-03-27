//
//  CreateCollectionViewController.swift
//  Learning_FireBase&CoreData
//
//  Created by Evan Cranney on 30/8/17.
//  Copyright © 2017 OpenCache. All rights reserved.
//

import UIKit

class CreateCollectionViewController: UIViewController {
    
    let model: ModelController = ModelController()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        model.addCollection(name: nameTextField.text!, psw: passwordTextField.text!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let destination = navController.topViewController as! ListUnitsViewController
        destination.name = nameTextField.text!
        destination.password = passwordTextField.text!
        destination.model = model
    }
}
