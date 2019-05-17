

import UIKit
import CoreData

class DataViewController: UIViewController {
   
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    var dataVCViewModel : DataVCViewModel!

   
    override func viewDidLoad() {
        super.viewDidLoad()
         dataVCViewModel = DataVCViewModel(view: self)
    }

    @IBAction func updateBtnPressed(_ sender: Any) {
       dataVCViewModel.updateModel()
    }
    
    @IBAction func deleteBtnPressed(_ sender: Any) {
       dataVCViewModel.deleteRecord()
    }
    
    @IBAction func previousBtnPressed(_ sender: Any) {
        dataVCViewModel.showPreviosRecord()
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
      dataVCViewModel.showNextRecord()
    }    
}
