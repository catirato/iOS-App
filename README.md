# ✈️ Viagens CatPower

**Viagens CatPower** is an iOS application developed in **Swift** and **SwiftUI** that allows users to plan and manage trips in a simple, visual, and organized way.

The application allows users to view planned trips, add new trips, edit existing ones, and remove trips from the list. The initial data is loaded from a **JSON** file and then manipulated **in memory** during the application's execution.

This project was developed as part of the **iOS Development** course.

---

# 📱 Screenshots

<p align="center">
  <img src="screenshots/trip_list.png" width="180">
  <img src="screenshots/add_trip.png" width="180">
  <img src="screenshots/edit_trip.png" width="180">
  <img src="screenshots/about.png" width="180">
</p>

---

# 📋 Features

- View a list of trips
- Create new trips
- Edit existing trips
- Delete individual trips
- Delete all trips from the list
- Select a representative image for the trip
- Choose the trip type (Leisure, Work, Family, Adventure, or Cultural)
- **About** view with information about the application

---

# 🗂 Data Structure

Each trip contains:

- `id`
- `name`
- `destination`
- `period`
- `type`
- `description`
- `image`

The data is loaded from a **JSON** file included in the application's bundle.

---

# 🏗 Architecture

The application follows the **MVVM (Model–View–ViewModel)** pattern.

### Model
- `Trip.swift`

### ViewModel
- `TripViewModel.swift`

Main methods:
- `loadTripsFromJSON()`
- `addTrip()`
- `updateTrip()`
- `deleteTrip()`
- `deleteAllTrips()`

### Views
- `TripListView.swift`
- `TripRowView.swift`
- `AddTripView.swift`
- `EditTripView.swift`
- `AboutView.swift`

---

# 🛠 Technologies Used

- Swift
- SwiftUI
- JSON
- Xcode
- SF Symbols

---

# 👩‍💻 Author

**Catarina Rato**

Project developed for academic purposes.
