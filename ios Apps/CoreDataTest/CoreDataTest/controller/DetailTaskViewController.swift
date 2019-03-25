
import UIKit

class DetailTaskViewController: UIViewController {

    @IBOutlet weak var viewCh: UIView!
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btn.makeRounded()
        viewCh.layer.cornerRadius = viewCh.frame.size.width * 0.5
        viewCh.clipsToBounds = true
    }
    


}
