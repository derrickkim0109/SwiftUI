//
//  ContentView.swift
//  PhotoPicker
//
//  Created by Derrick kim on 2021/04/15.
//

import SwiftUI
import PhotosUI


struct ContentView: View {
    
    // Fields
    @State var isPresentPicker = false
    
    // Data Model
    @State var images = [UIImage]()
    
    var body: some View {
        
        VStack{
            
            Button(action: {
                isPresentPicker = true
            }, label: {
                Text("Select Image")
            })
            
            List{
                
                ForEach(images, id:\.self){ image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width, height: 200)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        .cornerRadius(10)
                        .clipShape(Circle())
                }
            }
            
        }
        .sheet(isPresented: $isPresentPicker, content: {
            // Picker
            
            //이미지 띄워주어야 함.
            ImagePicker(isPresent: $isPresentPicker, images: $images)
        })
    }
}


struct ImagePicker: UIViewControllerRepresentable {
 
    // Fields
    @Binding var isPresent : Bool
    // 이미지 담을곳 연결
    @Binding var images: [UIImage]
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        // 0 은 image 여러개 , 1은 image 하나.
        
        configuration.filter = .images
        // image, video, livePhotos. 등으로 설정가능.
        
        
        let picker = PHPickerViewController(configuration: configuration)
        
        // image 선택했을때, 전달했을때.
        // class로 잡힌 UIViewController에서는 self로 보통함.(그 클래스 안에서 작업)
        picker.delegate = context.coordinator
        
        return picker
        
    }
    
    // Coordinator 클래스를 연결하는 부분.
    func makeCoordinator() -> Coordinator {
        return  ImagePicker.Coordinator(picker: self)
    }
    
    // picker delegate 구조
    class Coordinator: PHPickerViewControllerDelegate {
        
        // Fields
        var picker : ImagePicker
        
        init(picker : ImagePicker) {
            self.picker = picker
        }
        
        
        // 이미지 선택해서 Add했을경우 여기로 호출됨.
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            self.picker.isPresent = false
            // 전에 추가 한것들 사라지게 할려면
            self.picker.images.removeAll()
            
            // Images
            for img in results{
                // 이미지 불러올수 있나 없나를 확인하는것.
                // True면
                if img.itemProvider.canLoadObject(ofClass: UIImage.self){
                    
                    // image 가져오는 법
                    img.itemProvider.loadObject(ofClass: UIImage.self) { (loadedImage, error) in
                        
                        // Optional 임
                        guard let hasImage = loadedImage else{
                            print("Empty Images")
                            return
                        }
                        self.picker.images.append(hasImage as! UIImage)
                    }
                }
                // False면
                else{
                    print("Fail to loaded")
                }
            }
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
