import SwiftUI

struct FeedView: View {
    @State private var posts: [Post] = [] // Feed data

    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationView {
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(posts) { post in
                            PostView(post: post)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Feed")
            }
            .onAppear {
                // Mock posts for now (you can replace with real data later)
                loadMockPosts()
            }
            
            // Logo in the top-right corner
            Image("OutFitLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50) // Adjust the size of the logo
                .background(Color.gray)
                .padding([.top, .trailing]) // Padding from the top-right edge
        }
    }

    // Mock post loader
    private func loadMockPosts() {
        let sampleImage = UIImage(systemName: "photo")!
        posts = [
            Post(image: sampleImage, username: "User1", upvotes: 3, comments: ["This app is so scuffed LMFAOOO"]),
            Post(image: sampleImage, username: "User2", upvotes: 5, comments: ["Cool style!"]),
            Post(image: sampleImage, username: "User3", upvotes: 2, comments: ["Great fit!"])
        ]
    }
}

#Preview {
    FeedView()
}
