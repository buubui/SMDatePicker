//
//  BorderToolBar.swift
//  FITpin
//
//  Created by Buu Bui on 8/15/15.
//  Copyright (c) 2015 fitpin. All rights reserved.
//

import UIKit
@IBDesignable public class BorderToolBar: UIToolbar {
  @IBInspectable public var cornerRadius: CGFloat = 0
  @IBInspectable public var leftBorder: Bool = false
  @IBInspectable public var rightBorder: Bool = false
  @IBInspectable public var topBorder: Bool = false
  @IBInspectable public var bottomBorder: Bool = false
  @IBInspectable public var borderWidth: CGFloat = 0
  @IBInspectable public var borderColor: UIColor = UIColor.clearColor()
  override public func drawRect(rect: CGRect) {
    let context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor )
    let moveWidth = self.borderWidth / 2
    CGContextSetLineWidth(context, borderWidth)
    if topBorder {
      CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect) + moveWidth)
      CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect) + moveWidth) // top
    }
    if leftBorder {
      CGContextMoveToPoint(context, CGRectGetMinX(rect) + moveWidth, CGRectGetMinY(rect))
      CGContextAddLineToPoint(context, CGRectGetMinX(rect) + moveWidth, CGRectGetMaxY(rect))
    }
    if rightBorder {
      CGContextMoveToPoint(context, CGRectGetMaxX(rect) - moveWidth, CGRectGetMinY(rect))
      CGContextAddLineToPoint(context, CGRectGetMaxX(rect) - moveWidth, CGRectGetMaxY(rect))
    }
    if bottomBorder {
      CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect) - moveWidth)
      CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect) - moveWidth)
    }
    CGContextStrokePath(context)
    self.layer.cornerRadius = cornerRadius
  }
}
