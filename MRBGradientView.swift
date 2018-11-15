import UIKit

/**
    A view that can be configured with gradients, shadows, and a border radius.
    See https://github.com/skunkmb/MRBGradientView.

     - Author: Marco Burstein <marco@marco.how>
 */
@IBDesignable class MRBGradientView: UIView {
    /// The first gradient color.
    @IBInspectable var color1: UIColor = UIColor.red {
        didSet {
            setNeedsLayout();
        }
    }

    /// The second gradient color.
    @IBInspectable var color2: UIColor = UIColor.blue {
        didSet {
            setNeedsLayout();
        }
    }

    /// The horizontal offset for the shadow.
    @IBInspectable var shadowHorizontalOffset: CGFloat = 0.0 {
        didSet {
            setNeedsLayout();
        }
    }

    /// The vertical offset for the shadow.
    @IBInspectable var shadowVerticalOffset: CGFloat = 0.0 {
        didSet {
            setNeedsLayout();
        }
    }

    /// The color for the shadow.
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            setNeedsLayout();
        }
    }

    /// The blur radius for the shadow.
    @IBInspectable var shadowBlurRadius: CGFloat = 0.0 {
        didSet {
            setNeedsLayout();
        }
    }

    /// The opacity for the shadow, from 0 to 1.
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet {
            setNeedsLayout();
        }
    }

    /// The spread amount for the shadow, from 0 to 1.
    @IBInspectable var shadowSpread: CGFloat = 0.0 {
        didSet {
            setNeedsLayout();
        }
    }

    /// The horizontal position for the first color, from 0 to 1.
    @IBInspectable var color1HorizontalPosition: CGFloat = 0.5 {
        didSet {
            setNeedsLayout();
        }
    }

    /// The vertical position for the first color, from 0 to 1.
    @IBInspectable var color1VerticalPosition: CGFloat = 0.0 {
        didSet {
            setNeedsLayout();
        }
    }

    /// The horizontal position for the second color, from 0 to 1.
    @IBInspectable var color2HorizontalPosition: CGFloat = 0.5 {
        didSet {
            setNeedsLayout();
        }
    }

    /// The vertical position for the second color, from 0 to 1.
    @IBInspectable var color2VerticalPosition: CGFloat = 1.0 {
        didSet {
            setNeedsLayout();
        }
    }

    /// The border radius for this view.
    @IBInspectable var borderRadius: CGFloat = 0.0 {
        didSet {
            setNeedsLayout();
        }
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        (layer as? CAGradientLayer)?.colors = [color1.cgColor, color2.cgColor]
        (layer as? CAGradientLayer)?.startPoint = CGPoint(
            x: color1HorizontalPosition,
            y: color1VerticalPosition
        );
        (layer as? CAGradientLayer)?.endPoint = CGPoint(
            x: color2HorizontalPosition,
            y: color2VerticalPosition
        );
        layer.cornerRadius = borderRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = shadowBlurRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize(
            width: shadowHorizontalOffset,
            height: shadowVerticalOffset
        );

        if shadowSpread == 0 {
            layer.shadowPath = nil
        } else {
            let insetRectangle = layer.bounds.insetBy(
                dx: -shadowSpread,
                dy: -shadowSpread
            )
            layer.shadowPath = UIBezierPath(
                roundedRect: insetRectangle,
                cornerRadius: borderRadius
            ).cgPath
        }
    }

    /**
        Animates the colors of this view.

         - Parameters:
            - toColor1: The new first color.
            - toColor2: The new second color.
            - duration: The length of the animation.
            - timingFunctionName: The timing function to use for this animation.
    **/
    func animateColors(
        toColor1: UIColor,
        toColor2: UIColor,
        duration: TimeInterval,
        timingFunctionName: CAMediaTimingFunctionName = CAMediaTimingFunctionName.linear
    ) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = (layer as? CAGradientLayer)?.colors
        animation.toValue = [toColor1.cgColor, toColor2.cgColor]
        animation.duration = duration
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: timingFunctionName)
        (layer as? CAGradientLayer)?.add(animation, forKey:"colors")
        (layer as? CAGradientLayer)?.colors = [toColor1.cgColor, toColor2.cgColor]
    }

    /**
        Animates the position of the first color.

         - Parameters:
            - toHorizontalPosition: The new horizontal position.
            - toVerticalPosition: The new vertical position.
            - duration: The length of the animation.
            - timingFunctionName: The timing function to use for this animation.
    **/
    func animateColor1Position(
        toHorizontalPosition: CGFloat,
        toVerticalPosition: CGFloat,
        duration: TimeInterval,
        timingFunctionName: CAMediaTimingFunctionName = CAMediaTimingFunctionName.linear
    ) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "startPoint")
        animation.fromValue = (layer as? CAGradientLayer)?.startPoint
        animation.toValue = CGPoint(x: toHorizontalPosition, y: toVerticalPosition)
        animation.duration = duration
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: timingFunctionName)
        (layer as? CAGradientLayer)?.add(animation, forKey:"startPoint")
        (layer as? CAGradientLayer)?.startPoint = CGPoint(x: toHorizontalPosition, y: toVerticalPosition)
    }

    /**
        Animates the position of the second color.

         - Parameters:
            - toHorizontalPosition: The new horizontal position.
            - toVerticalPosition: The new vertical position.
            - duration: The length of the animation.
            - timingFunctionName: The timing function to use for this animation.
    **/
    func animateColor2Position(
        toHorizontalPosition: CGFloat,
        toVerticalPosition: CGFloat,
        duration: TimeInterval,
        timingFunctionName: CAMediaTimingFunctionName = CAMediaTimingFunctionName.linear
    ) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "endPoint")
        animation.fromValue = (layer as? CAGradientLayer)?.startPoint
        animation.toValue = CGPoint(x: toHorizontalPosition, y: toVerticalPosition)
        animation.duration = duration
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: timingFunctionName)
        (layer as? CAGradientLayer)?.add(animation, forKey:"endPoint")
        (layer as? CAGradientLayer)?.endPoint = CGPoint(x: toHorizontalPosition, y: toVerticalPosition)
    }

    /**
        Animates the color of the shadow.

         - Parameters:
            - toShadowColor: The new shadow color.
            - duration: The length of the animation.
            - timingFunctionName: The timing function to use for this animation.
    **/
    func animateShadowColor(
        toShadowColor: UIColor,
        duration: TimeInterval,
        timingFunctionName: CAMediaTimingFunctionName = CAMediaTimingFunctionName.linear
    ) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = layer.shadowColor
        animation.toValue = toShadowColor.cgColor
        animation.duration = duration
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: timingFunctionName)
        layer.add(animation, forKey:"shadowColor")
        (layer as? CAGradientLayer)?.shadowColor = toShadowColor.cgColor
    }

    /**
        Animates the radius of the shadow.

         - Parameters:
            - toShadowRadius: The new shadow radius.
            - duration: The length of the animation.
            - timingFunctionName: The timing function to use for this animation.
    **/
    func animateShadowRadius(
        toShadowRadius: CGFloat,
        duration: TimeInterval,
        timingFunctionName: CAMediaTimingFunctionName = CAMediaTimingFunctionName.linear
    ) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "shadowRadius")
        animation.fromValue = layer.shadowOpacity
        animation.toValue = toShadowRadius
        animation.duration = duration
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: timingFunctionName)
        layer.add(animation, forKey:"shadowRadius")
        (layer as? CAGradientLayer)?.shadowRadius = toShadowRadius
    }

    /**
        Animates the opacity of the shadow.

         - Parameters:
            - toShadowOpacity: The new shadow opacity.
            - duration: The length of the animation.
            - timingFunctionName: The timing function to use for this animation.
    **/
    func animateShadowOpacity(
        toShadowOpacity: Float,
        duration: TimeInterval,
        timingFunctionName: CAMediaTimingFunctionName = CAMediaTimingFunctionName.linear
    ) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = layer.shadowOpacity
        animation.toValue = toShadowOpacity
        animation.duration = duration
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: timingFunctionName)
        layer.add(animation, forKey:"shadowOpacity")
        (layer as? CAGradientLayer)?.shadowOpacity = toShadowOpacity
    }
}
