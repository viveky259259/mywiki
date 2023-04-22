class ApiConstant {
  static const String baseSearchUrl =
      'https://en.wikipedia.org/w/api.php?action=query&formatversion=2&generator=prefixsearch&gpslimit=10&gpssearch=';
  static const String endSearchUrl =
      '&pilimit=10&piprop=thumbnail&pithumbsize=200&prop=pageimages%7Cpageterms&redirects=&wbptterms=description&format=json';

  static const String baseWikiPageUrl = 'https://en.wikipedia.org/?curid=';
}
