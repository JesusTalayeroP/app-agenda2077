
import Foundation
import Alamofire

class Request {
    
    static let shared = Request()
    
    private init() {}
    
    func getUsers() -> DataRequest {
        
        return AF.request(Endpoints.shared.baseURL+Endpoints.shared.getUsers, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor:nil)
        
    }
    
    func postLogIn(parameters:[String:String]) -> DataRequest {
        
        return AF.request(Endpoints.shared.baseURL + Endpoints.shared.postLogIn, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: nil, interceptor:nil)
        
        
    }
    
    func postSignUp(user: User) {
        
        AF.request(Endpoints.shared.baseURL + Endpoints.shared.postSignUp, method: .post, parameters: user, encoder: JSONParameterEncoder.default).response {response in debugPrint(response)
            
        }
        
    }
    func postRecoverPassword(parameters:[String:String]) {
        
        AF.request(Endpoints.shared.baseURL + Endpoints.shared.recoverPassword, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).response {response in debugPrint(response)
        }
    }
}
