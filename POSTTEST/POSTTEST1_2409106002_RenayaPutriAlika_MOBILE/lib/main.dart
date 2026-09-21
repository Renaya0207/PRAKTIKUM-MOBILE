
import 'package:flutter/material.dart';

void main() {
  runApp(const MovieBoxApp());
}

// Widget utama aplikasi MovieBox
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

      // Menonaktifkan banner DEBUG di pojok kanan atas
      debugShowCheckedModeBanner: false,

      // Menampilkan halaman utama MovieBox
      home: const HomePage(),
    );
  }
}

// Halaman utama MovieBox
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman
    return Scaffold(
      // Mengatur warna latar belakang halaman
      backgroundColor: const Color(0xFF121212),

      // SafeArea menjaga konten agar tidak tertutup area perangkat
      body: SafeArea(
        // SingleChildScrollView membuat halaman dapat di-scroll
        child: SingleChildScrollView(
          // Padding memberikan jarak pada isi halaman
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),

            // Column menyusun seluruh konten secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Row menyusun logo dan ikon profil secara horizontal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Column menyusun judul dan subjudul secara vertikal
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

                        // SizedBox memberikan jarak vertikal
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

                    // Container digunakan untuk membungkus ikon profil
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292929),
                        borderRadius: BorderRadius.circular(14),
                      ),

                      // Icon menampilkan ikon profil pengguna
                      child: const Icon(
                        Icons.person,
                        color: Colors.orange,
                        size: 25,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak antara header dan pencarian
                const SizedBox(height: 25),

                // Text menampilkan judul bagian pencarian
                const Text(
                  'Find Your Favorite Movie',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // SizedBox memberikan jarak vertikal
                const SizedBox(height: 14),

                // Container membungkus TextField agar memiliki background
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF292929),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  // Padding memberikan ruang di dalam pencarian
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),

                    // TextField digunakan untuk input pencarian film
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),

                      // InputDecoration mengatur tampilan TextField
                      decoration: InputDecoration(
                        hintText: 'Search movie...',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),

                        // Icon menampilkan ikon pencarian
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.orange,
                        ),

                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                // SizedBox memberikan jarak menuju rekomendasi
                const SizedBox(height: 28),

                // Row menampilkan judul dan label rekomendasi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Text menampilkan judul bagian rekomendasi
                    const Text(
                      'Recommended For You',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Text menampilkan label tambahan
                    const Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak sebelum kartu film
                const SizedBox(height: 16),

                // Row menyusun dua kartu film secara horizontal
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Expanded membagi ruang untuk kartu film pertama
                    Expanded(
                      child: movieCard(
                        title: 'Avengers',
                        genre: 'Action • Sci-Fi',
                        rating: '8.0',
                        icon: Icons.movie,
                        posterColor: const Color(0xFF7B241C),
                      ),
                    ),

                    // SizedBox memberikan jarak horizontal antar kartu
                    const SizedBox(width: 14),

                    // Expanded membagi ruang untuk kartu film kedua
                    Expanded(
                      child: movieCard(
                        title: 'Interstellar',
                        genre: 'Sci-Fi • Drama',
                        rating: '8.7',
                        icon: Icons.public,
                        posterColor: const Color(0xFF154360),
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak menuju bagian trending
                const SizedBox(height: 30),

                // Text menampilkan judul film trending
                const Text(
                  'Trending Movies',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // SizedBox memberikan jarak vertikal
                const SizedBox(height: 16),

                // Container digunakan sebagai kartu trending
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF292929),
                    borderRadius: BorderRadius.circular(18),
                  ),

                  // Row menyusun ikon dan informasi film
                  child: Row(
                    children: [

                      // Container menjadi poster sederhana film
                      Container(
                        width: 75,
                        height: 95,
                        decoration: BoxDecoration(
                          color: const Color(0xFF512E5F),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        // Icon menampilkan ikon film
                        child: const Icon(
                          Icons.local_movies,
                          color: Colors.orange,
                          size: 35,
                        ),
                      ),

                      // SizedBox memberikan jarak antara poster dan informasi
                      const SizedBox(width: 15),

                      // Expanded mengisi sisa ruang informasi film
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

                            // SizedBox memberikan jarak vertikal
                            const SizedBox(height: 8),

                            // Text menampilkan genre film
                            const Text(
                              'Action • Adventure',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),

                            // SizedBox memberikan jarak vertikal
                            const SizedBox(height: 8),

                            // Row menyusun ikon bintang dan rating
                            Row(
                              children: [

                                // Icon menampilkan bintang rating
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 17,
                                ),

                                // SizedBox memberikan jarak horizontal
                                const SizedBox(width: 5),

                                // Text menampilkan nilai rating
                                const Text(
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

                      // Icon menampilkan tombol panah
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.orange,
                        size: 18,
                      ),
                    ],
                  ),
                ),

                // SizedBox memberikan jarak sebelum navigasi
                const SizedBox(height: 30),

                // Container menjadi navigasi bawah aplikasi
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF292929),
                    borderRadius: BorderRadius.circular(18),
                  ),

                  // Row menyusun menu navigasi horizontal
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      // Column menyusun ikon dan teks menu Home
                      Column(
                        children: [

                          // Icon menunjukkan menu Home aktif
                          const Icon(
                            Icons.home,
                            color: Colors.orange,
                            size: 24,
                          ),

                          // SizedBox memberikan jarak vertikal
                          const SizedBox(height: 5),

                          // Text menampilkan label Home
                          const Text(
                            'Home',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      // Column menyusun ikon dan teks menu Explore
                      Column(
                        children: [

                          // Icon menampilkan ikon Explore
                          const Icon(
                            Icons.explore,
                            color: Colors.grey,
                            size: 24,
                          ),

                          // SizedBox memberikan jarak vertikal
                          const SizedBox(height: 5),

                          // Text menampilkan label Explore
                          const Text(
                            'Explore',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      // Column menyusun ikon dan teks menu Favorite
                      Column(
                        children: [

                          // Icon menampilkan ikon Favorite
                          const Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                            size: 24,
                          ),

                          // SizedBox memberikan jarak vertikal
                          const SizedBox(height: 5),

                          // Text menampilkan label Favorite
                          const Text(
                            'Favorite',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      // Column menyusun ikon dan teks menu Profile
                      Column(
                        children: [

                          // Icon menampilkan ikon Profile
                          const Icon(
                            Icons.person_outline,
                            color: Colors.grey,
                            size: 24,
                          ),

                          // SizedBox memberikan jarak vertikal
                          const SizedBox(height: 5),

                          // Text menampilkan label Profile
                          const Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
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

  // Fungsi untuk membuat kartu rekomendasi film
  Widget movieCard({
    required String title,
    required String genre,
    required String rating,
    required IconData icon,
    required Color posterColor,
  }) {
    // Container digunakan sebagai pembungkus kartu film
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(18),
      ),

      // Padding memberikan jarak isi kartu
      child: Padding(
        padding: const EdgeInsets.all(10),

        // Column menyusun poster dan informasi film
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Container digunakan sebagai poster film
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: posterColor,
                borderRadius: BorderRadius.circular(12),
              ),

              // Icon menampilkan ikon film sebagai poster
              child: Icon(
                icon,
                color: Colors.orange,
                size: 50,
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

            // SizedBox memberikan jarak vertikal
            const SizedBox(height: 6),

            // Text menampilkan genre film
            Text(
              genre,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),

            // SizedBox memberikan jarak vertikal
            const SizedBox(height: 8),

            // Row menyusun rating bintang dan nilai
            Row(
              children: [

                // Icon menampilkan ikon bintang
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 16,
                ),

                // SizedBox memberikan jarak horizontal
                const SizedBox(width: 4),

                // Text menampilkan rating film
                Text(
                  rating,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}