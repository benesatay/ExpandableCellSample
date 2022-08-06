//
//  Extensions + UIView.swift
//  ListWithExpandableCell
//
//  Created by Bahadır Enes Atay on 6.08.2022.
//

import UIKit

extension UIView {
    func createGradientLayer(_ colors: [CGColor],
                             startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.colors = colors
        gradientLayer.drawsAsynchronously = true
        gradientLayer.frame = self.frame
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
