// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_database_information_d.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarDatabaseInformationDCollection on Isar {
  IsarCollection<IsarDatabaseInformationD> get isarDatabaseInformationDs =>
      this.collection();
}

const IsarDatabaseInformationDSchema = CollectionSchema(
  name: r'IsarDatabaseInformationD',
  id: 1899388176155334733,
  properties: {
    r'databaseInformationListKey': PropertySchema(
      id: 0,
      name: r'databaseInformationListKey',
      type: IsarType.string,
    ),
    r'databaseInformationListValue': PropertySchema(
      id: 1,
      name: r'databaseInformationListValue',
      type: IsarType.string,
    )
  },
  estimateSize: _isarDatabaseInformationDEstimateSize,
  serialize: _isarDatabaseInformationDSerialize,
  deserialize: _isarDatabaseInformationDDeserialize,
  deserializeProp: _isarDatabaseInformationDDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarDatabaseInformationDGetId,
  getLinks: _isarDatabaseInformationDGetLinks,
  attach: _isarDatabaseInformationDAttach,
  version: '3.0.2',
);

int _isarDatabaseInformationDEstimateSize(
  IsarDatabaseInformationD object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.databaseInformationListKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.databaseInformationListValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarDatabaseInformationDSerialize(
  IsarDatabaseInformationD object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.databaseInformationListKey);
  writer.writeString(offsets[1], object.databaseInformationListValue);
}

IsarDatabaseInformationD _isarDatabaseInformationDDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarDatabaseInformationD();
  object.databaseInformationListKey = reader.readStringOrNull(offsets[0]);
  object.databaseInformationListValue = reader.readStringOrNull(offsets[1]);
  object.id = id;
  return object;
}

P _isarDatabaseInformationDDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarDatabaseInformationDGetId(IsarDatabaseInformationD object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarDatabaseInformationDGetLinks(
    IsarDatabaseInformationD object) {
  return [];
}

void _isarDatabaseInformationDAttach(
    IsarCollection<dynamic> col, Id id, IsarDatabaseInformationD object) {
  object.id = id;
}

extension IsarDatabaseInformationDQueryWhereSort on QueryBuilder<
    IsarDatabaseInformationD, IsarDatabaseInformationD, QWhere> {
  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarDatabaseInformationDQueryWhere on QueryBuilder<
    IsarDatabaseInformationD, IsarDatabaseInformationD, QWhereClause> {
  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
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

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
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

extension IsarDatabaseInformationDQueryFilter on QueryBuilder<
    IsarDatabaseInformationD, IsarDatabaseInformationD, QFilterCondition> {
  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'databaseInformationListKey',
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'databaseInformationListKey',
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'databaseInformationListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'databaseInformationListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'databaseInformationListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'databaseInformationListKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'databaseInformationListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'databaseInformationListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
          QAfterFilterCondition>
      databaseInformationListKeyContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'databaseInformationListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
          QAfterFilterCondition>
      databaseInformationListKeyMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'databaseInformationListKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'databaseInformationListKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'databaseInformationListKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'databaseInformationListValue',
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'databaseInformationListValue',
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'databaseInformationListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'databaseInformationListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'databaseInformationListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'databaseInformationListValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'databaseInformationListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'databaseInformationListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
          QAfterFilterCondition>
      databaseInformationListValueContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'databaseInformationListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
          QAfterFilterCondition>
      databaseInformationListValueMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'databaseInformationListValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'databaseInformationListValue',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> databaseInformationListValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'databaseInformationListValue',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
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

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
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

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD,
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
}

extension IsarDatabaseInformationDQueryObject on QueryBuilder<
    IsarDatabaseInformationD, IsarDatabaseInformationD, QFilterCondition> {}

extension IsarDatabaseInformationDQueryLinks on QueryBuilder<
    IsarDatabaseInformationD, IsarDatabaseInformationD, QFilterCondition> {}

extension IsarDatabaseInformationDQuerySortBy on QueryBuilder<
    IsarDatabaseInformationD, IsarDatabaseInformationD, QSortBy> {
  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterSortBy>
      sortByDatabaseInformationListKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseInformationListKey', Sort.asc);
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterSortBy>
      sortByDatabaseInformationListKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseInformationListKey', Sort.desc);
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterSortBy>
      sortByDatabaseInformationListValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseInformationListValue', Sort.asc);
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterSortBy>
      sortByDatabaseInformationListValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseInformationListValue', Sort.desc);
    });
  }
}

extension IsarDatabaseInformationDQuerySortThenBy on QueryBuilder<
    IsarDatabaseInformationD, IsarDatabaseInformationD, QSortThenBy> {
  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterSortBy>
      thenByDatabaseInformationListKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseInformationListKey', Sort.asc);
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterSortBy>
      thenByDatabaseInformationListKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseInformationListKey', Sort.desc);
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterSortBy>
      thenByDatabaseInformationListValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseInformationListValue', Sort.asc);
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterSortBy>
      thenByDatabaseInformationListValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'databaseInformationListValue', Sort.desc);
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarDatabaseInformationDQueryWhereDistinct on QueryBuilder<
    IsarDatabaseInformationD, IsarDatabaseInformationD, QDistinct> {
  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QDistinct>
      distinctByDatabaseInformationListKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'databaseInformationListKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarDatabaseInformationD, IsarDatabaseInformationD, QDistinct>
      distinctByDatabaseInformationListValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'databaseInformationListValue',
          caseSensitive: caseSensitive);
    });
  }
}

extension IsarDatabaseInformationDQueryProperty on QueryBuilder<
    IsarDatabaseInformationD, IsarDatabaseInformationD, QQueryProperty> {
  QueryBuilder<IsarDatabaseInformationD, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarDatabaseInformationD, String?, QQueryOperations>
      databaseInformationListKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'databaseInformationListKey');
    });
  }

  QueryBuilder<IsarDatabaseInformationD, String?, QQueryOperations>
      databaseInformationListValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'databaseInformationListValue');
    });
  }
}
