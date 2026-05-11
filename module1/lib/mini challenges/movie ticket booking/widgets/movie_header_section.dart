import 'package:flutter/material.dart';
import 'movie_info_card.dart';

class MovieHeaderSection extends StatelessWidget {
  const MovieHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(28),

          child: Stack(
            children: [
              Image.network(
                "https://m.media-amazon.com/images/S/pv-target-images/418f791d94eeeea9599373167f26de3334882d9e4b15ec503d597de98af99dbb.jpg",
                height: 340,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Positioned(
                top: 16,
                right: 16,

                child: CircleAvatar(
                  backgroundColor:
                      Colors.black54,

                  child: IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "Spider-Man: Across the Spider-Verse",

          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: const [
            Icon(
              Icons.movie_creation_outlined,
              color: Colors.orangeAccent,
            ),

            SizedBox(width: 8),

            Text(
              "Animation • Action",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(width: 16),

            Icon(
              Icons.access_time,
              color: Colors.orangeAccent,
            ),

            SizedBox(width: 6),

            Text(
              "2h 20m",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),

        const SizedBox(height: 26),

        Wrap(
          spacing: 16,
          runSpacing: 16,

          children: const [
            MovieInfoCard(
              icon: Icons.star,
              title: "Rating",
              subtitle: "8.7/10",
            ),

            MovieInfoCard(
              icon: Icons.language,
              title: "Language",
              subtitle: "English",
            ),

            MovieInfoCard(
              icon: Icons.theaters,
              title: "Format",
              subtitle: "3D IMAX",
            ),
          ],
        ),
      ],
    );
  }
}