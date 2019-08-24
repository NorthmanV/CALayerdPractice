//
//  ScrollingView.swift
//  CALayersPractice
//
//  Created by Ruslan Akberov on 24/08/2019.
//  Copyright © 2019 Ruslan Akberov. All rights reserved.
//

import UIKit

class ScrollingView: UIView {
    
    override class var layerClass: AnyClass {
        return CAScrollLayer.self
    }
    
}
