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
