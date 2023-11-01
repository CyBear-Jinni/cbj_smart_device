// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_devices_d.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarDevicesDCollection on Isar {
  IsarCollection<IsarDevicesD> get isarDevicesDs => this.collection();
}

const IsarDevicesDSchema = CollectionSchema(
  name: r'IsarDevicesD',
  id: -1028190560951825978,
  properties: {
    r'smartDeviceListKey': PropertySchema(
      id: 0,
      name: r'smartDeviceListKey',
      type: IsarType.string,
    ),
    r'smartDeviceListValue': PropertySchema(
      id: 1,
      name: r'smartDeviceListValue',
      type: IsarType.stringList,
    )
  },
  estimateSize: _isarDevicesDEstimateSize,
  serialize: _isarDevicesDSerialize,
  deserialize: _isarDevicesDDeserialize,
  deserializeProp: _isarDevicesDDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarDevicesDGetId,
  getLinks: _isarDevicesDGetLinks,
  attach: _isarDevicesDAttach,
  version: '3.1.0+1',
);

int _isarDevicesDEstimateSize(
  IsarDevicesD object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.smartDeviceListKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.smartDeviceListValue;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          if (value != null) {
            bytesCount += value.length * 3;
          }
        }
      }
    }
  }
  return bytesCount;
}

void _isarDevicesDSerialize(
  IsarDevicesD object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.smartDeviceListKey);
  writer.writeStringList(offsets[1], object.smartDeviceListValue);
}

IsarDevicesD _isarDevicesDDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarDevicesD();
  object.id = id;
  object.smartDeviceListKey = reader.readStringOrNull(offsets[0]);
  object.smartDeviceListValue = reader.readStringOrNullList(offsets[1]);
  return object;
}

P _isarDevicesDDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNullList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarDevicesDGetId(IsarDevicesD object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarDevicesDGetLinks(IsarDevicesD object) {
  return [];
}

void _isarDevicesDAttach(
    IsarCollection<dynamic> col, Id id, IsarDevicesD object) {
  object.id = id;
}

extension IsarDevicesDQueryWhereSort
    on QueryBuilder<IsarDevicesD, IsarDevicesD, QWhere> {
  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarDevicesDQueryWhere
    on QueryBuilder<IsarDevicesD, IsarDevicesD, QWhereClause> {
  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterWhereClause> idBetween(
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

extension IsarDevicesDQueryFilter
    on QueryBuilder<IsarDevicesD, IsarDevicesD, QFilterCondition> {
  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'smartDeviceListKey',
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'smartDeviceListKey',
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smartDeviceListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smartDeviceListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smartDeviceListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smartDeviceListKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'smartDeviceListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'smartDeviceListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'smartDeviceListKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'smartDeviceListKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smartDeviceListKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'smartDeviceListKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'smartDeviceListValue',
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'smartDeviceListValue',
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'smartDeviceListValue',
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'smartDeviceListValue',
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smartDeviceListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smartDeviceListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smartDeviceListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smartDeviceListValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'smartDeviceListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'smartDeviceListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'smartDeviceListValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'smartDeviceListValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smartDeviceListValue',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'smartDeviceListValue',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'smartDeviceListValue',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'smartDeviceListValue',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'smartDeviceListValue',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'smartDeviceListValue',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'smartDeviceListValue',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterFilterCondition>
      smartDeviceListValueLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'smartDeviceListValue',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IsarDevicesDQueryObject
    on QueryBuilder<IsarDevicesD, IsarDevicesD, QFilterCondition> {}

extension IsarDevicesDQueryLinks
    on QueryBuilder<IsarDevicesD, IsarDevicesD, QFilterCondition> {}

extension IsarDevicesDQuerySortBy
    on QueryBuilder<IsarDevicesD, IsarDevicesD, QSortBy> {
  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterSortBy>
      sortBySmartDeviceListKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartDeviceListKey', Sort.asc);
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterSortBy>
      sortBySmartDeviceListKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartDeviceListKey', Sort.desc);
    });
  }
}

extension IsarDevicesDQuerySortThenBy
    on QueryBuilder<IsarDevicesD, IsarDevicesD, QSortThenBy> {
  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterSortBy>
      thenBySmartDeviceListKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartDeviceListKey', Sort.asc);
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QAfterSortBy>
      thenBySmartDeviceListKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartDeviceListKey', Sort.desc);
    });
  }
}

extension IsarDevicesDQueryWhereDistinct
    on QueryBuilder<IsarDevicesD, IsarDevicesD, QDistinct> {
  QueryBuilder<IsarDevicesD, IsarDevicesD, QDistinct>
      distinctBySmartDeviceListKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smartDeviceListKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarDevicesD, IsarDevicesD, QDistinct>
      distinctBySmartDeviceListValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smartDeviceListValue');
    });
  }
}

extension IsarDevicesDQueryProperty
    on QueryBuilder<IsarDevicesD, IsarDevicesD, QQueryProperty> {
  QueryBuilder<IsarDevicesD, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarDevicesD, String?, QQueryOperations>
      smartDeviceListKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smartDeviceListKey');
    });
  }

  QueryBuilder<IsarDevicesD, List<String?>?, QQueryOperations>
      smartDeviceListValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smartDeviceListValue');
    });
  }
}
