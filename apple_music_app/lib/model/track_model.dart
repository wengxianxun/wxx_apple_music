class TrackModel {
  late String wrapperType;
  late String kind;
  late int artistId;
  late int collectionId;
  late int trackId;
  late String artistName;
  late String collectionName;
  late String trackName;
  late String collectionCensoredName;
  late String trackCensoredName;
  late String artistViewUrl;
  late String collectionViewUrl;
  late String trackViewUrl;
  late String previewUrl;
  late String artworkUrl30;
  late String artworkUrl60;
  late String artworkUrl100;
  late double collectionPrice;
  late double trackPrice;
  late DateTime releaseDate;
  late String collectionExplicitness;
  late String trackExplicitness;
  late int discCount;
  late int discNumber;
  late int trackCount;
  late int trackNumber;
  late int trackTimeMillis;
  late String country;
  late String currency;
  late String primaryGenreName;
  late bool isStreamable;

  TrackModel({
    required this.wrapperType,
    required this.kind,
    required this.artistId,
    required this.collectionId,
    required this.trackId,
    required this.artistName,
    required this.collectionName,
    required this.trackName,
    required this.collectionCensoredName,
    required this.trackCensoredName,
    required this.artistViewUrl,
    required this.collectionViewUrl,
    required this.trackViewUrl,
    required this.previewUrl,
    required this.artworkUrl30,
    required this.artworkUrl60,
    required this.artworkUrl100,
    required this.collectionPrice,
    required this.trackPrice,
    required this.releaseDate,
    required this.collectionExplicitness,
    required this.trackExplicitness,
    required this.discCount,
    required this.discNumber,
    required this.trackCount,
    required this.trackNumber,
    required this.trackTimeMillis,
    required this.country,
    required this.currency,
    required this.primaryGenreName,
    required this.isStreamable,
  });

  TrackModel.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'] ?? '';
    kind = json['kind'] ?? '';
    artistId = json['artistId'] ?? 0;
    collectionId = json['collectionId'] ?? 0;
    trackId = json['trackId'] ?? 0;
    artistName = json['artistName'] ?? '';
    collectionName = json['collectionName'] ?? '';
    trackName = json['trackName'] ?? '';
    collectionCensoredName = json['collectionCensoredName'] ?? '';
    trackCensoredName = json['trackCensoredName'] ?? '';
    artistViewUrl = json['artistViewUrl'] ?? '';
    collectionViewUrl = json['collectionViewUrl'] ?? '';
    trackViewUrl = json['trackViewUrl'] ?? '';
    previewUrl = json['previewUrl'] ?? '';
    artworkUrl30 = json['artworkUrl30'] ?? '';
    artworkUrl60 = json['artworkUrl60'] ?? '';
    artworkUrl100 = json['artworkUrl100'] ?? '';
    collectionPrice = (json['collectionPrice'] ?? 0).toDouble();
    trackPrice = (json['trackPrice'] ?? 0).toDouble();
    releaseDate =
        DateTime.tryParse(json['releaseDate'] ?? '') ?? DateTime(1970);
    collectionExplicitness = json['collectionExplicitness'] ?? '';
    trackExplicitness = json['trackExplicitness'] ?? '';
    discCount = json['discCount'] ?? 0;
    discNumber = json['discNumber'] ?? 0;
    trackCount = json['trackCount'] ?? 0;
    trackNumber = json['trackNumber'] ?? 0;
    trackTimeMillis = json['trackTimeMillis'] ?? 0;
    country = json['country'] ?? '';
    currency = json['currency'] ?? '';
    primaryGenreName = json['primaryGenreName'] ?? '';
    isStreamable = json['isStreamable'] ?? false;
  }

  Map<String, dynamic> toJson() {
    return {
      'wrapperType': wrapperType,
      'kind': kind,
      'artistId': artistId,
      'collectionId': collectionId,
      'trackId': trackId,
      'artistName': artistName,
      'collectionName': collectionName,
      'trackName': trackName,
      'collectionCensoredName': collectionCensoredName,
      'trackCensoredName': trackCensoredName,
      'artistViewUrl': artistViewUrl,
      'collectionViewUrl': collectionViewUrl,
      'trackViewUrl': trackViewUrl,
      'previewUrl': previewUrl,
      'artworkUrl30': artworkUrl30,
      'artworkUrl60': artworkUrl60,
      'artworkUrl100': artworkUrl100,
      'collectionPrice': collectionPrice,
      'trackPrice': trackPrice,
      'releaseDate': releaseDate.toIso8601String(),
      'collectionExplicitness': collectionExplicitness,
      'trackExplicitness': trackExplicitness,
      'discCount': discCount,
      'discNumber': discNumber,
      'trackCount': trackCount,
      'trackNumber': trackNumber,
      'trackTimeMillis': trackTimeMillis,
      'country': country,
      'currency': currency,
      'primaryGenreName': primaryGenreName,
      'isStreamable': isStreamable,
    };
  }
}
