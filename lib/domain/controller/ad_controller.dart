import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nooh/domain/model/ads_model.dart';

class AdController extends GetxController {
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  RxBool isBannerAdLoaded = false.obs;
  RxBool isInterstitialAdLoaded = false.obs;
  var adsData = AdsModel().obs;

  String? appId;
  String? bannerAdUnitId;
  String? interstitialAdUnitId;

  @override
  void onInit() {
    super.onInit();
    fetchAdIdsAndLoadAds();
  }

  void fetchTelegramPage() async {
    try {
      var response = await Dio().get('https://nooh.live/api/getAppData');

      if (response.statusCode == 200) {
        adsData.value = AdsModel.fromJson(response.data);
      } else {
        Get.snackbar('Error', 'Failed to load TelegramPage');
      }
    } catch (e, st) {
      print('Error occurred: $e');
      print('Stack Trace: $st');
    }
  }

  Future<void> fetchAdIdsAndLoadAds() async {
    try {
      // Fetch AdMob IDs from the API
      final response = await Dio().get('https://nooh.live/api/getAppData');
      AdsModel adsModel = AdsModel.fromJson(response.data);
      AdsData? adsData = adsModel.data?.first;

      if (adsData != null) {
        appId = adsData.appID;
        bannerAdUnitId = adsData.bannerID;
        interstitialAdUnitId = adsData.interstitialID;

        // Load the ads with the fetched Ad IDs
        _loadBannerAd();
        _loadInterstitialAd();
      } else {
        print('No AdsData found.');
      }
    } catch (e) {
      print('Failed to fetch AdMob IDs: $e');
    }
  }

  void _loadBannerAd() {
    if (bannerAdUnitId != null) {
      bannerAd = BannerAd(
        adUnitId: bannerAdUnitId!,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            isBannerAdLoaded.value = true;
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print('Banner Ad failed to load: $error');
          },
        ),
      )..load();
    } else {
      print('Banner AdUnit ID is null');
    }
  }

  void _loadInterstitialAd() {
    if (interstitialAdUnitId != null) {
      InterstitialAd.load(
        adUnitId: interstitialAdUnitId!,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            isInterstitialAdLoaded.value = true;
          },
          onAdFailedToLoad: (error) {
            print('Interstitial Ad failed to load: $error');
          },
        ),
      );
    } else {
      print('Interstitial AdUnit ID is null');
    }
  }

  void showInterstitialAd() {
    if (isInterstitialAdLoaded.value && interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _loadInterstitialAd(); // Load a new ad after the current one is dismissed
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          print('Interstitial Ad failed to show: $error');
          _loadInterstitialAd(); // Load a new ad if it fails to show
        },
      );
      interstitialAd!.show();
      isInterstitialAdLoaded.value = false; // Reset the flag after showing
    }
  }

  @override
  void onClose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    super.onClose();
  }
}
