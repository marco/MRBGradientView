# MRBGradientView

MRBGradientView an iOS view class for creating gradients and shadows with ease.
It supports usage through code as well as within the Interface Builder.

<img src="https://user-images.githubusercontent.com/17259768/48664515-97384580-ea54-11e8-8f7c-b893d34e682e.png" width="400">

## Supported Features

 - Gradient creation.
 - Custom starting and ending points.
 - Shadow color, blur, and opacity.
 - Shadow offset and spread.
 - Custom border radius.
 - Gradient and shadow animations.

## Installation

MRBGradientView can be installed with CocoaPods.

In your `Podfile`, add `MRBGradientView`.

```ruby
pod 'MRBGradientView'
```

Then install your Pods.

```bash
pod install
```

---

## Docs

### Properties

 - **color1**: The first gradient color.
 - **color2**: The second gradient color.
 - **shadowHorizontalOffset**: The horizontal offset for the shadow.
 - **shadowVerticalOffset**: The vertical offset for the shadow.
 - **shadowColor**: The color of the shadow.
 - **shadowBlur**: The blur radius for the shadow.
 - **shadowSpread**: The spread amount for the shadow.
 - **color1HorizontalPosition**: The horizontal position for `color1`, from `0`
   to `1`. `0` represents the left edge, while `1` is the right edge.
 - **color1VerticalPosition**: The vertical position for `color1`, from `0` to
   `1`. `0` represents the top edge, while `1` is the bottom edge.
 - **color2HorizontalPosition**: The horizontal position for `color2`, from `0`
   to `1`. `0` represents the left edge, while `1` is the right edge.
 - **color2VerticalPosition**: The vertical position for `color2`, from `0` to
   `1`. `0` represents the top edge, while `1` is the bottom edge.
 - **borderRadius**: The border radius for this view.

### Methods

 - **animateColors(toColor1, toColor2, duration, timingFunctionName)**:
   Animates the colors of this view.
    - *toColor1*: The new first color.
    - *toColor2*: The new second color.
    - *duration*: The length of the animation.
    - *timingFunctionName*: The timing function to use for this animation.
      Defaults to linear.

 - **animateColor1Position(toHorizontalPosition, toVerticalPosition, duration,
   timingFunctionName)**: Animates the position of the first color.
    - *toHorizontalPosition*: The new horizontal position.
    - *toVerticalPosition*: The new vertical position.
    - *duration*: The length of the animation.
    - *timingFunctionName*: The timing function to use for this animation.
      Defaults to linear.

 - **animateColor2Position(toHorizontalPosition, toVerticalPosition, duration,
   timingFunctionName)**: Animates the position of the second color.
    - *toHorizontalPosition*: The new horizontal position.
    - *toVerticalPosition*: The new vertical position.
    - *duration*: The length of the animation.
    - *timingFunctionName*: The timing function to use for this animation.
      Defaults to linear.

 - **animateShadowColor(toShadowColor, duration, timingFunctionName)**:
   Animates the color of the shadow.
    - *toShadowColor*: The new shadow color.
    - *duration*: The length of the animation.
    - *timingFunctionName*: The timing function to use for this animation.
      Defaults to linear.

 - **animateShadowRadius(toShadowRadius, duration, timingFunctionName)**:
   Animates the radius of the shadow.
    - *toShadowRadius*: The new shadow radius.
    - *duration*: The length of the animation.
    - *timingFunctionName*: The timing function to use for this animation.
      Defaults to linear.

 - **animateShadowOpacity(toShadowOpacity, duration, timingFunctionName)**:
   Animates the opacity of the shadow.
    - *toShadowOpacity*: The new shadow opacity.
    - *duration*: The length of the animation.
    - *timingFunctionName*: The timing function to use for this animation.
