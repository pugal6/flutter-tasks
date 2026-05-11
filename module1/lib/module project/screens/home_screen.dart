import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../widgets/category_card.dart';
import '../widgets/event_card.dart';
import '../widgets/featured_event_card.dart';
import '../widgets/gallery_item.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 700;

    final List<EventModel> featuredEvents = [
      EventModel(
        title: 'Music Festival',
        location: 'Marina Beach',
        image:
            'https://images.unsplash.com/photo-1501386761578-eac5c94b800a',
        date: '12 May',
      ),
      EventModel(
        title: 'Food Carnival',
        location: 'Chennai',
        image:
            'https://images.unsplash.com/photo-1414235077428-338989a2e8c0',
        date: '18 May',
      ),
    ];

    final List<EventModel> events = [
      EventModel(
        title: 'Tech Meetup',
        location: 'Tidel Park',
        image:
            'https://images.unsplash.com/photo-1511578314322-379afb476865',
        date: '20 May',
      ),
      EventModel(
        title: 'Startup Talk',
        location: 'Anna Nagar',
        image:
            'https://images.unsplash.com/photo-1528605248644-14dd04022da1',
        date: '25 May',
      ),
    ];

    final List<String> galleryImages = [
      'https://images.unsplash.com/photo-1492684223066-81342ee5ff30',
      'https://images.unsplash.com/photo-1505236858219-8359eb29e329',
      'https://images.unsplash.com/photo-1529156069898-49953e39b3ac',
      'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      Text(
                        '📍 Chennai, India',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        'Hello, Pugal 👋',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        'Discover local events nearby',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const CircleAvatar(
                    radius: 28,
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// FEATURED EVENTS
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      'Featured Events',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    TextButton(
      onPressed: () {},

      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF4F46E5),
        
      ),

      child: const Text('See All',
      style: TextStyle(
        fontWeight: FontWeight.w600,
      ),),
    ),
  ],
),

              const SizedBox(height: 18),

              SizedBox(
                height: 260,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredEvents.length,

                  itemBuilder: (context, index) {
                    return FeaturedEventCard(
                      event: featuredEvents[index],
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              /// CATEGORIES
             Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      'Categories',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    TextButton(
      onPressed: () {},

      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF4F46E5),
      ),

      child: const Text(
        'Browse',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ],
),

              const SizedBox(height: 18),

              SizedBox(
                height: 120,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: const [

                    CategoryCard(
                      icon: Icons.music_note,
                      title: 'Music',
                    ),

                    CategoryCard(
                      icon: Icons.sports_soccer,
                      title: 'Sports',
                    ),

                    CategoryCard(
                      icon: Icons.code,
                      title: 'Tech',
                    ),

                    CategoryCard(
                      icon: Icons.palette,
                      title: 'Art',
                    ),

                    CategoryCard(
                      icon: Icons.restaurant,
                      title: 'Food',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// UPCOMING EVENTS
             Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      'Upcoming Events',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    TextButton(
      onPressed: () {},

      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF4F46E5),
      ),

      child: const Text(
        'View More',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ],
),

              const SizedBox(height: 18),

              SizedBox(
                height: 280,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: events.length,

                  itemBuilder: (context, index) {
                    return EventCard(
                      event: events[index],
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              /// COMMUNITY GALLERY
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      'Community Gallery',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    TextButton(
      onPressed: () {},

      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF4F46E5),
      ),

      child: const Text(
        'Photos',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ],
),

              const SizedBox(height: 18),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                itemCount: galleryImages.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 4 : 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1,
                ),

                itemBuilder: (context, index) {
                  return GalleryItem(
                    image: galleryImages[index],
                  );
                },
              ),

              const SizedBox(height: 30),

              /// CREATE EVENT
              const Text(
                'Create Event',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              /// EVENT TITLE
              TextField(
                decoration: InputDecoration(
                  hintText: 'Event Title',
                  filled: true,
                  fillColor: Colors.white,

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 18,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// EVENT LOCATION
              TextField(
                decoration: InputDecoration(
                  hintText: 'Event Location',
                  filled: true,
                  fillColor: Colors.white,

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 18,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F46E5),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  onPressed: () {},

                  child: const Text(
                    'Create Event',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}