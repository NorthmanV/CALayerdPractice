//
//  AVPlayerLayerVC.swift
//  CALayersPractice
//
//  Created by Ruslan Akberov on 07/09/2019.
//  Copyright © 2019 Ruslan Akberov. All rights reserved.
//

import UIKit
import AVKit

class AVPlayerLayerVC: UIViewController {
    
    @IBOutlet weak var viewForLayer: UIView!
    
    var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
    }
    
    private func setupLayer() {
        let url = Bundle.main.url(forResource: "diamonds", withExtension: "mov")!
        player = AVPlayer(url: url)
        player.actionAtItemEnd = .none
        
        let playerLayer = AVPlayerLayer()
        playerLayer.frame = viewForLayer.bounds
        playerLayer.player = player

        viewForLayer.layer.addSublayer(playerLayer)
        player.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidReachEnd), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
    }
    
    @objc func playerDidReachEnd(notification: NSNotification) {
        let playerItem = notification.object as! AVPlayerItem
        playerItem.seek(to: .zero, completionHandler: nil)
        player.play()
    }
}
