import 'package:flutter/material.dart';

class DetailPelatihanScreen extends StatefulWidget {
  final String title;
  final String description;
  final String date;

  DetailPelatihanScreen({
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  _DetailPelatihanScreenState createState() => _DetailPelatihanScreenState();
}

class _DetailPelatihanScreenState extends State<DetailPelatihanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pelatihan'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal.shade800),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade200, Colors.teal.shade50],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Detail Section
            Text(
              'Detail',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Container dengan border dan garis pemisah
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildDetailRow('Tanggal Pelaksanaan', widget.date),
                  _buildDivider(),
                  _buildDetailRow('Lokasi', 'Online'),
                  _buildDivider(),
                  _buildDetailRow('Level Pelatihan', 'Nasional'),
                  _buildDivider(),
                  _buildDetailRow('Jumlah Peserta', '50'),
                  _buildDivider(),
                  _buildDetailRow('No. Sertifikat', 'ID-PL-0197832'),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Bukti Sertifikat
            Text(
              'Bukti Pelatihan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/certificate_sample.png',
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),

            // Mata Kuliah yang Relevan
            Text(
              'Mata Kuliah yang Relevan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                _buildChip('Manajemen Proyek'),
                _buildChip('Sistem Informasi'),
                _buildChip('Teknologi Web'),
              ],
            ),
            SizedBox(height: 16),

            // Bidang Minat yang Relevan
            Text(
              'Bidang Minat yang Relevan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                _buildChip('Manajemen IT'),
                _buildChip('Pengembangan Sistem'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[300],
      height: 1,
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.orange[50],
      labelStyle: TextStyle(
        color: Colors.orange[800],
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
