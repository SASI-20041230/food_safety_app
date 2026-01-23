# 🛡️ Food Safety App

A comprehensive Flutter application designed to ensure food safety compliance through citizen reporting and professional inspections. This app empowers citizens to report food safety violations and enables inspectors to conduct thorough assessments using AI-powered analysis.

## 🎉 **Latest Update: Mobile APK Ready!**

✅ **Production APK Available**: `build/app/outputs/flutter-apk/app-release.apk` (49.4MB)  
✅ **Android 5.0+ Compatible**: Ready for mobile installation  
✅ **Complete Features**: Restaurant ratings, inspections, citizen reports  
✅ **Production Ready**: Optimized release build with all fixes applied  

**Quick Start**: Download the APK and install on your Android device for the full food safety experience!

---

## 📋 Table of Contents

- [Features](#features)
- [Recent Enhancements](#recent-enhancements)
- [Tech Stack](#tech-stack)
- [Screenshots](#screenshots)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [API Integration](#api-integration)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## ✨ Features

### 👥 Citizen Features
- **Report Violations**: Submit detailed reports about food safety issues with photos
- **Real-time Location**: GPS-based location tracking for accurate reporting
- **Image Upload**: Support for multiple images with camera/gallery access
- **Anonymous Reporting**: Option to report anonymously
- **Report Tracking**: Monitor the status of submitted reports
- **Profile Management**: Update personal information and view account details

### 🔍 Inspector Features
- **Professional Inspections**: Comprehensive checklist-based inspections
- **AI-Powered Analysis**: YOLOv8 integration for automated image analysis
- **Citizen Report Review**: Access and analyze citizen-submitted reports
- **Compliance Scoring**: Automated scoring based on FSSAI guidelines
- **Report Management**: Approve, reject, or escalate reports
- **Profile Management**: Update professional details and license information

### 🏢 Admin Features
- **User Management**: Manage all users (citizens, inspectors, admins)
- **Restaurant Management**: Add, edit, delete restaurants with search and filtering
- **Report Analytics**: Comprehensive analytics on food safety reports
- **System Administration**: Full system control and configuration
- **Real-time Activity Monitoring**: Live activity feed with real-time updates
- **System Settings**: Configure notifications, AI analysis, data retention, and more
- **Profile Management**: Update administrative information and organization details
- **Dashboard Analytics**: Real-time statistics and system health monitoring

### 🔐 Authentication System
- **Secure Login**: Email and password-based authentication with proper validation
- **Role-Based Access**: Different dashboards for citizens, inspectors, and admins
- **User Registration**: Separate registration flows for each user type with validation
- **Persistent Sessions**: Secure session management with local storage
- **Error Handling**: Comprehensive error messages for login and registration failures
- **Input Validation**: Email format, password strength, and phone number validation

### 👤 Profile Management
- **Universal Profile Screen**: Single, responsive profile screen for all user roles
- **Editable Profiles**: Users can update personal and professional information
- **Profile Photos**: Upload profile pictures from camera or gallery
- **Role-Specific Fields**: Different form fields based on user role
- **Account Information**: Display verification status and registration details

### ⚙️ Settings & Preferences
- **App Settings**: Notification preferences, language selection, and app information
- **Account Management**: View account details and logout functionality
- **Privacy & Support**: Links to privacy policy, terms of service, and help resources
- **Cross-Platform**: Consistent settings experience across all platforms

## 🚀 Recent Enhancements

### Version 1.2.0 - Complete Mobile App with APK Deployment

#### ⭐ **APK Build & Mobile Deployment**
- **Release APK Generated**: Successfully built production-ready APK (49.4MB)
- **Mobile Installation**: Ready for Android devices (API 21+)
- **Optimized Performance**: Release build with tree-shaking and minification
- **Cross-Platform Ready**: Built for Android with iOS/Web compatibility

#### 👥 **Enhanced Citizen Features**
- **Restaurant Rating System**: Complete 5-star rating and review functionality
- **Advanced Report Submission**: Multi-image upload with camera/gallery support
- **Real-time Location Tracking**: GPS-based accurate reporting
- **Report Status Tracking**: Live updates on submitted reports
- **User Profile Management**: Complete profile editing with photo upload

#### 🔍 **Inspector Dashboard Improvements**
- **Smart Inspection Workflow**: Conditional restaurant selection for new vs existing inspections
- **Completed Inspection Details**: Clickable completed inspections with detailed view
- **Enhanced Report Review**: Fixed image display for citizen reports (local files + URLs)
- **Comprehensive Checklist System**: FSSAI-compliant inspection checklists
- **Professional Scoring**: Automated compliance scoring and risk assessment

#### 🏢 **Restaurant Management System**
- **Restaurant Profiles**: Detailed information with ratings and reviews
- **Inspection History**: Complete audit trail of all inspections
- **Risk Assessment**: Automated risk scoring based on compliance
- **Search & Filtering**: Advanced restaurant discovery features

#### 📱 **UI/UX Enhancements**
- **Material Design 3**: Modern, responsive interface
- **Cross-Platform Compatibility**: Optimized for mobile, tablet, and desktop
- **Improved Navigation**: Intuitive bottom navigation with role-based access
- **Error Handling**: Comprehensive error messages and user feedback
- **Loading States**: Professional loading indicators and progress feedback

#### 🔧 **Technical Improvements**
- **State Management**: Robust Provider-based state management
- **Local Storage**: SharedPreferences for persistent data
- **Image Handling**: Support for both local files and network images
- **Form Validation**: Comprehensive input validation with custom validators
- **API Integration**: RESTful API architecture with error handling

## 🛠️ Tech Stack

### 👥 Citizen Features
- **Report Violations**: Submit detailed reports about food safety issues with photos
- **Real-time Location**: GPS-based location tracking for accurate reporting
- **Image Upload**: Support for multiple images with camera/gallery access
- **Anonymous Reporting**: Option to report anonymously
- **Report Tracking**: Monitor the status of submitted reports

### 🔍 Inspector Features
- **Professional Inspections**: Comprehensive checklist-based inspections
- **AI-Powered Analysis**: YOLOv8 integration for automated image analysis
- **Citizen Report Review**: Access and analyze citizen-submitted reports
- **Compliance Scoring**: Automated scoring based on FSSAI guidelines
- **Report Management**: Approve, reject, or escalate reports

### 🏢 Restaurant Management
- **Restaurant Profiles**: Detailed information about registered restaurants
- **Inspection History**: Track all past inspections and compliance records
- **Risk Assessment**: Automated risk scoring based on inspection results

## 🛠️ Tech Stack

### Frontend
- **Flutter**: Cross-platform mobile and web development
- **Dart**: Programming language
- **Provider**: State management solution

### Backend & Services
- **RESTful APIs**: For data communication
- **Firebase**: Authentication and cloud storage
- **SQLite**: Local data storage

### AI & ML
- **YOLOv8**: Object detection for food safety violations
- **Computer Vision**: Image analysis and classification

### Development Tools
- **Android Studio / VS Code**: IDE
- **Git**: Version control
- **GitHub**: Repository hosting

## 📱 Screenshots

### Citizen Dashboard
- Report submission interface
- Image upload functionality
- Report status tracking

### Inspector Dashboard
- Inspection checklists
- Citizen reports review
- AI analysis results

### Restaurant Profiles
- Inspection history
- Compliance scores
- Risk assessments

## 🚀 Installation

### 📱 **Mobile APK Installation (Recommended)**

The app is now available as a production-ready APK for Android devices:

#### **APK Download & Installation:**
1. **Locate the APK file**: `build/app/outputs/flutter-apk/app-release.apk`
2. **Transfer to Android device**: Copy the APK to your Android phone via USB, email, or cloud storage
3. **Enable Unknown Sources**:
   - Go to **Settings > Security** (or **Privacy** on Android 12+)
   - Enable **"Install unknown apps"** or **"Install apps from unknown sources"**
4. **Install the APK**:
   - Open file manager and navigate to the APK
   - Tap `app-release.apk` to install
   - Follow installation prompts
5. **Launch the app**: Find "Food Safety App" in your app drawer

#### **System Requirements:**
- **Android Version**: 5.0 (API 21) or higher
- **Storage**: ~100MB free space
- **Permissions**: Camera, Storage, Location (optional)

### 💻 **Development Setup**

#### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- Git
- Android SDK (for Android development)

#### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/SASI-20041230/food_safety_app.git
   cd food_safety_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure platform-specific settings**

   **For Android:**
   - Ensure Android SDK is properly configured
   - Add required permissions in `android/app/src/main/AndroidManifest.xml`

   **For iOS:**
   - Open `ios/Runner.xcworkspace` in Xcode
   - Configure camera and photo library permissions

4. **Run the application**
   ```bash
   # For Android
   flutter run -d android

   # For iOS
   flutter run -d ios

   # For Web
   flutter run -d chrome
   ```

### 🏗️ **Build Instructions**

**Android APK (Release Build):**
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

**Android App Bundle (AAB):**
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

**iOS App Store:**
```bash
flutter build ios --release
```

**Web Build:**
```bash
flutter build web --release
```

## 📦 **APK Information**

### **Current Release: Version 1.2.0**
- **File Size**: 49.4MB
- **Build Type**: Release APK (Optimized)
- **Supported Platforms**: Android 5.0+ (API 21+)
- **Build Date**: January 24, 2026

### **APK Features**
✅ **Complete Citizen Experience**
- Restaurant rating and review system
- Multi-image violation reporting
- GPS location tracking
- Report status monitoring

✅ **Full Inspector Dashboard**
- Professional inspection checklists
- Completed inspection details view
- Citizen report review with images
- FSSAI compliance scoring

✅ **Production Ready**
- Optimized performance
- Secure data handling
- Offline capabilities
- Cross-platform compatibility

### **APK File Location**
```
food_safety_app/
└── build/
    └── app/
        └── outputs/
            └── flutter-apk/
                ├── app-release.apk (49.4MB)
                └── app-release.apk.sha1
```

## 📖 Usage

### 🚀 **Getting Started with Mobile APK**

1. **Install the APK** on your Android device (see Installation section)
2. **Launch the App**: Tap the "Food Safety App" icon
3. **Select User Role**: Choose between Citizen, Inspector
4. **Register/Login**: Create account or login with existing credentials

### 👥 **For Citizens (Mobile App)**

#### **Restaurant Discovery & Rating**
- **Browse Restaurants**: View restaurants with ratings and reviews
- **Rate & Review**: Submit 5-star ratings with detailed feedback
- **Search & Filter**: Find restaurants by location, cuisine, or rating

#### **Report Violations**
- **Quick Reporting**: Capture photos of violations with camera
- **Detailed Reports**: Add descriptions, locations, and multiple images
- **Anonymous Option**: Report without personal information
- **Track Progress**: Monitor report status and inspector responses

#### **Profile & Settings**
- **Manage Profile**: Update personal information and profile photo
- **App Preferences**: Configure notifications and app settings
- **Account Security**: Secure login with persistent sessions

### 🔍 **For Inspectors (Mobile App)**

#### **Dashboard Overview**
- **Pending Inspections**: View assigned inspections with restaurant details
- **Completed History**: Access past inspections with detailed results
- **Quick Actions**: Start new inspections or review completed ones

#### **Inspection Management**
- **Smart Workflow**: Restaurant selection only for new inspections
- **Comprehensive Checklists**: FSSAI-compliant inspection categories
- **Evidence Collection**: Capture photos during inspections
- **Real-time Scoring**: Automated compliance scoring

#### **Citizen Report Review**
- **Report Analysis**: View citizen reports with images
- **AI Integration**: Access AI-powered analysis (when available)
- **Status Updates**: Approve, reject, or mark reports as resolved

#### **Professional Tools**
- **License Management**: FSSAI license validation and updates
- **Report Generation**: Create detailed inspection reports
- **Data Export**: Export inspection data for records

## 🏗️ Project Structure

```
food_safety_app/
├── android/                    # Android platform code & build files
│   ├── app/
│   │   ├── build.gradle.kts
│   │   └── src/main/AndroidManifest.xml
│   └── gradle/wrapper/
├── ios/                        # iOS platform code
├── lib/                        # Main Flutter application
│   ├── config/
│   │   └── constants.dart      # App constants and configuration
│   ├── models/                 # Data models
│   │   ├── inspection.dart     # Inspection data structure
│   │   ├── rating.dart         # Restaurant rating model
│   │   ├── report.dart         # Citizen report model
│   │   ├── restaurant.dart     # Restaurant information
│   │   └── user.dart           # User authentication model
│   ├── providers/              # State management (Provider pattern)
│   │   ├── auth_provider.dart         # Authentication & user management
│   │   ├── inspection_provider.dart   # Inspection workflow management
│   │   ├── rating_provider.dart       # Restaurant rating system
│   │   ├── report_provider.dart       # Citizen reports management
│   │   └── restaurant_provider.dart   # Restaurant data management
│   ├── screens/                # UI screens organized by user role
│   │   ├── auth/               # Authentication screens
│   │   │   ├── login_screen.dart
│   │   │   └── registration_screen.dart
│   │   ├── citizen/            # Citizen user interface
│   │   │   ├── dashboard.dart         # Citizen home with ratings
│   │   │   ├── restaurant_details.dart # Restaurant info & reviews
│   │   │   └── report_screen.dart     # Violation reporting
│   │   ├── inspector/          # Inspector dashboard & tools
│   │   │   ├── dashboard.dart         # Main inspector interface
│   │   │   ├── new_inspection.dart    # Inspection creation/completion
│   │   │   └── inspection_details.dart # Completed inspection viewer
│   │   ├── profile_screen.dart        # Universal profile management
│   │   └── settings_screen.dart       # App settings & preferences
│   └── services/              # API and utility services
│       ├── api_service.dart   # REST API communication
│       └── mock_data.dart     # Sample data for development
├── test/                      # Unit and widget tests
├── web/                       # Web platform files
├── build/                     # Build outputs
│   └── app/outputs/flutter-apk/
│       └── app-release.apk    # 📱 Production APK (49.4MB)
├── analysis_options.yaml      # Dart/Flutter analysis configuration
├── pubspec.yaml              # Flutter dependencies & assets
└── README.md                 # 📖 This documentation
```

## 🔌 API Integration

The app integrates with the following APIs:

### Food Safety APIs
- **FSSAI Compliance API**: Real-time compliance checking
- **Restaurant Database**: Centralized restaurant information
- **Inspection Records**: Historical inspection data

### AI Services
- **YOLOv8 API**: Object detection for food safety violations
- **Image Analysis**: Automated quality assessment
- **Risk Scoring**: Machine learning-based risk evaluation

### Authentication
- **Firebase Auth**: User authentication and authorization
- **Role-based Access**: Different permissions for citizens, inspectors, and admins

## 🚀 Deployment

### **Mobile App Deployment**
- **APK Status**: ✅ Production-ready APK built and tested
- **File Location**: `build/app/outputs/flutter-apk/app-release.apk`
- **Size**: 49.4MB (optimized release build)
- **Supported Devices**: Android 5.0+ (API 21+)

### **Distribution Options**
- **Direct APK**: Share APK file via email, cloud storage, or direct transfer
- **Google Play Store**: Ready for Play Store submission (AAB format available)
- **Enterprise Distribution**: Suitable for internal company distribution

### **Installation Instructions for Users**
1. Download the APK file to your Android device
2. Enable "Install unknown apps" in device settings
3. Open the APK file and follow installation prompts
4. Launch the app and enjoy the full food safety experience!

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Flutter best practices and Material Design 3 guidelines
- Write comprehensive tests for new features
- Update documentation for any changes
- Ensure cross-platform compatibility (Android/iOS/Web)
- Test on multiple screen sizes and orientations

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

**Project Developer**: SASI
- **GitHub**: [@SASI-20041230](https://github.com/SASI-20041230)
- **Repository**: [Food Safety App](https://github.com/SASI-20041230/food_safety_app)
- **Version**: 1.2.0 (January 24, 2026)

### Support & Issues
- 🐛 **Bug Reports**: Create an issue on GitHub
- 💡 **Feature Requests**: Use GitHub Discussions
- 📧 **General Questions**: Check documentation or create discussions
- 📱 **Mobile App Issues**: Test with the latest APK release

### **APK Download**
The latest APK is available in the `build/app/outputs/flutter-apk/` directory after running:
```bash
flutter build apk --release
```

---

⭐ **Star this repository** if you find it helpful!

**Made with ❤️ for Food Safety - Now Available on Mobile!** 📱
