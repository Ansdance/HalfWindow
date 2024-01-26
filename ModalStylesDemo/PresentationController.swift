//
//  CustomPresentationController.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 26.01.2024.
//  Copyright © 2024 ANSAR DAULETBAYEV. All rights reserved.
//

import UIKit

//class PresentationController: UIPresentationController {
//    override var frameOfPresentedViewInContainerView: CGRect {
//        let bounds = containerView!.bounds
//        let halfHeight = bounds.height / 2
//        return CGRect(x: 0,
//                      y: halfHeight,
//                      width: bounds.width,
//                      height: halfHeight)
//    }
//}
class PresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        let bounds = containerView!.bounds
        let height: CGFloat = 300
        return CGRect(x: 0,
                      y: bounds.height - height,
                      width: bounds.width,
                      height: height)
    }
}
