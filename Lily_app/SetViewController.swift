//
//  SetViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/06/10.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit

class SetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var index : Int?
    var isAppear: [Bool] = []
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ud = UserDefaults.standard
        if let aaa = ud.array(forKey: "isAppear"){
            isAppear = aaa as! [Bool]
        } else {
            for _ in 0..<10 {
                self.isAppear.append(false)
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        let ud = UserDefaults.standard
        ud.set(isAppear, forKey: "isAppear")
        ud.synchronize()
    }
    
    
    //UITableViewDataSourceのデリゲートメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! SetTableViewCell
        
//        cell.textLabel?.text = String(indexPath.row)
        
        return cell
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
