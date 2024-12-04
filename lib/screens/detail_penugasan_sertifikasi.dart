import 'package:flutter/material.dart';

class DetailPenugasanSertifikasi extends StatefulWidget {
  final String title;
  final String description;
  final String date;

  const DetailPenugasanSertifikasi({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
  }) : super(key: key);

  @override
  _DetailPenugasanSertifikasiState createState() =>
      _DetailPenugasanSertifikasiState();
}

class _DetailPenugasanSertifikasiState
    extends State<DetailPenugasanSertifikasi> {
  bool isDownloading = false;

  void _startDownload() {
    setState(() {
      isDownloading = true;
    });

    // Simulasi proses download
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isDownloading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Draft Surat Tugas berhasil diunduh!"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Sertifikasi'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFe3fdfd), // Hijau muda
                    Color(0xFFffffe0), // Kuning muda
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFdaf7dc), // Hijau muda
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Detail Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailRow(label: 'Tanggal', value: widget.date),
                  SizedBox(height: 8),
                  DetailRow(
                      label: 'Lokasi',
                      value: 'Hotel Savana Lt. 3, Malang, Jawa Timur'),
                  SizedBox(height: 8),
                  DetailRow(label: 'Level Sertifikasi', value: 'Internasional'),
                  SizedBox(height: 8),
                  DetailRow(label: 'Jumlah Peserta', value: '20'),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Download Button
            Center(
              child: ElevatedButton(
                onPressed: isDownloading ? null : _startDownload,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDownloading ? Colors.grey : Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
                child: isDownloading
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Mengunduh...',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      )
                    : Text(
                        'Unduh Draft Surat Tugas',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(color: Colors.black54)),
      ],
    );
  }
}
