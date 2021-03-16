//
//  ListView.swift
//  Assignment
//
//  Created by AK on 15/03/21.
//

import UIKit

class ListView: UIView {
    
    lazy var listView:UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(listView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpView()
    }
    
    private func setUpView(){
        listView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        listView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        listView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        listView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }

}
