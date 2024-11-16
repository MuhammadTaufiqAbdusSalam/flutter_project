import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate back to LoginScreen on logout
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profil.png'), // Replace with actual image asset path
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 16),

            // Nama
            _buildTextField(label: 'Nama', value: 'Ade Ismail, S.Kom., M.TI.'),

            // Jabatan
            _buildTextField(label: 'Jabatan', value: 'Dosen Pengajar TI'),

            // Username
            _buildTextField(label: 'Username', value: 'adeismail'),

            // Password
            _buildTextField(
              label: 'Password',
              value: '  ',
              isPassword: true,
            ),
            const SizedBox(height: 24),

            // Riwayat Mengajar Section
            _buildSection(
              title: 'Riwayat Mengajar',
              items: ['Data Mining', 'Algoritma dan Struktur Dasar', 'Mobile'],
              color: Colors.orange,
            ),
            const SizedBox(height: 24),

            // Bidang Minat Section
            _buildSection(
              title: 'Bidang Minat',
              items: ['Data Analysis', 'Data Science'],
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  // Method to create text fields with label
  Widget _buildTextField({required String label, required String value, bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        const SizedBox(height: 8),
        TextField(
          readOnly: true,
          obscureText: isPassword,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            hintText: value,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            suffixIcon: isPassword ? const Icon(Icons.visibility) : null,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Method to create a section with colored tags
  Widget _buildSection({required String title, required List<String> items, required Color color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Lihat semuanya',
              style: TextStyle(color: Colors.teal, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: items
              .map((item) => Chip(
                    label: Text(item),
                    backgroundColor: color.withOpacity(0.1),
                    labelStyle: TextStyle(color: color),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
