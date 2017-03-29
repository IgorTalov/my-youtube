//
//  VideoCell.swift
//  youTubeTest
//
//  Created by Игорь Талов on 30.03.17.
//  Copyright © 2017 Игорь Талов. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let separatoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift - Blank Space"
        return label
    }()
    
    let subTitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "TaylorSwiftVEVO - 1,648,345,657 views - 2 years"
        textView.textColor = UIColor.lightGray
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        //Add SubViews
        addSubview(thumbnailImageView)
        addSubview(separatoView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subTitleTextView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView,separatoView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatoView)
        
        //Top Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute:NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //Left Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute:NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //Right Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute:NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //Height Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute:NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //Top Constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute:NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //Left Constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute:NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //Right Constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute:NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //Height Constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute:NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
