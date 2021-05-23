import Foundation
import SwiftUI
import APNGKit

public struct APNGView: UIViewRepresentable {

    let image: APNGImage?

    public init(url: URL) {
        self.image = APNGImage(url: url)
    }
    
    public init(url urlString: String) {
        self.init(url: URL(string: urlString)!)
    }

    public init(named: String) {
        self.image = APNGImage(named: named)
    }

    public func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    public func makeUIView(context: Context) -> UIView {
        guard let image = self.image else { return UIView() }
        let imageView = APNGImageView(image: image)
        imageView.startAnimating()
        return imageView
    }

    public func makeCoordinator() -> () {
    }

}

extension APNGImage {
    convenience init?(url: URL) {
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        self.init(data: data)
    }
}
