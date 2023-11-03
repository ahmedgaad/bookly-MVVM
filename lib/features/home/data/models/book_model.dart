import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String id;
  final String kind;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;
  final String searchInfo;

  const BookModel({
    required this.id,
    required this.kind,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    required this.searchInfo,
  });

  @override
  List<Object?> get props =>
      [id, kind, etag, selfLink, volumeInfo, saleInfo, accessInfo, searchInfo];

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json['id'],
        kind: json['kind'],
        etag: json['etag'],
        selfLink: json['selfLink'],
        volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
        saleInfo: SaleInfo.fromJson(json['saleInfo']),
        accessInfo: AccessInfo.fromJson(json['accessInfo']),
        searchInfo: json['searchInfo']['textSnippet'],
      );
}

class VolumeInfo extends Equatable {
  final String title;
  final String subTitle;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String descreption;
  final List<IndustryIdentifiers> industryIdentifiers;
  final ReadingModes readingModes;
  final int pageCount;
  final String printType;
  final List<String> categories;
  final int averageRating;
  final int ratingsCount;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final PanelizationSummary panelizationSummary;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  const VolumeInfo({
    required this.title,
    required this.subTitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.descreption,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printType,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  @override
  List<Object?> get props => [
        title,
        subTitle,
        authors,
        publisher,
        publishedDate,
        descreption,
        industryIdentifiers,
        readingModes,
        pageCount,
        printType,
        categories,
        averageRating,
        ratingsCount,
        maturityRating,
        allowAnonLogging,
        contentVersion,
        panelizationSummary,
        imageLinks,
        language,
        previewLink,
        infoLink,
        canonicalVolumeLink
      ];

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'],
        subTitle: json['subtitle'],
        authors: json['authors'],
        publisher: json['publisher'],
        publishedDate: json['publishedDate'],
        descreption: json['description'],
        industryIdentifiers: List<IndustryIdentifiers>.from(
            (json['industryIdentifiers'] as List).map((industryIdentifier) =>
                IndustryIdentifiers.fromJson(industryIdentifier))).toList(),
        readingModes: ReadingModes.fromJson(json['readingModes']),
        pageCount: json['pageCount'],
        printType: json['printType'],
        categories: json['categories'] as List<String>,
        averageRating: json['averageRating'],
        ratingsCount: json['ratingsCount'],
        maturityRating: json['maturityRating'],
        allowAnonLogging: json['allowAnonLogging'],
        contentVersion: json['contentVersion'],
        panelizationSummary:
            PanelizationSummary.fromJson(json['panelizationSummary']),
        imageLinks: ImageLinks.fromJson(json['imageLinks']),
        language: json['language'],
        previewLink: json['previewLink'],
        infoLink: json['infoLink'],
        canonicalVolumeLink: json['canonicalVolumeLink'],
      );
}

class IndustryIdentifiers extends Equatable {
  final String type;
  final String identifier;

  const IndustryIdentifiers({required this.type, required this.identifier});

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifiers(
        type: json['type'],
        identifier: json['identifier'],
      );

  @override
  List<Object?> get props => [type, identifier];
}

class ReadingModes extends Equatable {
  final bool text;
  final bool image;

  const ReadingModes({required this.text, required this.image});

  @override
  List<Object?> get props => [text, image];

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json['text'],
        image: json['image'],
      );
}

class PanelizationSummary extends Equatable {
  final bool containsEpubBubbles;
  final bool containsImageBubbles;

  const PanelizationSummary(
      {required this.containsEpubBubbles, required this.containsImageBubbles});

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json['containsEpubBubbles'],
        containsImageBubbles: json['containsImageBubbles'],
      );

  @override
  List<Object?> get props => [containsEpubBubbles, containsImageBubbles];
}

class ImageLinks extends Equatable {
  final String smallThumbnail;
  final String thumbnail;

  const ImageLinks({required this.smallThumbnail, required this.thumbnail});

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json['smallThumbnail'],
        thumbnail: json['thumbnail'],
      );
}

class SaleInfo extends Equatable {
  final String country;
  final String saleability;
  final String isEbook;

  const SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json['country'],
        saleability: json['saleability'],
        isEbook: json['isEbook'],
      );

  @override
  List<Object?> get props => [country, saleability, isEbook];
}

class AccessInfo extends Equatable {
  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final String webReaderLink;
  final String accessViewStatus;
  final bool quoteSharingAllowed;
  final Pdf pdf;
  final bool epubIsAvailable;

  const AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
    required this.pdf,
    required this.epubIsAvailable,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json['country'],
        viewability: json['viewability'],
        embeddable: json['embeddable'],
        publicDomain: json['publicDomain'],
        textToSpeechPermission: json['textToSpeechPermission'],
        webReaderLink: json['webReaderLink'],
        accessViewStatus: json['accessViewStatus'],
        quoteSharingAllowed: json['quoteSharingAllowed'],
        pdf: Pdf.fromJson(json['pdf']),
        epubIsAvailable: json['epub']['isAvailable'],
      );

  @override
  List<Object?> get props => [
        country,
        viewability,
        embeddable,
        publicDomain,
        textToSpeechPermission,
        webReaderLink,
        accessViewStatus,
        quoteSharingAllowed,
        pdf,
        epubIsAvailable
      ];
}

class Pdf extends Equatable {
  final bool isAvailable;
  final String acsTokenLink;

  const Pdf({
    required this.isAvailable,
    required this.acsTokenLink,
  });

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        isAvailable: json['isAvailable'],
        acsTokenLink: json['acsTokenLink'],
      );

  @override
  List<Object?> get props => [isAvailable, acsTokenLink];
}
