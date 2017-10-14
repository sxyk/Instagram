//
//  CommentReadViewController.swift
//  Instagram
//
//  Created by 田中優樹 on 2017/10/04.
//  Copyright © 2017年 yuki.tanaka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CommentReadViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var postArray: [PostData] = []
    var postData:PostData!

    @IBOutlet weak var tableView: UITableView!
    @IBAction func onClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //MARK: UITableViewDataSourceプロトコルのメソッド
    //データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        return postData.comments.count
    }
    
    //各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commentCell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath as IndexPath)
        
        let comment = postData.comments[indexPath.row]
        commentCell.textLabel?.text = comment
        
        return commentCell
    }
    
    //MARK: UITableViewDelegateプロトコルのメソッド
    //各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
