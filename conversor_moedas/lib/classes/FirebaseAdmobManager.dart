import 'package:firebase_admob/firebase_admob.dart';

class FirebaseAdmobManager {
  bool _isInit = false;
  BannerAd _bottomBannerAd;
  InterstitialAd interstitialAd;
  final String _interstitialId = "ca-app-pub-5069015322638131/3280246528";
  final String _bannerId = "ca-app-pub-5069015322638131/1812279856";
  final String _appId = "ca-app-pub-5069015322638131~5751524862";


  //Modify the following for the actual Admob advertisement.
  String appID = FirebaseAdMob.testAppId;
  String bannerID = BannerAd.testAdUnitId;
  String interstitialID = InterstitialAd.testAdUnitId;
  String rewardedVideoAdID = RewardedVideoAd.testAdUnitId;

  Function(MobileAdEvent) _interstitialAdListener;

  init({
    MobileAdListener interstitialAdListener,
    RewardedVideoAdListener rewardedVideoListner,
  }) async {
    _isInit = await FirebaseAdMob.instance.initialize(appId: _appId);

    _bottomBannerAd = createBannerAd();

    _interstitialAdListener = interstitialAdListener;
    interstitialAd = createInterstitialAd();
    RewardedVideoAd.instance.listener = rewardedVideoListner;
  }

  dispose() {
    _bottomBannerAd.dispose();
    interstitialAd.dispose();
    _isInit = false;
  }

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    //testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['promoção', 'compras', 'produtos', 'church'],
    //contentUrl: 'http://www.vatican.va/',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  /*** Banner AD ***/
  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: _bannerId,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  showBannerAd() {
    _bottomBannerAd ??= createBannerAd();
    _bottomBannerAd
      ..load()
      ..show();
  }

  removeBannerAd() {
    _bottomBannerAd?.dispose();
    _bottomBannerAd = null;
  }

  /*** Interstitial AD ***/
  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: _interstitialId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }

  loadInterstitialAd() async {
    interstitialAd?.dispose();
    interstitialAd = createInterstitialAd()..load();
  }

  showInterstitialAd() {
    interstitialAd ??= createInterstitialAd(); 
    interstitialAd..load()..show();
  }

  /*** RewardedVideo AD ***/
  loadRewardedVideoAd() {
    RewardedVideoAd.instance
        .load(adUnitId: rewardedVideoAdID, targetingInfo: targetingInfo);
  }

  showRewardedVideoAd() {
    RewardedVideoAd.instance.show();
  }
}
