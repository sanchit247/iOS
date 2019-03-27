
import UIKit
import WebKit
class MainViewController: UIViewController,UISearchBarDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var navBar: UINavigationItem!
    var searchBarController = UISearchController(searchResultsController: nil)
    var verticalIconMenuName = "icon2"
    
    @IBOutlet weak var downloads: UIButton!
    @IBOutlet weak var bookmark: UIButton!
    @IBOutlet weak var forwardbtn: UIButton!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarSetup()
        webView.load(URLRequest(url: URL(string: "https://www.google.com")!))
        webView.navigationDelegate = self
        forwardbtn.backgroundColor = UIColor.gray
        backButton.backgroundColor = UIColor.gray
    }
    
    func navBarSetup(){
        
        searchBarController.hidesNavigationBarDuringPresentation = false
        let searchBar = searchBarController.searchBar
        searchBar.delegate = self
        navBar.titleView = searchBar
        
        let menuBtn = UIButton(type: .system)
        menuBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        menuBtn.setImageToBtn(img: UIImage(named: verticalIconMenuName)!)
        
        let tabBtn = UIButton(type: .system)
        tabBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        tabBtn.layer.borderWidth = 2
        tabBtn.layer.borderColor = UIColor.gray.cgColor
        tabBtn.tintColor = UIColor(cgColor:tabBtn.layer.borderColor!)
        tabBtn.setTitle("3", for: .normal)
        //        tabBtn.setImageToBtn(img: UIImage(named: "icon")!)
        navBar.rightBarButtonItems = [UIBarButtonItem(customView: menuBtn), UIBarButtonItem(customView: tabBtn)]
        
        menuBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
       // navigationController?.hidesBarsOnSwipe = true
        
    }
    
    @objc func btnAction(sender : UIButton!){
        let alertController = UIAlertController(title: "iOScreator", message:
            "Hello, world!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    // MARK: runs when search is perform in search bar
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        webView.load(URLRequest(url: URL(string: searchBarController.searchBar.text!)!))
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //searchBarController.hidesNavigationBarDuringPresentation = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //searchBarController.hidesNavigationBarDuringPresentation = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.canGoBack{
            backButton.isEnabled = true
            backButton.backgroundColor = UIColor.white
        }
        else
        {
            backButton.backgroundColor = UIColor.gray
        }
        if webView.canGoForward{
            forwardbtn.isEnabled = true
            forwardbtn.backgroundColor = UIColor.white
        }
        else
        {
            forwardbtn.backgroundColor = UIColor.gray
        }
        searchBarController.searchBar.text = webView.url?.absoluteString
        
        
    }

 
    @IBAction func goForward(_ sender: UIButton) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    @IBAction func goBackward(_ sender: UIButton) {
        if webView.canGoBack
        {
            webView.goBack()
        }
    }
}
