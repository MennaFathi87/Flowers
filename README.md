
# 🌸 Flowor

**Flowor** is a Flutter app for displaying and selling flower bouquets and plants.
Users can browse **Best Sellers** and **Popular** products, view **product details**, and manage their **cart** and **favorites**.

**🎨 Design Reference:** [Figma Design](https://www.figma.com/design/6gDM4CrZaaGoULShewRZon/Flowora?node-id=81-477&t=N7lMo8ShF5lrJ0AA-0)

---

## ✨ Features

* 🌷 **Product Listing**

  * Best Seller & Popular products
  * Horizontal & Grid scrolling

* 📄 **Product Details Page**

  * Product image, title, description, price
  * Quantity selector (increase/decrease)
  * Add to Cart 🛒 & Add to Favorites 💖

* 🔐 **Firebase Integration**

  * Authentication: Secure user login
  * Cloud Firestore: Store user data, cart, and favorites

* 📱 **User Experience**

  * SnackBar notifications for actions
  * Clean UI using Flutter Widgets: `Stack`, `GridView`, `ListView`, `Wrap`

---

## 🛠 Technologies Used

* **Flutter & Dart**
* **Firebase Authentication**
* **Cloud Firestore**
* **Flutter Widgets**: `Stack`, `GridView`, `ListView`, `Wrap`


## 🚀 How to Run

1. Install **Flutter** and **Dart**.
2. Open the project in **VS Code** or **Android Studio**.
3. Add your Firebase config files:

   * Android: `google-services.json`
   * iOS: `GoogleService-Info.plist`
4. Install dependencies:

```bash
flutter pub get
```

5. Run the app:

```bash
flutter run
```

---

## 📝 Notes

* Images are stored in `assets/photo/` and must be declared in `pubspec.yaml`.
* Firebase Authentication ensures secure user login.
* Firestore stores each user’s **cart** and **favorites** separately.
* Refer to the **Figma Design link** for UI reference.؟
