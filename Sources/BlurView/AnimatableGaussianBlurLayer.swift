import QuartzCore

final class GaussianBlurLayer: CALayer {
  private static let inputRadiusKeyPath = "filters.gaussianBlur.inputRadius"
  
  private let gaussianBlurEffect = GaussianBlurFilter()
  
  override init() {
    super.init()
    
    if let gaussianBlurEffect {
      gaussianBlurEffect.inputRadius = 0
      filters = [gaussianBlurEffect.effect]
    }
  }
  
  override init(layer: Any) {
    super.init(layer: layer)
    
    if let layer = layer as? GaussianBlurLayer {
      gaussianBlurEffect?.inputRadius = layer._blurRadius
      setValue(layer.blurRadius, forKeyPath: Self.inputRadiusKeyPath)
    }
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @NSManaged var _blurRadius: Double
  
  public var blurRadius: Double {
    get { gaussianBlurEffect?.inputRadius ?? 0 }
    set {
      gaussianBlurEffect?.inputRadius = newValue
      setValue(newValue, forKeyPath: Self.inputRadiusKeyPath)
      _blurRadius = newValue
    }
  }
  
  override func action(forKey event: String) -> CAAction? {
    let superAction = super.action(forKey: event)
    
    guard event == #keyPath(_blurRadius),
          let animation = super.action(forKey: #keyPath(opacity)) as? CABasicAnimation
    else { return superAction }
    
    animation.keyPath = Self.inputRadiusKeyPath
    animation.fromValue = presentation()?.blurRadius
    animation.toValue = blurRadius
    
    return animation
  }
}
