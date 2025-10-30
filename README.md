# login_theater (Tugas 2)

* **Nama:** Thariq Fadhlurrahman
* **NIM:** 202310370311290
* **Kelas:** Pemrograman Mobile D

## Penjelasan Singkat

Aplikasi ini terdiri dari tiga halaman utama sesuai desain yang diberikan:

1.  **Halaman Login:** Halaman untuk pengguna masuk.
2.  **Halaman Sign-up:** Halaman untuk pengguna baru mendaftar.
3.  **Halaman Theater:** Halaman untuk menampilkan daftar bioskop yang ada di lokasi pengguna.

Fokus utama dari tugas ini adalah membangun UI secara manual agar identik dengan desain dan mengimplementasikan fungsionalitas deteksi lokasi.

## Cara Kerja

Aplikasi ini dibangun menggunakan arsitektur GetX (GetX Pages, GetX Controller, GetX Bindings).

* **Routing:** Navigasi diatur dalam file `app_pages.dart` dan `app_routes.dart`.
* **State Management:** State untuk halaman Theater dikelola oleh `ProfileController`.
* **Deteksi Lokasi:**
    1.  Saat pengguna membuka halaman Theater (`ProfileView`), `ProfileBinding` akan menginisialisasi `ProfileController`.
    2.  `ProfileController` secara otomatis memanggil fungsi `_determinePosition()` pada saat `onInit()`.
    3.  Fungsi ini menggunakan *package* **`geolocator`** untuk meminta izin dan mendapatkan koordinat (Latitude & Longitude) perangkat.
    4.  Setelah koordinat didapat, *package* **`geocoding`** digunakan untuk mengubah koordinat tersebut menjadi alamat yang dapat dibaca manusia.
    5.  Nama kota diekstrak dari alamat dan disimpan dalam variabel reaktif `locationName`.
    6.  `Obx` (Observer) pada `ProfileView` secara otomatis memperbarui UI untuk menampilkan nama kota tersebut.
* **UI Halaman Theater:**
    * Daftar bioskop (seperti XI CINEMA, CGV, dll.) ditampilkan menggunakan `ListView.builder`.
    * Setiap item bioskop dibungkus dengan widget `Card` untuk memberikan efek *shadow* (terangkat) dan `ExpansionTile` untuk UI *dropdown*.
 
## Cara Menggunakan

Berikut adalah langkah-langkah untuk menjalankan dan menguji aplikasi ini.

### 1. Persiapan

Sudah menginstal **Flutter SDK**.

### 2. Instalasi

1.  Kloning *repository* ini.
2.  Buka terminal di direktori *root project*.
3.  Jalankan perintah berikut untuk mengunduh semua *package* yang dibutuhkan:

    ```bash
    flutter pub get
    ```

### 3. Konfigurasi Wajib (Geolocator)

Untuk menggunakan `geolocator`, pastikan izin lokasi telah ditambahkan:

* **Untuk Android** (`android/app/src/main/AndroidManifest.xml`):
    Tambahkan izin ini di dalam tag `<manifest>`:
    ```xml
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    ```

* **Untuk iOS** (`ios/Runner/Info.plist`):
    Tambahkan *key* berikut:
    ```xml
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>Aplikasi ini membutuhkan akses lokasi untuk menampilkan bioskop di kota Anda.</string>
    ```

### 4. Menjalankan Aplikasi

1.  Hubungkan perangkat.
2.  Jalankan aplikasi dengan perintah:
    ```bash
    flutter run
    ```
3.  Aplikasi akan dimulai pada halaman **Login** dan di paling bawah ada tulisan warna biru register here yang akan mengarah ke halaman **Signup**.
<img width="442" height="1020" alt="Screenshot 2025-10-29 222419" src="https://github.com/user-attachments/assets/259c7224-ca86-4d3d-ba0d-3e183e609ca4" />
<img width="445" height="1019" alt="Screenshot 2025-10-29 222439" src="https://github.com/user-attachments/assets/b0ae43a4-3860-41b8-a60b-92a4be079b9a" />
4.  Setelah *login*, aplikasi akan mengarah ke halaman **Theater**.
<img width="446" height="1015" alt="Screenshot 2025-10-29 222516" src="https://github.com/user-attachments/assets/84f79a62-c378-426c-b801-0d3e4da06411" />
6.  Saat halaman **Theater** pertama kali dibuka, aplikasi akan **meminta izin lokasi**.
7.  **Setujui (Allow)** permintaan izin tersebut.
8.  Teks "Loading..." akan berubah menjadi nama kota saat ini.
<img width="443" height="1014" alt="Screenshot 2025-10-29 222503" src="https://github.com/user-attachments/assets/22e0dd2e-e02f-4050-b797-5dc39d83f262" />
