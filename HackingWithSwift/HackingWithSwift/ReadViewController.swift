import UIKit
import WebKit

class ReadViewController: UIViewController, StoryBoard{
    var webView = WKWebView()
    var project: Project!
    var navigationDelegate = NavigationDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(project != nil, "You must set a project before show this view controller.")
        title = project.title
        webView.load("https://www.hackingwithswift.com/read/\(project.number)/overview")
    }
    
    override func loadView(){
        webView.navigationDelegate = navigationDelegate
        view = webView
    }
}
extension WKWebView{
    func load(_ UrlString: String){
        guard let url = URL(string: UrlString) else {return}
        let request = URLRequest(url: url)
        load(request)
    }
}
