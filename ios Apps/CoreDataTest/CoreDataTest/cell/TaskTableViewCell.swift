import UIKit

class TaskTableViewCell: BaseTableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(text:String){
       taskLabel.text = text
    }
    override func bindData(data: customData) {
        taskLabel.text = data as! String
    }

}
