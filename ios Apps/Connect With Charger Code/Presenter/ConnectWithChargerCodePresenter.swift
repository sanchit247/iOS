
class ConnectWithChargerCodePresenter {
    var view : ConnectWithChargerCodeViewController?
    convenience init(view: ConnectWithChargerCodeViewController) {
        self.init()
        self.view = view
    }
    func connectBtnAction(){
        print("Button tapped hit api pending")
    }
   
}
