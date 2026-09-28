import 'package:flutter/material.dart';

import 'data.dart';
import 'detail.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: destinationList.length,
        itemBuilder: (context, index) {
          DestinationModel destination = destinationList[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinationDetailPage(destination: destination),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: destination.imageUrl.startsWith('http')
                        ? Image.network(
                            destination.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            destination.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      destination.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    child: Text(destination.category),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
