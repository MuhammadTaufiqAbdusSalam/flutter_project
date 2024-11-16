import 'package:flutter/material.dart';

class PendataanScreen extends StatefulWidget {
  @override
  _PendataanScreenState createState() => _PendataanScreenState();
}

class _PendataanScreenState extends State<PendataanScreen> {
  String selectedCategory = 'Sertifikasi'; // Default selection
  String selectedYear = '2023'; // Default year

  // Data for Sertifikasi and Pelatihan
  final List<Map<String, String>> sertifikasiItems = [
    {
      'title': 'Sertifikasi 1',
      'description': 'Deskripsi Sertifikasi 1',
      'date': 'Januari 2023'
    },
    {
      'title': 'Sertifikasi 2',
      'description': 'Deskripsi Sertifikasi 2',
      'date': 'Februari 2023'
    },
  ];

  final List<Map<String, String>> pelatihanItems = [
    {
      'title': 'Pelatihan 1',
      'description': 'Deskripsi Pelatihan 1',
      'date': 'Maret 2023'
    },
    {
      'title': 'Pelatihan 2',
      'description': 'Deskripsi Pelatihan 2',
      'date': 'April 2023'
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Determine items to display based on selected category
    List<Map<String, String>> displayedItems =
        selectedCategory == 'Sertifikasi' ? sertifikasiItems : pelatihanItems;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
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
                  // Title
                  Text(
                    "Pelatihan & Sertifikasi",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),

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

                  // White Box for Dropdowns and List Items
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Dropdown Menus for Categories and Year
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Category Dropdown
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: selectedCategory,
                                dropdownColor: Colors.teal,
                                items: ['Sertifikasi', 'Pelatihan']
                                    .map((category) => DropdownMenuItem<String>(
                                          value: category,
                                          child: Text(
                                            category,
                                            style: TextStyle(color: Colors.white),
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
                                  hintStyle: TextStyle(color: Colors.white),
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
                                            style: TextStyle(color: Colors.white),
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
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        // List of items
                        ListView.builder(
                          itemCount: displayedItems.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = displayedItems[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
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
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['description']!,
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.teal[50],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        item['date']!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.teal,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
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
