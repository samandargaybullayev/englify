# 🇬🇧 Englify

**Englify** — a modern mobile app that helps users learn and improve their English effortlessly.  
It allows users to translate texts into English, correct grammar mistakes, and interactively practice language skills.

---

## ✨ Features

- 🔤 Fast English text translation  
- 🧠 Grammar correction powered by AI  
- 📚 Sentence analysis and explanations  
- 🎧 Pronunciation support (if enabled)  
- 💾 Translation history saving  
- 🌐 Online/offline mode (coming soon)  

---

## 🧩 Technologies

| Component | Technology |
|------------|-------------|
| App Platform | Flutter |
| Language | Dart |
| API Communication | REST API |
| State Management | Bloc / Cubit |
| Local Storage | Hive / SharedPreferences |
| UI Design | Material 3 + Custom Components |

---

## 🚀 Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/samandargaybullayev/englify.git
   cd englify
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

---

## 🧠 How It Works

Englify processes user input text through an AI or API pipeline:

1. **User Input** → provided text  
2. **API Request** → text translation or grammar analysis  
3. **Response** → returns improved or translated English text  
4. **Display** → shows results on a clean and intuitive UI  

---

## 📂 Project Structure

```
englify/
 ┣ lib/
 ┃ ┣ blocs/          # Bloc / Cubit state management
 ┃ ┣ models/         # Data models
 ┃ ┣ services/       # API and helper functions
 ┃ ┣ screens/        # UI screens
 ┃ ┗ main.dart       # Entry point
 ┣ assets/
 ┃ ┣ images/         # Icons and images
 ┃ ┗ translations/   # JSON translation files
 ┣ pubspec.yaml
 ┗ README.md
```

---

## 🧪 Testing

```bash
flutter test
```

All unit and widget tests are located in the `test/` directory.

---

## 🧑‍💻 Contributing

1. **Fork** the repository  
2. Create a new branch (`feature/my-feature`)  
3. Commit your changes  
4. Submit a **Pull Request**  

Please follow the code quality rules defined in `analysis_options.yaml`.

---

## 📝 License

This project is distributed under the **MIT License**.  
See the [`LICENSE`](LICENSE) file for more information.

---

## 💬 Contact

**Author:** [Samandar G’aybullayev](https://github.com/samandargaybullayev)  
**GitHub:** [@samandargaybullayev](https://github.com/samandargaybullayev)

---

> “Englify — simplify learning, amplify results.”
