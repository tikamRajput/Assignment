//
//  SubCatCell.swift
//  Assignment
//
//  Created by AK on 16/03/21.
//

import UIKit

class SubCatCell: UITableViewCell {
    
    lazy var subCatName: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = .darkGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var displayName: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = .darkGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(subCatName)
        addSubview(displayName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpCell()
    }
    
    private func setUpCell(){
        subCatName.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        subCatName.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        //subCatName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        subCatName.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        subCatName.font = UIFont(name: "Roboto-Regular", size: 18)
        
        displayName.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        displayName.topAnchor.constraint(equalTo: subCatName.bottomAnchor).isActive = true
        displayName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        displayName.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        displayName.font = UIFont(name: "Roboto-Light", size: 16)
    }
}
