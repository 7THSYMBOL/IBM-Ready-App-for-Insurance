/*
Licensed Materials - Property of IBM
© Copyright IBM Corporation 2015. All Rights Reserved.
*/

import CoreFoundation
import Foundation
import UIKit

extension UIView{
    var width: CGFloat { return self.frame.size.width }
    var height: CGFloat { return self.frame.size.height }
    var size: CGSize  { return self.frame.size}
    
    var origin: CGPoint { return self.frame.origin }
    var x: CGFloat { return self.frame.origin.x }
    var y: CGFloat { return self.frame.origin.y }
    var centerX: CGFloat { return self.center.x }
    var centerY: CGFloat { return self.center.y }
    
    var left: CGFloat { return self.frame.origin.x }
    var right: CGFloat { return self.frame.origin.x + self.frame.size.width }
    var top: CGFloat { return self.frame.origin.y }
    var bottom: CGFloat { return self.frame.origin.y + self.frame.size.height }
    
    func setWidth(width:CGFloat)
    {
        self.frame.size.width = width
    }
    
    func setHeight(height:CGFloat)
    {
        self.frame.size.height = height
    }
    
    func setSize(size:CGSize)
    {
        self.frame.size = size
    }
    
    func setOrigin(point:CGPoint)
    {
        self.frame.origin = point
    }
    
    func setOriginX(x:CGFloat)
    {
        self.frame.origin = CGPointMake(x, self.frame.origin.y)
    }
    
    func setOriginY(y:CGFloat)
    {
        self.frame.origin = CGPointMake(self.frame.origin.x, y)
    }
    
    func setCenterX(x:CGFloat)
    {
        self.center = CGPointMake(x, self.center.y)
    }
    
    func setCenterY(y:CGFloat)
    {
        self.center = CGPointMake(self.center.x, y)
    }
    
    func roundCorner(radius:CGFloat)
    {
        self.layer.cornerRadius = radius
    }
    
    func setTop(top:CGFloat)
    {
        self.frame.origin.y = top
    }
    
    func setLeft(left:CGFloat)
    {
        self.frame.origin.x = left
    }
    
    func setRight(right:CGFloat)
    {
        self.frame.origin.x = right - self.frame.size.width
    }
    
    func setBottom(bottom:CGFloat)
    {
        self.frame.origin.y = bottom - self.frame.size.height
    }
    
    func shakeView() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.06
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(self.center.x - 10, self.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(self.center.x + 10, self.center.y))
        self.layer.addAnimation(animation, forKey: "position")
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(CGColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.CGColor
        }
    }
    
    ///
    /// Begin Auto Layout extension code
    ///
    /// NOTE: If you are adjusting constraints on outlets
    /// that have already been set in storyboard, make sure to
    /// call removeAllConstraints() before starting to set
    /// constraints via code with these methods.
    ///
    
    var differentSuperviewsWarningMessage: String {
        return "Since you are adding a constraint to self.superview, self and the view passed in need to have the same superview. The views you are trying to align do not have the same superview."
    }
    
    /// Remove all constraints from a view. Make sure you don't have a weak reference to your view/outlet, else it might be deallocated.
    func removeAllConstraints() {
        let theSuperview = self.superview
        self.removeFromSuperview()
        theSuperview?.addSubview(self)
    }
    
    /// Center the view vertically and horizontally in superview.
    func centerInSuperview() {
        self.centerVerticallyInSuperview()
        self.centerHorizontallyInSuperview()
    }
    
    /// Center the view vertically in superview.
    func centerVerticallyInSuperview() {
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1,
            constant: 0))
    }
    
    /// Center the view horizontally in superview.
    func centerHorizontallyInSuperview() {
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0))
    }
    
    /// Set the leading (left) space to superview.
    ///
    /// - parameter space: The amount to space.
    func leadingSpaceToSuperview(space: CGFloat) {
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: space))
    }
    
    /// Set the top space to superview.
    ///
    /// - parameter space: The amount to space.
    func topSpaceToSuperview(space: CGFloat) {
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: space))
    }
    
    /// Set the bottom space to superview.
    ///
    /// - parameter space: The amount to space.
    func bottomSpaceToSuperview(space: CGFloat) {
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: -space))
    }
    
    /// Set the trailing (right) space to superview.
    ///
    /// - parameter space: The amount to space.
    func trailingSpaceToSuperview(space: CGFloat) {
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant: -space))
    }
    
    /// Space the calling view's left border away from the passed in view's right border.
    ///
    /// - parameter view: The view to space from.
    /// - parameter space: The amount to space.
    func horizontalSpacingToRightOf(view: UIView, space: CGFloat) {
        assert(self.superview == view.superview, differentSuperviewsWarningMessage)
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: space))
    }
    
    /// Space the calling view's right border away from the passed in view's left border.
    ///
    /// - parameter view: The view to space from.
    /// - parameter space: The amount to space.
    func horizontalSpacingToLeftOf(view: UIView, space: CGFloat) {
        assert(self.superview == view.superview, differentSuperviewsWarningMessage)
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: -space))
    }
    
    /// Space the calling view's top border away from the passed in view's bottom border.
    ///
    /// - parameter view: The view to space from.
    /// - parameter space: The amount to space.
    func verticalSpacingBelow(view: UIView, space: CGFloat) {
        assert(self.superview == view.superview, differentSuperviewsWarningMessage)
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: space))
    }
    
    /// Space the calling view's bottom border away from the passed in view's top border.
    ///
    /// - parameter view: The view to space from.
    /// - parameter space: The amount to space.
    func verticalSpacingAbove(view: UIView, space: CGFloat) {
        assert(self.superview == view.superview, differentSuperviewsWarningMessage)
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: -space))
    }
    
    /// Set the calling view's x center equal to the passed in view's x center.
    ///
    /// - parameter view: The view to center with.
    func centerXWith(view: UIView) {
        assert(self.superview == view.superview, differentSuperviewsWarningMessage)
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0))
    }
    
    /// Set the calling view's y center equal to the passed in view's y center.
    ///
    /// - parameter view: The view to center with.
    func centerYWith(view: UIView) {
        assert(self.superview == view.superview, differentSuperviewsWarningMessage)
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1,
            constant: 0))
    }
    
    /// Align the calling view's top border with the passed in view's top border.
    ///
    /// - parameter view: The view to align with.
    func alignTopWith(view: UIView) {
        assert(self.superview == view.superview, differentSuperviewsWarningMessage)
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 0))
    }
    
    /// Align the calling view's bottom border with the passed in view's bottom border.
    ///
    /// - parameter view: The view to align with.
    func alignBottomWith(view: UIView) {
        assert(self.superview == view.superview, differentSuperviewsWarningMessage)
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0))
    }
    
    /// Align the calling view's left border with the passed in view's left border.
    ///
    /// - parameter view: The view to align with.
    func alignLeftWith(view: UIView) {
        assert(self.superview == view.superview, differentSuperviewsWarningMessage)
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 0))
    }
    
    /// Align the calling view's right border with the passed in view's right border.
    ///
    /// - parameter view: The view to align with.
    func alignRightWith(view: UIView) {
        assert(self.superview == view.superview, differentSuperviewsWarningMessage)
        self.superview?.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: 0))
    }
    
    ///
    /// End Auto Layout extension code
    ///
}








