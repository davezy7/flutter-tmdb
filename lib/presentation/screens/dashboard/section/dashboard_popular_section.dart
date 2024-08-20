import 'package:flutter/material.dart';
import 'package:tmdb/presentation/component/tmdb_image_loader.dart';

class DashboardPopularSection extends StatefulWidget {
  const DashboardPopularSection({super.key});

  @override
  State<DashboardPopularSection> createState() =>
      _DashboardPopularSectionState();
}

class _DashboardPopularSectionState extends State<DashboardPopularSection> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: ScrollController(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: _popularItem(index),
      ),
      itemCount: 10,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _popularItem(int index) {
    String imgurl =
        "https://fastly.picsum.photos/id/491/300/400.jpg?hmac=XOvLicnWnbjh7rbbDacn27aXVjNzdWLLZchlTn0cif4";
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 16, right: 8),
            alignment: Alignment.topRight,
            child: TmdbImageLoader(
              imageUrl: imgurl,
              height: 225,
              width: 150,
            )),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            (index + 1).toString(),
            style: TextStyle(
              fontSize: 72,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Colors.cyan,
            ),
          ),
        ),
      ],
    );
  }
}
