

# Quotes App

A visually appealing Quotes App built with Flutter, designed to provide users with inspirational and meaningful quotes paired with stunning background images. This app fetches random background images from Unsplash to create an immersive experience, making each quote feel unique and captivating. Users can easily share, copy, and save their favorite quotes with a single tap.

[Project URL on GitHub](https://github.com/WednesdaySP/CodeSoft-Task-2)

## 🌟 Features

- **Random Quote Display**: View a new inspirational quote each time you open the app.
- **Background Images from Unsplash**: Dynamic and high-quality backgrounds sourced from Unsplash's API.
- **Favorite Quotes**: Save your favorite quotes for easy access later.
- **Share Quotes**: Quickly share quotes with friends and family through social media or messaging apps.
- **Copy to Clipboard**: Copy quotes to your clipboard with a single tap.
- **Offline Access**: Access saved favorite quotes even when offline.

## 🔧 Technologies Used

- **Flutter**: For building a smooth and responsive UI across platforms.
- **Unsplash API**: To fetch high-quality, random background images that accompany each quote.
- **Dio**: For making API requests to retrieve quotes and images.
- **Shared Preferences**: To store favorite quotes locally on the device.

## 📲 Screenshots

![project-3](https://github.com/user-attachments/assets/2712a09f-bda4-4217-9160-a2a7198264bf)


## 🚀 Getting Started

### Prerequisites

- **Flutter**: Make sure the Flutter SDK is installed on your machine ([Flutter Installation Guide](https://flutter.dev/docs/get-started/install)).

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/WednesdaySP/CodeSoft-Task-2.git
   ```
2. **Navigate to Project Directory**
   ```bash
   cd CodeSoft-Task-2
   ```
3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

### API Setup

To access Unsplash's API for background images, you will need an API key:

1. Sign up at [Unsplash](https://unsplash.com/developers) and get an API key.
2. Add your API key in the `lib/constants.dart` file:
   ```dart
   const String unsplashApiKey = 'YOUR_API_KEY_HERE';
   ```

### Running the App

To run the app on your device, use:

```bash
flutter run
```

## 🛠 Architecture

This app uses **Provider** for state management:
- **Provider** helps manage app states like favorites and quote sharing.
- **Repository** handles fetching quotes and background images from the respective APIs.
- **UI Layer** utilizes Provider listeners to update UI when app state changes.


## 💡 Usage

1. **View Quotes**: Open the app to view a random quote with a beautiful Unsplash background.
2. **Share or Copy Quotes**: Tap the share icon to share or the copy icon to copy the quote to your clipboard.
3. **Favorite Quotes**: Save quotes by tapping the heart icon, and access them in the favorites section.
4. **Refresh Quotes**: Refresh for a new quote and image combination.

## 📌 Future Enhancements

- **Quote Categories**: Add categories to filter quotes by themes like motivation, love, and success.
- **Daily Quote Notifications**: Enable daily notifications with a random quote.
- **Enhanced Customization**: Allow users to customize the font style and background images.

## 📄 License

This project is licensed under the MIT License.

---

