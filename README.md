# 📸 ImageDownloaderSDK

A lightweight, protocol-oriented image downloading and caching SDK built with Swift Concurrency and `NSCache`, supporting both memory and disk caching.

---

## ✨ Features

- ✅ Async image downloading via `URLSession`
- ✅ In-memory & disk caching
- ✅ Swift Concurrency (`async/await`)
- ✅ Protocol-oriented design
- ✅ Pluggable architecture (`ImageCaching`, `ImageDownloading`)

---

## 📦 Installation

### Swift Package Manager (Source-Based)

```swift
.package(url: "https://github.com/yourusername/ImageDownloaderSDK.git", from: "1.0.0")
```

Then import:

```swift
import ImageDownloaderSDK
```

---

## 🧩 Protocols

### `ImageCaching`

An abstraction for image caching (memory + disk).

```swift
func image(for url: URL) -> UIImage?
func store(_ image: UIImage, for url: URL) async
```

---

### `ImageDownloading`

An abstraction for downloading images from the web.

```swift
func download(from url: URL) async throws -> UIImage
func cancel(url: URL) async
```

---

### `ImageLoading`

An observable object that loads and exposes an image for UI binding.

```swift
@MainActor
protocol ImageLoading: ObservableObject {
    var image: UIImage? { get }
    func load(_ url: URL)
    func cancel()
}
```

---

## 🧠 Default Implementations

### `DefaultImageCache`

A singleton actor implementing `ImageCaching`, using:

- `NSCache` for memory
- `FileManager` for disk

```swift
public static let shared = DefaultImageCache()
```

---

## 📚 Example Usage (SwiftUI)

```swift
@StateObject var loader = MyImageLoader()

Image(uiImage: loader.image ?? UIImage())
    .onAppear {
        loader.load(URL(string: "https://example.com/cat.png")!)
    }
```

---

## 📘 Documentation

To browse Apple-style documentation, open this package in Xcode and select **Product > Build Documentation**.

---

## 🛠️ Contributing

Contributions welcome! Please open issues or submit PRs.

---

## 📄 License

MIT License © 2025 Prachi Bharadwaj
