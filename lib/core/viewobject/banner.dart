class BannerData {
  BannerData({
    this.success,
    this.message,
    this.data,
  });
  bool? success;
  String? message;
  List<Banner>? data;

  BannerData fromMap(Map<String, dynamic> dynamicData) {
    return BannerData(
      success: dynamicData['success'],
      message: 'Success',
      data: Banner().fromMapList(dynamicData['data']),
    );
  }
}

class Banner {
  Banner({this.id, this.name, this.image});

  int? id;
  String? name;
  String? image;

  Banner fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      // String photo = dynamicData["image"] ?? '';
      return Banner(
        id: dynamicData["id"],
        name: dynamicData["name"],
        image: dynamicData["image"],
        // createdAt: DateTime.parse(dynamicData["created_at"]),
        // updatedAt: DateTime.parse(dynamicData["updated_at"]),
      );
    } else {
      return Banner(id: 0);
    }
  }

  Map<String, dynamic>? toMap(Banner object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;
    data['name'] = object.name;
    data['image'] = object.image;
    // data['photo'] = object.image;
    // data['created_at'] = object.createdAt.toString();
    // data['updated_at'] = object.updatedAt.toString();
    return data;
  }

  List<Banner> fromMapList(List<dynamic> dynamicDataList) {
    final List<Banner> subUserList = <Banner>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }

  List<Map<String, dynamic>?> toMapList(List<Banner> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (Banner? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}
