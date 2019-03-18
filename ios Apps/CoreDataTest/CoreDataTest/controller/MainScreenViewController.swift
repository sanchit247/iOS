import UIKit

class MainScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func showPerson(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showPerson", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPerson"{
            if let destinationVc = segue.destination as? ViewController{
                
            }
        }
        if segue.identifier == "showTask"{
           
            if let destinationVc = segue.destination as? TaskViewController{

            }
            
        }
    }
    @IBAction func showTask(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showTask", sender: self)
    }
}
