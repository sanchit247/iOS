
import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var serviceImage: UIImageView!
    func bindData(image:UIImage , name : String){
        serviceImage.image = image
        serviceNameLabel.text = name
        
    }
}
