//
//import UIKit
//
//class QuestionierTVC: UITableViewController {
//  
//  enum Attributes: Int {
//    case first, second, third, fourth, fifth
//  }
//  
//  enum Section: Int {
//    case manager, owner, brandPitched, competation, preference, feedback, branding, image
//  
//    static var all: [Section] {
//      return [.manager, .owner,.brandPitched, .competation, .preference, .feedback, .branding, .image]
//    }
//    
////    switch self {
////    case .manager:
////    case .owner:
////    case .brandPitched:
////    case .competation:
////    case .preference:
////    case .feedback:
////    case .branding:
////    case .image:
////    }
//
//    
//    func numberOfRows() -> Int {
//      var rows = 0
//      
//      switch self {
//      case .manager, .owner, .image: rows = 3
//      case .brandPitched, .preference, .branding: rows = 2
//      case .competation, .feedback: rows = 1
//      }
//      
//      return rows
//    }
//    
//    func title() -> String {
//      var title = ""
//      
//      switch self {
//      case .manager: title = "Therapist-Manager"
//      case .owner: title = "Owner"
//      case .brandPitched: title = "Details Of Brand pitched"
//      case .competation: title = "Competition Details"
//      case .preference: title = "Product Preference"
//      case .feedback: title = "Feedback and Suggestions"
//      case .branding: title = "Branding Collaterals Given"
//      case .image: title = "Images"
//      }
//      
//      return title
//    }
//  
//  }
//  
//  var competationDetail = ""
//  var feedBack = ""
//  var branding = ""
//  var other = ""
//  var owner = Owner()
//  var brand = Brand()
//  var therapist = Therapist()
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    brand.product = Product()
//    owner.brand = brand
//  }
//  // MARK: - Table view data source
//
//  override func numberOfSections(in tableView: UITableView) -> Int {
//    return Section.all.count
//  }
//  
//  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    guard let section = Section(rawValue: section) else {return ""}
//    return section.title()
//  }
//
//  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    guard let section = Section(rawValue: section) else { return 0 }
//    return section.numberOfRows()
//  }
//  
//  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NameViewCell.self)) as? NameViewCell,
//      let section = Section(rawValue: indexPath.section),
//      let row = Attributes(rawValue: indexPath.row)
//      else { return UITableViewCell() }
//      cell.delegate = self
//      switch section {
//      case .manager:
//        switch row {
//        case .first:
//          cell.titleLabel.text = "Name"
//          cell.textfield.placeholder = "John Deo"
//        case .second:
//          cell.titleLabel.text = "Contact"
//          cell.textfield.placeholder = "9xxxxxxxxx"
//        case .third:
//          cell.titleLabel.text = "Email"
//          cell.textfield.placeholder = "xxx@xxx.com"
//        default: break
//        }
//        
//      case .owner:
//        switch row {
//        case .first:
//          cell.titleLabel.text = "Name"
//          cell.textfield.placeholder = "John Deo"
//        case .second:
//          cell.titleLabel.text = "Contact"
//          cell.textfield.placeholder = "9xxxxxxxxx"
//        case .third:
//          cell.titleLabel.text = "Email"
//          cell.textfield.placeholder = "xxx@xxx.com"
//        default: break
//        }
//
//      case .brandPitched:
//        switch row {
//        case .first:
//          cell.titleLabel.text = "Details"
//          cell.textfield.placeholder = "detail"
//        case .second:
//          cell.titleLabel.text = "Name"
//          cell.textfield.placeholder = "Product name"
//        default: break
//        }
//        
//      case .competation:
//        switch row {
//        case .first:
//          cell.titleLabel.text = "Details"
//          cell.textfield.placeholder = "Competition  details"
//        default: break
//        }
//        
//      case .preference:
//        switch row {
//        case .first:
//          cell.titleLabel.text = "Product A"
//          cell.textfield.placeholder = "Name"
//        case .second:
//          cell.titleLabel.text = "Product B"
//          cell.textfield.placeholder = "Name"
//        default: break
//        }
//
//      case .feedback:
//        switch row {
//        case .first:
//          cell.titleLabel.text = "Feedback"
//          cell.textfield.placeholder = "Feedback, Suggestions."
//        default: break
//        }
//
//      case .branding:
//        switch row {
//        case .first:
//          cell.titleLabel.text = "Branding"
//          cell.textfield.placeholder = "Branding"
//        case .second:
//          cell.titleLabel.text = "Other"
//          cell.textfield.placeholder = "Other"
//        default: break
//        }
//        
//      case .image:
//        switch row {
//        case .first:
//          cell.titleLabel.text = "Name"
//          cell.textfield.placeholder = "John Deo"
//        case .second:
//          cell.titleLabel.text = "Contact"
//          cell.textfield.placeholder = "9xxxxxxxxx"
//        case .third:
//          cell.titleLabel.text = "Email"
//          cell.textfield.placeholder = "xxx@xxx.com"
//        default: break
//        }
//      }
//    cell.selectionStyle = .none
//    return cell
//  }
//  
//  func updateModel(for cell: NameViewCell) {
//    guard let sectionNumber = tableView.indexPath(for: cell)?.section else { return }
//    guard let section = Section(rawValue: sectionNumber) else { return }
//    
//    let text = cell.textfield.text
//    
//    switch section {
//    case .manager:
//      switch row {
//      case .first: therapist.name = text
//      case .second: therapist.contact = text
//      case .third: therapist.email = text
//      default: break
//      }
//      
//    case .owner:
//      switch row {
//      case .first: therapist.name = text
//      case .second: therapist.contact = text
//      case .third: therapist.email = text
//      default: break
//      }
//      
//    case .brandPitched:
//      switch row {
//      case .first: owner.brand?.detail = text
//      case .second: owner.brand?.product?.name = text
//      default: break
//      }
//      
//    case .competation:
//      switch row {
//      case .first: competationDetail = text
//      default: break
//      }
//      
//    case .preference:
//      switch row {
//      case .first: owner.brand.
//      case .second:
//        cell.titleLabel.text = "Product B"
//        cell.textfield.placeholder = "Name"
//      default: break
//      }
//      
//    case .feedback:
//      switch row {
//      case .first:
//        cell.titleLabel.text = "Feedback"
//        cell.textfield.placeholder = "Feedback, Suggestions."
//      default: break
//      }
//      
//    case .branding:
//      switch row {
//      case .first:
//        cell.titleLabel.text = "Branding"
//        cell.textfield.placeholder = "Branding"
//      case .second:
//        cell.titleLabel.text = "Other"
//        cell.textfield.placeholder = "Other"
//      default: break
//      }
//      
//    default: break
//  }
//  
//}
//
//extension NameViewCellDelegate {
//
//  func didEndEditing(on cell: NameViewCell) {
//    updateModel(for: cell)
//  }
//
//}
//
//extension QuestionierTVC {
//
//  static func get() -> QuestionierTVC {
//    let sb = UIStoryboard.init(storyboard: .sales)
//    let questionierTVC: QuestionierTVC = sb.instantiateViewController()
//    return questionierTVC
//  }
//  
//}
