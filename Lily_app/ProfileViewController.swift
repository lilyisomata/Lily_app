//
//  ProfileViewController.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2017/05/27.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    let ud = UserDefaults.standard
    //選択したセルの番号を取得
    var index : Int?
    var nameArray : Array<String> = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //配列が存在するなら(まあこのViewに来るまでには存在しているはず)配列を取得
        if let aaa = ud.object(forKey: "name"){
            nameArray = aaa as! Array<String>
            self.nameTextField.text = nameArray[index!]
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        //選択したセルの番号と同じところに保存
        nameArray[index!] = self.nameTextField.text!
        
        //新規作成していたなら
        if (index == nameArray.count-1){
            nameArray.append("新規作成")
        }
        
        //userdefaultsに保存
        ud.set(nameArray, forKey: "name")
        ud.synchronize()
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        return 10;
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
