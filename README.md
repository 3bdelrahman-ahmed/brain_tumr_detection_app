# 🧠 Brain Tumor Detection App

A comprehensive Flutter application for brain tumor detection and medical consultation, featuring AI-powered analysis and doctor connectivity.

## 📱 Features

### 🔍 Core Features
- **AI-Powered Brain Tumor Detection**: Upload medical images for instant AI analysis
- **Doctor Directory**: Browse and connect with qualified medical professionals
- **Real-time Search**: Find doctors by specialty, location, or name
- **Multi-language Support**: Internationalization with localized content
- **Responsive Design**: Optimized for various screen sizes and orientations

### 👨‍⚕️ Doctor Features
- **Comprehensive Doctor Profiles**: View detailed information about medical professionals
- **Search & Filter**: Advanced search functionality with real-time results
- **Pagination Support**: Smooth loading of large doctor datasets
- **Clinic Information**: Access to clinic details and contact information

### 🎨 UI/UX Features
- **Modern Material Design**: Clean and intuitive user interface
- **Dark/Light Theme Support**: Adaptive theming based on user preferences
- **Shimmer Loading**: Elegant loading animations for better user experience
- **Error Handling**: Graceful error recovery with retry mechanisms
- **Empty State Handling**: User-friendly empty state illustrations

## 🏗️ Architecture

This project follows **Clean Architecture** principles with:

```
lib/
├── core/                   # Core functionality and shared components
│   ├── components/         # Reusable widgets and cubits
│   ├── utils/             # Utilities, extensions, and assets
│   └── themes/            # App theming and styling
├── features/              # Feature-based modules
│   ├── doctors/           # Doctor listing and search functionality
│   │   ├── data/          # Data layer (repositories, models)
│   │   ├── domain/        # Domain layer (entities, use cases)
│   │   └── presentation/  # Presentation layer (UI, BLoC)
│   └── detection/         # Brain tumor detection features
└── generated/             # Generated files (translations, assets)
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.x
- **State Management**: BLoC Pattern with Cubit
- **Architecture**: Clean Architecture with Domain-Driven Design
- **Networking**: HTTP requests for API communication
- **Internationalization**: Built-in Flutter i18n support
- **UI Components**: Custom Material Design components
- **Responsive Design**: Screen-adaptive layouts

## 📦 Dependencies

### Core Dependencies
```yaml
flutter_bloc: ^8.x.x          # State management
http: ^0.13.x                  # Network requests
flutter_localizations: ^3.x.x # Internationalization
```

### UI & Animation
```yaml
shimmer: ^3.x.x               # Loading animations
flutter_svg: ^2.x.x           # SVG asset support
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- Android SDK / Xcode (for mobile development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/brain_tumor_detection_app.git
   cd brain_tumor_detection_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 📱 Screenshots

> - Home screen with brain scan upload
<img width="720" height="1280" alt="Screenshot_1758902402" src="https://github.com/user-attachments/assets/252fcf8b-102b-4a0f-a6fd-2ef98e4160a2" />

> - Doctor listing page
<img width="720" height="1280" alt="Screenshot_1758899491" src="https://github.com/user-attachments/assets/7367aeae-98fb-4c65-bc90-99fb54811ae9" />

> - AI analysis results
<img width="720" height="1280" alt="image" src="https://github.com/user-attachments/assets/3f82a8ca-49e8-4de9-937e-7b63d93861ba" />

> - Doctor profile pages
<img width="720" height="1280" alt="Screenshot_1758902922" src="https://github.com/user-attachments/assets/d7d00666-4285-49de-9b8e-05c9b426f2e4" />

## 🔧 Configuration

### API Configuration
Update the API endpoints in your configuration files:

```dart
// lib/core/utils/constants/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'YOUR_API_BASE_URL';
  static const String doctorsEndpoint = '/doctors';
  static const String detectionEndpoint = '/detect';
}
```

### Localization
The app supports multiple languages. Add new translations in:
- `lib/l10n/intl_en.arb` (English)
- `lib/l10n/intl_ar.arb` (Arabic)

## 🧪 Testing

Run tests using:
```bash
flutter test
```

## 📊 Performance Optimization

- **Lazy Loading**: Doctors list with pagination
- **Image Optimization**: Efficient image loading and caching
- **Memory Management**: Proper disposal of controllers and streams
- **Error Boundaries**: Graceful error handling throughout the app

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- **Flutter Developer**: [Abdelrahman Ahmed]
- **Flutter Developer** : [Yousef Ibrahim]
- **Flutter Developer** : [Kerouls Soliman]
- **UI/UX Designer** : [Sarah Seyam]
- **ML Eng** : [Ahmed Mohamed]
- **ML Eng** : [Yusuf Ashraf]
- **ML Eng** : [Amira Hamed]
- **Back-end Developer** : [Kareem Tamer] 

## 📞 Support

For support and questions:
- Email: abdelrahmanahmed0255@gmail.com
- Issues: [GitHub Issues](https://github.com/3bdelrahman-ahmed/brain_tumr_detection_app/issues)

## 🙏 Acknowledgments

- Medical professionals who provided consultation
- Flutter community for excellent packages
- UI/UX inspiration from healthcare applications

---

**⚠️ Medical Disclaimer**: This application is for educational and informational purposes only. Always consult with qualified medical professionals for proper diagnosis and treatment.
