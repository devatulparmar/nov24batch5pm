import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/constants.dart';
import 'package:nov24batch5pm/utils/image_urls.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Screen'),
      ),
      body: Column(
        children: [
          /// Asset Image
          Row(
            children: [
              Image(
                height: 100,
                width: 100,
                image: const AssetImage(img1),
                errorBuilder:
                    (BuildContext context, Object obj, StackTrace? stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    color: Colors.red,
                    size: 50,
                  );
                },
              ),
              Image.asset(
                img1,
                width: 100,
                height: 100,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.image_not_supported,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ],
          ),

          /// Network Image
          Row(
            children: [
              Image(
                height: 100,
                width: 100,
                image: const NetworkImage(imgNetwork),
                errorBuilder: (BuildContext context, Object obj, StackTrace? stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    color: Colors.red,
                    size: 50,
                  );
                },
              ),
              Image.network(
                imgNetwork,
                height: 100,
                width: 100,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.image_not_supported,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ],
          ),

          /// Cached Network Image
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage(img1),
          ),

          /// ClipRRect
          CircleAvatar(
            radius: 100,
            backgroundImage: const AssetImage(img1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: imgNetwork,
                progressIndicatorBuilder:
                    (context, str, DownloadProgress progress) {
                  print(progress.downloaded);
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                },
                errorWidget: (_, __, ___) => const Icon(
                  Icons.image_not_supported,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
          ),

          /// Container
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: const DecorationImage(
                image: AssetImage(img1),
                fit: BoxFit.cover,
                opacity: 1,
                // invertColors: true
              ),
            ),
          ),
        ],
      ),
    );
  }
}
