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
.package(url: "https://github.com/prachipb09/ImageCacherSDK.git", from: "1.0.0")
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
## 📦 ImagePrefetcher

An actor-based concurrent image prefetcher that downloads images in advance using a max concurrency limit.

```swift
public actor ImagePrefetcher {
    public static let shared: ImagePrefetcher
    public init(downloader: ImageDownloading)
    public func prefetch(_ urls: [URL]) async
    public func cancel(_ urls: [URL]) async
}
```

### Usage
```swift
await ImagePrefetcher.shared.prefetch([url1, url2])
```

## ⏱️ AsyncSemaphore

An internal actor that limits the number of concurrent downloads using a semaphore-like mechanism.

```swift
actor AsyncSemaphore {
    init(maxConcurrent: Int)
    func wait() async
    func signal() async
}
```

Used internally by `ImagePrefetcher` to ensure at most `maxConcurrent` image downloads happen in parallel.

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

Prachi Bharadwaj
