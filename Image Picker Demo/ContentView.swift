//
//  ContentView.swift
//  Image Picker Demo
//
//  Created by Ben Anderson on 10/3/24.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore

struct ContentView: View {
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            
            
            Button {
                
                isPickerShowing = true
                
            } label: {
                Text("Select a Photo")
            }
            // Upload Button
            if selectedImage != nil {
                Button {
                    uploadPhoto()
                } label: {
                    Text("Upload photo")
                }
            }
            
            
        }
        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
    }
        
        func uploadPhoto(){
            guard selectedImage != nil else {
                return
            }
            
            let storageRef = Storage.storage().reference()
            
            let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
            
            guard imageData != nil else {
                return
            }
            
            let fileRef = storageRef.child("images/\(UUID().uuidString).jpg")
            
            let uploadTask = fileRef.putData(imageData!, metadata: nil) {
                metadata, error in
                
                
                if error == nil && metadata != nil {
                    
                    let db = Firestore.firestore()
                    db.collection("images").document()
                }
            }
        }
        
        
        
        }
    


struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
