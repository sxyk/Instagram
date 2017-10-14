//
//  PostData.swift
//  Instagram
//
//  Created by 田中優樹 on 2017/09/29.
//  Copyright © 2017年 yuki.tanaka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: NSDate?
    var likes: [String] = []
    var isLiked: Bool = false
    
    var comments: [String] = []
    
    init(snapshot: DataSnapshot, myid: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String:AnyObject]
        
        imageString = valueDictionary["image"] as? String
        if let imageStringA = imageString {
            image = UIImage(data: NSData(base64Encoded: imageStringA, options: .ignoreUnknownCharacters)! as Data)
        }
        
        self.name = valueDictionary["name"] as? String
        self.caption = valueDictionary["caption"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = NSDate(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        if let likes = valueDictionary["iikes"] as? [String] {
            self.likes = likes
        }
        
        for liked in self.likes {
            if liked == myid {
                self.isLiked = true
                break
            }
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
