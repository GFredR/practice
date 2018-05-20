//
//  ZSocialScrollView.swift
//  ZPullView


import UIKit

@objc protocol ZSocialPullDelegate {
    func ZSocialPullAction(_ view: ZSocialPullView,action:String)
}

class ZSocialPullView: UIView, UIScrollViewDelegate
{
    var Zdelegate: ZSocialPullDelegate?
    
    var scrollview: UIScrollView!
    
    var likeEmptyImage: UIImage?
    var likeFilledImage: UIImage?
    
    var emptyLikeView: UIView!
    var filledLikeView: UIView!
    
    var shareEmptyImage: UIImage?
    var shareFilledImage: UIImage?
    
    var emptyShareView: UIView!
    var filledShareView: UIView!
    
    var backgroundColorOriginal: UIColor?
    
    private var originalView: UIView!
    private var bounceVar:CGFloat = 0.0
    private var bouncing:Bool = false
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setLikeImages(_ emptyImage: UIImage, filledImage: UIImage)
    {
        likeEmptyImage = emptyImage
        likeFilledImage = filledImage
    }
    
    func setShareImages(_ emptyImage: UIImage, filledImage: UIImage)
    {
        shareEmptyImage = emptyImage
        shareFilledImage = filledImage
    }
    
    func setUIView(_ view: UIView){
        
        //Centering the original View
        view.frame = CGRect(x: self.frame.width/2-view.frame.width/2, y: self.frame.height/2-view.frame.height/2, width: view.frame.width, height: view.frame.height)
        view.backgroundColor = backgroundColorOriginal
        //
        originalView = view
        
        //Like Button Filled
        filledLikeView = UIView(frame: CGRect(x: view.frame.width-65+view.frame.origin.x, y: self.frame.height/2-25, width: 50, height:50))
        let likeFilledImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: filledLikeView.frame.width, height: filledLikeView.frame.height))
        likeFilledImageView.image = likeFilledImage
        filledLikeView.addSubview(likeFilledImageView)
        self.addSubview(filledLikeView)
        
        //Like Button Empty
        emptyLikeView = UIView(frame: CGRect(x: view.frame.width-65+view.frame.origin.x, y: self.frame.height/2-25, width: 50, height:50))
        emptyLikeView.backgroundColor = backgroundColorOriginal
        let likeEmptyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: emptyLikeView.frame.width, height: emptyLikeView.frame.height))
        likeEmptyImageView.image = likeEmptyImage
        emptyLikeView?.addSubview(likeEmptyImageView)
        self.addSubview(emptyLikeView!)
        
        //Share Button Filled
        filledShareView = UIView(frame: CGRect(x: view.frame.origin.x+15, y: self.frame.height/2-25, width: 50, height:50))
        let shareFilledImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: filledShareView.frame.width, height: filledShareView.frame.height))
        shareFilledImageView.image = shareFilledImage
        filledShareView.addSubview(shareFilledImageView)
        self.addSubview(filledShareView)
        
        //Share Button Empty
        emptyShareView = UIView(frame: CGRect(x: view.frame.origin.x+15, y: self.frame.height/2-25, width: 50, height:50))
        emptyShareView.backgroundColor = backgroundColorOriginal
        let shareEmptyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: emptyShareView.frame.width, height: emptyShareView.frame.height))
        shareEmptyImageView.image = shareEmptyImage
        emptyShareView?.addSubview(shareEmptyImageView)
        self.addSubview(emptyShareView!)
        
        
        //
        scrollview = UIScrollView(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        scrollview.delegate = self
        scrollview.bounces = true
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.alwaysBounceHorizontal = true
        scrollview.backgroundColor = UIColor.clear()
        scrollview.contentSize = CGSize(width: self.frame.width+1, height: self.frame.height)
        self.addSubview(scrollview)
        scrollview.addSubview(view)
        
        emptyLikeView.isHidden = true
        filledLikeView.isHidden = true
        emptyShareView.isHidden = true
        filledShareView.isHidden = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let n = scrollView.contentOffset.x / self.frame.width
        if bouncing == false {
            if n>0{
                self.colorLikeView(n)
                emptyLikeView.isHidden = false
                filledLikeView.isHidden = false
                emptyShareView.isHidden = true
                filledShareView.isHidden = true
                
            }
            else if n<0{
                self.colorShareView(n)
                emptyLikeView.isHidden = true
                filledLikeView.isHidden = true
                emptyShareView.isHidden = false
                filledShareView.isHidden = false
            }
        }
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        bouncing = true
        
        if scrollview.contentOffset.x >= 75.0 {
            self.didLike()
        }
        else if scrollview.contentOffset.x <= -75.0 {
            self.didShare()
        }
        
        if scrollview.contentOffset.x >= 0 {
            self.filledShareView.isHidden = true
            self.emptyShareView.isHidden = true
        }
        else if scrollview.contentOffset.x < 0 {
            self.filledLikeView.isHidden = true
            self.emptyLikeView.isHidden = true
        }
        
        if scrollView.contentOffset.x >= 50 { bounceVar = 50 }
        if scrollView.contentOffset.x < 50 && scrollView.contentOffset.x > -50 { bounceVar = scrollView.contentOffset.x }
        if scrollView.contentOffset.x < -50 { bounceVar = -50 }

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            //self.scrollview.setContentOffset(CGPointMake(0.00266666666666667, 0), animated: true)
            self.scrollview.setContentOffset(CGPoint(x: 0.00266666666666667-self.bounceVar, y: 0), animated: true)
            }, completion:{
                finished in
                _ = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(ZSocialPullView.bounceBack1), userInfo: nil, repeats: false)
        })
    }
    
    func bounceBack1()
    {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            //self.scrollview.setContentOffset(CGPointMake(0.00266666666666667, 0), animated: true)
            self.scrollview.setContentOffset(CGPoint(x: 0.00266666666666667+self.bounceVar/2, y: 0), animated: true)
            self.layoutIfNeeded()
            }, completion:{
                finished in
                self.filledLikeView.isHidden = true
                self.emptyLikeView.isHidden = true
                self.filledShareView.isHidden = true
                self.emptyShareView.isHidden = true
                _ = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(ZSocialPullView.bounceBack2), userInfo: nil, repeats: false)
        })
    }
    
    func bounceBack2()
    {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            //self.scrollview.setContentOffset(CGPointMake(0.00266666666666667, 0), animated: true)
            self.scrollview.setContentOffset(CGPoint(x: 0.00266666666666667-self.bounceVar/4, y: 0), animated: true)
            self.layoutIfNeeded()
            }, completion:{
                finished in
                _ = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(ZSocialPullView.bounceBack3), userInfo: nil, repeats: false)
        })
    }
    
    func bounceBack3()
    {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            //self.scrollview.setContentOffset(CGPointMake(0.00266666666666667, 0), animated: true)
            self.scrollview.setContentOffset(CGPoint(x: 0.00266666666666667, y: 0), animated: true)
            self.layoutIfNeeded()
            }, completion:{
                finished in
                self.filledLikeView.isHidden = false
                self.emptyLikeView.isHidden = false
                self.filledShareView.isHidden = false
                self.emptyShareView.isHidden = false
                self.bouncing = false
        })
    }
    
    func colorLikeView(_ percent: CGFloat){
        let x = (percent*100)/0.29
        var y = (50-x)+20
        if  (y<0){
            y=0
            }
            emptyLikeView.frame = CGRect(x: originalView.frame.width-65+originalView.frame.origin.x, y: self.frame.height/2-25, width: 100, height:y)
    }
    
    func colorShareView(_ percent: CGFloat){
        let abspercent = abs(percent)
        let x = (abspercent*100)/0.29
        var y = (50-x)+20
        if  (y<0){
            y=0
        }
        emptyShareView.frame = CGRect(x: originalView.frame.origin.x+15, y: self.frame.height/2-25, width: 100, height:y)
    }
    
    func didLike(){
        self.Zdelegate?.ZSocialPullAction(self, action: "didLike")
    }
    
    func didShare(){
        self.Zdelegate?.ZSocialPullAction(self, action: "didShare")
    }
}
