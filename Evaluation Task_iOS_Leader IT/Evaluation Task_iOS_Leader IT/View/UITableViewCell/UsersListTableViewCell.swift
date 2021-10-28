//
//  UsersListTableViewCell.swift
//  Evaluation Task_iOS_Leader IT
//
//  Created by Hemendu.Kathiriya on 27/10/21.
//

import UIKit

class UsersListTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!{
        didSet{
            lblName.text = ""
        }
    }
    @IBOutlet weak var lblNumber: UILabel!{
        didSet{
            lblNumber.text = ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: CUSTOM METHODS
    
    func configureCell(userModel:UsersModel){
        lblName.text = userModel.name
        lblNumber.text = userModel.phone
    }
    
}
