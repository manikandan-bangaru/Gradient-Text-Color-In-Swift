
import UIKit
func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {

      UIGraphicsBeginImageContext(gradientLayer.bounds.size)
      gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return UIColor(patternImage: image!)
}
func getGradientLayer(bounds : CGRect) -> CAGradientLayer{
    let gradient = CAGradientLayer()
    gradient.frame = bounds
    // gradient colors in order which they will visually appear
    gradient.colors = [UIColor.red.cgColor,UIColor.blue.cgColor, UIColor.green.cgColor]

    // Gradient from left to right
    gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    return gradient
}

let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
textView.font = UIFont.boldSystemFont(ofSize:80)
textView.textAlignment = .center
textView.text = "Create Gradient Text Color for UIText, UIButton, UITextView,etc in iOS"
let gradient = getGradientLayer(bounds: textView.bounds)
textView.textColor = gradientColor(bounds: textView.bounds, gradientLayer: gradient)

let button = UIButton(frame: textView.bounds)
button.setTitle("Hello World", for: .normal)
button.titleLabel?.font =  UIFont.boldSystemFont(ofSize:80)
button.setTitleColor(gradientColor(bounds: textView.bounds, gradientLayer: gradient), for: .normal)
let label = UILabel(frame: textView.bounds)
label.text = "Hello World!"
label.font =  UIFont.boldSystemFont(ofSize:80)
label.textColor = gradientColor(bounds: textView.bounds, gradientLayer: gradient)
