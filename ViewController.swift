//
//  ViewController.swift
//  firebaseApurva
//
//  Created by Felix-ITS 004 on 23/09/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference!
    var courseDic = NSMutableDictionary()
    
    @IBOutlet weak var durationText: UITextField!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var feesText: UITextField!
    
    
    @IBAction func saveToFirebase(_ sender: UIButton) {
        
       ref = Database.database().reference()
        courseDic.setValue(nameText.text!, forKey: "Name")
        courseDic.setValue(durationText.text!, forKey: "Duration")
        courseDic.setValue(feesText.text!, forKey: "Fees")
        ref.child("Courses").childByAutoId().setValue(courseDic) { (error, reference) in
            
            if((error) != nil)
            {
                print("Failed to Insert:\(error?.localizedDescription)")
            }
            else
            {
                print("Insert:Success")
                
            }
            /* ref.child("Courses").setValue(couserDic, withCompletionBlock: { (error, data) in
             if let error = error
             {
             print(error.localizedDescription)
             }
             else
             {
             print("Data saved successfully")
             }
             */
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseApp.configure()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

