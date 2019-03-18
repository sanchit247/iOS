import UIKit
extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            Model.shared.loadPersons()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
        else{
             Model.shared.filterData(text: searchText)
        }
       
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      Model.shared.filterData(text: searchBar.text!)
    }
    
}
