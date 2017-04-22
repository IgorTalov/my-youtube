//
//  SettingCell.swift
//  youTubeTest
//
//  Created by Игорь Талов on 12.04.17.
//  Copyright © 2017 Игорь Талов. All rights reserved.
//

import UIKit

class SettingCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            print(isHighlighted)
            self.backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            iconImageView.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
        }
    }
    
    var setting: Setting? {
        didSet{
            nameLabel.text = setting?.name
            if let imageName = setting?.imageName {
                iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                iconImageView.tintColor = UIColor.darkGray
            }
            
        }
    }
    
    let iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.image = UIImage(named: "settings")?.withRenderingMode(.alwaysTemplate)
        imgView.tintColor = UIColor.darkGray
        return imgView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(iconImageView)
        self.addSubview(nameLabel)
        
        addConstraintsWithFormat(format: "H:|-16-[v0(34)]-8-[v1]|", views: iconImageView, nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(34)]-8-|", views: iconImageView) //FIX: Add Constraint
        addConstraintsWithFormat(format: "V:|-8-[v0]-8-|", views: nameLabel)
    }
}
