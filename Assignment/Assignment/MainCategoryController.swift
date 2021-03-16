//
//  MainCategoryController.swift
//  Assignment
//
//  Created by AK on 15/03/21.
//

import UIKit

class MainCategoryController: UIViewController {

    let dataGetter = JASONFileReader()
    
    var listData: [DataModel] = []
    
    var expandRow: IndexPath?
    
    private lazy var listView: ListView = {
        let uv = ListView()
        uv.translatesAutoresizingMaskIntoConstraints = false
        return uv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        loadPageData()
    }
    
    private func addListing(){
        view.addSubview(listView)
        listView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        listView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive =
            true
        listView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        listView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        listView.listView.register(MainCatCell.self, forCellReuseIdentifier: "Cell")
        listView.listView.register(SubCatCell.self, forCellReuseIdentifier: "SubCell")
        listView.listView.delegate = self
        listView.listView.dataSource = self
    }
    
    private func loadPageData(){
        ProgressHud.showProgressHud("Please wait.", self.view)
        dataGetter.delegates = self
        dataGetter.getJsonData(fileReader: "menu")
    }
}

//MARK:- UITableView Delegates
extension MainCategoryController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandRow?.section == section ? listData[section].sub_category?.count ?? 0 + 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCatCell
            if expandRow?.section == indexPath.section{
                cell.dropIcon.image = UIImage(named: "dropup")
            }
            else
            {
                cell.dropIcon.image = UIImage(named: "dropdown")
            }
            cell.textName.text = listData[indexPath.section].name?.capitalized
            cell.selectionStyle = .none
            cell.layoutIfNeeded()
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCell", for: indexPath) as! SubCatCell
        cell.subCatName.text = listData[indexPath.section].sub_category?[indexPath.row - 1].name?.capitalized
        cell.displayName.text = listData[indexPath.section].sub_category?[indexPath.row - 1].display_name
        cell.selectionStyle = .none
        cell.layoutIfNeeded()
        return cell
        
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if expandRow != indexPath {
                expandRow = indexPath
            } else {
                expandRow = nil
            }
            tableView.reloadData()
        }
    }
    
}

//MARK:- JSON Data getter delegates
extension MainCategoryController: JSONFileDelegates {
    
    func returnJSON(_ jsondata: [DataModel]) {
        ProgressHud.hideProgressHud(self.view)
        listData = jsondata
        addListing()
    }
    
    func returnError(_ errorMessage: String) {
        ProgressHud.hideProgressHud(self.view)
        ErrorMessageClass.sharedInstance.errorMessage(self, errorMessage, "Error!")
    }
    
}
