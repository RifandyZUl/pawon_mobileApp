import 'package:flutter/material.dart';
import 'package:latihan/screen/pages/home_screen.dart';
import 'package:latihan/screen/pages/saved_recipes_page.dart';
import '/widgets/search_card.dart';
import '/models/search_item.dart';
import 'profile_page.dart';

class SearchPage extends StatelessWidget {
  final List<SearchItem> searchHistory = [
    SearchItem(
      title: "Mie Goreng Jawa",
      imageUrl:
          "https://i.pinimg.com/474x/e0/c2/3c/e0c23c2ddfe5671d973f3362ed25e199.jpg",
      date: "4 days ago",
      rating: 4.5,
    ),
    SearchItem(
      title: "Seblak Bandung",
      imageUrl:
          "https://i.pinimg.com/474x/27/bf/6e/27bf6e38a69ec4fc14d1dce5f43e81e0.jpg",
      date: "7 days ago",
      rating: 4.3,
    ),
    SearchItem(
      title: "Rawon Gurih Jawa Timur",
      imageUrl:
          "https://i.pinimg.com/474x/a6/6f/a2/a66fa211d64a5b8c24ff189a7d071a45.jpg",
      date: "19 Jun 2024",
      rating: 4.7,
    ),
  ];

  final List<SearchItem> lastViewed = [
    SearchItem(
      title: "Sambal Terong Penyet",
      imageUrl:
          "https://i.pinimg.com/736x/9d/94/c6/9d94c6588e2540ceb7ff0fead4c00c58.jpg",
      date: "",
      rating: 4.2,
    ),
    SearchItem(
      title: "Tongseng Ayam",
      imageUrl:
          "https://i.pinimg.com/474x/c5/eb/6f/c5eb6f41f118a54bfd3c7c777590a904.jpg",
      date: "",
      rating: 4.1,
    ),
    SearchItem(
      title: "Cumi & Udang Saus Padang",
      imageUrl:
          "https://i.pinimg.com/474x/75/80/43/7580431c8cea7a5ae5eaec4aa2596b9a.jpg",
      date: "",
      rating: 4.5,
    ),
  ];

  final List<SearchItem> basedOnSearch = [
    SearchItem(
      title: "Tempe & Tahu Bacem",
      imageUrl:
          "https://i.pinimg.com/474x/24/30/51/2430516f42c87766efaa26a78d56b953.jpg",
      date: "",
      rating: 4.3,
    ),
    SearchItem(
      title: "Seafood Fried Rice",
      imageUrl:
          "https://i.pinimg.com/474x/68/6f/ff/686fff48b62cdd94d36c1ef9df494f15.jpg",
      date: "",
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: Column(
        children: [
          SizedBox(height: 50),
          _buildSearchBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, "Search history"),
                  _buildVerticalSearchHistory(searchHistory),
                  _buildSectionTitle(context, "Last viewed"),
                  _buildHorizontalList(lastViewed),
                  _buildSectionTitle(context, "Based on your search"),
                  _buildHorizontalList(basedOnSearch),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalSearchHistory(List<SearchItem> items) {
  return ListView.builder(
    shrinkWrap: true, // Agar tidak mengambil tinggi penuh
    physics: NeverScrollableScrollPhysics(), // Menghindari konflik scroll
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(12),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            item.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          subtitle: Text(
            item.date,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      );
    },
  );
}

  Widget _buildHorizontalList(List<SearchItem> items) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return SearchCard(
            title: item.title,
            imageUrl: item.imageUrl,
            date: item.date,
            rating: item.rating,
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text("See All"),
          ),
        ],
      ),
    );
  }

    BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: 1, // Ganti sesuai halaman aktif
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SavedRecipesPage(savedRecipes: [])),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()), // Navigasi ke ProfilePage
            );
          }
        },
      );
    }


  }