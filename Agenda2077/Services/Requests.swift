
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
    
    func postSignUp(user: User) -> DataRequest {
        
        return AF.request(Endpoints.shared.baseURL + Endpoints.shared.postSignUp, method: .post, parameters: user, encoder: JSONParameterEncoder.default)
    }
    
    func postRecoverPassword(parameters:[String:String]) -> DataRequest {
        
        return AF.request(Endpoints.shared.baseURL + Endpoints.shared.postRecoverPassword, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
    }
    
    func getProfileInfo() -> DataRequest {
        
        return AF.request(Endpoints.shared.baseURL+Endpoints.shared.getProfileDetails, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor:nil)
        
    }
    
    func postChangePassword(parameters:[String:String]) -> DataRequest {
        
        return AF.request(Endpoints.shared.baseURL + Endpoints.shared.postChangePassword, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
    }
}
