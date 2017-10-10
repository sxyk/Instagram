//
//  CommentEditViewController.swift
//  Instagram
//
//  Created by 田中優樹 on 2017/10/04.
//  Copyright © 2017年 yuki.tanaka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CommentEditViewController: UIViewController {
    
    @IBOutlet weak var commentField: UITextField!
    @IBAction func commentPostButton(_ sender: Any) {
        
        let time = NSDate.timeIntervalSinceReferenceDate
        let name = Auth.auth().currentUser?.displayName
        
        let postRef = Database.database().reference().child(Const.PostPath)
        let comments = ["comment": commentField.text!, "time": String(time), "name": name!]
        postRef.childByAutoId().setValue(comments)
    }

    @IBAction func onClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
