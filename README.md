# GradientTextColorInSwift
Create gradient UIColor in swift

Checkout medium post : -

https://medium.com/@mkd0237/how-to-create-generic-gradient-text-colour-pattern-color-for-uilabel-uibutton-uitextview-etc-1f0616d96af6


func getGradientLayer(bounds:CGRect) -> CAGradientLayer{
    let gradient = CAGradientLayer()
    gradient.frame = bounds
    // gradient colors in order which they will visually appear
    gradient.colors = [UIColor.red.cgColor,UIColor.blue.cgColor, UIColor.green.cgColor]
    // Gradient from left to right
    gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    return gradient
}

func gradientColor(bounds:CGRect, gradientLayer:CAGradientLayer) -> UIColor? {
    UIGraphicsBeginImageContext(gradientLayer.bounds.size)
    gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return UIColor(patternImage: image!)
}
let button = UIButton(frame: CGRect(x: 0, y: 0, width: 600, height: 120))
button.setTitle("Hello World", for: .normal)
button.titleLabel?.font = UIFont.boldSystemFont(ofSize:80)
let gradient = getGradientLayer(bounds: button.bounds)
button.setTitleColor(gradientColor(bounds: button.bounds, gradientLayer: gradient), for: .normal)
