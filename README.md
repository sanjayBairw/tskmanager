# 📋 Task Manager (tskmanager)

A clean, modern **Task Manager** application built with **Flutter** and **Material Design 3**. The app fetches tasks from a REST API, provides filtering capabilities, and supports full CRUD operations — all wrapped in a polished, production-quality UI.

---

## ✨ Features

| Feature | Description |
|---|---|
| **Splash Screen** | Animated launch screen with a Lottie animation and progress indicator |
| **Login Screen** | Form-validated sign-in UI with email & password fields (UI-only demo) |
| **Task List** | Scrollable list of tasks fetched from a remote API |
| **Add Task** | Create new tasks via a sleek bottom-sheet dialog |
| **Toggle Completion** | Tap a task to mark it as done/pending with visual feedback |
| **Swipe to Delete** | Dismiss tasks by swiping left with a delete confirmation background |
| **Filter Tasks** | Filter by **All**, **Completed**, or **Pending** using choice chips |
| **Task Overview** | At-a-glance counters for completed and pending tasks |
| **Pull to Refresh** | Swipe down to reload tasks from the API |
| **Error Handling** | Graceful error view with retry option on network failures |

---

## 🏗️ Architecture

The project follows a **clean, layered architecture** with clear separation of concerns:

```
┌─────────────┐
│   Screens   │   UI layer – pages the user sees
├─────────────┤
│   Widgets   │   Reusable UI components
├─────────────┤
│  Providers  │   State management (ChangeNotifier + Provider)
├─────────────┤
│  Services   │   Data fetching / business logic
├─────────────┤
│   Models    │   Data classes
└─────────────┘
```

**State Management:** [Provider](https://pub.dev/packages/provider) with `ChangeNotifier` — a lightweight, recommended approach for Flutter apps.

---

## 📂 Folder Structure

```
lib/
├── main.dart                  # App entry point & MaterialApp config
├── data/                      # (Reserved for local data sources)
├── models/
│   └── task.dart              # Task data model with JSON parsing
├── providers/
│   └── task_provider.dart     # State management – filtering, CRUD, API calls
├── screens/
│   ├── splash_screen.dart     # Animated splash with Lottie
│   ├── login_screen.dart      # Sign-in form with validation
│   └── home_screen.dart       # Main task list & overview dashboard
├── services/
│   └── task_service.dart      # REST API client (JSONPlaceholder)
└── widgets/
    ├── task_filter_bar.dart    # Filter chips + count badges
    └── task_tile.dart          # Individual task card with swipe-to-delete
```

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| **Flutter** (SDK ≥ 3.9.2) | Cross-platform UI framework |
| **Dart** | Programming language |
| **Material 3** | Design system with `ColorScheme.fromSeed` |
| **Provider** ^6.1.5 | State management |
| **http** ^1.6.0 | REST API communication |
| **Lottie** ^3.3.1 | Splash screen animation |

---

## 🌐 API

The app uses the [JSONPlaceholder](https://jsonplaceholder.typicode.com/) REST API as its data source:

- **Endpoint:** `https://jsonplaceholder.typicode.com/todos`
- **Method:** `GET`
- **Response:** Array of 200 task objects with `id`, `userId`, `title`, and `completed` fields.

> **Note:** New tasks, toggles, and deletions are handled locally in-memory. The API is read-only and serves as the initial data source.

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** ≥ 3.9.2 — [Install Flutter](https://docs.flutter.dev/get-started/install)
- **Android Studio** / **VS Code** with Flutter extensions
- An emulator or physical device

### Installation

```bash
# 1. Clone the repository
git clone <repository-url>
cd tskmanager

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

### Build APK

```bash
flutter build apk --release
```

The release APK will be available at `build/app/outputs/flutter-apk/app-release.apk`.

---

## 📱 App Flow

```
Splash Screen (2s, Lottie animation)
        │
        ▼
   Login Screen (UI-only validation)
        │
        ▼
   Home Screen
   ├── Overview Card (filter chips + task counts)
   ├── Task List (scrollable, pull-to-refresh)
   │   ├── Tap → toggle done/pending
   │   └── Swipe left → delete task
   └── FAB → Add New Task (bottom sheet)
```

---

## 📝 Key Implementation Details

- **Immutable Data Model:** The `Task` class uses `final` fields and a `copyWith` method for safe state updates.
- **Dependency Injection:** `TaskService` and `TaskProvider` accept optional dependencies via constructor parameters, making them testable.
- **Error Resilience:** Network errors are caught and displayed with a user-friendly retry UI rather than crashing the app.
- **Material 3 Theming:** The entire app uses `ColorScheme.fromSeed(seedColor: Colors.teal)` for a cohesive, modern look.

---

## 📱 Screenshots

### Login Screen

![Login Screen](screenshots/login.png),
(screenshots/loginPass.png)

---

### Home Screen

![Home Screen](screenshots/homescreen.png)

---

### Filtered View

![Filtered View](screenshots/filteredDone.png)
![Filtered View](screenshots/filteredPending.png)

## 👤 Author

**Sanjay**

---
