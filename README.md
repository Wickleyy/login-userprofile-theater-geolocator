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
    * [cite_start]Daftar bioskop (seperti XI CINEMA, CGV, dll.) [cite: 9, 12, 13, 31, 32, 33] ditampilkan menggunakan `ListView.builder`.
    * Setiap item bioskop dibungkus dengan widget `Card` untuk memberikan efek *shadow* (terangkat) dan `ExpansionTile` untuk UI *dropdown*.
