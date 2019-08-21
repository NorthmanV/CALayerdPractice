//
//  ViewController.swift
//  CALayersPractice
//
//  Created by Ruslan Akberov on 21/08/2019.
//  Copyright © 2019 Ruslan Akberov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForLayer: UIView!
    
    var layer: CALayer {
        return viewForLayer.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
    }
    
    private func setupLayer() {
        layer.backgroundColor = UIColor.blue.cgColor
        layer.borderWidth = 100
        layer.borderColor = UIColor.red.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10
        layer.contents = UIImage(named: "star")!.cgImage
        layer.contentsGravity = .center
    }

    @IBAction func viewForLayerTapped(_ sender: UITapGestureRecognizer) {
        layer.shadowOpacity = layer.shadowOpacity == 0.7 ? 0 : 0.7
    }
    
    @IBAction func viewForLayerPinched(_ sender: UIPinchGestureRecognizer) {
        let offset: CGFloat = sender.scale < 1 ? 2 : -2
        let oldFrame = layer.frame
        let oldOrigin = oldFrame.origin
        let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
        let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
        let newFrame = CGRect(origin: newOrigin, size: newSize)
        if newFrame.width >= 100 && newFrame.width <= 300 {
            layer.borderWidth -= offset
            layer.cornerRadius += (offset / 2)
            layer.frame = newFrame
        }
    }
    
}

