//
//  Post.swift
//  Out Fit
//
//  Created by Alexis Diaz on 11/20/24.
//

import Foundation
import UIKit

class Post: Identifiable {
    let id = UUID()
    var image: UIImage
    var votes: Int
    var comments: [String]
    var username: String

    init(image: UIImage, username: String, upvotes: Int = 0, comments: [String] = []) {
        self.image = image
        self.username = username
        self.votes = upvotes
        self.comments = comments
    }
    
    func addComment(_ comment: String) {
        comments.append(comment)
    }
    
    func upvote() {
        votes += 1
    }
    
    func downvote() {
        votes -= 1
    }
}
