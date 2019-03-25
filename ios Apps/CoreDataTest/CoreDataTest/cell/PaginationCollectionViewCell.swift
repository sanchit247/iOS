import UIKit

class PaginationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    func bindData(img : UIImage){
       imageView.image = img
       imageView.frame.size.width = UIScreen.main.bounds.width 
    }
}

