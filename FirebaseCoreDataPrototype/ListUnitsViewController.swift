//
//  ListUnitsViewController.swift
//  Learning_FireBase&CoreData
//
//  Created by Evan Cranney on 30/8/17.
//  Copyright © 2017 OpenCache. All rights reserved.
//

import UIKit

class ListUnitsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var model: ModelController?
    
    var name = String()
    var password = String()
    
    @IBOutlet weak var tableView: UITableView!
    
    var units: [SampleUnit] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTableData()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTableData() {
        units = model!.fetchUnits(name: name, psw: password)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let unit = units[indexPath.row]
        cell.textLabel?.text = unit.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AddUnitViewController
        destination.name = name
        destination.password = password
        destination.model = model
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
