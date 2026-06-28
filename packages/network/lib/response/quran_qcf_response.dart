import 'package:core/core.dart';

part 'quran_qcf_response.mapper.dart';

@MappableClass()
class QuranQcfResponse with QuranQcfResponseMappable {
  int page;
  String font;
  List<SurahResponse> surahs;
  List<QuranLineResponse> lines;

  QuranQcfResponse({
    this.page = 1,
    this.font = '',
    this.surahs = const [],
    this.lines = const [],
  });
}

@MappableClass()
class SurahResponse with SurahResponseMappable {
  int id;
  String name;
  String nameArabic;
  int verseStart;
  int verseEnd;

  SurahResponse({
    this.id = 0,
    this.name = '',
    this.nameArabic = '',
    this.verseStart = 0,
    this.verseEnd = 0,
  });
}

@MappableClass()
class QuranLineResponse with QuranLineResponseMappable {
  int line;
  List<QuranWordResponse> words;

  QuranLineResponse({
    this.line = 0,
    this.words = const [],
  });

}

@MappableClass()
class QuranWordResponse with QuranWordResponseMappable {
  int code;
  String char;
  String font;
  String text;
  WordType? type;
  int? sura;
  String? verseKey;
  int? position;

  QuranWordResponse({
    this.code = 0,
    this.char = '',
    this.font = '',
    this.text = '',
    this.type,
    this.sura,
    this.verseKey,
    this.position,
  });

}

@MappableEnum(caseStyle: .snakeCase)
enum WordType {
  bismillah,
  end,
  surahHeader,
  word,
  quarter
}

// enum Font {
//   hafs1,
//   hafs2,
//   hafs3,
//   hafs4,
//   hafs5,
//   hafs6,
//   hafs7,
//   hafs8,
//   hafs9,
//   hafs10,
//   hafs11,
//   hafs12,
//   hafs13,
//   hafs14,
//   hafs15,
//   hafs16,
//   hafs17,
//   hafs18,
//   hafs19,
//   hafs20,
//   hafs21,
//   hafs22,
//   hafs23,
//   hafs24,
//   hafs25,
//   hafs26,
//   hafs27,
//   hafs28,
//   hafs29,
//   hafs30,
//   hafs31,
//   hafs32,
//   hafs33,
//   hafs34,
//   hafs35,
//   hafs36,
//   hafs37,
//   hafs38,
//   hafs39,
//   hafs40,
//   hafs41,
//   hafs42,
//   hafs43,
//   hafs44,
//   hafs45,
//   hafs46,
//   hafs47,
//   qbsml,
//   normal
// }
