
import Foundation

class ConnectWithChargerCodeRequestModel{
    
    
    //Note :- Property Name must be same as key used in request API
    var requestBody: [String:AnyObject]!
    var requestHeader: [String:AnyObject]!
    
    init(builderObject builder:Builder){
        //Instantiating service Request model Properties with Builder Object property
        self.requestBody = builder.requestBody
        self.requestHeader = builder.requestHeader
        
    }
    // This inner class is used for setting upper class properties
    internal class Builder{
        //MARK:- Builder class Properties
        //Note :- Property Name must be same as key used in request API
        var requestBody: [String:AnyObject] = [String:AnyObject]()
        var requestHeader: [String:AnyObject] = [String:AnyObject]()
        var requestQueryParams: [String:AnyObject] =  [String:AnyObject]()
        
    
        func addRequestHeader(key:String , value:String) -> Builder {
            self.requestHeader[key] = value as AnyObject?
            return self
        }

        func setPowerOnOff(_ powerOnOff:String) -> Builder{
            requestBody["powerOnOff"] = powerOnOff as AnyObject?
            return self
        }
 
        func setPhoneID(_ phoneID:String) -> Builder{
            requestBody["phoneID"] = phoneID as AnyObject?
            return self
        }
     
        func setChargerCode(_ chargerCode:String) -> Builder{
            requestBody["chargerCode"] = chargerCode as AnyObject?
            return self
        }

        func build()->ConnectWithChargerCodeRequestModel{
            return ConnectWithChargerCodeRequestModel(builderObject: self)
        }
    }
    
    func getEndPoint()->String{
        return AppConstants.ApiEndPoints.CONNECT_CHARGER
    }
  
}
