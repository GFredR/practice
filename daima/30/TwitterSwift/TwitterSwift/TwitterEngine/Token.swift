//
//  Token.swift
//  TwitterSwift


import Foundation
class Token : NSObject, NSCoding {
    var key = ""
    var secret = ""
    var verifier = ""
    
    required init (stringToParse : String) {
        let components = stringToParse.components(separatedBy: "&")
        for value in components {
            let elements = value.components(separatedBy: "=")
            if elements[0] == "oauth_token" {
                self.key = elements[1]
            }
            if elements[0] == "oauth_token_secret" {
                self.secret = elements[1]
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.key = aDecoder.decodeObject(forKey: "key") as! String
        self.secret = aDecoder.decodeObject(forKey: "secret") as! String
        self.verifier = aDecoder.decodeObject(forKey: "verifier") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.key, forKey: "key")
        aCoder.encode(self.secret, forKey: "secret")
        aCoder.encode(self.verifier, forKey: "verifier")
    }
}

class AccessToken : Token {
    var authenticatedUID = ""
    var authenticatedScreenName = ""
    
    required init (stringToParse : String) {
        let components = stringToParse.components(separatedBy: "&")
        for value in components {
            let element = value.components(separatedBy: "=")
            if element[0] == "user_id" {
                self.authenticatedUID = element[1]
            }
            if element[0] == "screen_name" {
                self.authenticatedScreenName = element[1];
            }
        }
        super.init(stringToParse: stringToParse)
    }
    
    func save () -> AccessToken {
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        UserDefaults.standard().set(data, forKey: "tokenKey")
        return self
    }
    
    class func loadAccessToken () -> AccessToken? {
        if let data = UserDefaults.standard().object(forKey: "tokenKey") as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: data) as? AccessToken
        }
        return nil
    }

    
    required init?(coder aDecoder: NSCoder) {
        self.authenticatedUID = aDecoder.decodeObject(forKey: "authenticatedUID") as! String
        self.authenticatedScreenName = aDecoder.decodeObject(forKey: "authenticatedScreenName") as! String
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(self.authenticatedScreenName, forKey: "authenticatedScreenName")
        aCoder.encode(self.authenticatedUID, forKey: "authenticatedUID")
        super.encode(with: aCoder)
    }
}



