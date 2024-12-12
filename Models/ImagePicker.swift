import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage? // Binding to pass the selected image
    @Environment(\.dismiss) var dismiss // Environment variable to dismiss the view

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary // Use .camera for live photos if needed
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            guard let image = info[.originalImage] as? UIImage else {
                parent.dismiss()
                return
            }
            // Pass the selected image to the parent view
            parent.selectedImage = image
            parent.dismiss() // Dismiss the picker
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss() // Dismiss the picker if canceled
        }
    }
}
