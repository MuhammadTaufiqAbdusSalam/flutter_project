import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PendataanScreen extends StatefulWidget {
  @override
  _PendataanScreenState createState() => _PendataanScreenState();
}

class _PendataanScreenState extends State<PendataanScreen> {
  String selectedCategory = 'Pelatihan'; // Default category
  String selectedYear = '2023'; // Default year

  // Data fetched from API
  List<dynamic> pelatihanItems = [];
  List<dynamic> sertifikasiItems = [];

  String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzM0MDc2MTg0LCJleHAiOjE3MzQwNzk3ODQsIm5iZiI6MTczNDA3NjE4NCwianRpIjoibndUUXF0SVhMdndwSTNGZCIsInN1YiI6IjYiLCJwcnYiOiJlNGY5NzE1ZTgyY2U1ZTllYTcxZjcwMjhmYTZmMWJkODY3YTY0NDExIn0.iBcJFz4lGb6fx8XqxxLZ7e0smr5K1QNAczPXnQjziTE"; // Masukkan token Anda

  @override
  void initState() {
    super.initState();
    fetchPelatihanData();
    fetchSertifikasiData();
  }

  Future<void> fetchPelatihanData() async {
    final url = Uri.parse("http://127.0.0.1:8000/api/riwayat-pelatihan");

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          pelatihanItems = data['data'];
        });
      } else {
        throw Exception("Failed to load pelatihan data");
      }
    } catch (e) {
      print("Error fetching pelatihan data: $e");
    }
  }

  Future<void> fetchSertifikasiData() async {
    final url = Uri.parse("http://127.0.0.1:8000/api/riwayat-sertifikasi");

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          sertifikasiItems = data['data'];
        });
      } else {
        throw Exception("Failed to load sertifikasi data");
      }
    } catch (e) {
      print("Error fetching sertifikasi data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine which data to display based on selectedCategory
    final displayItems =
        selectedCategory == 'Pelatihan' ? pelatihanItems : sertifikasiItems;

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

                  // Dropdown Menus for Categories and Year
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Category Dropdown
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedCategory,
                          dropdownColor: Colors.teal,
                          items: ['Pelatihan', 'Sertifikasi']
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // White Box for List Items
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: displayItems.isEmpty
                          ? Center(
                              child: Text(
                                selectedCategory == 'Pelatihan'
                                    ? "Data pelatihan sedang dimuat..."
                                    : "Data sertifikasi sedang dimuat...",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : ListView.builder(
                              itemCount: displayItems.length,
                              itemBuilder: (context, index) {
                                final item = displayItems[index];
                                return Card(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  color: Colors.white.withOpacity(0.9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      item['nama_pelatihan'] ??
                                          item['nama_sertifikasi'] ??
                                          'Unknown',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Vendor: ${item['nama_vendor_pelatihan'] ?? item['nama_vendor_sertifikasi'] ?? '-'}",
                                          style: TextStyle(
                                              color: Colors.black54),
                                        ),
                                        SizedBox(height: 4),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.teal[50],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            "Level: ${item['level_pelatihan'] ?? item['jenis_sertifikasi'] ?? '-'}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // trailing: IconButton(
                                    //   icon: Icon(Icons.arrow_forward,
                                    //       color: Colors.teal),
                                    //   onPressed: () {
                                    //     // Navigation or action for details
                                    //     print(
                                    //         "Navigate to details for ${item['nama_pelatihan'] ?? item['nama_sertifikasi']}");
                                    //   },
                                    // ),
                                  ),
                                );
                              },
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
