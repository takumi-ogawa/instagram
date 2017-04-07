//
//  CommentViewController.swift
//  Pods
//
//  Created by 小川拓未 on 2017/03/24.
//
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CommentViewController: UIViewController {
    
    var postData:PostData!
    var displayName:String = ""
    
    
    @IBOutlet weak var commentTextview: UITextView!
    @IBOutlet weak var kettei: UIButton!
    
    @IBAction func kettei(_ sender: Any) {
        let comment:String = commentTextview.text!
        
        if ( comment != "" ) {
            // コメントがある状態
            
            // ユーザー名
            print(displayName)
            
            // コメント
            print(comment)
            
            // コメントデータを格納する変数の初期化
            var commentArray:[String] = [] // 空の状態
            
            // postDataにコメントがすでに付いていた場合
            if ( postData.comments.count > 0 ) {
                commentArray = postData.comments // すでにあるコメントデータをcommentsに格納しておく
            }
            
            // コメントしたデータを追加
            commentArray.append("\(displayName) : \(comment)")
            
            // Firebaeに保存する
            let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(postData.id!)
            let fcomments = ["comments": commentArray]
            postRef.updateChildValues(fcomments)
            // イイねボタンの処理と同じ様な内容。
            
            
        }
        else {
            // コメントがない状態
        }
        
        dismisscommentview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    //commentViewController.swiftの画面を閉じるコード
    func dismisscommentview(){
        
        dismiss(animated: true, completion: nil)
        
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
