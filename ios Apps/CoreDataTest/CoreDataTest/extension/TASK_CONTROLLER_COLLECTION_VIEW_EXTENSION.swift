import UIKit
extension TaskViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "paginationCell", for: indexPath) as! PaginationCollectionViewCell
        cell.bindData(img: UIImage(named: "pipeline")!)
        
        return cell
    }
    
}
