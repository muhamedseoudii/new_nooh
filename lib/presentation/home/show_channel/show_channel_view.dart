import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/controller/all_channel_controller.dart';
import 'package:nooh/presentation/component/home_task_custom.dart';
import 'package:nooh/presentation/home/show_channel/channel_details.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

class ShowChannelView extends StatelessWidget {
  const ShowChannelView({super.key});

  @override
  Widget build(BuildContext context) {
    final AllChannelController allChannelController =
        Get.put(AllChannelController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "show channel".tr,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Obx(
          () {
            if (allChannelController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (allChannelController.allChannel.value.data == null ||
                allChannelController.allChannel.value.data!.isEmpty) {
              return Center(child: Text('No channels available'));
            } else {
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: allChannelController.allChannel.value.data!.length,
                itemBuilder: (context, index) {
                  var allChannel =
                      allChannelController.allChannel.value.data![index];
                  return HomeTaskCustom(
                    onTap: () {
                      TransitionHelper.navigateTo(
                        ChannelDetailsView(id: allChannel.sId ?? ''),
                      );
                    },
                    title: allChannel.title ?? '',
                    image: allChannel.image?.openImage ?? '',
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
