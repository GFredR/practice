//
//  NatureStickerBrowserViewController.swift


import UIKit
import Messages

class NatureStickerBrowserViewController: MSStickerBrowserViewController {
    
    var stickers = [MSSticker]()
    
    func loadStickers() {
        for i in 1...4 {
            createSticker(asset: "stick0\(i)", localizedDescription: "stick0\(i)")
        }
    }
    
    func changeBackgroundColor(color: UIColor) {
        stickerBrowserView.backgroundColor = color
    }
    
    func createSticker(asset: String, localizedDescription: String) {
        guard let stickerPath = Bundle.main.pathForResource(asset, ofType: "jpg") else {
            print("path error", asset)
            return
        }
        let stickerURL = URL(fileURLWithPath: stickerPath)
        
        let sticker: MSSticker
        
        do {
            try sticker = MSSticker(contentsOfFileURL: stickerURL, localizedDescription: localizedDescription)
            stickers.append(sticker)
        } catch  {
            print(error)
            return
        }
    }
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}
