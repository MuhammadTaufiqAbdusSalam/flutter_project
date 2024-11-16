import 'package:flutter/material.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);

  @override
  _NotifikasiScreenState createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  // List of notifications
  final List<Map<String, String>> _notifications = [
    {'date': '6 Mei 2024', 'message': 'Selamat! Anda telah terpilih untuk mengikuti program sertifikasi!'},
    {'date': '20 Februari 2024', 'message': 'Selamat! Anda telah terpilih untuk mengikuti program pelatihan!'},
    {'date': '3 Januari 2023', 'message': 'Selamat! Anda telah terpilih untuk mengikuti program sertifikasi!'},
  ];

  // Controller for the search input
  TextEditingController _searchController = TextEditingController();

  // Filtered list of notifications based on search
  List<Map<String, String>> _filteredNotifications = [];

  @override
  void initState() {
    super.initState();
    _filteredNotifications = _notifications; // Initialize with all notifications
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredNotifications = _notifications.where((notification) {
        return notification['message']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari di sini',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(child: _buildNotificationList()),
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView.builder(
      itemCount: _filteredNotifications.length,
      itemBuilder: (context, index) {
        final notification = _filteredNotifications[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification['date']!,
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
              SizedBox(height: 4.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified,
                        color: Colors.teal,
                        size: 40.0,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          notification['message']!,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle detail button action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text('Detail', style: TextStyle(fontSize: 14.0, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
