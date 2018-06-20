//
//  ChatLogController.swift
//  fbMessenger
//
//  Created by GVN on 6/20/18.
//  Copyright © 2018 Son Vu. All rights reserved.
//

import UIKit

class ChatLogController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var friend: Friend? {
        didSet {
            navigationItem.title = friend?.name
            messages = friend?.messenges?.allObjects as? [Message]
            messages = messages?.sorted(by: {$0.date!.compare($1.date! as Date) == .orderedAscending})
        }
    }
    
    var messages: [Message]?
    private let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ChatLogCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ChatLogCell
        cell.messageTextView.text = messages?[indexPath.item].mess
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}

class ChatLogCell: BaseCell {
    override func setupViews() {
        super.setupViews()
        addSubview(messageTextView)
        addConstraintWithFormat(format: "H:|[v0]|", views: messageTextView)
        addConstraintWithFormat(format: "V:|[v0]|", views: messageTextView)
    }
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Sample message"
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()
}
