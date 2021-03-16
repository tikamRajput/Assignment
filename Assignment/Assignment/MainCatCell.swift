//
//  MainCatCell.swift
//  Assignment
//
//  Created by AK on 16/03/21.
//

import UIKit

class MainCatCell: UITableViewCell {
    
    lazy var textName: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = .darkText
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var dropIcon:UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.image = UIImage(named: "dropdown")
        imgV.clipsToBounds = true
        imgV.contentMode = .scaleToFill
        return imgV
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(textName)
        addSubview(dropIcon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpCell()
    }
    
    private func setUpCell(){
        dropIcon.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        dropIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dropIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        dropIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        textName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        textName.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        textName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        textName.rightAnchor.constraint(equalTo: dropIcon.leftAnchor, constant: -20).isActive = true
        textName.font = UIFont(name: "Roboto-Regular", size: 20)
    }
}
