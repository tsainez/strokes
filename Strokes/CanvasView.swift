//
//  CanvasView.swift
//  Strokes
//
//  Created by Anthony Sainez on 8/27/18.
//  Adapted from Brian Advent's repository on GitHub
//  Copyright © 2018 Anthony Sainez. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var lineColor:UIColor!
    var lineWidth:CGFloat!
    var path:UIBezierPath!
    var touchPoint:CGPoint!
    var startingPoint:CGPoint!
    
    override func layoutSubviews() {
        // called when it is layed out by the system, similar to init
        // no specific frame needed
        
        self.clipsToBounds = true // cannot draw over the edges
        self.isMultipleTouchEnabled = false // only recognize one touch
        
        lineColor = UIColor.black
        lineWidth = 1.5 // small width for drawing characters
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self) // canvas view is a view

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // called when putting finger on surface, and when moving finger.
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint // updating starting point every time movement made
        
        drawShapeLayer()
    }
    
    func drawShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
    func clearCanvas() {
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }

}
