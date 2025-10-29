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

---

## Tugas Individu 7 - Elemen Dasar Flutter

### Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Dalam Flutter, seluruh tampilan aplikasi dibangun menggunakan struktur yang disebut widget tree. 
- Widget tree adalah susunan hierarki dari widget, di mana setiap elemen di layar merupakan bagian dari sebuah pohon widget. 

Pada dasarnya, setiap widget bisa memiliki child (anak) atau children (beberapa anak) yang akan menjadi bagian visual atau fungsional di dalamnya. Hubungan parent–child berarti widget induk bertanggung jawab atas tata letak dan perilaku widget anak di dalamnya. Misalnya, Column sebagai parent dapat memiliki beberapa Text atau Container sebagai children, dan parent inilah yang menentukan bagaimana posisi dan ukuran setiap child diatur di layar.

### Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Widget yang digunakan pada proyek ini antara lain:
- MaterialApp → Sebagai root aplikasi, menyediakan tema dan konfigurasi navigasi.
- Scaffold → Menyediakan struktur dasar halaman seperti AppBar, body, dan latar belakang.
- AppBar → Menampilkan judul aplikasi “Tendhang” di bagian atas layar.
- Column & Row → Mengatur tata letak widget secara vertikal dan horizontal.
- Card (pada InfoCard) → Menampilkan data pribadi seperti NPM, Nama, dan Kelas dengan tampilan kotak rapi.
- GridView.count → Menampilkan item dalam bentuk grid 3 kolom.
- Container → Mengatur padding dan ukuran elemen.
- Text dan Icon → Menampilkan teks dan ikon untuk setiap item.
- Material & InkWell → Memberikan efek klik dan interaksi dengan pengguna.
- SnackBar → Menampilkan pesan sementara ketika item ditekan.

Semua widget ini bekerja sama untuk membangun antarmuka aplikasi dengan gaya Material Design

### Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp merupakan widget utama yang biasanya diletakkan di bagian root aplikasi Flutter berbasis Material Design. Fungsinya adalah menyediakan konfigurasi dasar aplikasi seperti tema (theme), navigasi (routes), judul (title), dan pengaturan tampilan lainnya. MaterialApp juga secara otomatis mengintegrasikan berbagai elemen Material Design seperti warna, ikon, dan animasi standar. Karena fungsinya yang menyeluruh dan menjadi fondasi dari gaya visual aplikasi, widget ini hampir selalu digunakan sebagai widget root di aplikasi Flutter.

### Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

- `StatelessWidget` adalah widget yang tidak memiliki state atau kondisi yang dapat berubah selama aplikasi berjalan. Contohnya adalah widget yang hanya menampilkan teks statis. 
- `StatefulWidget` memiliki state yang dapat berubah seiring waktu dan menyebabkan tampilan diperbarui (rebuild). Misalnya, tombol yang mengubah warna ketika ditekan membutuhkan StatefulWidget, seperti awal create project flutter. 

Pemilihan di antara keduanya tergantung pada apakah widget memerlukan perubahan tampilan dinamis. Jika iya, gunakan StatefulWidget; jika tidak, StatelessWidget sudah cukup. Pada proyek ini sejauh ini cuma StatelessWidget

### Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

`BuildContext` adalah objek penting yang merepresentasikan lokasi sebuah widget dalam widget tree. Ia digunakan oleh Flutter untuk mengetahui posisi widget dan memungkinkan widget berinteraksi dengan elemen lain di atasnya dalam hierarki, seperti mengakses tema atau melakukan navigasi. Dalam metode `build(BuildContext context)`, parameter context digunakan untuk mendapatkan informasi tentang lingkungan widget tersebut, seperti memanggil `Theme.of(context)` untuk mengambil data tema atau `Navigator.of(context)` untuk berpindah halaman. Tanpa `BuildContext`, Flutter tidak bisa memahami hubungan antar-widget di pohon widget.

### Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

- Hot reload adalah fitur di Flutter yang memungkinkan pengembang memperbarui kode dan melihat hasil perubahan secara instan tanpa kehilangan state aplikasi. Misalnya, jika kamu sedang berada di halaman kedua aplikasi dan mengubah tampilan teks, hasilnya akan langsung muncul tanpa kembali ke halaman awal. 
- Hot restart akan me-restart seluruh aplikasi dari awal, termasuk menghapus semua state yang tersimpan. 

Misalnya, jika sedang berada di halaman tertentu dan melakukan hot reload, posisi layar tetap sama. Namun dengan hot restart, aplikasi akan kembali ke halaman MyHomePage() awal.

### Jelaskan bagaimana kamu menambahkan navigasi untuk berpindah antar layar di aplikasi Flutter.

Navigasi antar layar di Flutter dilakukan menggunakan Navigator. Untuk berpindah ke layar lain, digunakan perintah `Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanTujuan()))`, yang akan menambahkan layar baru ke atas tumpukan (stack) navigasi. Untuk kembali ke layar sebelumnya, digunakan `Navigator.pop(context)`. Selain itu, Flutter juga mendukung sistem named routes, di mana setiap halaman diberi nama unik dan navigasi dilakukan dengan `Navigator.pushNamed(context, '/halaman')`. Sistem ini membuat pengelolaan rute lebih rapi dan mudah saat aplikasi semakin kompleks.

Untuk saat ini, kode kamu belum memiliki navigasi antar halaman karena semua fungsi tombol masih menampilkan SnackBar.
