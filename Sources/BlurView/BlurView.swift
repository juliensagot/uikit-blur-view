#if canImport(UIKit)
import UIKit

open class BlurView: UIView {
  public override class var layerClass: AnyClass {
    GaussianBlurLayer.self
  }
  
  /// The radius of the Gaussian blur effect applied to the view.
  ///
  /// Adjust this property to change the intensity of the blur. A higher value results in a stronger blur effect.
  /// The value is measured in points and must be non-negative.
  ///
  /// - Note: The default value is `0.0`, which means no blur is applied.
  public var blurRadius: Double {
    get { (layer as! GaussianBlurLayer).blurRadius }
    set { (layer as! GaussianBlurLayer).blurRadius = newValue  }
  }
}
#endif
