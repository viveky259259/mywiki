class SearchResultDto {
  bool? batchcomplete;
  ContinuePage? continuePage;
  Query? query;

  SearchResultDto({this.batchcomplete, this.continuePage, this.query});

  SearchResultDto.fromJson(Map<String, dynamic> json) {
    batchcomplete = json['batchcomplete'];
    continuePage = json['continue'] != null
        ? new ContinuePage.fromJson(json['continue'])
        : null;
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batchcomplete'] = this.batchcomplete;
    if (this.continuePage != null) {
      data['continue'] = this.continuePage!.toJson();
    }
    if (this.query != null) {
      data['query'] = this.query!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sroffset'] = this.sroffset;
    data['continue'] = this.continueString;
    return data;
  }
}

class Query {
  Searchinfo? searchinfo;
  List<SearchResult>? searchResult;

  Query({this.searchinfo, this.searchResult});

  Query.fromJson(Map<String, dynamic> json) {
    searchinfo = json['searchinfo'] != null
        ? new Searchinfo.fromJson(json['searchinfo'])
        : null;
    if (json['pages'] != null) {
      searchResult = <SearchResult>[];
      json['pages'].forEach((v) {
        searchResult!.add(new SearchResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchinfo != null) {
      data['searchinfo'] = this.searchinfo!.toJson();
    }
    if (this.searchResult != null) {
      data['searchResult'] = this.searchResult!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalhits'] = this.totalhits;
    data['suggestion'] = this.suggestion;
    data['suggestionsnippet'] = this.suggestionsnippet;
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
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    terms = json['terms'] != null ? new Terms.fromJson(json['terms']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ns'] = this.ns;
    data['title'] = this.title;
    data['pageid'] = this.pageid;
    data['timestamp'] = this.timestamp;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['width'] = this.width;
    data['height'] = this.height;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    return data;
  }
}
