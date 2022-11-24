# Tugas 7 PBP - Semester Ganjil 2022/2023

#### Flutter app name: counter_7

#### Jawaban Pertanyaan

1. Jelaskan apa yang dimaksud dengan *stateless widget* dan *stateful widget* dan jelaskan perbedaan dari keduanya.<br/>
   Jawab:<br/>
   *State* sebuah *widget* adalah informasi objek-objek yang dimiliki propertinya (parameter) saat tahap pembuatan/*build*. *Stateless widget* adalah *widget* yang tidak dapat berubah sedangkan *stateful widget* adalah *widget* yang dinamis atau dapat berubah *state*-nya.
   *Stateless widget* tidak memiliki *state* dan tidak bergantung pada perubahan data atau perilaku apapun. *Stateless widget* hanya memiliki properti final yang didefinisikan saat konstruksi. *Stateful widget* memiliki *internal state* dan dapat me-*render* ulang apabila terjadi perubahan. `Icon`, `IconButton`, dan `Text` adalah contoh *stateless widget* sedangkan `Checkbox`, `Radio`, `Slider`, `InkWell`, `Form`, dan `TextField` adalah contoh *stateful widgets*.

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.<br/>
   Jawab:<br/>
   - `MaterialApp`: membungkus *widgets* yang umumnya dibutuhkan untuk aplikasi-aplikasi yang mengimplementasikan Material Design.
   - `AppBar`: *app bar* Material Design, tersusun atas *toolbar* dan kemungkinan *widgets* lain seperti `TabBar` dan `FlexibleSpaceBar`.
   - `Theme`, `ThemeData`, dan fungsi `Theme.of`: `ThemeData` menentukan konfigurasi dari keseluruhan visual `Theme` untuk `MaterialApp` atau *widget subtree* di dalam aplikasi. `Theme.of` akan mencari *value* `ThemeData` yang dispesifikasi untuk `BuildContext` *ancestor* terdekat.
   - `Scaffold`: mengimplementasikan struktur *visual layout* dasar. Menyediakan APIs untuk menampilkan *drawers*, *snack bars*, dan *bottom sheets*.
   - `Center`: meletakkan *child* di tengah dirinya (*centers its child within itself*).
   - `Column`: menyusun *child widgets* secara vertikal.
   - `Row`: menyusun *child widgets* secara horizontal.
   - `Padding`: menyisipkan *child*-nya dengan *padding* yang ditentukan.
   - `Text`: serangkaian teks dengan *style* yang sama.
   - `FloatingActionButton`: Tombol ikon lingkaran/melingkar yang mengambang diatas konten untuk menekankan perintah utama (*primary action*), paling umum digunakan dalam `Scaffold`.

3. Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.<br/>
   Jawab:<br/>
   Fungsi `setState()` dipanggil saat kita melakukan perubahan pada *internal state* (seperti perubahan variabel), `setState()` memberi tahu Flutter *framework* bahwa telah terjadi perubahan pada *internal state* objek ini, yang kemudian membuat *build method* dijalankan kembali secara sinkronus agar tampilan merefleksikan perubahan tersebut.

4. Jelaskan perbedaan antara `const` dengan `final`.<br/>
   Jawab:<br/>
   `const` dan `final` sama-sama membuat suatu variabel nilainya konstan atau tidak dapat diubah dengan operasi apapun, perbedaan keduanya adalah `const` hanya membuat variabel tersebut konstan dari/sejak *compile-time*. `const` artinya seluruh *deep state* objek ditentukan saat *compile-time* dan kemudian dibekukan, tidak dapat diubah.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.<br/>
   Jawab:<br/>
   Dari *template* yang terbentuk saat menjalankan `flutter create`, ada beberapa modifikasi yang harus dilakukan. Pertama, menambahkan fungsi untuk mengurangi (*decrement*) counter jika `_counter` tidak sama dengan nol. Kemudian menambahkan tombol (`floatingActionButton`) yang terhubung dengan fungsi *decrement* tersebut seperti tombol *increment*. Kedua `floatingActionButton` diletakkan dalam *layout* `Row` dengan `crossAxisAlignment.end`, `MainAxisAlignment.spaceBetween`, dan `TextDirection.rtl`  yang menyusun elemen-elemen secara horizontal dari kanan ke kiri pada bagian bawah layar dengan jarak antar *children*, tombol *decrement* hanya dibuat jika `_counter` tidak sama dengan nol. Terakhir, untuk menyesuaikan posisi tombol yang *overflow* dan tidak rapi, `Row` dibungkus dengan `Padding`.

<br/>

# Tugas 8 PBP - Semester Ganjil 2022/2023

#### Jawaban Pertanyaan

1. Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`.<br/
   Jawab:<br/>
   `Navigator.push` menambahkan *screen* baru di bagian paling atas *navigation stack* sedangkan `Navigator.pushReplacement` mengganti *screen* paling atas *navigation stack*.
   
2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.<br/>
   Jawab:<br/>
   Sama seperti pada Tugas 7:
   - `MaterialApp`: membungkus *widgets* yang umumnya dibutuhkan untuk aplikasi-aplikasi yang mengimplementasikan Material Design.
   - `AppBar`: *app bar* Material Design, tersusun atas *toolbar* dan kemungkinan *widgets* lain seperti `TabBar` dan `FlexibleSpaceBar`.
   - `Theme`, `ThemeData`, dan fungsi `Theme.of`: `ThemeData` menentukan konfigurasi dari keseluruhan visual `Theme` untuk `MaterialApp` atau *widget subtree* di dalam aplikasi. `Theme.of` akan mencari *value* `ThemeData` yang dispesifikasi untuk `BuildContext` *ancestor* terdekat.
   - `Scaffold`: mengimplementasikan struktur *visual layout* dasar. Menyediakan APIs untuk menampilkan *drawers*, *snack bars*, dan *bottom sheets*.
   - `Center`: meletakkan *child* di tengah dirinya (*centers its child within itself*).
   - `Column`: menyusun *child widgets* secara vertikal.
   - `Row`: menyusun *child widgets* secara horizontal.
   - `Padding`: menyisipkan *child*-nya dengan *padding* yang ditentukan.
   - `Text`: serangkaian teks dengan *style* yang sama.
   - `FloatingActionButton`: Tombol ikon lingkaran/melingkar yang mengambang diatas konten untuk menekankan perintah utama (*primary action*), paling umum digunakan dalam `Scaffold`.
   
   dengan tambahan:
   - `Drawer`: panel Material Design yang *slides* secara horizontal dari tepi `Scaffold` untuk menampilkan tautan navigasi dalam aplikasi atau disebut juga *burger menu*.
   - `ListTile`: *single fixed-height row* yang biasanya berisi beberapa teks serta ikon di depan atau di belakang.
   - `SingleChildScrollView`: sebuah kotak dimana suatu *widget* dapat *scroll*.
   - `DropdownButton`: menampilkan item yang dipilih saat ini dan panah yang membuka menu untuk memilih item lain.
   - `TextButton`: tombol datar sederhana tanpa *border*.
   - `Dialog`: menampilkan dialog.
   - `TextFormField`: `TextField` di dalam `FormField`.
   - `ListView`: scrollable, linear list of widgets.
   - `FutureBuilder`: *widget that builds itself based on the latest snapshot of interaction with a Future*.
   - `CircularProgressIndicator`: *loading indicator*.
 
3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: `onPressed`).<br/>
   Jawab:<br/>
   `onPressed`, `onTap`, `onChanged`, `onSaved`.
   
4. Jelaskan bagaimana cara kerja `Navigator` dalam "mengganti" halaman dari aplikasi Flutter.<br/>
   Jawab:<br/>
   Menggunakan *navigation stack* yaitu *stack* halaman-halaman yang dibuka, dapat dilakukan berbagai operasi seperti `Navigator.pop`, `Navigator.push` dan `Navigator.pushReplacement`.
   
5. Jelaskan bagaimana cara kamu mengimplementasikan *checklist* di atas.<br/>
   Jawab:<br/>
   Memodifikasi dengan mengimplementasikan tutorial 7 untuk menambahkan form dan mengimplementasikan tutorial 8 yang dimodifikasi tanpa menggunakan JSON untuk menampilkan data.

# Tugas 9 PBP - Semester Ganjil 2022/2023

#### Jawaban Pertanyaan

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?<br/>
Jawab:<br/>
Ya. Bekerja dengan data JSON dapat dilakukan secara *manual serialization* (untuk proyek kecil) dan *automated serialization using code generation* (untuk proyek sedang sampai besar), *manual serialization* dapat dilakukan secara *inline* maupun menggunakan *model class*. Sayangnya, *inline serialization* menggunakan `jsonDecode()` yang mengembalikan `Map<String, dynamic`, sehingga tipe *values* tidak akan diketahui sampai *runtime*. Hal ini membuat kode lebih *error-prone* karena sebagian besar *statically typed language features* akan hilang. Oleh karena itu, penggunaan *model class* lebih dianjurkan untuk *manual serialization*.

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.<br/>
Jawab:<br/>
Sama seperti pada Tugas 8:
   - `MaterialApp`: membungkus *widgets* yang umumnya dibutuhkan untuk aplikasi-aplikasi yang mengimplementasikan Material Design.
   - `AppBar`: *app bar* Material Design, tersusun atas *toolbar* dan kemungkinan *widgets* lain seperti `TabBar` dan `FlexibleSpaceBar`.
   - `Theme`, `ThemeData`, dan fungsi `Theme.of`: `ThemeData` menentukan konfigurasi dari keseluruhan visual `Theme` untuk `MaterialApp` atau *widget subtree* di dalam aplikasi. `Theme.of` akan mencari *value* `ThemeData` yang dispesifikasi untuk `BuildContext` *ancestor* terdekat.
   - `Scaffold`: mengimplementasikan struktur *visual layout* dasar. Menyediakan APIs untuk menampilkan *drawers*, *snack bars*, dan *bottom sheets*.
   - `Center`: meletakkan *child* di tengah dirinya (*centers its child within itself*).
   - `Column`: menyusun *child widgets* secara vertikal.
   - `Row`: menyusun *child widgets* secara horizontal.
   - `Padding`: menyisipkan *child*-nya dengan *padding* yang ditentukan.
   - `Text`: serangkaian teks dengan *style* yang sama.
   - `FloatingActionButton`: Tombol ikon lingkaran/melingkar yang mengambang diatas konten untuk menekankan perintah utama (*primary action*), paling umum digunakan dalam `Scaffold`.
   - `Drawer`: panel Material Design yang *slides* secara horizontal dari tepi `Scaffold` untuk menampilkan tautan navigasi dalam aplikasi atau disebut juga *burger menu*.
   - `ListTile`: *single fixed-height row* yang biasanya berisi beberapa teks serta ikon di depan atau di belakang.
   - `SingleChildScrollView`: sebuah kotak dimana suatu *widget* dapat *scroll*.
   - `DropdownButton`: menampilkan item yang dipilih saat ini dan panah yang membuka menu untuk memilih item lain.
   - `TextButton`: tombol datar sederhana tanpa *border*.
   - `Dialog`: menampilkan dialog.
   - `TextFormField`: `TextField` di dalam `FormField`.
   - `ListView`: scrollable, linear list of widgets.
   - `FutureBuilder`: *widget that builds itself based on the latest snapshot of interaction with a Future*.
   - `CircularProgressIndicator`: *loading indicator*.
   
   dengan tambahan:
   - `Card`: a Material Design card that has slightly rounded corners and a shadow.
   - `RichText`: menampilkan text dengan beberapa *style* berbeda.
   - `ElevatedButton`: a Material Design elevated button, a filled button whose material elevates when pressed.

3. Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.<br/>
Jawab:<br/>
Bekerja dengan data JSON dapat dilakukan secara *manual serialization* (untuk proyek kecil) dan *automated serialization using code generation* (untuk proyek sedang sampai besar). Untuk *manual serialization*, Flutter memiliki *built-in library* `dart:convert` yang memiliki JSON *encoder* dan *decoder*. Dengan *library* ini JSON *serialization* dapat dilakukan dengan dua cara, yaitu secara *inline* dan menggunakan *model class*. *Inline serialization* menggunakan `jsonDecode()` yang mengembalikan `Map<String, dynamic`, sehingga tipe *values* tidak akan diketahui sampai *runtime*. Sayangnya, hal ini membuat kode lebih *error-prone* karena sebagian besar *statically typed language features* akan hilang. Permasalahan ini dapat diatasi dengan menggunakan *model class* yang memiliki *constructor* `<Nama_Model>.fromJson() yang akan membuat *instance* model dari struktur map dan *method* `toJson()` yang melakukan hal sebaliknya. Untuk menggunakan data JSON pada Flutter, kita menggunakan *method* asinkronus yang akan melakukan *fetch* URL JSON yang ingin digunakan dengan dependensi http Dart. Kemudian, untuk mengaksesnya kita gunakan *serialization methods* yang sebelumnya dijelaskan.

4. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
Jawab:
Dibuat dua halaman baru, tempat list semua *watchlist* dan halaman detail setiap judul. Halaman list semua judul pada dasarnya meggunakan cara yang sama dengan halaman *budget data* pada tugas 8, namun kali ini datanya bukan dari list tetapi dari sumber URL JSON. Data JSON tersebut diakses dengan cara yang dijelaskan pada bagian nomer 3, dengan *approach manual serialization* dengan *model class* yang juga dibuat di file terpisah dengan menggunakan Quicktype. Cara menampilkannya juga sama-sama menggunakan `ListView.builder` seperti sebelumnya, tetapi kali ini dengan menggunakan *widget card* yang ketika di-klik akan menggunakan `Navigator.push` untuk menampikan halaman detail. Halamn detail menerima parameter `Fields` dari index *watchlist* yang dipilih. Selain itu, ditambahkan `ElevatedButton` untuk keluar dari halaman detail dengan menggunakan `Navigator.pop`.
