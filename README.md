# 🧠 Brain Tumor Detection App

A cross-platform mobile application that uses deep learning techniques to detect brain tumors from MRI scans. Built with **Flutter**, this app provides an intuitive user interface and integrates a trained model for accurate predictions.

---

## 📱 Features

- Upload brain MRI images for real-time analysis
- Predicts presence of tumor using a pre-trained model
- Multi-platform support: Android, iOS, Web, Windows, macOS, and Linux
- Simple, clean, and responsive UI using Flutter

---

## 🚀 Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart (comes with Flutter)
- Git
- Android Studio or Xcode for mobile emulation (depending on your platform)

### Installation

```bash
# Clone the repository
git clone https://github.com/3bdelrahman-ahmed/brain_tumr_detection_app.git

# Navigate to the project folder
cd brain_tumr_detection_app

# Install Flutter dependencies
flutter pub get

# Run the app
flutter run

---

🧪 How It Works
User uploads an MRI brain scan via the app interface.

The app preprocesses the image and feeds it to a pre-trained deep learning model.

The model predicts whether the image contains a tumor.

The result is displayed to the user in a clear and simple format.
---

lib/
│
├── main.dart              # App entry point
├── screens/               # UI screens (home, result, etc.)
├── widgets/               # Reusable widgets
├── services/              # Image handling and model inference
├── utils/                 # Helper functions and constants
---


🧠 Model Details
The app currently uses a TensorFlow Lite (TFLite) model for on-device inference. You can replace the model with your own by placing it in the appropriate assets folder and updating the inference logic.****
---

📬 Contact
Developed by @3bdelrahman-ahmed
Developed by @youssef7221
---

Feel free to open an issue or reach out with suggestions or improvements!
