
import UIKit

class RoboIDTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    func bindData(id : String){
        idLabel.text = id
    }

}
