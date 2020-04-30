//struct ContentView: View {
//    @State private var blurAmount: CGFloat = 0
//
//    var body: some View {
//        let blur = Binding<CGFloat>(
//            get: {
//                self.blurAmount
//            },
//            set: {
//                self.blurAmount = $0
//                print("New value is \(self.blurAmount)")
//            }
//        )
//
//        return VStack {
//            Text("Hello, World!")
//                .blur(radius: blurAmount)
//
//            Slider(value: blur, in: 0...20)
//        }
//    }
//}

//          action sheet

//struct ContentView: View {
//    @State private var showingActionSheet = false
//    @State private var backgroundColor = Color.white
//
//    var body: some View {
//        Text("Hello, World!")
//            .frame(width: 300, height: 300)
//            .background(backgroundColor)
//            .onTapGesture {
//                self.showingActionSheet = true
//            }.actionSheet(isPresented: $showingActionSheet) {
//                ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
//                    .default(Text("Red")) { self.backgroundColor = .red },
//                    .default(Text("Green")) { self.backgroundColor = .green },
//                    .default(Text("Blue")) { self.backgroundColor = .blue },
//                    .cancel()
//                ])
//            }
//    }
//}


//フィルター


//import CoreImage
//import CoreImage.CIFilterBuiltins
//
//struct ContentView: View {
//    @State private var image: Image?
//
//    var body: some View {
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//        }
//        .onAppear(perform: loadImage)
//    }
//
//    func loadImage() {
////        image = Image("kasumi")
//
//        guard let inputImage = UIImage(named: "kasumi") else { return }
//        let beginImage = CIImage(image: inputImage)
//        let context = CIContext()
//
//        let currentFilter = CIFilter.sepiaTone()
//        currentFilter.inputImage = beginImage
////        inputImage is the image we want to change
//        currentFilter.intensity = 1
////        intensity is how strongly the sepia effect should be applied, specified in the range 0 (original image) and 1 (full sepia).
//
////        ドット絵
////        let currentFilter = CIFilter.pixellate()
////        currentFilter.inputImage = beginImage
////        currentFilter.scale = 100
//
////        この二つ動かん
////        let currentFilter = CIFilter.crystallize()
////        currentFilter.inputImage = beginImage
////        currentFilter.radius = 200
////        let currentFilter = CIFilter.crystallize()
////        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
////        currentFilter.radius = 200
//
//        // get a CIImage from our filter or exit if that fails　currentFilter.inputImage = beginImageのこと？
//        guard let outputImage = currentFilter.outputImage else { return }
//
//        // attempt to get a CGImage from our CIImage
//        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
//            // convert that to a UIImage
//            let uiImage = UIImage(cgImage: cgimg)
//
//            // and convert that to a SwiftUI image
//            image = Image(uiImage: uiImage)
//        }
//    }
//
//}



//struct ContentView: View {
//    @State private var image: Image?
//    @State private var showingImagePicker = false
//    @State private var inputImage: UIImage?
//    
//    func loadImage() {
//        guard let inputImage = inputImage else { return }
//        image = Image(uiImage: inputImage)
//
//        let imageSaver = ImageSaver()
//        imageSaver.writeToPhotoAlbum(image: inputImage)
//    }
//
//    var body: some View {
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//
//            Button("Select Image") {
//               self.showingImagePicker = true
//            }
//        }
//        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
//            ImagePicker(image: self.$inputImage)
//        }
//    }
//}
//
//class ImageSaver: NSObject {
//    func writeToPhotoAlbum(image: UIImage) {

////        the first one is the image to save, the second one is an object that should be notified about the result of the save, the third one is the method on the object that should be run

//        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
//    }
//
//    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
//        print("Save finished!")
//    }
//}

//https://www.hackingwithswift.com/books/ios-swiftui/using-coordinators-to-manage-swiftui-view-controllers
//And now we can modify makeCoordinator() so that it passes the ImagePicker struct into the coordinator, like this:

//func makeCoordinator() -> Coordinator {
//    Coordinator(self)
//}

//ImagePicker自身をCoordinatorクラスの親要素に代入

//var parent: ImagePicker
//
//init(_ parent: ImagePicker) {
//    self.parent = parent
//}
