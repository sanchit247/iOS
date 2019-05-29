import UIKit
class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var children = [Coordinator]()
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func showRoboListVC() {
        let vc = RoboListTableViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func showRoboControllerVC(){
        let vc = RoboControllerViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func showPatientRecordVC(){
        let vc = PatientRecordViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func showSignupVC(){
        let vc = SignUpViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func showLoginVC(){
       start()
    }
    func showActivityVC(){
        let vc = ActivityViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
