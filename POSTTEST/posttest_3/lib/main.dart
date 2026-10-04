import 'package:flutter/material.dart';

void main() {

  // runApp digunakan untuk menjalankan aplikasi Flutter

  runApp(const MovieBoxApp());

}

// ============================================================
// WIDGET UTAMA APLIKASI
// ============================================================
// StatelessWidget digunakan karena MovieBoxApp tidak memiliki data yang berubah selama aplikasi berjalan.

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

        // ColorScheme digunakan untuk mengatur skema warna aplikasi

        colorScheme: ColorScheme.fromSeed(

          seedColor: Colors.orange,

          brightness: Brightness.dark,

        ),

      ),

      // Menghilangkan banner DEBUG

      debugShowCheckedModeBanner: false,

      // Menampilkan HomePage sebagai halaman pertama

      home: const HomePage(),

    );

  }

}

// ============================================================
// MODEL DATA FILM
// ============================================================
// Class Movie digunakan untuk menyimpan data sebuah film.

class Movie {

  final String title;

  final String genre;

  final String rating;

  final String imagePath;

  // Constructor Movie digunakan untuk membuat data film.

  const Movie({

    required this.title,

    required this.genre,

    required this.rating,

    required this.imagePath,

  });

}

// ============================================================
// HALAMAN HOME - STATEFUL WIDGET
// ============================================================
// StatefulWidget digunakan karena HomePage memiliki data yang dapat berubah selama aplikasi berjalan.

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override

  State<HomePage> createState() => _HomePageState();

}

// ============================================================
// STATE HOME PAGE
// ============================================================

class _HomePageState extends State<HomePage> {

  // ==========================================================
  // STATE PENCARIAN
  // ==========================================================
  // searchQuery menyimpan teks pencarian dari TextField.

  String searchQuery = '';

  // ==========================================================
  // STATE FAVORITE
  // ==========================================================
  // favoriteMovies menyimpan judul film yang sudah disukai.
  // Set digunakan agar satu film tidak tersimpan dua kali.

  final Set<String> favoriteMovies = {};

  // ==========================================================
  // STATE NAVIGASI
  // ==========================================================
  // currentIndex menyimpan menu navigasi yang sedang aktif.

  int currentIndex = 0;

  // ==========================================================
  // DATA FILM
  // ==========================================================
  // List Movie menyimpan seluruh film yang tersedia.

  final List<Movie> movies = const [
    // Film Marvel
    Movie(title: 'Avengers', genre: 'Action • Sci-Fi', rating: '8.0', imagePath: 'assets/avengers.jpg'),
    Movie(title: 'Avengers: Infinity War', genre: 'Action • Sci-Fi', rating: '8.4', imagePath: 'assets/infinity_war.jpg'),
    Movie(title: 'Avengers: Endgame', genre: 'Action • Sci-Fi', rating: '8.4', imagePath: 'assets/endgame.jpg'),
    Movie(title: 'Iron Man', genre: 'Action • Sci-Fi', rating: '7.9', imagePath: 'assets/iron_man.jpg'),
    Movie(title: 'Spider-Man: No Way Home', genre: 'Action • Adventure', rating: '8.2', imagePath: 'assets/spiderman.jpg'),
    Movie(title: 'Black Panther', genre: 'Action • Adventure', rating: '7.3', imagePath: 'assets/black_panther.jpg'),
    Movie(title: 'Doctor Strange', genre: 'Action • Fantasy', rating: '7.5', imagePath: 'assets/doctor_strange.jpg'),
    Movie(title: 'Guardians of the Galaxy', genre: 'Action • Adventure', rating: '8.0', imagePath: 'assets/guardians.jpg'),

    // Rekomendasi film lainnya
    Movie(title: 'Interstellar', genre: 'Sci-Fi • Drama', rating: '8.7', imagePath: 'assets/interstellar.jpg'),
    Movie(title: 'Inception', genre: 'Sci-Fi • Thriller', rating: '8.8', imagePath: 'assets/inception.jpg'),
    Movie(title: 'The Batman', genre: 'Action • Crime', rating: '7.8', imagePath: 'assets/the_batman.jpg'),
    Movie(title: 'Dune: Part Two', genre: 'Sci-Fi • Adventure', rating: '8.5', imagePath: 'assets/dune_two.jpg'),
    Movie(title: 'The Martian', genre: 'Sci-Fi • Adventure', rating: '8.0', imagePath: 'assets/the_martian.jpg'),
  ];

  // ==========================================================
  // FUNGSI FAVORITE
  // ==========================================================
  // Fungsi toggleFavorite digunakan untuk menambah ataumenghapus film dari daftar favorite.

  void toggleFavorite(String movieTitle) {

    // setState digunakan untuk memberitahu Flutter bahwa state berubah sehingga UI akan diperbarui.

    setState(() {

      // Jika film sudah ada di favorite

      if (favoriteMovies.contains(movieTitle)) {

        // Hapus film dari favorite

        favoriteMovies.remove(movieTitle);

      } else {

        // Jika belum ada, tambahkan ke favorite

        favoriteMovies.add(movieTitle);

      }

    });

  }

  // ==========================================================
  // FUNGSI FILTER SEARCH
  // ==========================================================
  // Getter filteredMovies digunakan untuk menghasilkan daftar film berdasarkan teks pencarian.

  List<Movie> get filteredMovies {

    // Jika search kosong, semua film ditampilkan.

    if (searchQuery.isEmpty) {

      return movies;

    }

    // Filter film berdasarkan judul atau genre.

    return movies.where((movie) {

      // contains digunakan untuk mengecek apakah teks pencarian terdapat pada judul atau genre.

      return movie.title.toLowerCase().contains(searchQuery) ||

          movie.genre.toLowerCase().contains(searchQuery);

    }).toList();

  }

  // ==========================================================
  // BUILD HOME PAGE
  // ==========================================================

  @override

  Widget build(BuildContext context) {

    // Scaffold digunakan sebagai struktur dasar halaman.

    return Scaffold(

      // Mengatur warna background halaman.

      backgroundColor: const Color(0xFF121212),

      // SafeArea menjaga konten dari notch dan status bar.

      body: SafeArea(

        // SingleChildScrollView membuat halaman dapat di-scroll.

        child: SingleChildScrollView(

          // Padding memberikan jarak dari tepi layar.

          child: Padding(

            padding: const EdgeInsets.symmetric(

              horizontal: 20,

              vertical: 20,

            ),

            // Column menyusun seluruh konten secara vertikal.

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                // ==================================================
                // HEADER
                // ==================================================
                // Row menyusun header secara horizontal.

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    // Column menyusun teks secara vertikal.

                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        // Text menampilkan sapaan pengguna.

                        const Text(

                          'Hello, Movie Lover! 👋🏻',

                          style: TextStyle(

                            fontSize: 14,

                            color: Colors.grey,

                          ),

                        ),

                        // SizedBox memberikan jarak.

                        const SizedBox(height: 6),

                        // Text menampilkan nama aplikasi.

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

                    // Container digunakan untuk membuat kotak

                    // ikon profil.

                    Container(

                      padding: const EdgeInsets.all(10),

                      // BoxDecoration mengatur tampilan container.

                      decoration: BoxDecoration(

                        color: const Color(0xFF292929),

                        borderRadius: BorderRadius.circular(14),

                      ),

                      // Icon menampilkan ikon profil.

                      child: const Icon(

                        Icons.person,

                        color: Colors.orange,

                        size: 25,

                      ),

                    ),

                  ],

                ),

                // SizedBox memberikan jarak setelah header.

                const SizedBox(height: 25),

                // ==================================================
                // SEARCH
                // ==================================================
                // Text menampilkan judul pencarian.

                const Text(

                  'Find Your Favorite Movie',

                  style: TextStyle(

                    fontSize: 20,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                // SizedBox memberikan jarak.

                const SizedBox(height: 14),

                // Container membungkus TextField.

                Container(

                  decoration: BoxDecoration(

                    color: const Color(0xFF292929),

                    borderRadius: BorderRadius.circular(15),

                  ),

                  // Padding memberikan ruang di dalam search.

                  child: Padding(

                    padding: const EdgeInsets.symmetric(

                      horizontal: 16,

                    ),

                    // TextField digunakan sebagai input pencarian.

                    child: TextField(

                      // Mengatur warna teks yang diketik.

                      style: const TextStyle(

                        color: Colors.white,

                      ),

                      // onChanged dipanggil setiap kali pengguna mengetik pada TextField.

                      onChanged: (value) {

                        // setState digunakan untuk mengubah state

                        // searchQuery dan memperbarui tampilan.

                        setState(() {

                          searchQuery = value.toLowerCase();

                        });

                      },

                      // InputDecoration mengatur tampilan TextField.

                      decoration: InputDecoration(

                        hintText: 'Search movie...',

                        // Mengatur warna teks hint.

                        hintStyle: const TextStyle(

                          color: Colors.grey,

                        ),

                        // Icon search ditampilkan pada sisi kanan.

                        suffixIcon: const Icon(

                          Icons.search,

                          color: Colors.orange,

                        ),

                        // Menghilangkan border TextField.

                        border: InputBorder.none,

                      ),

                    ),

                  ),

                ),

                // SizedBox memberikan jarak.

                const SizedBox(height: 28),

                // ==================================================
                // RECOMMENDED MOVIES
                // ==================================================
                // Row menyusun judul dan See All.

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    // Text menampilkan judul section.

                    const Text(

                      'Recommended For You',

                      style: TextStyle(

                        fontSize: 20,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                    // Text menampilkan See All.

                    const Text(

                      'See All',

                      style: TextStyle(

                        color: Colors.orange,

                        fontSize: 13,

                      ),

                    ),

                  ],

                ),

                // SizedBox memberikan jarak.

                const SizedBox(height: 16),

                // ==================================================
                // HASIL SEARCH
                // ==================================================
                // Jika hasil pencarian kosong maka menampilkan pesan bahwa film tidak ditemukan.

                if (filteredMovies.isEmpty)

                  // Container digunakan sebagai pesan kosong.

                  Container(

                    width: double.infinity,

                    padding: const EdgeInsets.all(20),

                    // BoxDecoration mengatur tampilan pesan.

                    decoration: BoxDecoration(

                      color: const Color(0xFF292929),

                      borderRadius: BorderRadius.circular(18),

                    ),

                    // Column menyusun icon dan teks.

                    child: const Column(

                      children: [

                        // Icon search off menunjukkan tidak ada film yang ditemukan.

                        Icon(

                          Icons.search_off,

                          color: Colors.grey,

                          size: 40,

                        ),

                        // SizedBox memberikan jarak.

                        SizedBox(height: 10),

                        // Text menampilkan pesan.

                        Text(

                          'Movie not found',

                          style: TextStyle(

                            color: Colors.grey,

                          ),

                        ),

                      ],

                    ),

                  )

                // Jika hasil pencarian tersedia,

                // tampilkan kartu film.

                else

                  // Row menyusun kartu film secara horizontal.

                  // SizedBox memberi tinggi untuk daftar kartu film.
                 SizedBox(
                   height: 255,
                   // ListView horizontal memungkinkan seluruh film digeser.
                   child: ListView.separated(
                     scrollDirection: Axis.horizontal,
                     itemCount: filteredMovies.length,
                     separatorBuilder: (context, index) =>
                         const SizedBox(width: 14),
                     itemBuilder: (context, index) {
                       // SizedBox menjaga lebar setiap kartu tetap konsisten.
                       return SizedBox(
                         width: 155,
                         child: movieCard(movie: filteredMovies[index]),
                       );
                     },
                   ),
                 ),

               // SizedBox memberikan jarak.

                const SizedBox(height: 30),

                // ==================================================
                // TRENDING MOVIES
                // ==================================================
                // Text menampilkan judul trending.

                const Text(

                  'Trending Movies',

                  style: TextStyle(

                    fontSize: 20,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                // SizedBox memberikan jarak.

                const SizedBox(height: 16),

                // Container digunakan sebagai kartu trending.

                Container(

                  width: double.infinity,

                  padding: const EdgeInsets.all(18),

                  // BoxDecoration memberikan background, radius dan bayangan pada kartu.

                  decoration: BoxDecoration(

                    color: const Color(0xFF292929),

                    borderRadius: BorderRadius.circular(18),

                    // BoxShadow memberikan efek bayangan.

                    boxShadow: [

                      BoxShadow(

                        color: Colors.black.withValues(alpha: 0.4),

                        blurRadius: 10,

                        offset: const Offset(0, 5),

                      ),

                    ],

                  ),

                  // Row menyusun poster dan informasi film.

                  child: Row(

                    children: [

                      // SizedBox digunakan untuk menentukan

                      // ukuran area poster.

                      SizedBox(

                        width: 75,

                        height: 95,

                        // Stack digunakan untuk menumpuk poster

                        // dan rating.

                        child: Stack(

                          children: [

                            // ClipRRect membuat sudut gambar membulat.

                            ClipRRect(

                              borderRadius: BorderRadius.circular(12),

                              // Image.asset menampilkan poster film.

                              child: Image.asset(

                                'assets/guardians.jpg',

                                width: 75,

                                height: 95,

                                fit: BoxFit.cover,

                              ),

                            ),

                            // Positioned menempatkan rating pada bagian bawah poster.

                            Positioned(

                              left: 0,

                              right: 0,

                              bottom: 0,

                              // Container menjadi background rating.

                              child: Container(

                                padding: const EdgeInsets.symmetric(

                                  vertical: 4,

                                ),

                                color: Colors.black.withValues(

                                  alpha: 0.7,

                                ),

                                // Text menampilkan rating.

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

                      // SizedBox memberikan jarak.

                      const SizedBox(width: 15),

                      // Expanded mengisi sisa ruang.

                      const Expanded(

                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            // Text menampilkan judul film.

                            Text(

                              'Guardians of the Galaxy',

                              style: TextStyle(

                                fontSize: 16,

                                fontWeight: FontWeight.bold,

                              ),

                            ),

                            // SizedBox memberikan jarak.

                            SizedBox(height: 8),

                            // Text menampilkan genre film.

                            Text(

                              'Action • Adventure',

                              style: TextStyle(

                                color: Colors.grey,

                                fontSize: 12,

                              ),

                            ),

                            // SizedBox memberikan jarak.

                            SizedBox(height: 8),

                            // Row menyusun rating film.

                            Row(

                              children: [

                                // Icon menampilkan bintang.

                                Icon(

                                  Icons.star,

                                  color: Colors.orange,

                                  size: 17,

                                ),

                                // SizedBox memberikan jarak.

                                SizedBox(width: 5),

                                // Text menampilkan rating.

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

                      // GestureDetector membuat ikon favorite dapat ditekan.

                      GestureDetector(

                        onTap: () {

                          // State favorite Guardians diubah menggunakan setState melalui fungsi.

                          toggleFavorite('Guardians of the Galaxy');

                        },

                        // Icon berubah berdasarkan state favorite.

                        child: Icon(

                          favoriteMovies.contains(

                            'Guardians of the Galaxy',

                          )

                              ? Icons.favorite

                              : Icons.favorite_border,

                          color: Colors.orange,

                          size: 24,

                        ),

                      ),

                    ],

                  ),

                ),

                // SizedBox memberikan jarak.

                const SizedBox(height: 30),

                // ==================================================
                // NAVIGATION MENU
                // ==================================================
                // Container digunakan sebagai menu navigasi bawah.

                Container(

                  padding: const EdgeInsets.symmetric(

                    vertical: 15,

                  ),

                  // BoxDecoration memberikan tampilan menu.

                  decoration: BoxDecoration(

                    color: const Color(0xFF292929),

                    borderRadius: BorderRadius.circular(18),

                    // BoxShadow memberikan efek bayangan.

                    boxShadow: [

                      BoxShadow(

                        color: Colors.black.withValues(alpha: 0.4),

                        blurRadius: 10,

                        offset: const Offset(0, 5),

                      ),

                    ],

                  ),

                  // Row menyusun menu navigasi secara horizontal.

                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [

                      // Menu Home.

                      GestureDetector(

                        // onTap mengubah state currentIndex.

                        onTap: () {

                          setState(() {

                            currentIndex = 0;

                          });

                        },

                        // Column menyusun icon dan label.

                        child: Column(

                          children: [

                            // Icon Home.

                            Icon(

                              Icons.home,

                              color: currentIndex == 0

                                  ? Colors.orange

                                  : Colors.grey,

                              size: 24,

                            ),

                            // SizedBox memberikan jarak.

                            const SizedBox(height: 5),

                            // Text label Home.

                            Text(

                              'Home',

                              style: TextStyle(

                                color: currentIndex == 0

                                    ? Colors.orange

                                    : Colors.grey,

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

                        // onTap mengubah state lalu membuka Explore.

                        onTap: () {

                          setState(() {

                            currentIndex = 1;

                          });

                          // Navigator.push membuka halaman Explore.

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (context) =>

                                  const ExplorePage(),

                            ),

                          );

                        },

                        // Column menyusun icon dan teks.

                        child: Column(

                          children: [

                            // Icon Explore.

                            Icon(

                              Icons.explore,

                              color: currentIndex == 1

                                  ? Colors.orange

                                  : Colors.grey,

                              size: 24,

                            ),

                            // SizedBox memberikan jarak.

                            const SizedBox(height: 5),

                            // Text label Explore.

                            Text(

                              'Explore',

                              style: TextStyle(

                                color: currentIndex == 1

                                    ? Colors.orange

                                    : Colors.grey,

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

                        // onTap mengubah state lalu membuka Favorite.

                        onTap: () {

                          setState(() {

                            currentIndex = 2;

                          });

                          // Navigator.push membuka halaman Favorite.

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (context) => FavoritePage(

                                favoriteMovies: favoriteMovies,

                              ),

                            ),

                          );

                        },

                        // Column menyusun icon dan teks.

                        child: Column(

                          children: [

                            // Icon Favorite berubah berdasarkan state.

                            Icon(

                              favoriteMovies.isNotEmpty

                                  ? Icons.favorite

                                  : Icons.favorite_border,

                              color: currentIndex == 2

                                  ? Colors.orange

                                  : Colors.grey,

                              size: 24,

                            ),

                            // SizedBox memberikan jarak.

                            const SizedBox(height: 5),

                            // Text label Favorite.

                            Text(

                              'Favorite',

                              style: TextStyle(

                                color: currentIndex == 2

                                    ? Colors.orange

                                    : Colors.grey,

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

                        // onTap mengubah state lalu membuka Profile.

                        onTap: () {

                          setState(() {

                            currentIndex = 3;

                          });

                          // Navigator.push membuka halaman Profile.

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (context) =>

                                  const ProfilePage(),

                            ),

                          );

                        },

                        // Column menyusun icon dan teks.

                        child: Column(

                          children: [

                            // Icon Profile.

                            Icon(

                              Icons.person_outline,

                              color: currentIndex == 3

                                  ? Colors.orange

                                  : Colors.grey,

                              size: 24,

                            ),

                            // SizedBox memberikan jarak.

                            const SizedBox(height: 5),

                            // Text label Profile.

                            Text(

                              'Profile',

                              style: TextStyle(

                                color: currentIndex == 3

                                    ? Colors.orange

                                    : Colors.grey,

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
  // Function movieCard digunakan untuk membuat kartu film berdasarkan data Movie yang diberikan.

  Widget movieCard({

    required Movie movie,

  }) {

    // Mengecek apakah film sedang menjadi favorite.

    final bool isFavorite =

        favoriteMovies.contains(movie.title);

    // Container digunakan sebagai pembungkus kartu.

    return Container(

      decoration: BoxDecoration(

        color: const Color(0xFF292929),

        borderRadius: BorderRadius.circular(18),

        // BoxShadow memberikan efek bayangan.

        boxShadow: [

          BoxShadow(

            color: Colors.black.withValues(alpha: 0.4),

            blurRadius: 8,

            offset: const Offset(0, 4),

          ),

        ],

      ),

      // Padding memberikan jarak isi kartu.

      child: Padding(

        padding: const EdgeInsets.all(10),

        // Column menyusun poster dan informasi secara vertikal.

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // SizedBox menentukan ukuran area poster.

            SizedBox(

              height: 150,

              width: double.infinity,

              // Stack digunakan untuk menumpuk poster, rating, dan tombol favorite.

              child: Stack(

                children: [

                  // ClipRRect membuat sudut poster membulat.

                  ClipRRect(

                    borderRadius: BorderRadius.circular(12),

                    // Image.asset menampilkan poster film.

                    child: Image.asset(

                      movie.imagePath,

                      width: double.infinity,

                      height: 150,

                      fit: BoxFit.cover,

                    ),

                  ),

                  // Positioned menempatkan rating di bawah poster.

                  Positioned(

                    right: 8,

                    bottom: 8,

                    // Container menjadi background rating.

                    child: Container(

                      padding: const EdgeInsets.symmetric(

                        horizontal: 7,

                        vertical: 4,

                      ),

                      decoration: BoxDecoration(

                        color: Colors.black.withValues(alpha: 0.75),

                        borderRadius: BorderRadius.circular(8),

                      ),

                      // Row menyusun icon bintang dan rating.

                      child: Row(

                        mainAxisSize: MainAxisSize.min,

                        children: [

                          // Icon bintang.

                          const Icon(

                            Icons.star,

                            color: Colors.orange,

                            size: 14,

                          ),

                          // SizedBox memberikan jarak.

                          const SizedBox(width: 3),

                          // Text menampilkan rating.

                          Text(

                            movie.rating,

                            style: const TextStyle(

                              fontSize: 11,

                              fontWeight: FontWeight.bold,

                            ),

                          ),

                        ],

                      ),

                    ),

                  ),

                  // Positioned menempatkan tombol favorite di pojok kiri atas poster.

                  Positioned(

                    left: 8,

                    top: 8,

                    // GestureDetector membuat tombol dapat ditekan.

                    child: GestureDetector(

                      onTap: () {

                        // toggleFavorite mengubah state favorite.

                        toggleFavorite(movie.title);

                      },

                      // Container digunakan sebagai background icon.

                      child: Container(

                        padding: const EdgeInsets.all(5),

                        decoration: BoxDecoration(

                          color: Colors.black.withValues(alpha: 0.7),

                          shape: BoxShape.circle,

                        ),

                        // Icon berubah berdasarkan state.

                        child: Icon(

                          isFavorite

                              ? Icons.favorite

                              : Icons.favorite_border,

                          color: Colors.orange,

                          size: 18,

                        ),

                      ),

                    ),

                  ),

                ],

              ),

            ),

            // SizedBox memberikan jarak setelah poster.

            const SizedBox(height: 10),

            // Text menampilkan judul film.

            Text(

              movie.title,

              maxLines: 1,

              overflow: TextOverflow.ellipsis,

              style: const TextStyle(

                fontSize: 15,

                fontWeight: FontWeight.bold,

              ),

            ),

            // SizedBox memberikan jarak.

            const SizedBox(height: 6),

            // Text menampilkan genre film.

            Text(

              movie.genre,

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
// StatelessWidget digunakan karena halaman Explore tidak memiliki state yang berubah.

class ExplorePage extends StatelessWidget {

  const ExplorePage({super.key});

  @override

  Widget build(BuildContext context) {

    // Scaffold digunakan sebagai struktur halaman.

    return Scaffold(

      backgroundColor: const Color(0xFF121212),

      // AppBar digunakan sebagai header halaman.

      appBar: AppBar(

        title: const Text('Explore Movies'),

        backgroundColor: const Color(0xFF121212),

        foregroundColor: Colors.orange,

      ),

      // Padding memberikan jarak isi halaman.

      body: Padding(

        padding: const EdgeInsets.all(20),

        // Column menyusun konten secara vertikal.

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Text menampilkan judul halaman.

            const Text(

              'Explore',

              style: TextStyle(

                fontSize: 26,

                fontWeight: FontWeight.bold,

                color: Colors.orange,

              ),

            ),

            // SizedBox memberikan jarak.

            const SizedBox(height: 15),

            // Container menjadi kartu informasi.

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(20),

              // BoxDecoration memberikan background dan bayangan.

              decoration: BoxDecoration(

                color: const Color(0xFF292929),

                borderRadius: BorderRadius.circular(18),

                // BoxShadow memberikan efek bayangan.

                boxShadow: [

                  BoxShadow(

                    color: Colors.black.withValues(alpha: 0.4),

                    blurRadius: 10,

                    offset: const Offset(0, 5),

                  ),

                ],

              ),

              // Column menyusun isi kartu.

              child: const Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // Icon film.

                  Icon(

                    Icons.local_movies,

                    color: Colors.orange,

                    size: 45,

                  ),

                  // SizedBox memberikan jarak.

                  SizedBox(height: 15),

                  // Text informasi halaman.

                  Text(

                    'Find movies that match your mood.',

                    style: TextStyle(

                      fontSize: 17,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  // SizedBox memberikan jarak.

                  SizedBox(height: 8),

                  // Text deskripsi.

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

            // Spacer mendorong tombol ke bagian bawah.

            const Spacer(),

            // SizedBox membuat tombol memenuhi lebar.

            SizedBox(

              width: double.infinity,

              // ElevatedButton digunakan untuk tombol kembali.

              child: ElevatedButton(

                onPressed: () {

                  // Navigator.pop digunakan untuk kembali

                  // ke halaman sebelumnya.

                  Navigator.pop(context);

                },

                // Text menampilkan tulisan tombol.

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
// FavoritePage menerima data favorite dari HomePage.

class FavoritePage extends StatelessWidget {

  // Set favoriteMovies berisi judul film yang disukai.

  final Set<String> favoriteMovies;

  const FavoritePage({

    super.key,

    required this.favoriteMovies,

  });

  @override

  Widget build(BuildContext context) {

    // Scaffold digunakan sebagai struktur halaman.

    return Scaffold(

      backgroundColor: const Color(0xFF121212),

      // AppBar digunakan sebagai header.

      appBar: AppBar(

        title: const Text('Favorite Movies'),

        backgroundColor: const Color(0xFF121212),

        foregroundColor: Colors.orange,

      ),

      // Jika belum ada favorite maka tampilkan empty state.

      body: favoriteMovies.isEmpty

          // Center menempatkan konten di tengah halaman.

          ? Center(

              // Column menyusun ikon dan teks.

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  // Icon favorite.

                  const Icon(

                    Icons.favorite,

                    color: Colors.orange,

                    size: 70,

                  ),

                  // SizedBox memberikan jarak.

                  const SizedBox(height: 20),

                  // Text menampilkan informasi.

                  const Text(

                    'Your Favorite Movies',

                    style: TextStyle(

                      fontSize: 22,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  // SizedBox memberikan jarak.

                  const SizedBox(height: 10),

                  // Text menampilkan keterangan.

                  const Text(

                    'Belum ada film yang ditambahkan.',

                    style: TextStyle(

                      color: Colors.grey,

                    ),

                  ),

                  // SizedBox memberikan jarak.

                  const SizedBox(height: 25),

                  // ElevatedButton digunakan untuk kembali.

                  ElevatedButton(

                    onPressed: () {

                      // Navigator.pop kembali ke halaman sebelumnya.

                      Navigator.pop(context);

                    },

                    // Text menampilkan label tombol.

                    child: const Text('Back'),

                  ),

                ],

              ),

            )

          // Jika terdapat favorite maka tampilkan daftar.

          : Padding(

              padding: const EdgeInsets.all(20),

              // ListView menampilkan daftar favorite.

              child: ListView(

                children: [

                  // Text menampilkan jumlah favorite.

                  Text(

                    '${favoriteMovies.length} Favorite Movie',

                    style: const TextStyle(

                      fontSize: 20,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  // SizedBox memberikan jarak.

                  const SizedBox(height: 20),

                  // ListView diisi menggunakan map dari Set.

                  ...favoriteMovies.map(

                    (movieTitle) {

                      // Container digunakan sebagai kartu favorite.

                      return Container(

                        margin: const EdgeInsets.only(

                          bottom: 12,

                        ),

                        padding: const EdgeInsets.all(16),

                        // BoxDecoration mengatur kartu.

                        decoration: BoxDecoration(

                          color: const Color(0xFF292929),

                          borderRadius: BorderRadius.circular(15),

                        ),

                        // Row menyusun icon dan nama film.

                        child: Row(

                          children: [

                            // Icon favorite.

                            const Icon(

                              Icons.favorite,

                              color: Colors.orange,

                            ),

                            // SizedBox memberikan jarak.

                            const SizedBox(width: 15),

                            // Expanded mengisi ruang yang tersedia.

                            Expanded(

                              child: Text(

                                movieTitle,

                                style: const TextStyle(

                                  fontSize: 16,

                                  fontWeight: FontWeight.bold,

                                ),

                              ),

                            ),

                          ],

                        ),

                      );

                    },

                  ),

                  // SizedBox memberikan jarak.

                  const SizedBox(height: 10),

                  // ElevatedButton digunakan untuk kembali.

                  ElevatedButton(

                    onPressed: () {

                      // Navigator.pop kembali ke HomePage.

                      Navigator.pop(context);

                    },

                    // Text menampilkan label tombol.

                    child: const Text('Back to Home'),

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
// StatelessWidget digunakan karena halaman Profile tidak memiliki state yang berubah.

class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key});

  @override

  Widget build(BuildContext context) {

    // Scaffold digunakan sebagai struktur halaman.

    return Scaffold(

      backgroundColor: const Color(0xFF121212),

      // AppBar digunakan sebagai header.

      appBar: AppBar(

        title: const Text('Profile'),

        backgroundColor: const Color(0xFF121212),

        foregroundColor: Colors.orange,

      ),

      // Padding memberikan jarak isi halaman.

      body: Padding(

        padding: const EdgeInsets.all(20),

        // Column menyusun konten secara vertikal.

        child: Column(

          children: [

            // Container digunakan sebagai avatar.

            Container(

              padding: const EdgeInsets.all(20),

              // BoxDecoration membuat bentuk avatar bulat.

              decoration: BoxDecoration(

                color: const Color(0xFF292929),

                shape: BoxShape.circle,

                // BoxShadow memberikan efek bayangan.

                boxShadow: [

                  BoxShadow(

                    color: Colors.black.withValues(alpha: 0.5),

                    blurRadius: 12,

                    offset: const Offset(0, 5),

                  ),

                ],

              ),

              // Icon digunakan sebagai foto profil sederhana.

              child: const Icon(

                Icons.person,

                color: Colors.orange,

                size: 70,

              ),

            ),

            // SizedBox memberikan jarak.

            const SizedBox(height: 20),

            // Text menampilkan nama pengguna.

            const Text(

              'Movie Lover',

              style: TextStyle(

                fontSize: 24,

                fontWeight: FontWeight.bold,

              ),

            ),

            // SizedBox memberikan jarak.

            const SizedBox(height: 8),

            // Text menampilkan informasi profil.

            const Text(

              'Welcome to MovieBox!',

              style: TextStyle(

                color: Colors.grey,

              ),

            ),

            // Spacer mendorong tombol ke bagian bawah.

            const Spacer(),

            // SizedBox membuat tombol memenuhi lebar.

            SizedBox(

              width: double.infinity,

              // ElevatedButton digunakan untuk kembali.

              child: ElevatedButton(

                onPressed: () {

                  // Navigator.pop digunakan untuk kembali ke halaman sebelumnya.

                  Navigator.pop(context);

                },

                // Text menampilkan label tombol.

                child: const Text('Back to Home'),

              ),

            ),

          ],

        ),

      ),

    );

  }

}