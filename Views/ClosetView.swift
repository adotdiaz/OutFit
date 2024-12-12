import SwiftUI

struct ClosetView: View {
    @Environment(\.managedObjectContext) private var context // Core Data context
    @FetchRequest(sortDescriptors: [SortDescriptor(\.dateAdded, order: .reverse)])
    private var allItems: FetchedResults<ClothingItem>
    
    @State private var selectedImage: UIImage? = nil
    @State private var showingImagePicker = false
    @State private var selectedType: ClothingType = .top // Default type
    @State private var itemName: String = "New Item" // Default name

    var body: some View {
        VStack {
            // Add a button for importing images
            Button(action: {
                showingImagePicker = true
            }) {
                Text("Import Clothing Item")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // Display imported image and save options
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()

                // Buttons to save the imported image to a category
                HStack {
                    Button(action: {
                        saveClothingItem(image: selectedImage, name: "New Top", type: .top)
                        self.selectedImage = nil // Clear the selected image after saving
                    }) {
                        Text("Add to Tops")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Button(action: {
                        saveClothingItem(image: selectedImage, name: "New Bottom", type: .bottom)
                        self.selectedImage = nil // Clear the selected image after saving
                    }) {
                        Text("Add to Bottoms")
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Button(action: {
                        saveClothingItem(image: selectedImage, name: "New Shoe", type: .shoe)
                        self.selectedImage = nil // Clear the selected image after saving
                    }) {
                        Text("Add to Shoes")
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            
            // Closet Sections
            ScrollView {
                VStack(spacing: 20) {
                    SectionView(title: "Tops", items: allItems.filter { $0.type == ClothingType.top.rawValue })
                    SectionView(title: "Bottoms", items: allItems.filter { $0.type == ClothingType.bottom.rawValue })
                    SectionView(title: "Shoes", items: allItems.filter { $0.type == ClothingType.shoe.rawValue })
                }
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(
                selectedImage: $selectedImage
            )
        }
        .padding()
    }
    
    // Save the new clothing item to Core Data
    func saveClothingItem(image: UIImage, name: String, type: ClothingType) {
        guard let imageData = image.pngData() else { return } // Convert UIImage to Data

        // Create a new ClothingItem using the context
        let newItem = ClothingItem(context: context)
        newItem.imageData = imageData
        newItem.type = type.rawValue // Save the correct category
        newItem.name = name
        newItem.dateAdded = Date()

        do {
            try context.save() // Save the context
            print("Saved \(name) as \(type.rawValue)")
        } catch {
            print("Failed to save item: \(error.localizedDescription)")
        }
    }
}

struct SectionView: View {
    let title: String
    let items: [ClothingItem]
    
    var body: some View {
        VStack {
            Text(title).font(.headline)
            TabView {
                ForEach(items) { item in
                    VStack {
                        if let image = item.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                        }
                        Text(item.name ?? "Unknown").font(.caption)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 200)
        }
    }
}
