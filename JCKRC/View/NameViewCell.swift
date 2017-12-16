
import UIKit

protocol NameViewCellDelegate: class {
  
  func didEndEditing(on cell: NameViewCell)

}

class NameViewCell: UITableViewCell {

  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var textfield: UITextField!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    textfield.delegate = self
  }
  
  weak var delegate: NameViewCellDelegate?
  
}

extension NameViewCell: UITextFieldDelegate {

  func textFieldDidEndEditing(_ textField: UITextField) {
    delegate?.didEndEditing(on: self)
  }

}
