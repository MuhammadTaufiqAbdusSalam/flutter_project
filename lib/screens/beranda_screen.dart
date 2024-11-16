import 'package:flutter/material.dart';
import 'pendataan_screen.dart';
import 'penawaran_screen.dart';
import 'notifikasi_screen.dart';
import 'profil_screen.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _selectedIndex == 0
          ? _buildHomeScreen()
          : _selectedIndex == 1
              ? PendataanScreen()
              : _selectedIndex == 2
                  ? PenawaranScreen()
                  : ProfilScreen(), // Navigate to PenawaranScreen for index 2
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Pendataan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Penawaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildHomeScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selamat Pagi, Pak Ade',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                color: Colors.teal,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotifikasiScreen()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 16),

          // Profile Section with Background
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 185, 235, 244),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 58, 72, 73).withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profil.png'),
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ade Ismail, S.Kom., M.TI.',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Dosen Pengajar TI',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Logic for editing profile
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 58, 138, 207),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, color: Colors.white, size: 17),
                          SizedBox(width: 8), // Spacing between icon and text
                          Text(
                            'Edit Profil',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 24),
          Text(
            'Bidang Minat Anda',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildCustomChip('Algoritma Evolusioner'),
              _buildCustomChip('Big Data'),
              _buildCustomChip('Clustering'),
              _buildCustomChip('Data Analysis'),
              _buildCustomChip('Data Science'),
            ],
          ),
          SizedBox(height: 24),
          Text(
            'Riwayat Sertifikasi dan Pelatihan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoCard('Pelatihan', '100'),
              _buildInfoCard('Sertifikasi', '10'),
            ],
          ),
        ],
      ),
    );
  }

  // Custom Chip Widget
  Widget _buildCustomChip(String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.teal),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.teal, // Warna garis tepi
          width: 1.5,
        ),
      ),
      backgroundColor: Colors.transparent, // Latar belakang transparan
    );
  }

  Widget _buildInfoCard(String title, String count) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal, width: 0.5),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '$title telah diselesaikan',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
