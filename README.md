# 🛡️ Food Guard

A comprehensive Flutter application designed to ensure food safety compliance through citizen reporting and professional inspections. This app empowers citizens to report food safety violations and enables inspectors to conduct thorough assessments using AI-powered analysis.

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

### Version 1.1.0 - Authentication & UI Improvements

#### 🔐 Enhanced Authentication System
- **Proper Authentication Logic**: Replaced mock authentication with real credential validation
- **Persistent User Storage**: Users are now stored locally using SharedPreferences
- **Input Validation**: Added comprehensive validation for emails, passwords, and phone numbers
- **Password Security**: Minimum password length requirements and secure storage
- **Role-Based Validation**: Ensures users can only access their designated role dashboards

#### 👤 Profile Management
- **Universal Profile Screen**: Single, responsive profile screen for all user roles
- **Editable Profiles**: Users can update their personal and professional information
- **Role-Specific Fields**: Different fields displayed based on user role (citizen/inspector/admin)
- **Account Information**: Display account status, verification status, and registration date
- **Responsive Design**: Profile screen adapts to different screen sizes

#### 📱 UI/UX Improvements
- **Responsive Dashboards**: Improved responsiveness across all dashboard screens
- **Enhanced Login Screen**: Clean authentication interface without demo credentials
- **Consistent Navigation**: Profile access from all dashboard menu options
- **Improved Error Handling**: Better error messages and user feedback
- **Cross-Platform Compatibility**: Optimized for mobile, tablet, and web platforms

#### 🏢 Admin Dashboard Enhancements
- **Real-time Updates**: Live data synchronization across all dashboards (30-second intervals)
- **Enhanced Restaurant Management**: Add new restaurants with comprehensive form validation
- **Advanced Search & Filtering**: Search restaurants by name, address, or phone with sorting options
- **System Activity Monitoring**: Real-time activity feed showing all system events
- **Comprehensive System Settings**: Configure notifications, AI analysis, data retention, and system maintenance
- **Fixed Report Analytics**: Corrected pending reports count to match across all dashboards
- **System Health Monitoring**: Real-time system status and performance metrics
- **Data Management Tools**: Cache clearing, data export, and system maintenance features

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

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- Git

### Setup Instructions

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
   - Add camera permissions in `android/app/src/main/AndroidManifest.xml`

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

### Build Instructions

**Android APK:**
```bash
flutter build apk --release
```

**iOS App Store:**
```bash
flutter build ios --release
```

**Web Build:**
```bash
flutter build web --release
```

## 📖 Usage

### Getting Started
1. **Launch the App**: Open the app on your device
2. **Select User Role**: Choose between Citizen, Inspector, or Admin
3. **Register or Login**: Create a new account or login with existing credentials

### For Citizens
1. **Register/Login**: Create an account or login with existing credentials
2. **Browse Restaurants**: Find restaurants in your area
3. **Submit Reports**: Take photos and describe violations
4. **Track Progress**: Monitor report status and inspector responses
5. **Manage Profile**: Update personal information, set profile photo, and view account details
6. **App Settings**: Configure notifications, language, and other preferences

### For Inspectors
1. **Login**: Access inspector dashboard with inspector credentials
2. **Review Reports**: Analyze citizen-submitted reports
3. **Conduct Inspections**: Use checklists for professional assessments
4. **AI Analysis**: Utilize automated image analysis
5. **Generate Reports**: Create detailed compliance reports
6. **Update Profile**: Manage professional details, license info, and profile photo
7. **App Settings**: Configure notifications and preferences

### For Admins
1. **Login**: Access admin dashboard with admin credentials
2. **User Management**: View and manage all registered users
3. **Restaurant Oversight**: Monitor restaurant registrations and compliance
4. **Report Analytics**: Review comprehensive food safety analytics
5. **System Administration**: Full system control and configuration
6. **Profile Management**: Update administrative information and profile photo
7. **App Settings**: Configure notifications and preferences

## 🏗️ Project Structure

```
food_guard/
├── android/                 # Android platform code
├── ios/                     # iOS platform code
├── lib/                     # Main Flutter application
│   ├── models/             # Data models
│   │   ├── inspection.dart
│   │   ├── report.dart
│   │   ├── restaurant.dart
│   │   └── user.dart
│   ├── providers/          # State management
│   │   ├── auth_provider.dart      # Authentication & user management
│   │   ├── inspection_provider.dart
│   │   ├── report_provider.dart
│   │   └── restaurant_provider.dart
│   ├── screens/            # UI screens
│   │   ├── auth/           # Authentication screens
│   │   │   ├── login_screen.dart
│   │   │   └── registration_screen.dart
│   │   ├── citizen/        # Citizen user interface
│   │   │   ├── home_screen.dart
│   │   │   └── report_screen.dart
│   │   ├── inspector/      # Inspector dashboard
│   │   │   ├── dashboard.dart
│   │   │   ├── checklist_screen.dart
│   │   │   └── new_inspection.dart
│   │   ├── admin/          # Admin interface
│   │   │   ├── admin_dashboard.dart
│   │   │   ├── manage_restaurants.dart
│   │   │   ├── review_reports.dart
│   │   │   └── user_management.dart
│   │   ├── profile_screen.dart     # Universal profile management
│   │   └── settings_screen.dart    # App settings and preferences
│   ├── services/           # API and utility services
│   │   ├── api_service.dart
│   │   └── mock_data.dart
│   └── config/             # Configuration files
│       └── constants.dart
├── test/                   # Unit and widget tests
├── web/                    # Web platform files
└── pubspec.yaml           # Flutter dependencies
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

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Flutter best practices
- Write comprehensive tests
- Update documentation
- Ensure cross-platform compatibility

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

**Project Developer**: SASI
- **GitHub**: [@SASI-20041230](https://github.com/SASI-20041230)
- **Email**: [your-email@example.com]
- **LinkedIn**: [Your LinkedIn Profile]

### Support
- Create an issue on GitHub for bug reports
- Use discussions for questions and feature requests
- Check the documentation for common solutions

---

⭐ **Star this repository** if you find it helpful!

**Made with ❤️ for Food Safety**
