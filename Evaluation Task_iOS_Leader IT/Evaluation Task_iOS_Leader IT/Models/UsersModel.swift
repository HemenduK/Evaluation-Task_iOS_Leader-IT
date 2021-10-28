//
//  UsersModel.swift
//  Evaluation Task_iOS_Leader IT
//
//  Created by Hemendu.Kathiriya on 26/10/21.
//

import UIKit

class UsersModel: NSObject,NSCoding {
    var userId : Int!
    var name : String?
    var username : String?
    var email : String?
    var street : String?
    var suite : String?
    var city : String?
    var zipCode : String?
    var latitude : String?
    var longitude : String?
    var phone : String?
    var website : String?
    var companyName : String?
    var catchPhrase : String?
    var bs : String?
    var strAddress : String?

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        
        if let userId : Int = dictionary["id"] as? Int{
            self.userId = userId
        }
        
        if let name = dictionary["name"]{
            self.name = name as? String
        }
        
        if let username = dictionary["username"]{
            self.username = username as? String
        }
        
        if let email = dictionary["email"]{
            self.email = email as? String
        }
        
        if let address : [String:Any] = dictionary["address"] as? [String : Any]{
            if let suite = address["suite"]{
                self.suite = suite as? String
                self.strAddress = suite as? String
            }
            if let street = address["street"]{
                self.street = street as? String
                self.strAddress = self.strAddress! + ", " + self.street!
            }
            if let city = address["city"]{
                self.city = city as? String
                self.strAddress = self.strAddress! + ", " + self.city!
            }
            if let zipcode = address["zipcode"]{
                self.zipCode = zipcode as? String
                self.strAddress = self.strAddress! + " - " + self.zipCode!
            }
            if let geo : Dictionary = address["geo"] as? Dictionary<String, Any>{
                if let latitude = geo["lat"]{
                    self.latitude = latitude as? String
                }
                if let longitude = geo["lng"]{
                    self.longitude = longitude as? String
                }
            }
        }
        
        if let phone = dictionary["phone"]{
            self.phone = phone as? String
        }
        
        if let website = dictionary["website"]{
            self.website = website as? String
        }
        
        if let company : [String:Any] = dictionary["company"] as? [String : Any]{
            if let name = company["name"]{
                self.companyName = name as? String
            }
            if let catchPhrase = company["catchPhrase"]{
                self.catchPhrase = catchPhrase as? String
            }
            if let bs = company["bs"]{
                self.bs = bs as? String
            }
        }
       
    }
    
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    required init(coder aDecoder: NSCoder)
    {
        userId = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        username = aDecoder.decodeObject(forKey: "username") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        suite = aDecoder.decodeObject(forKey: "suite") as? String
        strAddress = aDecoder.decodeObject(forKey: "address") as? String
        street = aDecoder.decodeObject(forKey: "street") as? String
        city = aDecoder.decodeObject(forKey: "city") as? String
        zipCode = aDecoder.decodeObject(forKey: "zipcode") as? String
        latitude = aDecoder.decodeObject(forKey: "lat") as? String
        longitude = aDecoder.decodeObject(forKey: "lng") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        website = aDecoder.decodeObject(forKey: "website") as? String
        companyName = aDecoder.decodeObject(forKey: "company") as? String
        catchPhrase = aDecoder.decodeObject(forKey: "catchPhrase") as? String
        bs = aDecoder.decodeObject(forKey: "bs") as? String
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(userId, forKey: "id")
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if username != nil{
            aCoder.encode(username, forKey: "username")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if suite != nil{
            aCoder.encode(suite, forKey: "suite")
        }
        if strAddress != nil{
            aCoder.encode(strAddress, forKey: "address")
        }
        if street != nil{
            aCoder.encode(street, forKey: "street")
        }
        if city != nil{
            aCoder.encode(city, forKey: "city")
        }
        if zipCode != nil{
            aCoder.encode(zipCode, forKey: "zipcode")
        }
        if latitude != nil{
            aCoder.encode(latitude, forKey: "lat")
        }
        if longitude != nil{
            aCoder.encode(longitude, forKey: "lng")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if website != nil{
            aCoder.encode(website, forKey: "website")
        }
        if companyName != nil{
            aCoder.encode(companyName, forKey: "company")
        }
        if catchPhrase != nil{
            aCoder.encode(catchPhrase, forKey: "catchPhrase")
        }
        if bs != nil{
            aCoder.encode(bs, forKey: "bs")
        }
    }
    
}
