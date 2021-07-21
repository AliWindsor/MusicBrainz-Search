//
//  TableViewCell.swift
//  ContactsList - UIKit
//
//  Created by Alicia Windsor on 05/07/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
   
        subView.addSubview(nameLabel)
        subView.addSubview(titleLabel)
        
        self.contentView.addSubview(subView)
        self.contentView.addSubview(arrowImage)


        subView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        subView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        subView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        subView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        
        nameLabel.topAnchor.constraint(equalTo:self.subView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.subView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.subView.trailingAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.subView.leadingAnchor).isActive = true
        
        arrowImage.widthAnchor.constraint(equalToConstant:26).isActive = true
        arrowImage.heightAnchor.constraint(equalToConstant:26).isActive = true
        arrowImage.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        arrowImage.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
     
    }

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    //Name
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Title
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .orange
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Arrow
    let arrowImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        img.image = UIImage(systemName: "arrow.right")
        img.tintColor = .orange
        return img
    }()
    
    //Container for Name and Title
    let subView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    var artist:Artists? {
        didSet{
            guard let artistItem = artist else {return}
            
            if let name = artistItem.name{
                nameLabel.text = name
            }
            
            if let title = artistItem.disambiguation{
                titleLabel.text = title
            }else{
                titleLabel.text = "Unknown"
            }
        }
    }
    
}
