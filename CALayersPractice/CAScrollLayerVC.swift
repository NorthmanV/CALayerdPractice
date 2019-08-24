//
//  CAScrollLayerVC.swift
//  CALayersPractice
//
//  Created by Ruslan Akberov on 24/08/2019.
//  Copyright © 2019 Ruslan Akberov. All rights reserved.
//

import UIKit

class CAScrollLayerVC: UIViewController {
    
    @IBOutlet weak var scrollingView: ScrollingView!
    
    var scrollingViewLayer: CAScrollLayer {
        return scrollingView.layer as! CAScrollLayer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
    }
    
    private func setupLayer() {
        scrollingViewLayer.scrollMode = .both
        scrollingViewLayer.cornerRadius = 4
    }
    
    @IBAction func panGestureTapped(_ sender: UIPanGestureRecognizer) {
        var newPoint = scrollingView.bounds.origin
        newPoint.x -= sender.translation(in: scrollingView).x
        newPoint.y -= sender.translation(in: scrollingView).y
        sender.setTranslation(.zero, in: scrollingView)
        scrollingViewLayer.scroll(to: newPoint)
        
        if sender.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                [unowned self] in
                self.scrollingViewLayer.scroll(to: CGPoint.zero)
                }, completion: nil)
        }
    }
    
}
