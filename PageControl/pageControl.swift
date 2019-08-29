// MARK: - <#UICollectionViewDelegate#>
extension UIViewController : UICollectionViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = (self.collectionView.contentOffset)
        visibleRect.size = (self.collectionView.bounds.size)
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = self.collectionView.indexPathForItem(at: visiblePoint) else { return }
        
        //print(indexPath[1])
        self.pageControl.currentPage = indexPath[1]
    }
}
