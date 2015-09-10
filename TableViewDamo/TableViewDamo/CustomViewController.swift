//
//  CustomViewController.swift
//  TableViewDamo
//
//  Created by Lokesh Yadav on 10/09/15.
//  Copyright (c) 2015 Lokesh Yadav. All rights reserved.
//

import UIKit


class CustomViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//MARK: Tableview data source method

extension CustomViewController:UITableViewDataSource, UITableViewDelegate{
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int // Default is 1 if not implemented
    {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 10;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
//        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomCell
//        cell.lbltext?.text = "ROW:\(indexPath.row*2)"
//        
//        return cell;
        
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomCell
        
        // Fetches the appropriate meal for the data source layout.
        cell.lbltext?.text = "ROW:\(indexPath.row*2)"
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        
    }
    
}
