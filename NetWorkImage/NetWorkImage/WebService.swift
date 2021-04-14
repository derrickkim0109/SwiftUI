//
//  WebService.swift
//  NetWorkImage
//
//  Created by Derrick kim on 2021/04/14.
//

import Foundation
import SwiftUI // ImageLoader 작업 시작부분부터 적음.

struct User: Codable, Identifiable {
    
    // Fields
    var id : String
    var name : String
    var avatar : String
    var createdAt : String
}



class WebService {
    // https://6076a03e1ed0ae0017d696a8.mockapi.io/user
       
    
    
    func loadUsers(completion: @escaping ([User]) -> Void ) {
        
        guard let url = URL(string: "https://6076a03e1ed0ae0017d696a8.mockapi.io/user") else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let hasData = data else{
                return
            }
            
            let users = try! JSONDecoder().decode([User].self, from: hasData)
            // 이 users를 밖의 completion으로 보내야함
            completion(users) // -> closure 밖에 쪽으로 보낼려면 @escaping
        }.resume()
    }
}

// Image
class ImageLoader: ObservableObject {
    
    
    
    // Fields
    @Published var image : UIImage?
    
    var urlString : String
    
    init(urlString: String) {
        self.urlString = urlString
        // URL 가져온후 function 호출
        self.loadImageFromURL()
    }
    
    
    func loadImageFromURL(){
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let hasData = data else {
                return
            }
            
            guard let loadImage = UIImage(data: hasData)else{
                return
            }
            
            // Background Thread 로 되면 안되서. 비동기 방식으로 해야함 _> self.image = loadImage 이거만 적으면 안됨.
            DispatchQueue.main.async {
                self.image = loadImage
            }
        }
        .resume()
    }
    
}
    
// Protocol

struct URLImage: View {
    
    @ObservedObject var loader: ImageLoader
    
    // 위의 function을 쓸려면 View에서 URL넣는게 강제사항이 되버리는 경우다.
    init(urlString : String) {
        self.loader = ImageLoader(urlString: urlString)
    }
    
    
    
    var body: some View{
        
        // image data를 받아오기전에 실패 해버렸을 경우 Optional
        Image(uiImage: loader.image ?? UIImage(named: "placeholderImage")! )
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .aspectRatio(contentMode: .fill)
    }
}
