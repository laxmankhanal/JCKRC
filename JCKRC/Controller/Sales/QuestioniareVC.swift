
import UIKit

class QuestioniareVC: UIViewController {

  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet var therapistName: UITextField!
  @IBOutlet var therapistContactNumber: UITextField!
  @IBOutlet var therapistEmail: UITextField!
  @IBOutlet var ownerName: UITextField!
  @IBOutlet var ownerContact: UITextField!
  @IBOutlet var ownerEmail: UITextField!
  @IBOutlet var brandDetail: UITextField!
  @IBOutlet var productName: UITextField!
  @IBOutlet var compentationDetail: UITextField!
  @IBOutlet var productNameA: UITextField!
  @IBOutlet var productNameB: UITextField!
  @IBOutlet var feedback: UITextField!
  @IBOutlet var branding: UITextField!
  @IBOutlet var other: UITextField!
  @IBOutlet var visitingCardView: UIView!
  @IBOutlet var salonPhotoView: UIView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(takePhotoForVisitingCard))
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(takeSalonPhoto))
    visitingCardView.addGestureRecognizer(gesture)
    salonPhotoView.addGestureRecognizer(tapGesture)
  }
  
  func takePhotoForVisitingCard() {
    
  
  }
  
  func takeSalonPhoto() {
  
  }
  
  
  
  
  
  
  
  @IBAction func completeButtonAction(_ sender: UIButton) {
    
    
  }

}
