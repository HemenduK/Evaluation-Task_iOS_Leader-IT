//
//  UsersListVC.swift
//  Evaluation Task_iOS_Leader IT
//
//  Created by Hemendu.Kathiriya on 27/10/21.
//

import UIKit

class UsersListVC: UIViewController {

    var arrUsers : [UsersModel?] = []
    @IBOutlet weak var tblUsersList: UITableView!
    var refresher = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Users List"
        self.configureRefreshControl()
        self.getUsersList()
    }
    
    //MARK: CUSTOM METHODS
    
    func configureRefreshControl(){
        self.refresher.tintColor = UIColor.darkGray
        self.refresher.addTarget(self, action: #selector(reloadUserData), for: .valueChanged)
        self.tblUsersList.addSubview(refresher)
    }
    
    @objc func reloadUserData(){
        self.refresher.beginRefreshing()
        if(self.arrUsers.count > 0){
            self.arrUsers.removeAll()
        }
        self.getUsersList()
    }
    
    func getUsersList(){
        if CommonUtility().isNetworkConnected(){
            WebserviceManager().getUsersDetails(OnCompletion: { (arrUsersModel, success, successStatus) in
                DispatchQueue.main.async {
                    self.refresher.endRefreshing()
                    if success{
                        if let arrResponse = arrUsersModel{
                            if(arrResponse.count > 0){
                                self.arrUsers = arrResponse
                                do{
                                    let archivedData = try NSKeyedArchiver.archivedData(withRootObject: arrResponse, requiringSecureCoding: false)
                                    UserDefaults.standard.setValue(archivedData, forKey: "USERSARRAY")
                                    UserDefaults.standard.synchronize()
                                }catch{
                                    print("Error in save users data")
                                }
                                
                                self.tblUsersList.reloadData()
                            }
                        }
                        
                    }
                }
            })
        }else{
            self.refresher.endRefreshing()
            if let userdefaultData = UserDefaults.standard.value(forKey: "USERSARRAY") as? Data{
                do{
                    let unarc = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userdefaultData)
                    if let arrUsers = unarc as? [UsersModel]{
                        self.arrUsers = arrUsers
                        self.tblUsersList.reloadData()
                    }
                }catch{
                    print("Error in fetch users data")
                }
            }
        }
    }
}

extension UsersListVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "UsersListTableViewCell") as? UsersListTableViewCell
        if (cell == nil) {
            cell = Bundle.main.loadNibNamed("UsersListTableViewCell", owner: self, options: nil)?.first as? UsersListTableViewCell
            cell?.selectionStyle = .none
        }
        if(self.arrUsers.count > 0){
            if let userModel = arrUsers[indexPath.row]{
                cell?.configureCell(userModel: userModel)
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC : UsersDetailsVC = (self.storyboard?.instantiateViewController(withIdentifier: "UsersDetailsVC") as? UsersDetailsVC)!
        if let userModel = arrUsers[indexPath.row]{
            detailsVC.userModel = userModel
        }
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}

