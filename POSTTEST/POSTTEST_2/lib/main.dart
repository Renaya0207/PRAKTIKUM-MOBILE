import 'package:flutter/material.dart';

void main() {
  runApp(const MovieBoxApp());
}

// ============================================================
// WIDGET UTAMA APLIKASI
// ============================================================

class MovieBoxApp extends StatelessWidget {
  const MovieBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp digunakan sebagai wrapper utama aplikasi
    return MaterialApp(
      // Mengatur judul aplikasi
      title: 'MovieBox',

      // Mengatur tema visual aplikasi
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),

      // Menghilangkan banner DEBUG
      debugShowCheckedModeBanner: false,

      // Menampilkan halaman Home sebagai halaman pertama
      home: const HomePage(),
    );
  }
}


// ============================================================
// HALAMAN HOME
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman
    return Scaffold(
      // Mengatur warna background halaman
      backgroundColor: const Color(0xFF121212),

      // SafeArea menjaga konten dari area notch/status bar
      body: SafeArea(
        // SingleChildScrollView membuat halaman dapat di-scroll
        child: SingleChildScrollView(
          // Padding memberikan jarak dari tepi layar
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),

            // Column menyusun seluruh konten secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ==================================================
                // HEADER
                // ==================================================

                // Row menyusun bagian header secara horizontal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Column menyusun teks secara vertikal
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // Text menampilkan sapaan pengguna
                        const Text(
                          'Hello, Movie Lover! 👋',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),

                        // SizedBox memberikan jarak
                        const SizedBox(height: 6),

                        // Text menampilkan nama aplikasi
                        const Text(
                          'MovieBox',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),

                    // Container digunakan untuk membuat kotak ikon profil
                    Container(
                      padding: const EdgeInsets.all(10),

                      // BoxDecoration mengatur tampilan container
                      decoration: BoxDecoration(
                        color: const Color(0xFF292929),
                        borderRadius: BorderRadius.circular(14),
                      ),

                      // Icon menampilkan ikon profil
                      child: const Icon(
                        Icons.person,
                        color: Colors.orange,
                        size: 25,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak setelah header
                const SizedBox(height: 25),


                // ==================================================
                // SEARCH
                // ==================================================

                // Text menampilkan judul pencarian
                const Text(
                  'Find Your Favorite Movie',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 14),

                // Container membungkus TextField
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF292929),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  // Padding memberikan ruang di dalam search
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),

                    // TextField digunakan untuk input pencarian
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),

                      // InputDecoration mengatur tampilan TextField
                      decoration: InputDecoration(
                        hintText: 'Search movie...',

                        // Mengatur warna teks hint
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),

                        // Icon digunakan sebagai ikon pencarian
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.orange,
                        ),

                        // Menghilangkan border TextField
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 28),


                // ==================================================
                // RECOMMENDED MOVIES
                // ==================================================

                // Row menyusun judul dan See All
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Text menampilkan judul section
                    const Text(
                      'Recommended For You',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Text menampilkan See All
                    const Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 16),

                // Row menyusun dua kartu film secara horizontal
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Expanded membagi ruang untuk kartu pertama
                    Expanded(
                      child: movieCard(
                        title: 'Avengers',
                        genre: 'Action • Sci-Fi',
                        rating: '8.0',
                        imagePath: 'assets/avengers.jpg',
                      ),
                    ),

                    // SizedBox memberikan jarak antar kartu
                    const SizedBox(width: 14),

                    // Expanded membagi ruang untuk kartu kedua
                    Expanded(
                      child: movieCard(
                        title: 'Interstellar',
                        genre: 'Sci-Fi • Drama',
                        rating: '8.7',
                        imagePath: 'assets/interstellar.jpg',
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 30),


                // ==================================================
                // TRENDING MOVIES
                // ==================================================

                // Text menampilkan judul trending
                const Text(
                  'Trending Movies',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 16),

                // Container digunakan sebagai kartu trending
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),

                  // BoxDecoration memberikan warna, radius,
                  // dan BoxShadow pada kartu
                  decoration: BoxDecoration(
                    color: const Color(0xFF292929),
                    borderRadius: BorderRadius.circular(18),

                    // BoxShadow digunakan untuk memberikan
                    // efek bayangan pada kartu
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),

                  // Row menyusun poster dan informasi film
                  child: Row(
                    children: [

                      // Stack digunakan untuk menumpuk gambar
                      // dengan label rating
                      SizedBox(
                        width: 75,
                        height: 95,

                        child: Stack(
                          children: [

                            // Image.asset menampilkan poster dari folder assets
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),

                              // Image.asset digunakan untuk mengambil
                              // gambar dari folder assets
                              child: Image.asset(
                                'assets/guardians.jpg',
                                width: 75,
                                height: 95,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Positioned digunakan untuk menempatkan
                            // label rating di bagian bawah poster
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,

                              // Container menjadi background label rating
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),

                                color: Colors.black.withValues(alpha: 0.7),

                                // Text menampilkan rating
                                child: const Text(
                                  '8.0 ⭐',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // SizedBox memberikan jarak
                      const SizedBox(width: 15),

                      // Expanded mengisi sisa ruang
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            // Text menampilkan judul film
                            const Text(
                              'Guardians of the Galaxy',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // SizedBox memberikan jarak
                            const SizedBox(height: 8),

                            // Text menampilkan genre
                            const Text(
                              'Action • Adventure',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),

                            // SizedBox memberikan jarak
                            const SizedBox(height: 8),

                            // Row menyusun rating
                            const Row(
                              children: [

                                // Icon menampilkan bintang
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 17,
                                ),

                                // SizedBox memberikan jarak
                                SizedBox(width: 5),

                                // Text menampilkan nilai rating
                                Text(
                                  '8.0 / 10',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Icon panah menunjukkan detail
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.orange,
                        size: 18,
                      ),
                    ],
                  ),
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 30),


                // ==================================================
                // NAVIGATION MENU
                // ==================================================

                // Container digunakan sebagai menu navigasi bawah
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),

                  // BoxDecoration memberikan tampilan menu
                  decoration: BoxDecoration(
                    color: const Color(0xFF292929),
                    borderRadius: BorderRadius.circular(18),

                    // BoxShadow memberikan efek bayangan
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),

                  // Row menyusun menu navigasi secara horizontal
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      // Menu Home
                      GestureDetector(
                        // GestureDetector digunakan agar menu dapat ditekan
                        onTap: () {},

                        // Column menyusun icon dan teks
                        child: const Column(
                          children: [

                            // Icon Home
                            Icon(
                              Icons.home,
                              color: Colors.orange,
                              size: 24,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(height: 5),

                            // Text label Home
                            Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),


                      // ==================================================
                      // EXPLORE
                      // ==================================================

                      GestureDetector(
                        // GestureDetector membuat menu Explore dapat ditekan
                        onTap: () {

                          // Navigator.push digunakan untuk membuka
                          // halaman Explore
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ExplorePage(),
                            ),
                          );
                        },

                        // Column menyusun icon dan teks Explore
                        child: const Column(
                          children: [

                            // Icon Explore
                            Icon(
                              Icons.explore,
                              color: Colors.grey,
                              size: 24,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(height: 5),

                            // Text label Explore
                            Text(
                              'Explore',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),


                      // ==================================================
                      // FAVORITE
                      // ==================================================

                      GestureDetector(
                        // GestureDetector membuat menu Favorite dapat ditekan
                        onTap: () {

                          // Navigator.push membuka halaman Favorite
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const FavoritePage(),
                            ),
                          );
                        },

                        // Column menyusun icon dan teks Favorite
                        child: const Column(
                          children: [

                            // Icon Favorite
                            Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                              size: 24,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(height: 5),

                            // Text label Favorite
                            Text(
                              'Favorite',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),


                      // ==================================================
                      // PROFILE
                      // ==================================================

                      GestureDetector(
                        // GestureDetector membuat menu Profile dapat ditekan
                        onTap: () {

                          // Navigator.push membuka halaman Profile
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ProfilePage(),
                            ),
                          );
                        },

                        // Column menyusun icon dan teks Profile
                        child: const Column(
                          children: [

                            // Icon Profile
                            Icon(
                              Icons.person_outline,
                              color: Colors.grey,
                              size: 24,
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(height: 5),

                            // Text label Profile
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  // ============================================================
  // FUNCTION MOVIE CARD
  // ============================================================

  // Function digunakan untuk membuat kartu film
  Widget movieCard({
    required String title,
    required String genre,
    required String rating,
    required String imagePath,
  }) {

    // Container digunakan sebagai pembungkus kartu
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(18),

        // BoxShadow memberikan efek bayangan pada kartu
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      // Padding memberikan jarak isi kartu
      child: Padding(
        padding: const EdgeInsets.all(10),

        // Column menyusun poster dan informasi secara vertikal
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Stack digunakan untuk menumpuk poster
            // dengan rating di atas gambar
            SizedBox(
              height: 150,
              width: double.infinity,

              child: Stack(
                children: [

                  // Image.asset digunakan untuk menampilkan poster
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    // Image.asset mengambil gambar dari assets
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      height: 150,

                      // BoxFit.cover membuat gambar memenuhi area
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Positioned digunakan untuk menempatkan
                  // rating pada bagian bawah poster
                  Positioned(
                    right: 8,
                    bottom: 8,

                    // Container menjadi background rating
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.75),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      // Row menyusun icon bintang dan rating
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          // Icon bintang
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 14,
                          ),

                          // SizedBox memberikan jarak
                          const SizedBox(width: 3),

                          // Text menampilkan rating
                          Text(
                            rating,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // SizedBox memberikan jarak setelah poster
            const SizedBox(height: 10),

            // Text menampilkan judul film
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

            // SizedBox memberikan jarak
            const SizedBox(height: 6),

            // Text menampilkan genre film
            Text(
              genre,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ============================================================
// HALAMAN EXPLORE
// ============================================================

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Scaffold digunakan sebagai struktur halaman
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      // AppBar digunakan sebagai header halaman
      appBar: AppBar(
        title: const Text('Explore Movies'),
        backgroundColor: const Color(0xFF121212),
        foregroundColor: Colors.orange,
      ),

      // Padding memberikan jarak isi halaman
      body: Padding(
        padding: const EdgeInsets.all(20),

        // Column menyusun konten secara vertikal
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Text menampilkan judul halaman
            const Text(
              'Explore',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),

            // SizedBox memberikan jarak
            const SizedBox(height: 15),

            // Container menjadi kartu informasi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              // BoxDecoration memberikan background dan bayangan
              decoration: BoxDecoration(
                color: const Color(0xFF292929),
                borderRadius: BorderRadius.circular(18),

                // BoxShadow memberikan efek bayangan
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              // Column menyusun isi kartu
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Icon film
                  Icon(
                    Icons.local_movies,
                    color: Colors.orange,
                    size: 45,
                  ),

                  // SizedBox memberikan jarak
                  SizedBox(height: 15),

                  // Text informasi halaman
                  Text(
                    'Find movies that match your mood.',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // SizedBox memberikan jarak
                  SizedBox(height: 8),

                  // Text deskripsi
                  Text(
                    'Explore berbagai film berdasarkan genre '
                    'dan kategori yang kamu sukai.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // ElevatedButton digunakan untuk tombol kembali
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {

                  // Navigator.pop digunakan untuk kembali
                  // ke halaman sebelumnya
                  Navigator.pop(context);
                },

                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ============================================================
// HALAMAN FAVORITE
// ============================================================

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Scaffold digunakan sebagai struktur halaman
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      // AppBar digunakan sebagai header
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        backgroundColor: const Color(0xFF121212),
        foregroundColor: Colors.orange,
      ),

      // Center menempatkan konten di tengah halaman
      body: Center(
        // Column menyusun ikon dan teks secara vertikal
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Icon favorite ditampilkan di halaman
            const Icon(
              Icons.favorite,
              color: Colors.orange,
              size: 70,
            ),

            // SizedBox memberikan jarak
            const SizedBox(height: 20),

            // Text menampilkan informasi
            const Text(
              'Your Favorite Movies',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            // SizedBox memberikan jarak
            const SizedBox(height: 10),

            // Text menampilkan keterangan
            const Text(
              'Belum ada film yang ditambahkan.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            // SizedBox memberikan jarak
            const SizedBox(height: 25),

            // ElevatedButton digunakan untuk kembali
            ElevatedButton(
              onPressed: () {

                // Navigator.pop kembali ke halaman sebelumnya
                Navigator.pop(context);
              },

              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}


// ============================================================
// HALAMAN PROFILE
// ============================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Scaffold digunakan sebagai struktur halaman
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      // AppBar digunakan sebagai header
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF121212),
        foregroundColor: Colors.orange,
      ),

      // Padding memberikan jarak isi halaman
      body: Padding(
        padding: const EdgeInsets.all(20),

        // Column menyusun konten secara vertikal
        child: Column(
          children: [

            // Container digunakan sebagai avatar
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF292929),
                shape: BoxShape.circle,

                // BoxShadow memberikan efek bayangan
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              // Icon digunakan sebagai foto profil sederhana
              child: const Icon(
                Icons.person,
                color: Colors.orange,
                size: 70,
              ),
            ),

            // SizedBox memberikan jarak
            const SizedBox(height: 20),

            // Text menampilkan nama pengguna
            const Text(
              'Movie Lover',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // SizedBox memberikan jarak
            const SizedBox(height: 8),

            // Text menampilkan informasi profil
            const Text(
              'Welcome to MovieBox!',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            // Spacer mendorong tombol ke bagian bawah
            const Spacer(),

            // SizedBox membuat tombol memenuhi lebar
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {

                  // Navigator.pop digunakan untuk kembali
                  // ke halaman sebelumnya
                  Navigator.pop(context);
                },

                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}