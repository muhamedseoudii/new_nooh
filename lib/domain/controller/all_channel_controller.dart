import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/model/all_channel_model.dart';

class AllChannelController extends GetxController {
  var isLoading = true.obs;
  var allChannel = AllChannel().obs;

  final Dio _dio = Dio();

  @override
  void onInit() {
    fetchAllChannel();
    super.onInit();
  }

  void fetchAllChannel() async {
    try {
      isLoading(true);
      final response =
          await _dio.get("https://nooh.live/api/chaneel/getChannels");

      if (response.statusCode == 200) {
        allChannel.value = AllChannel.fromJson(response.data);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e, st) {
      print('Error: $e');
      print('Error st: $st');
    } finally {
      isLoading(false);
    }
  }
}
