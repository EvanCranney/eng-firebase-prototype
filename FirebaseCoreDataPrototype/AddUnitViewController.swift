//
//  AddUnitViewController.swift
//  Learning_FireBase&CoreData
//
//  Created by Evan Cranney on 30/8/17.
//  Copyright © 2017 OpenCache. All rights reserved.
//

import UIKit

class AddUnitViewController: UIViewController {
    
    var model: ModelController?
    
    var name = String()
    var password = String()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var miscOneTextField: UITextField!
    @IBOutlet weak var miscTwoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        model!.addUnit(name: nameTextField.text!, miscData1: miscOneTextField.text!, miscData2: miscTwoTextField.text!)
        navigationController!.popViewController(animated: true)
    }

}
