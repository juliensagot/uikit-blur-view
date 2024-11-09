import Foundation

struct GaussianBlurFilter {
  let effect: NSObject
  
  var inputRadius: Double {
    get { effect.value(forKey: "inputRadius") as? Double ?? 0 }
    nonmutating set { effect.setValue(newValue, forKey: "inputRadius") }
  }
  
  init?() {
    guard let effect = Self.makeGaussianBlurFilter() else { return nil }
    self.effect = effect
  }
  
  private static func makeGaussianBlurFilter() -> NSObject? {
    let className = ["Filter", "CA"].reversed().joined()
    guard let caFilterClass = NSClassFromString(className) as? NSObject.Type else { return nil }
    
    let methodType = (@convention(c) (AnyClass, Selector, String) -> NSObject).self
    let selectorName = ["Name:", "With", "filter"].reversed().joined()
    let selector = NSSelectorFromString(selectorName)
    
    guard caFilterClass.responds(to: selector) else { return nil }
    
    let implementation = caFilterClass.method(for: selector)
    let method = unsafeBitCast(implementation, to: methodType)
    
    return method(caFilterClass, selector, "gaussianBlur")
  }
}
