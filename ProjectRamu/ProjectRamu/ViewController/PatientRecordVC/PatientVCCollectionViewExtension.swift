import UIKit
extension PatientRecordViewController : UICollectionViewDataSource , UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.serviceList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "servicesCell", for: indexPath) as! ServicesCollectionViewCell
        cell.bindData(image: UIImage(named: Array(self.serviceList)[indexPath.row].key) ?? UIImage(named: "NoImage")!, name: Array(self.serviceList)[indexPath.row].key)
        return cell
    }
}
