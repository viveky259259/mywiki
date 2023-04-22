// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_collection_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSearchResultCollectionCollection on Isar {
  IsarCollection<SearchResultCollection> get searchResultCollections =>
      this.collection();
}

const SearchResultCollectionSchema = CollectionSchema(
  name: r'SearchResultCollection',
  id: -3162725641528265740,
  properties: {
    r'searchResults': PropertySchema(
      id: 0,
      name: r'searchResults',
      type: IsarType.objectList,
      target: r'SearchResultCollectionItem',
    ),
    r'searchText': PropertySchema(
      id: 1,
      name: r'searchText',
      type: IsarType.string,
    )
  },
  estimateSize: _searchResultCollectionEstimateSize,
  serialize: _searchResultCollectionSerialize,
  deserialize: _searchResultCollectionDeserialize,
  deserializeProp: _searchResultCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'SearchResultCollectionItem': SearchResultCollectionItemSchema,
    r'ThumbnailCollectionItem': ThumbnailCollectionItemSchema,
    r'TermsCollectionItem': TermsCollectionItemSchema
  },
  getId: _searchResultCollectionGetId,
  getLinks: _searchResultCollectionGetLinks,
  attach: _searchResultCollectionAttach,
  version: '3.1.0',
);

int _searchResultCollectionEstimateSize(
  SearchResultCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.searchResults.length * 3;
  {
    final offsets = allOffsets[SearchResultCollectionItem]!;
    for (var i = 0; i < object.searchResults.length; i++) {
      final value = object.searchResults[i];
      bytesCount += SearchResultCollectionItemSchema.estimateSize(
          value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.searchText.length * 3;
  return bytesCount;
}

void _searchResultCollectionSerialize(
  SearchResultCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<SearchResultCollectionItem>(
    offsets[0],
    allOffsets,
    SearchResultCollectionItemSchema.serialize,
    object.searchResults,
  );
  writer.writeString(offsets[1], object.searchText);
}

SearchResultCollection _searchResultCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SearchResultCollection(
    reader.readString(offsets[1]),
    reader.readObjectList<SearchResultCollectionItem>(
          offsets[0],
          SearchResultCollectionItemSchema.deserialize,
          allOffsets,
          SearchResultCollectionItem(),
        ) ??
        [],
  );
  object.id = id;
  return object;
}

P _searchResultCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<SearchResultCollectionItem>(
            offset,
            SearchResultCollectionItemSchema.deserialize,
            allOffsets,
            SearchResultCollectionItem(),
          ) ??
          []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _searchResultCollectionGetId(SearchResultCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _searchResultCollectionGetLinks(
    SearchResultCollection object) {
  return [];
}

void _searchResultCollectionAttach(
    IsarCollection<dynamic> col, Id id, SearchResultCollection object) {
  object.id = id;
}

extension SearchResultCollectionQueryWhereSort
    on QueryBuilder<SearchResultCollection, SearchResultCollection, QWhere> {
  QueryBuilder<SearchResultCollection, SearchResultCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SearchResultCollectionQueryWhere on QueryBuilder<
    SearchResultCollection, SearchResultCollection, QWhereClause> {
  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SearchResultCollectionQueryFilter on QueryBuilder<
    SearchResultCollection, SearchResultCollection, QFilterCondition> {
  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchResultsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchResults',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchResultsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchResults',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchResultsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchResults',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchResultsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchResults',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchResultsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchResults',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchResultsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchResults',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'searchText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'searchText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'searchText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'searchText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'searchText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'searchText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
          QAfterFilterCondition>
      searchTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'searchText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
          QAfterFilterCondition>
      searchTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'searchText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'searchText',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection,
      QAfterFilterCondition> searchTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'searchText',
        value: '',
      ));
    });
  }
}

extension SearchResultCollectionQueryObject on QueryBuilder<
    SearchResultCollection, SearchResultCollection, QFilterCondition> {
  QueryBuilder<SearchResultCollection, SearchResultCollection,
          QAfterFilterCondition>
      searchResultsElement(FilterQuery<SearchResultCollectionItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'searchResults');
    });
  }
}

extension SearchResultCollectionQueryLinks on QueryBuilder<
    SearchResultCollection, SearchResultCollection, QFilterCondition> {}

extension SearchResultCollectionQuerySortBy
    on QueryBuilder<SearchResultCollection, SearchResultCollection, QSortBy> {
  QueryBuilder<SearchResultCollection, SearchResultCollection, QAfterSortBy>
      sortBySearchText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchText', Sort.asc);
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection, QAfterSortBy>
      sortBySearchTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchText', Sort.desc);
    });
  }
}

extension SearchResultCollectionQuerySortThenBy on QueryBuilder<
    SearchResultCollection, SearchResultCollection, QSortThenBy> {
  QueryBuilder<SearchResultCollection, SearchResultCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection, QAfterSortBy>
      thenBySearchText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchText', Sort.asc);
    });
  }

  QueryBuilder<SearchResultCollection, SearchResultCollection, QAfterSortBy>
      thenBySearchTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchText', Sort.desc);
    });
  }
}

extension SearchResultCollectionQueryWhereDistinct
    on QueryBuilder<SearchResultCollection, SearchResultCollection, QDistinct> {
  QueryBuilder<SearchResultCollection, SearchResultCollection, QDistinct>
      distinctBySearchText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'searchText', caseSensitive: caseSensitive);
    });
  }
}

extension SearchResultCollectionQueryProperty on QueryBuilder<
    SearchResultCollection, SearchResultCollection, QQueryProperty> {
  QueryBuilder<SearchResultCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SearchResultCollection, List<SearchResultCollectionItem>,
      QQueryOperations> searchResultsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'searchResults');
    });
  }

  QueryBuilder<SearchResultCollection, String, QQueryOperations>
      searchTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'searchText');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SearchResultCollectionItemSchema = Schema(
  name: r'SearchResultCollectionItem',
  id: -7713726371767970647,
  properties: {
    r'pageId': PropertySchema(
      id: 0,
      name: r'pageId',
      type: IsarType.long,
    ),
    r'terms': PropertySchema(
      id: 1,
      name: r'terms',
      type: IsarType.object,
      target: r'TermsCollectionItem',
    ),
    r'thumbnail': PropertySchema(
      id: 2,
      name: r'thumbnail',
      type: IsarType.object,
      target: r'ThumbnailCollectionItem',
    ),
    r'title': PropertySchema(
      id: 3,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _searchResultCollectionItemEstimateSize,
  serialize: _searchResultCollectionItemSerialize,
  deserialize: _searchResultCollectionItemDeserialize,
  deserializeProp: _searchResultCollectionItemDeserializeProp,
);

int _searchResultCollectionItemEstimateSize(
  SearchResultCollectionItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.terms;
    if (value != null) {
      bytesCount += 3 +
          TermsCollectionItemSchema.estimateSize(
              value, allOffsets[TermsCollectionItem]!, allOffsets);
    }
  }
  {
    final value = object.thumbnail;
    if (value != null) {
      bytesCount += 3 +
          ThumbnailCollectionItemSchema.estimateSize(
              value, allOffsets[ThumbnailCollectionItem]!, allOffsets);
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _searchResultCollectionItemSerialize(
  SearchResultCollectionItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.pageId);
  writer.writeObject<TermsCollectionItem>(
    offsets[1],
    allOffsets,
    TermsCollectionItemSchema.serialize,
    object.terms,
  );
  writer.writeObject<ThumbnailCollectionItem>(
    offsets[2],
    allOffsets,
    ThumbnailCollectionItemSchema.serialize,
    object.thumbnail,
  );
  writer.writeString(offsets[3], object.title);
}

SearchResultCollectionItem _searchResultCollectionItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SearchResultCollectionItem(
    pageId: reader.readLongOrNull(offsets[0]),
    terms: reader.readObjectOrNull<TermsCollectionItem>(
      offsets[1],
      TermsCollectionItemSchema.deserialize,
      allOffsets,
    ),
    thumbnail: reader.readObjectOrNull<ThumbnailCollectionItem>(
      offsets[2],
      ThumbnailCollectionItemSchema.deserialize,
      allOffsets,
    ),
    title: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _searchResultCollectionItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<TermsCollectionItem>(
        offset,
        TermsCollectionItemSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<ThumbnailCollectionItem>(
        offset,
        ThumbnailCollectionItemSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SearchResultCollectionItemQueryFilter on QueryBuilder<
    SearchResultCollectionItem, SearchResultCollectionItem, QFilterCondition> {
  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> pageIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pageId',
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> pageIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pageId',
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> pageIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pageId',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> pageIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pageId',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> pageIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pageId',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> pageIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> termsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'terms',
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> termsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'terms',
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> thumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thumbnail',
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> thumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thumbnail',
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
          QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
          QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension SearchResultCollectionItemQueryObject on QueryBuilder<
    SearchResultCollectionItem, SearchResultCollectionItem, QFilterCondition> {
  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> terms(FilterQuery<TermsCollectionItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'terms');
    });
  }

  QueryBuilder<SearchResultCollectionItem, SearchResultCollectionItem,
      QAfterFilterCondition> thumbnail(FilterQuery<ThumbnailCollectionItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'thumbnail');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ThumbnailCollectionItemSchema = Schema(
  name: r'ThumbnailCollectionItem',
  id: -2321028556901391935,
  properties: {
    r'height': PropertySchema(
      id: 0,
      name: r'height',
      type: IsarType.long,
    ),
    r'source': PropertySchema(
      id: 1,
      name: r'source',
      type: IsarType.string,
    ),
    r'width': PropertySchema(
      id: 2,
      name: r'width',
      type: IsarType.long,
    )
  },
  estimateSize: _thumbnailCollectionItemEstimateSize,
  serialize: _thumbnailCollectionItemSerialize,
  deserialize: _thumbnailCollectionItemDeserialize,
  deserializeProp: _thumbnailCollectionItemDeserializeProp,
);

int _thumbnailCollectionItemEstimateSize(
  ThumbnailCollectionItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.source;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _thumbnailCollectionItemSerialize(
  ThumbnailCollectionItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.height);
  writer.writeString(offsets[1], object.source);
  writer.writeLong(offsets[2], object.width);
}

ThumbnailCollectionItem _thumbnailCollectionItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ThumbnailCollectionItem(
    height: reader.readLongOrNull(offsets[0]),
    source: reader.readStringOrNull(offsets[1]),
    width: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _thumbnailCollectionItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ThumbnailCollectionItemQueryFilter on QueryBuilder<
    ThumbnailCollectionItem, ThumbnailCollectionItem, QFilterCondition> {
  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> heightEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> heightGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> heightLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> heightBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> sourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> sourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> sourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> sourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> sourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> sourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
          QAfterFilterCondition>
      sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
          QAfterFilterCondition>
      sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> widthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'width',
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> widthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'width',
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> widthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'width',
        value: value,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> widthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'width',
        value: value,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> widthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'width',
        value: value,
      ));
    });
  }

  QueryBuilder<ThumbnailCollectionItem, ThumbnailCollectionItem,
      QAfterFilterCondition> widthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'width',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ThumbnailCollectionItemQueryObject on QueryBuilder<
    ThumbnailCollectionItem, ThumbnailCollectionItem, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TermsCollectionItemSchema = Schema(
  name: r'TermsCollectionItem',
  id: -6194131494816160051,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.stringList,
    )
  },
  estimateSize: _termsCollectionItemEstimateSize,
  serialize: _termsCollectionItemSerialize,
  deserialize: _termsCollectionItemDeserialize,
  deserializeProp: _termsCollectionItemDeserializeProp,
);

int _termsCollectionItemEstimateSize(
  TermsCollectionItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.description;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _termsCollectionItemSerialize(
  TermsCollectionItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.description);
}

TermsCollectionItem _termsCollectionItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TermsCollectionItem(
    description: reader.readStringList(offsets[0]),
  );
  return object;
}

P _termsCollectionItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TermsCollectionItemQueryFilter on QueryBuilder<TermsCollectionItem,
    TermsCollectionItem, QFilterCondition> {
  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'description',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'description',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'description',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'description',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'description',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TermsCollectionItem, TermsCollectionItem, QAfterFilterCondition>
      descriptionLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'description',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension TermsCollectionItemQueryObject on QueryBuilder<TermsCollectionItem,
    TermsCollectionItem, QFilterCondition> {}
