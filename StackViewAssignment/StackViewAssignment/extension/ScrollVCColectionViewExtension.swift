import UIKit
extension ScrollViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellImage", for: indexPath) as! ImageCollectionViewCell
        cell.bindData(img: UIImage(named: "\(indexPath.row + 1)")!)
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}
