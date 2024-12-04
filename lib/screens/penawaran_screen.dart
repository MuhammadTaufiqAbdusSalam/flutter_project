import 'package:flutter/material.dart';
import 'detail_penugasan_pelatihan.dart';
import 'detail_penugasan_sertifikasi.dart';

class PenawaranScreen extends StatefulWidget {
  @override
  _PenawaranScreenState createState() => _PenawaranScreenState();
}

class _PenawaranScreenState extends State<PenawaranScreen> {
  String selectedCategory = 'Sertifikasi'; // Default selection
  String selectedYear = '2023'; // Default year

  // Sample data for Sertifikasi and Pelatihan
  final List<Map<String, String>> sertifikasiItems = [
    {
      'title': 'Sertifikasi Fundamental Frontend Engineer',
      'description': 'BuildWithAngga',
      'date': 'Februari 2023'
    },
    {
      'title': 'Sertifikasi Dasar Flutter',
      'description': 'Flutter Dev',
      'date': 'Januari 2023'
    },
  ];

  final List<Map<String, String>> pelatihanItems = [
    {
      'title': 'Pelatihan Fundamental Frontend Engineer with Vue Js',
      'description': 'BuildWithAngga',
      'date': 'Februari 2023'
    },
    {
      'title': 'Pelatihan Dasar Dart',
      'description': 'Flutter Dev',
      'date': 'Maret 2023'
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Pilih data berdasarkan kategori yang dipilih
    List<Map<String, String>> displayedItems =
        selectedCategory == 'Sertifikasi' ? sertifikasiItems : pelatihanItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Penugasan Pelatihan & Sertifikasi",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png', // Ganti dengan path gambar latar belakang Anda
              fit: BoxFit.cover,
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari di sini',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Dropdown dan List Items
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Dropdown Menus
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Category Dropdown
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: selectedCategory,
                                  dropdownColor: Colors.teal,
                                  items: ['Sertifikasi', 'Pelatihan']
                                      .map((category) =>
                                          DropdownMenuItem<String>(
                                            value: category,
                                            child: Text(
                                              category,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCategory = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.teal,
                                    hintStyle:
                                        TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),

                              // Year Dropdown
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: selectedYear,
                                  dropdownColor: Colors.teal,
                                  items: ['2023', '2022', '2021']
                                      .map((year) => DropdownMenuItem<String>(
                                            value: year,
                                            child: Text(
                                              year,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedYear = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.teal,
                                    hintStyle:
                                        TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),

                          // List of items
                          Expanded(
                            child: ListView.builder(
                              itemCount: displayedItems.length,
                              itemBuilder: (context, index) {
                                final item = displayedItems[index];
                                return Card(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  color: Colors.white.withOpacity(0.9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      item['title']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    subtitle: Text(
                                      item['description']!,
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.teal,
                                    ),
                                    onTap: () {
                                      // Navigasi ke layar detail
                                      if (selectedCategory == 'Sertifikasi') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPenugasanSertifikasi(
                                              title: item['title']!,
                                              description: item['description']!,
                                              date: item['date']!,
                                            ),
                                          ),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPenugasanPelatihan(
                                              title: item['title']!,
                                              description: item['description']!,
                                              date: item['date']!,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
