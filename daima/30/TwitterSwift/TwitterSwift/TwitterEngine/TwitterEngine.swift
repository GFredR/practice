//
//  TwitterEngine.swift
//  TwitterSwift


import UIKit
import Foundation

protocol TwitterEngineDelegate {
    func controllerToPresentAuthenticationWebView () -> UIViewController
}

enum HTTPRequestMethod : String {
    case POST = "POST"
    case GET  = "GET"
}

class TwitterEngine {
    // MARK: Public Properties
    var delegate : TwitterEngineDelegate?
    var user : TwitterConsumer?
    var authenticatedUserName : String? {
        return self.accessToken?.authenticatedScreenName
    }
    //block of code to excute when the authentication completes
    var onCompletingAuthenticationBlock: (() -> Void)?
    
    class var sharedEngine : TwitterEngine {
        struct Singleton {
            static let instance = TwitterEngine ()
        }
        return Singleton.instance
    }
    
    // MARK:  Private Properties
    private let session = URLSession (configuration: URLSessionConfiguration.default())
    private lazy var accessToken = AccessToken.loadAccessToken()
    
    // MARK:  Public functions
    func isAuthenticated () -> Bool {
        if self.user == nil || self.accessToken?.key == nil || self.accessToken?.secret == nil {
            return false
        }
        return true
    }
    
    func requestAccessToken (_ requestToken : Token) {
        let url = URL (string: "https://api.twitter.com/oauth/access_token")
        let request = self.generateSignedRequest(url!, token: requestToken, method: .POST)
        self.session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
               self.accessToken = AccessToken (stringToParse: responseString as String).save()
                //run completion block on main queue
                if self.onCompletingAuthenticationBlock != nil {
                
                }
            }
        }).resume()
    }
    
    func authenticate (_ completionHandler: (()->Void)?) {
        self.onCompletingAuthenticationBlock = completionHandler
        let url = URL (string: "https://api.twitter.com/oauth/request_token")
        let request = self.generateSignedRequest(url!, token: nil, method: .POST)
        self.session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                if error == nil {
                    if let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                        let token = Token (stringToParse: responseString as String)
                        let controller = self.delegate?.controllerToPresentAuthenticationWebView()
                        let authenticationWebController = TwitterAuthenticationWebController (requestToken: token)
                        let navCon = UINavigationController (rootViewController:authenticationWebController)
                        controller?.present(navCon, animated: true, completion: nil)
                    }
                }
                else {
                    let   alertView = UIAlertView (title: "Network Error", message: "Failed to fetch Request TOken", delegate: nil, cancelButtonTitle: "Okay", otherButtonTitles: "")
                    alertView.show()
                }
            })
        }).resume()
    }
    
    // MARK: Private functions
    private func generateSignedRequest (_ url : URL, token: Token?, method : HTTPRequestMethod)
        -> URLRequest {
            let mutablRequest = NSMutableURLRequest (url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
            mutablRequest.httpMethod = method.rawValue
            if let user = self.user  {
                self.signRequest(mutablRequest, token: token, user: user)
            }
            return mutablRequest as URLRequest
    }
    
    private func signRequest (_ request : NSMutableURLRequest, token : Token?, user: TwitterConsumer) {
        TwitterRequestSinging.sign(request , withToken: token?.key, tokenSecret: token?.secret, verifier: token?.verifier, key: user.key, secret: user.secret)
    }
}
