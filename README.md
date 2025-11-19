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
   - [Tugas 9 PBP 2025/2026](https://github.com/raihanheriandry/tendhang-mobile/wiki/Tugas-Individu-9)

---

## Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

### Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Model memastikan keamanan tipe (type-safety) dan maintainability jangka panjang. Model Dart (class) juga diperlukan untuk:
- Validasi tipe data otomatis. Setiap properti memiliki tipe (String, int, bool, dll). Ini mencegah kesalahan saat backend mengirim data tidak sesuai.
- Null-safety. Dart memiliki null-safety. Dengan model, kita bisa menandai mana yang nullable dan mana yang wajib.
- Maintainability. Jika struktur JSON berubah, cukup ubah model dan tidak perlu memperbaiki semua bagian kode yang memakai Map.
- Keterbacaan dan struktur lebih jelas. Model mempermudah memahami bentuk data.

Jika hanya memakai Map<String, dynamic>, akan rentan runtime error akibat salah ketik key atau tipe tidak sesuai, kemudian juga tidak ada perlindungan null-safety → rawan NPE (Null Pointer Error). Kode juga jadi berantakan dan sulit dirawat, apalagi jika JSON kompleks. Hal ini bisa membuat debugging lebih sulit → kesalahan baru muncul saat runtime.

### Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Fungsi package http:
- Untuk melakukan HTTP request standar.
- Digunakan untuk endpoint yang tidak membutuhkan autentikasi berbasis sesi (e.g. fetch data publik).
- Tidak menyimpan cookie atau session.

Fungsi CookieRequest
- Digunakan untuk request yang membutuhkan autentikasi sesi Django.
- Menyimpan cookie (sessionid) secara otomatis.
- Memastikan request selanjutnya tetap membawa session cookie tersebut.

Perbedaannya CookieRequest bisa menyimpan cookie dan autentikasi session Django. CookieRequest adalah jembatan Flutter dengan Django yang memakai session-based auth. Sedangkan http lebih fleksibel dan cocok untuk request publik.

### Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest menyimpan session cookie (sessionid), data status login, dan informasi user yang sedang login. Jika tiap widget membuat instance CookieRequest baru, Session tidak konsisten sehingga user dianggap belum login. Jika Cookie tidak terbagi, maka request berikutnya dianggap belum autentikasi. Sehingga Logout/login tidak tersinkron di seluruh app. Karena itu CookieRequest harus dibuat global melalui Provider dan diakses seluruh widget sebagai shared singleton. Tanpa shared CookieRequest, autentikasi berbasis session tidak akan berjalan.

### Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Agar Flutter dapat berkomunikasi dengan Django, diperlukan beberapa konfigurasi konektivitas khusus. Ketika menjalankan aplikasi Flutter pada Android emulator, alamat localhost tidak lagi merujuk pada komputer host yang menjalankan Django, melainkan merujuk ke emulator itu sendiri. Karena itu, alamat khusus 10.0.2.2 harus ditambahkan ke ALLOWED_HOSTS di Django, karena alamat tersebut merupakan jembatan yang digunakan emulator untuk mengakses server lokal di komputer host. Jika tidak ditambahkan, Django akan menolak seluruh permintaan dari aplikasi karena dianggap berasal dari host yang tidak diizinkan.

Selain itu, komunikasi antara Flutter dan Django termasuk dalam kategori cross-origin request, sehingga Django perlu mengaktifkan CORS (Cross-Origin Resource Sharing). Tanpa konfigurasi CORS, request dari Flutter akan diblokir karena dianggap tidak aman atau berasal dari domain yang berbeda. Di sisi lain, bila aplikasi memakai autentikasi berbasis sesi, konfigurasi cookie juga perlu diatur, terutama nilai SameSite, karena pengaturan yang terlalu ketat dapat mencegah cookie dikirim bersama request dari Flutter. Jika cookie tidak terkirim, Django tidak akan mengenali sesi login pengguna dan autentikasi tidak akan berfungsi dengan baik.

Terakhir, pada sisi Flutter (khususnya Android), aplikasi perlu mendapatkan izin internet melalui AndroidManifest.xml. Tanpa izin ini, Android akan memblokir seluruh koneksi jaringan, sehingga Flutter tidak dapat mengirim request ke Django sama sekali. Jika salah satu konfigurasi ini tidak dilakukan dengan benar—mulai dari ALLOWED_HOSTS, CORS, cookie, hingga izin akses internet—maka aplikasi Flutter dan server Django tidak akan dapat saling berkomunikasi, menyebabkan seluruh fitur seperti login, pengambilan data, dan pengiriman data gagal berfungsi.

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Alur:
- User memasukkan data di Flutter → Data ditampung dalam controller (TextEditingController).
- Flutter mengirim data ke Django menggunakan CookieRequest.post() atau http.post(), data dikirim sebagai JSON atau form data.
- Django menerima request. View memproses input → validasi → simpan ke database (Model Django).
- Django mengirim response kembali, dalam format JSON.
- Flutter menerima JSON, mengubah JSON menjadi model Dart. Data disimpan dalam state (setState/provider/state management).
- UI Flutter merender data dengan ListView, Card, Text, dsb.

Prosesnya: Input → Request → Backend → Response → Model → UI.

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Register
- Flutter kirim data username & password ke Django.
- Django membuat akun baru.
- Response dikirim ke Flutter (berhasil/gagal).
- User dapat melakukan login setelah sukses.

Login
- Flutter mengirim username & password ke endpoint login Django menggunakan CookieRequest.
- Django melakukan validasi kredensial.
- Jika benar, Django membuat session dan mengirim sessionid cookie.
- CookieRequest menyimpan cookie tersebut.
- Request selanjutnya otomatis membawa cookie sehingga django mengenali user
- Endpoint yang membutuhkan login dapat diakses.
- Flutter kemudian menavigasi ke halaman menu utama.

Logout
- Flutter memanggil endpoint logout dengan request.logout().
- Django Menghapus session user.
- Mengembalikan response sukses.
- CookieRequest menghapus cookie dari penyimpanan lokal.
- Flutter mengarahkan user kembali ke halaman login.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! 

#### Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.

mengeset pada django

```
ALLOWED_HOSTS = [..., ..., "10.0.2.2"]

CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```

juga tambahkan `corsheaders` ke settings di django

### 1. Membuat fitur registrasi pada Django dan Flutter

#### a. Menambahkan view registrasi di Django

```python
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']
```

Pada bagian ini, dibuat sebuah view baru yang menerima input lewat metode POST, kemudian membaca data JSON yang dikirimkan dari Flutter untuk melakukan pendaftaran pengguna.

#### b. Membuat halaman Flutter untuk registrasi

Halaman registrasi dibuat menggunakan StatefullWidget seperti pembuatan halaman Flutter pada umumnya.

#### c. Menyediakan form isian

Form terdiri dari *username*, *password*, dan *konfirmasi password* yang nantinya dikirim ke backend.

#### d. Mengimplementasikan tombol submit

```dart
final response = await request.postJson(
  "http://localhost:8000/auth/register/",
  jsonEncode({
    "username": username,
    "password1": password1,
    "password2": password2,
  }),
);
```

Tombol registrasi mengirimkan data ke endpoint register Django menggunakan metode `postJson`.

#### e. Setelah registrasi berhasil, arahkan ke halaman login

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const LoginPage()),
);
```

Jika backend mengembalikan status berhasil, pengguna dipindahkan ke halaman login.

---

### 2. Membuat halaman login untuk proyek Flutter

#### a. Membuat view login di Django

```python
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
```

Django menyediakan endpoint untuk memverifikasi kredensial pengguna.

#### b. Membangun halaman login Flutter

Prosesnya sama seperti membuat halaman biasa dengan StatefullWidget.

#### c. Menyusun form login

Form sederhana terdiri dari input username serta password.

#### d. Proses autentikasi Flutter ke Django

```dart
final response = await request.login(
  "http://localhost:8000/auth/login/",
  {
    'username': username,
    'password': password,
  },
);
```

Flutter mengirimkan kredensial ke endpoint Django melalui fungsi login bawaan dari `pbp_django_auth`.

#### e. Jika login sukses, navigasikan pengguna ke halaman utama

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const MyHomePage()),
);
```

---

### 3. Integrasi login/register/logout Django dengan Flutter

* Django menyediakan endpoint login, logout, dan register.
* Flutter mengakses endpoint tersebut melalui library `CookieRequest`.
* Data yang diterima dari Django diproses dalam format JSON.

---

### 4. Membuat model Dart berdasarkan struktur data Django

#### Langkahnya:

1. Melihat struktur JSON dari endpoint `localhost:8000/json`.
2. Menggunakan Quicktype untuk menghasilkan model Dart otomatis.
3. Menyimpan model tersebut dalam file seperti `product_entry.dart`.

---

### 5. Membuat halaman daftar item menggunakan data JSON Django

#### Langkahnya:

#### a. Buat halaman stateful sebagai wadah

Halaman ini akan menampilkan list item dari server.

#### b. Menyusun fungsi untuk fetch data

```dart
Future<List<ProductEntry>> fetchMood(CookieRequest request) async {
  final response = await request.get('http://localhost:8000/json/');
  var data = response;

  List<ProductEntry> listMood = [];
  for (var d in data) {
    if (d != null) listMood.add(ProductEntry.fromJson(d));
  }

  return listMood;
}
```

#### c. Menggunakan FutureBuilder untuk menampilkan data

FutureBuilder digunakan karena pengambilan data dilakukan secara async.

```dart
body: FutureBuilder(
  future: fetchMood(request),
  builder: (context, snapshot) {
    if (snapshot.data == null) {
      return const Center(child: CircularProgressIndicator());
    }
```

Jika proses pengambilan selesai, daftar item akan ditampilkan sebagai list view.

---

### 6. Membuat halaman detail item

#### a. Buat halaman stateful khusus detail

Halaman menerima parameter seperti id, harga, deskripsi, gambar, jumlah terjual, dll.

```dart
final int price;
final String description;
final String imageUrl;
final int sold;
dll
```

#### b. Menangani klik item pada halaman list

```dart
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailPage(
        price: snapshot.data![index].fields.price,
        description: snapshot.data![index].fields.description,
        sold: snapshot.data![index].fields.sold,
      ),
    ),
  );
}
```

#### c. Menampilkan informasi detail pada UI

```
```

---

#### 7. Menampilkan hanya item milik user yang sedang login

Filter dilakukan dari server:

```python
data = Product.objects.filter(user=request.user)
```

Endpoint JSON hanya memberikan item yang dimiliki oleh user yang sedang login, sehingga halaman Flutter akan otomatis menampilkan data sesuai user tersebut.