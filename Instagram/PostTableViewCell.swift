//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 小川拓未 on 2017/03/19.
//  Copyright © 2017年 takumi.ogawa. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setPostData(postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        
        //コメントテキストビューにコメントを表示させる（！マークがあるとエラーになる。。）
        
        let text_comment = postData.comments.joined(separator: "\n")
        self.commentTextView.text = text_comment
        
        
        
        //おまけ（コメントの量によってコメントテキストビューのサイズを変更する）
        let height = CGFloat(postData.comments.count) * 20.0
        self.commentTextView.frame =  CGRect(x:self.commentTextView.frame.origin.x, y:self.commentTextView.frame.origin.y, width:self.commentTextView.frame.width, height: height)
        
        
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString:String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
    }
    
}
