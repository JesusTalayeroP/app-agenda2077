
import Foundation
import Alamofire

class Request {
    
    static let shared = Request()
    
    private init() {}
    
    func getUsers() -> DataRequest {
        
        return AF.request(Endpoints.shared.baseURL+Endpoints.shared.getUsers, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor:nil)
        
    }
}
