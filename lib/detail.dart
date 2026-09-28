import 'package:flutter/material.dart';

import 'data.dart';
import 'home.dart';

class DestinationDetailPage extends StatelessWidget {
  final DestinationModel destination;

  const DestinationDetailPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destination.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            destination.imageUrl.startsWith('http')
                ? Image.network(
                    destination.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    destination.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.contain,
                  ),

            const SizedBox(height: 20),

            Text(
              destination.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text('Kategori: ${destination.category}'),
            Text('Lokasi: ${destination.location}'),
            Text('Jam Buka: ${destination.openingHours}'),
            Text('Tiket: ${destination.ticketInfo}'),
            Text('Daya Tarik: ${destination.attraction}'),

            const SizedBox(height: 20),

            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(destination.description),
          ],
        ),
      ),
    );
  }
}
