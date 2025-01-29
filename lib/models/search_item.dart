class SearchItem {
  final String title;
  final String imageUrl;
  final String date;
  final double rating; // Properti rating ditambahkan

  SearchItem({
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.rating, // Konstruktor menerima nilai rating
  });
}
