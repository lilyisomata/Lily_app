//
//  PresentViewController.swift
//  Lily_app
//
//  Created by Lilico Isomata on 2017/07/08.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
   
    @IBOutlet var cameraImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func camera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated:  true, completion:  nil)
    } else {
    
    print("error")
    //アラート出してもいいんじゃね？？
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        cameraImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    

    
   @IBAction func album(){
    
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
        }
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
