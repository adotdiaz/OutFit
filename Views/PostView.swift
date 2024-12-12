//
//  PostView.swift
//  Out Fit
//
//  Created by Alexis Diaz on 11/21/24.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Username
            Text(post.username)
                .font(.headline)
                .padding(.bottom, 5)
            
            // Post Image
            Image(uiImage: post.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            
            // Upvote Section
            HStack {
                Button(action: {
                    post.upvote()
                }) {
                    HStack {
                        Image(systemName: "arrow.up")
                        Text("\(post.votes)")
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                
                Spacer()
            }
            
            // Comments Section
            if !post.comments.isEmpty {
                VStack(alignment: .leading) {
                    Text("Comments:")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    ForEach(post.comments, id: \.self) { comment in
                        Text(comment)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    let sampleImage = UIImage(systemName: "photo")!
    return PostView(post: Post(image: sampleImage, username: "SampleUser", upvotes: 10, comments: ["Nice outfit!"]))
}
