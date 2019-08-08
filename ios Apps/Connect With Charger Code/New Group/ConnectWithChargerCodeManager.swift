
import Foundation

protocol ConnectWithChargerCodeManagerDelegate: BaseViewProtocol {
    func ConnectSuccessfull(withResponseModel connectWithChargerCodeResponseModel:ConnectWithChargerCodeResponseModel)
}

class ConnectWithChargerCodeManager: ResponseCallback{
    //MARK:- Variabels
    var delegate: ConnectWithChargerCodeManagerDelegate!
    //MARK:- Initializer
    convenience init(delegate responseDelegate:ConnectWithChargerCodeManagerDelegate) {
        self.init(delegate: responseDelegate)
    }
    
    func servicesManagerSuccessResponse<T>(responseObject: T) where T : Decodable, T : Encodable {
        self.delegate?.hideLoader()
        if let responseModel =  responseObject as? ConnectWithChargerCodeResponseModel
        {
            if (responseModel.success ?? false){
                self.delegate?.ConnectSuccessfull(withResponseModel: responseModel)
            }
            else{
                self.delegate?.showErrorAlert(AppConstants.ErrorMessages.ALERT_TITLE, alertMessage: AppConstants.ErrorMessages.MOBILE_EXITS)
                return
            }
        }
    }
    
    func servicesManagerError(error: ErrorResponse) {
        self.delegate?.hideLoader()
        self.delegate?.showErrorAlert(AppConstants.ErrorMessages.ALERT_TITLE, alertMessage: error.message)
    }
    
    func requestForConnectWithChargerCode(model: ConnectWithChargerModel,  checkMark: Bool){
            self.delegate?.showLoader()
            let signUpRequestModel = ConnectWithChargerCodeRequestModel.Builder()
                .setPowerOnOff(model.phoneID!)
                .setPhoneID(model.phoneID!)
                .setChargerCode(model.chargerCode!)
                .addRequestHeader(key: AppConstants.APIRequestHeaders.API_KEY, value: AppConstants.API.API_KEY)
                .build()
            
            let apiRequestUrl = AppConstants.URL.BASE_URL + signUpRequestModel.getEndPoint()
            let res = ResponseWrapper(responseCallBack: self)
            
            ServiceManager.sharedInstance.requestPOSTWithURL(apiRequestUrl, andRequestDictionary: signUpRequestModel.requestBody, requestHeader: signUpRequestModel.requestHeader, responseCallBack: res, returningClass: SignUpResponseModel.self)
    }
}
