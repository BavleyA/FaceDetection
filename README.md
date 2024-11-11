# Face Detection Application

This Flutter application enables users to detect faces in an image by either capturing a photo or uploading one from their gallery. The app uses face detection to count the number of faces in an image and displays the result to the user.

## Features

- **Take a Photo**: Capture an image using the device camera.
- **Upload a Photo**: Select an image from the device's gallery.
- **Face Detection**: Detect and count the number of faces in the selected image.
- **Real-time Feedback**: Displays the count of detected faces immediately.

## Technologies

- **Flutter**: Cross-platform framework for building the application.
- **Google ML Kit**: For face detection functionality.
- **Image Picker**: Allows users to capture or upload images.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio or Xcode (for running the app on Android or iOS)
- Firebase account if using Firebase ML Kit
- Permissions for camera and storage access on the device

### Installation

1. **Clone the repository:**
    ```bash
   git clone https://github.com/yourusername/face_detection_app.git
   cd face_detection_app
    
2. **Install dependencies:**
    ```bash
    flutter pub get
  
3. **Run The App:**
   ```bash
    flutter run

## Usage

1. **Launch the app.**
2. **Select an option**:
   - Tap **"Take Photo"** to capture a new image.
   - Tap **"Upload Photo"** to select an image from the gallery.
3. **View Results**:
   - The app will detect faces in the image and display the count on the screen.
  
## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to help improve the app.

  
