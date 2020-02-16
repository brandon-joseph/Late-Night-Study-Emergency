import Foundation
import Alamofire
import SwiftyJSON


class NetworkManager {

    private static let baseurl = "backendurl.com"

   static func getBuildings(completion: @escaping ([Building]) -> Void) {
    Alamofire.request(baseurl, method: .get).validate().responseData { response in
        switch response.result {
        case .success(let data):
            let jsonDecoder = JSONDecoder()
            
            if let buildingsData = try? jsonDecoder.decode(BuildingResponse.self, from: data) {
                let buildings = buildingsData.data.buildings
                completion(buildings)
            }
            
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
    
   static func getBathrooms(completion: @escaping ([Bathroom]) -> Void) {
    Alamofire.request(baseurl, method: .get).validate().responseData { response in
        switch response.result {
        case .success(let data):
            let jsonDecoder = JSONDecoder()
            
            if let Data = try? jsonDecoder.decode(BathroomResponse.self, from: data) {
                let result = Data.data.bathrooms
                completion(result)
            }
            
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
       static func getReviews(completion: @escaping ([Review]) -> Void) {
        Alamofire.request(baseurl, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let Data = try? jsonDecoder.decode(ReviewResponse.self, from: data) {
                    let result = Data.data.reviews 
                    completion(result)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
       static func getVendings(completion: @escaping ([Vending]) -> Void) {
        Alamofire.request(baseurl, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let Data = try? jsonDecoder.decode(VendingResponse.self, from: data) {
                    let result = Data.data.vendings
                    completion(result)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func postReview(username: String, rating: Double, text: String,completion: @escaping ([Review]) -> Void){
        let parameters: [String: Any] = [
            "username": username,
            "rating": rating,
            "text": text
        ]

        Alamofire.request(baseurl, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let reviewData = try? jsonDecoder.decode(ReviewResponse.self, from: data) {
                    completion(reviewData.data.reviews)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        // URLEncoding.default
    }
    
}
