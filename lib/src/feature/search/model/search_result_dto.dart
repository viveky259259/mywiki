class SearchResultDto {
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
}

class ContinuePage {
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
}

class Query {
  Searchinfo? searchinfo;
  List<SearchResult>? searchResult;

  Query({this.searchinfo, this.searchResult});

  Query.fromJson(Map<String, dynamic> json) {
    searchinfo = json['searchinfo'] != null
        ? Searchinfo.fromJson(json['searchinfo'])
        : null;
    if (json['pages'] != null) {
      searchResult = <SearchResult>[];
      json['pages'].forEach((v) {
        searchResult!.add(SearchResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (searchinfo != null) {
      data['searchinfo'] = searchinfo!.toJson();
    }
    if (searchResult != null) {
      data['searchResult'] = searchResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Searchinfo {
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
}

class SearchResult {
  int? ns;
  String? title;
  int? pageid;
  String? timestamp;
  Thumbnail? thumbnail;
  Terms? terms;

  SearchResult({this.ns, this.title, this.pageid, this.timestamp});

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
}

class Thumbnail {
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
}

class Terms {
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
}
