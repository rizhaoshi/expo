import 'package:expo/app/widgets/song_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'song_controller.dart';

class SongPage extends GetView<SongController> {
  const SongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SongController>(
        id: 'home_song_list_view',
        builder: (controller) {
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    const SizedBox(height: 5),
                    SongItemView(
                      songItem: controller.songs[index],
                    ),
                  ],
                );
              });
        });
  }
}
