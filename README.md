# Tendhang Football Store - Mobile
Where Kickers Find Their Gear

### 📚 Archive Tugas Web
   - [Tugas 2 PBP 2025/2026](https://github.com/raihanheriandry/tendhang/wiki/Tugas-2-PBP)
   - [Tugas 3 PBP 2025/2026](https://github.com/raihanheriandry/tendhang/wiki/Tugas-3-PBP)
   - [Tugas 4 PBP 2025/2026](https://github.com/raihanheriandry/tendhang/wiki/Tugas-4-PBP)
   - [Tugas 5 PBP 2025/2026](https://github.com/raihanheriandry/tendhang/wiki/Tugas-5-PBP)
   - [Tugas 6 PBP 2025/2026](https://github.com/raihanheriandry/tendhang/wiki/Tugas-6-PBP)

### 📚 Archive Tugas Mobile
   - [Tugas 7 PBP 2025/2026](https://github.com/raihanheriandry/tendhang-mobile/wiki/Tugas-Individu-7)
   - [Tugas 8 PBP 2025/2026](https://github.com/raihanheriandry/tendhang-mobile/wiki/Tugas-Individu-8)

---

## Tugas Individu 8 - Flutter Navigation, Layouts, Forms, and Input Elements

### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() digunakan untuk menambahkan halaman baru ke dalam stack navigasi sehingga pengguna masih dapat kembali ke halaman sebelumnya menggunakan tombol back. Sebaliknya, Navigator.pushReplacement() menggantikan halaman yang sedang aktif dengan halaman baru, sehingga pengguna tidak dapat kembali ke halaman sebelumnya. Pada aplikasi Football Shop ini, Navigator.push() cocok digunakan saat pengguna berpindah dari halaman daftar produk ke halaman detail produk karena pengguna mungkin ingin kembali untuk melihat produk lainnya. Sementara itu, Navigator.pushReplacement() lebih tepat digunakan setelah pengguna menyelesaikan suatu aksi yang sifatnya final, misalnya setelah menekan tombol “Simpan” pada form tambah produk atau setelah proses login, karena pengguna tidak perlu kembali ke halaman form atau login tersebut.

### Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Hierarki widget seperti Scaffold, AppBar, dan Drawer digunakan untuk menciptakan struktur halaman yang konsisten di seluruh aplikasi Football Shop. Scaffold berfungsi sebagai kerangka dasar halaman yang menyediakan ruang untuk konten utama dan komponen antarmuka lainnya. AppBar digunakan untuk menampilkan judul halaman atau tombol aksi seperti ikon kembali dan menu, sehingga pengguna mudah mengenali konteks halaman yang sedang dibuka. Drawer digunakan untuk menyediakan menu navigasi samping agar pengguna dapat berpindah antar halaman seperti Dashboard, Produk, dan Pengaturan dengan cara yang mudah dan konsisten. Dengan menggunakan ketiga widget ini secara konsisten, pengalaman navigasi pada aplikasi menjadi lebih terstruktur dan familiar untuk pengguna.

### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Penggunaan widget layout seperti Padding, SingleChildScrollView, dan ListView membantu menyusun tampilan form agar lebih nyaman digunakan dan responsif. Padding memberikan ruang di sekitar elemen sehingga tampilan tidak terlihat terlalu rapat dan lebih mudah dibaca. SingleChildScrollView memungkinkan seluruh konten form di-scroll, sehingga tetap dapat diakses meskipun konten panjang atau layar perangkat kecil. ListView digunakan untuk menampilkan elemen-elemen input secara vertikal dengan pengaturan tata letak otomatis. Contoh penerapannya dalam aplikasi Football Shop adalah halaman tambah produk, di mana setiap field input seperti nama produk, harga, stok, dan deskripsi dibungkus dengan Padding agar memiliki jarak antar elemen, dan keseluruhan form dimasukkan ke dalam SingleChildScrollView untuk mencegah tampilan terpotong ketika keyboard muncul.

### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Warna aplikasi saya set pada main.dart yaitu pada 
`colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFEFCE8),
          secondary: const Color(0xFF0E7490),
        ),` yang mana ini sesuai dengan warna pada versi web nya, diset juga ada 2 warna utama yang digunakan, sehingga warna kedepannya konsisten dengan brand toko