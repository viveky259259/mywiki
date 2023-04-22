import 'package:equatable/equatable.dart';

class SearchResultDto extends Equatable {
  bool? batchcomplete;
  ContinuePage? continuePage;
  Query? query;

  SearchResultDto({this.batchcomplete, this.continuePage, this.query});

  SearchResultDto.fromJson(Map<String, dynamic> json) {
    batchcomplete = json['batchcomplete'];
    continuePage = json['continue'] != null
        ? ContinuePage.fromJson(json['continue'])
        : null;
    query = json['query'] != null ? Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['batchcomplete'] = batchcomplete;
    if (continuePage != null) {
      data['continue'] = continuePage!.toJson();
    }
    if (query != null) {
      data['query'] = query!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [batchcomplete, continuePage, query];
}

class ContinuePage extends Equatable {
  int? sroffset;
  String? continueString;

  ContinuePage({this.sroffset, this.continueString});

  ContinuePage.fromJson(Map<String, dynamic> json) {
    sroffset = json['sroffset'];
    continueString = json['continue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sroffset'] = sroffset;
    data['continue'] = continueString;
    return data;
  }

  @override
  List<Object?> get props => [sroffset, continueString];
}

class Query extends Equatable {
  Searchinfo? searchinfo;
  List<SearchResult>? searchResults;

  Query({this.searchinfo, this.searchResults});

  Query.fromJson(Map<String, dynamic> json) {
    searchinfo = json['searchinfo'] != null
        ? Searchinfo.fromJson(json['searchinfo'])
        : null;
    if (json['pages'] != null) {
      searchResults = <SearchResult>[];
      json['pages'].forEach((v) {
        searchResults!.add(SearchResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (searchinfo != null) {
      data['searchinfo'] = searchinfo!.toJson();
    }
    if (searchResults != null) {
      data['searchResult'] = searchResults!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [searchinfo, searchResults];
}

class Searchinfo extends Equatable {
  int? totalhits;
  String? suggestion;
  String? suggestionsnippet;

  Searchinfo({this.totalhits, this.suggestion, this.suggestionsnippet});

  Searchinfo.fromJson(Map<String, dynamic> json) {
    totalhits = json['totalhits'];
    suggestion = json['suggestion'];
    suggestionsnippet = json['suggestionsnippet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalhits'] = totalhits;
    data['suggestion'] = suggestion;
    data['suggestionsnippet'] = suggestionsnippet;
    return data;
  }

  @override
  List<Object?> get props => [totalhits, suggestion, suggestionsnippet];
}

class SearchResult extends Equatable {
  int? ns;
  String? title;
  int? pageid;
  String? timestamp;
  Thumbnail? thumbnail;
  Terms? terms;

  SearchResult(
      {this.ns,
      this.title,
      this.pageid,
      this.timestamp,
      this.thumbnail,
      this.terms});

  SearchResult.fromJson(Map<String, dynamic> json) {
    ns = json['ns'];
    title = json['title'];
    pageid = json['pageid'];
    timestamp = json['timestamp'];
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    terms = json['terms'] != null ? Terms.fromJson(json['terms']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ns'] = ns;
    data['title'] = title;
    data['pageid'] = pageid;
    data['timestamp'] = timestamp;
    return data;
  }

  @override
  List<Object?> get props => [ns, title, pageid, timestamp, thumbnail, terms];
}

class Thumbnail extends Equatable {
  String? source;
  int? width;
  int? height;

  Thumbnail({this.source, this.width, this.height});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['source'] = source;
    data['width'] = width;
    data['height'] = height;
    return data;
  }

  @override
  List<Object?> get props => [source, width, height];
}

class Terms extends Equatable {
  List<String>? description;

  Terms({this.description});

  Terms.fromJson(Map<String, dynamic> json) {
    description = json['description'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    return data;
  }

  @override
  List<Object?> get props => [description];
}
