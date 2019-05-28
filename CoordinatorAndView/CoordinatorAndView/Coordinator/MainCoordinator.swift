import UIKit
class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var children = [Coordinator]()
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let dataVC = DataViewController.instantiate()
        navigationController.pushViewController(dataVC, animated: false)
        dataVC.coordinator = self
    }
    func showDescriptionVC() {
        let descriptionVC = DescriptionViewController.instantiate()
        // not used coordinator because donnt move any vc further
        //descriptionVC.coordinator = self
        navigationController.pushViewController(descriptionVC, animated: true)
    }
    func showBuyVC(){
        let buyVC = BuyViewController.instantiate()
        // not used coordinator because donnt move any vc further
        navigationController.pushViewController(buyVC, animated: true)
    }
}
