# Flutter Calculator App

A sleek, functional, and modern calculator app built with Flutter. This project showcases basic arithmetic operations and a history feature to track your calculations, all wrapped in a responsive and user-friendly UI.

## Features

- **Basic Operations:** Addition, subtraction, multiplication, and division.
- **Percentage & Toggle Sign:** Calculate percentages and switch between positive/negative values with ease.
- **History Drawer:** View your past calculations in a clean, accessible drawer.
- **Modern Design:** Circular buttons and intuitive layout for a great user experience.
- **Error Handling:** Displays "Error" for invalid mathematical expressions to prevent app crashes.

## Screenshots

*Coming soon: Screenshots of the app in action!*

## Installation

1. **Clone the Repository:**
   ```bash
   https://github.com/basuru07/Calculator-App.git
   cd flutter-calculator
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the App:**
   ```bash
   flutter run
   ```

## Usage

- Tap buttons to perform calculations.
- View calculation history by tapping the **History Icon** in the top-right corner.
- Clear the current input using the **AC** button.
- Use **+/-** to toggle the sign of the current number.
- Perform complex calculations by chaining multiple operations.

## Code Highlights

- **Mathematical Evaluation:** Used the `math_expressions` package for safe and reliable parsing and evaluation of user input.
- **Dynamic Buttons:** Created a reusable `calcbutton` widget for a consistent design across the app.
- **State Management:** Managed user input and history efficiently using Flutter's `StatefulWidget`.
- **Responsive Design:** Ensured the UI works seamlessly across devices of varying screen sizes.
- **Drawer Navigation:** Integrated a drawer for displaying calculation history with dynamic updates.

## Dependencies

- [Flutter Framework Dependency](https://flutter.dev/)
- [Math_expressions Dependency](https://pub.dev/packages/math_expressions)

