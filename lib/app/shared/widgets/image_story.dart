import 'package:getx_motion_flutter/app/data/model/story_model.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ImageStory extends StatelessWidget {
  final StoryModel story;
  final void Function()? onTap;
  const ImageStory({
    super.key,
    required this.story,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 77,
            height: 77,
            child: Stack(
              children: [
                story.isLoginAccount
                    ? SizedBox(
                        width: 72,
                        height: 72,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(72),
                          child: Image.asset(
                            'assets/images/${story.image}.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 90,
                        height: 90,
                        child: Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.purple,
                                  Colors.red,
                                  Colors.orange
                                ],
                              ),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                            child: Image.network(
                              story.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                story.isLoginAccount
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: const Icon(
                              Icons.add_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            width: 72,
            child: Text(
              story.namaAkun,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
