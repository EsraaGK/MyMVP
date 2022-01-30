
import UIKit

@IBDesignable extension UIView {
	@IBInspectable var cornerRadius: CGFloat {
		get { return layer.cornerRadius }
		set {
			  layer.cornerRadius = newValue

			  // If masksToBounds is true, subviews will be
			  // clipped to the rounded corners.
			  layer.masksToBounds = (newValue > 0)
		}
	}

	@IBInspectable var borderColor: UIColor? {
			get {
				guard let cgColor = layer.borderColor else {
					return nil
				}
				return UIColor(cgColor: cgColor)
			}
			set { layer.borderColor = newValue?.cgColor }
		}

		@IBInspectable var borderWidth: CGFloat {
			get {
				return layer.borderWidth
			}
			set {
				layer.borderWidth = newValue
			}
		}
}

extension UIView {
	/**
	Load the view from a nib file

	- Parameter bundle: The bundle where the class is located
	- Parameter nibName: The name of the nib file, this is the class name by default

	- Note: When using the default nibName value, the nib file name **must** be the same as the class name.
	*/
	public class func loadXib<T: UIView>(bundle: Bundle = Bundle.main, nibName: String = String("\(T.self)")) -> T? {
		return bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? T
	}
}
