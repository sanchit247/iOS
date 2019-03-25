
import UIKit
class taskTitleCell : commonData{
    var titleLabelText : String
    var btnTxt : String
    init(titletext:String,btnText:String) {
        self.titleLabelText = titletext
        self.btnTxt = btnText
    }
}
class TaskTableViewTitleCell: BaseTableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var titleBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func bindData<T>(data: T) where T : taskTitleCell {
        titleLable.text = data.titleLabelText
        titleBtn.setTitle(data.btnTxt, for: .normal)
    }

}
