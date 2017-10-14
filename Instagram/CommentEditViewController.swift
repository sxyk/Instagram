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
    
    var postData:PostData!
    
    @IBOutlet weak var commentField: UITextField!
    @IBAction func commentPostButton(_ sender: Any) {
        
        let name = Auth.auth().currentUser?.displayName
        
        if let commentText = commentField.text {
            postData.comments.append("\(name!): \(commentText)")
        }

        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        
        postRef.updateChildValues(["comment s": postData.comments])
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let commentReadViewController:CommentReadViewController = segue.destination as! CommentReadViewController
        commentReadViewController.postData = postData
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
