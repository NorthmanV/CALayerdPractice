//
//  CATextLayerVC.swift
//  CALayersPractice
//
//  Created by Ruslan Akberov on 31/08/2019.
//  Copyright © 2019 Ruslan Akberov. All rights reserved.
//

import UIKit

class CATextLayerVC: UIViewController {
    
    @IBOutlet weak var viewForTextLayer: UIView!
    
    let textLayer = CATextLayer()
    let text = String(repeating: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce auctor arcu quis velit congue dictum. ", count: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
    }
    
    override func viewDidLayoutSubviews() {
        textLayer.frame = viewForTextLayer.bounds
    }
    
    private func setupLayer() {
        viewForTextLayer.layer.addSublayer(textLayer)
        textLayer.string = text
        textLayer.font = CTFontCreateWithName("Arial" as CFString, 12, nil)
        textLayer.fontSize = 20
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.backgroundColor = UIColor.darkGray.cgColor
        textLayer.isWrapped = true
        textLayer.alignmentMode = .center
        textLayer.truncationMode = .end
    }
    
}
