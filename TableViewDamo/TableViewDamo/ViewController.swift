//
//  ViewController.swift
//  TableViewDamo
//
//  Created by Lokesh Yadav on 10/09/15.
//  Copyright (c) 2015 Lokesh Yadav. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: Tableview data source method

extension ViewController:UITableViewDataSource, UITableViewDelegate{
    

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
    
    let cell =  tableView.dequeueReusableCellWithIdentifier("BasicCell", forIndexPath: indexPath) as! UITableViewCell;
    
    cell.textLabel?.text = "ROW:\(indexPath.row)"
    
    return cell;
    
}
    
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    if indexPath.row == 0 {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : CustomViewController = storyboard.instantiateViewControllerWithIdentifier("CustomViewController") as! CustomViewController;
        //vc.teststring = "hello"
        self.navigationController!.pushViewController(vc, animated: true);

        
    }
}

}

//extension ViewController:UITableViewDelegate{
//    
//}
