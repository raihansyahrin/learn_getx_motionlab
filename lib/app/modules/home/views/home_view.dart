import 'package:getx_motion_flutter/app/shared/widgets/image_story.dart';
import 'package:getx_motion_flutter/app/shared/widgets/post_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../../../data/model/story_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            primary: true,
            leadingWidth: 120,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                'assets/logo_ig.png',
              ),
            ),
            actions: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: SvgPicture.asset('assets/favorite.svg'),
              ),
              // const SizedBox(
              //   width: 5,
              // ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/svg/message.svg'),
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/add.svg'),
              ),
              // const SizedBox(
              //   width: 10,
              // ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            selectedIconTheme: const IconThemeData(color: Colors.black),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/home.svg'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/search.svg'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/reels.svg'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/shop.svg'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    child: Image.asset(
                      'assets/images/foto_profile.png',
                    ),
                  ),
                ),
                label: '',
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 97.75,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: controller.storyModel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      StoryModel data = controller.storyModel[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ImageStory(
                          story: data,
                          onTap: () {
                            controller.toStoryPageView(data.storyItems);
                          },
                        ),
                      );
                    },
                  ),
                ),
                // const SizedBox(
                //   height: 16,
                // ),
                const Divider(
                  thickness: 0.5,
                  color: Color.fromRGBO(158, 158, 158, 1),
                ),
                Post(
                  postModel: controller.postModel,
                  onPressed: controller.changeIconLike,
                ),

                const SizedBox(
                  height: 18,
                ),
                Post(
                  postModel: controller.postModel,
                  onPressed: controller.changeIconLike,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
