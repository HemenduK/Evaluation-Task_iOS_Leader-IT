//
//  UsersDetailsVC.swift
//  Evaluation Task_iOS_Leader IT
//
//  Created by Hemendu.Kathiriya on 27/10/21.
//

import UIKit

class UsersDetailsVC: UIViewController {

    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!{
        didSet{
            lblPhoneNumber.text = ""
        }
    }
    @IBOutlet weak var lblUserName: UILabel!{
        didSet{
            lblUserName.text = ""
        }
    }
    @IBOutlet weak var lblName: UILabel!{
        didSet{
            lblName.text = ""
        }
    }
    @IBOutlet weak var imgViewProfilePic: UIImageView!{
        didSet{
            imgViewProfilePic.layer.cornerRadius = imgViewProfilePic.frame.height / 2
        }
    }
    var userModel : UsersModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupValues()
    }
    
    //MARK: - CUSTOM METHODS
    
    func setupValues(){
        if let model = self.userModel{
            if let name = model.name{
                self.lblName.text = name
            }
            if let username = model.username{
                self.lblUserName.text = "@" + username
            }
            if let phonenumber = model.phone{
                self.lblPhoneNumber.text = phonenumber
            }
            if let address = model.strAddress{
                self.lblAddress.text = address
            }
            if let email = model.email{
                self.lblEmail.text = email
            }
            if let companyName = model.companyName{
                self.lblCompany.text = companyName
            }
        }
    }
    
    // MARK: - BUTTONS ACTION METHODS
    
    @IBAction func btnAddressAction(_ sender: Any) {
        let mapVC : MapVC = (self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as? MapVC)!
        mapVC.latitude = self.userModel?.latitude
        mapVC.longitude = self.userModel?.longitude
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
}
