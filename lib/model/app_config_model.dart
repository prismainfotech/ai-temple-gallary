
import 'dart:convert';
import 'package:flutter/foundation.dart';

class AppConfigModel {
  String? id;
  String? appId;
  String? packageName;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? counter;
  String? counterNative;
  String? counterNativeList;
  String? counterBanner;
  String? otherCounter;
  String? image;
  String? baseUrl;
  String? imageUrl;
  String? teamUrl;
  String? appName;
  String? appLogo;
  String? appVersion;
  String? inReviewVersion;
  String? shareAppUrl;
  String? privacyPolicyUrl;
  String? ratingUrl;
  String? updateUrl;
  String? updateTitle;
  String? updateDescription;
  String? forceUpdate;
  String? skipUpdate;
  String? maintenanceMode;
  String? maintenanceTitle;
  String? maintenanceDescription;
  String? maintenanceUrl;
  String? adShow;
  AdsManager? adsManager;
  Extra? extra;
  String? userId;
  String? securityKey;
  String? adtype;
  String? redirectUrl;
  String? tc;
  int? success;

  AppConfigModel({
    this.id,
    this.appId,
    this.packageName,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.counter,
    this.counterNative,
    this.counterNativeList,
    this.counterBanner,
    this.otherCounter,
    this.image,
    this.baseUrl,
    this.imageUrl,
    this.teamUrl,
    this.appName,
    this.appLogo,
    this.appVersion,
    this.inReviewVersion,
    this.shareAppUrl,
    this.privacyPolicyUrl,
    this.ratingUrl,
    this.updateUrl,
    this.updateTitle,
    this.updateDescription,
    this.forceUpdate,
    this.skipUpdate,
    this.maintenanceMode,
    this.maintenanceTitle,
    this.maintenanceDescription,
    this.maintenanceUrl,
    this.adShow,
    this.adsManager,
    this.extra,
    this.userId,
    this.securityKey,
    this.adtype,
    this.redirectUrl,
    this.tc,
    this.success,
  });

  AppConfigModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appId = json['app_id'];
    packageName = json['package_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    counter = json['counter'];
    counterNative = json['counter_native'];
    counterNativeList = json['counter_native_list'];
    counterBanner = json['counter_banner'];
    otherCounter = json['other_counter'];
    image = json['image'];
    baseUrl = json['base_url'];
    imageUrl = json['image_url'];
    teamUrl = json['team_url'];
    appName = json['app_name'];
    appLogo = json['app_logo'];
    appVersion = json['app_version'];
    inReviewVersion = json['in_review_version'];
    shareAppUrl = json['share_app_url'];
    privacyPolicyUrl = json['privacy_policy_url'];
    ratingUrl = json['rating_url'];
    updateUrl = json['update_url'];
    updateTitle = json['update_title'];
    updateDescription = json['update_description'];
    forceUpdate = json['force_update'];
    skipUpdate = json['skip_update'];
    maintenanceMode = json['maintenance_mode'];
    maintenanceTitle = json['maintenance_title'];
    maintenanceDescription = json['maintenance_description'];
    maintenanceUrl = json['maintenance_url'];
    adShow = json['ad_show'];
    if (json['ads_manager'] != null) {
      try {
        if (json['ads_manager'] is String) {
          adsManager = AdsManager.fromJson(jsonDecode(json['ads_manager']));
        } else {
          adsManager = AdsManager.fromJson(json['ads_manager']);
        }
      } catch (e) {
        debugPrint("Error parsing ads_manager: $e");
      }
    }
    if (json['extra'] != null) {
      try {
        if (json['extra'] is String) {
          extra = Extra.fromJson(jsonDecode(json['extra']));
        } else {
          extra = Extra.fromJson(json['extra']);
        }
      } catch (e) {
        debugPrint("Error parsing extra: $e");
      }
    }
    userId = json['user_id'];
    securityKey = json['security_key'];
    adtype = json['adtype'];
    redirectUrl = json['redirect_url'];
    tc = json['tc'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['app_id'] = appId;
    data['package_name'] = packageName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['counter'] = counter;
    data['counter_native'] = counterNative;
    data['counter_native_list'] = counterNativeList;
    data['counter_banner'] = counterBanner;
    data['other_counter'] = otherCounter;
    data['image'] = image;
    data['base_url'] = baseUrl;
    data['image_url'] = imageUrl;
    data['team_url'] = teamUrl;
    data['app_name'] = appName;
    data['app_logo'] = appLogo;
    data['app_version'] = appVersion;
    data['in_review_version'] = inReviewVersion;
    data['share_app_url'] = shareAppUrl;
    data['privacy_policy_url'] = privacyPolicyUrl;
    data['rating_url'] = ratingUrl;
    data['update_url'] = updateUrl;
    data['update_title'] = updateTitle;
    data['update_description'] = updateDescription;
    data['force_update'] = forceUpdate;
    data['skip_update'] = skipUpdate;
    data['maintenance_mode'] = maintenanceMode;
    data['maintenance_title'] = maintenanceTitle;
    data['maintenance_description'] = maintenanceDescription;
    data['maintenance_url'] = maintenanceUrl;
    data['ad_show'] = adShow;
    if (adsManager != null) {
      data['ads_manager'] = jsonEncode(adsManager!.toJson());
    }
    if (extra != null) {
        data['extra'] = jsonEncode(extra!.toJson());
    }
    data['user_id'] = userId;
    data['security_key'] = securityKey;
    data['adtype'] = adtype;
    data['redirect_url'] = redirectUrl;
    data['tc'] = tc;
    data['success'] = success;
    return data;
  }
}

class AdsManager {
  List<AdUnit>? interstitialAds;
  List<AdUnit>? nativeAds;
  List<AdUnit>? bannerAds;
  List<AdUnit>? openAds;

  AdsManager({this.interstitialAds, this.nativeAds, this.bannerAds, this.openAds});

  AdsManager.fromJson(Map<String, dynamic> json) {
    if (json['interstitialAds'] != null) {
      interstitialAds = <AdUnit>[];
      json['interstitialAds'].forEach((v) {
        interstitialAds!.add(AdUnit.fromJson(v));
      });
    }
    if (json['nativeAds'] != null) {
      nativeAds = <AdUnit>[];
      json['nativeAds'].forEach((v) {
        nativeAds!.add(AdUnit.fromJson(v));
      });
    }
    if (json['bannerAds'] != null) {
      bannerAds = <AdUnit>[];
      json['bannerAds'].forEach((v) {
        bannerAds!.add(AdUnit.fromJson(v));
      });
    }
    if (json['openAds'] != null) {
      openAds = <AdUnit>[];
      json['openAds'].forEach((v) {
        openAds!.add(AdUnit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (interstitialAds != null) {
      data['interstitialAds'] =
          interstitialAds!.map((v) => v.toJson()).toList();
    }
    if (nativeAds != null) {
      data['nativeAds'] = nativeAds!.map((v) => v.toJson()).toList();
    }
    if (bannerAds != null) {
      data['bannerAds'] = bannerAds!.map((v) => v.toJson()).toList();
    }
    if (openAds != null) {
      data['openAds'] = openAds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdUnit {
  String? unitId;
  String? unitIdIos;
  String? adName;
  bool? status;

  AdUnit({this.unitId, this.unitIdIos, this.adName, this.status});

  AdUnit.fromJson(Map<String, dynamic> json) {
    unitId = json['unitId'];
    unitIdIos = json['unitIdIos'];
    adName = json['adName'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unitId'] = unitId;
    data['unitIdIos'] = unitIdIos;
    data['adName'] = adName;
    data['status'] = status;
    return data;
  }
}

class Extra {
  List<OtherApps>? otherApps;

  Extra({this.otherApps});

  Extra.fromJson(Map<String, dynamic> json) {
    if (json['otherApps'] != null) {
      otherApps = <OtherApps>[];
      json['otherApps'].forEach((v) {
        otherApps!.add(OtherApps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (otherApps != null) {
      data['otherApps'] = otherApps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OtherApps {
  String? logo;
  String? appName;
  String? url;

  OtherApps({this.logo, this.appName, this.url});

  OtherApps.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    appName = json['appName'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logo'] = logo;
    data['appName'] = appName;
    data['url'] = url;
    return data;
  }
}
