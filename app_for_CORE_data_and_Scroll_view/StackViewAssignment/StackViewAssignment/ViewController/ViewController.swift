
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    var boxIndex = 1
    var labelArray = [UILabel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addBtnPressed(_ sender: Any) {
        createView()
    }
    
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
        stackView.removeArrangedSubview(labelArray[labelArray.count - 1])
        labelArray[labelArray.count - 1].removeFromSuperview()
        labelArray.remove(at: labelArray.count - 1)
    }
    func createView(){
        let view = UILabel()
        view.widthAnchor.constraint(equalToConstant: 128).isActive = true
        view.backgroundColor = UIColor.red
        view.text = "\(labelArray.count + 1)"
        labelArray.append(view)
        stackView.addArrangedSubview(labelArray[labelArray.count - 1])
    }
}

