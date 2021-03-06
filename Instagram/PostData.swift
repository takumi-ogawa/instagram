//
//  PostData.swift
//  Instagram
//
//  Created by 小川拓未 on 2017/03/19.
//  Copyright © 2017年 takumi.ogawa. All rights reserved.
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
    var comments:[String] = []
    
    
    init(snapshot: FIRDataSnapshot, myId: String) {
        self.id = snapshot.key
        
        
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: NSData(base64Encoded: imageString!, options: .ignoreUnknownCharacters)! as Data)
        
        self.name = valueDictionary["name"] as? String
        
        self.caption = valueDictionary["caption"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = NSDate(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        for likeId in self.likes {
            if likeId == myId {
                self.isLiked = true
                break
            }
        }
        
        //コメントの取り出し→()!をつけるようにとエラーが出た
        if let comment = valueDictionary["comments"] as? [String]{
            self.comments = comment
        }
    }
    
}
