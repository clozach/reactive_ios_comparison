import UIKit
import Interstellar

var TypingSignalHandle: UInt8 = 0

extension UITextField: UITextFieldDelegate {
  public var typingSignal: Signal<String> {
    let signal: Signal<String>
    if let handle = objc_getAssociatedObject(self, &TypingSignalHandle) as? Signal<String> {
      signal = handle
    } else {
      signal = Signal("")
      delegate = self
      objc_setAssociatedObject(self, &TypingSignalHandle, signal, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
    }
    return signal
  }

  public func textField(textField: UITextField,
    shouldChangeCharactersInRange range: NSRange,
    replacementString string: String) -> Bool {
      // http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index
      let newString = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
      typingSignal.update(.Success(Box(newString)))
      return true
  }
}
