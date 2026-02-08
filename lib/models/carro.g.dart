// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carro.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCarroCollection on Isar {
  IsarCollection<Carro> get carros => this.collection();
}

const CarroSchema = CollectionSchema(
  name: r'Carro',
  id: -7539166692212907554,
  properties: {
    r'ano': PropertySchema(id: 0, name: r'ano', type: IsarType.long),
    r'imagemPath': PropertySchema(
      id: 1,
      name: r'imagemPath',
      type: IsarType.string,
    ),
    r'marca': PropertySchema(id: 2, name: r'marca', type: IsarType.string),
    r'modelo': PropertySchema(id: 3, name: r'modelo', type: IsarType.string),
    r'placa': PropertySchema(id: 4, name: r'placa', type: IsarType.string),
  },

  estimateSize: _carroEstimateSize,
  serialize: _carroSerialize,
  deserialize: _carroDeserialize,
  deserializeProp: _carroDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _carroGetId,
  getLinks: _carroGetLinks,
  attach: _carroAttach,
  version: '3.3.0',
);

int _carroEstimateSize(
  Carro object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imagemPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.marca.length * 3;
  bytesCount += 3 + object.modelo.length * 3;
  bytesCount += 3 + object.placa.length * 3;
  return bytesCount;
}

void _carroSerialize(
  Carro object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ano);
  writer.writeString(offsets[1], object.imagemPath);
  writer.writeString(offsets[2], object.marca);
  writer.writeString(offsets[3], object.modelo);
  writer.writeString(offsets[4], object.placa);
}

Carro _carroDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Carro(
    ano: reader.readLong(offsets[0]),
    imagemPath: reader.readStringOrNull(offsets[1]),
    marca: reader.readString(offsets[2]),
    modelo: reader.readString(offsets[3]),
    placa: reader.readString(offsets[4]),
  );
  object.id = id;
  return object;
}

P _carroDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _carroGetId(Carro object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _carroGetLinks(Carro object) {
  return [];
}

void _carroAttach(IsarCollection<dynamic> col, Id id, Carro object) {
  object.id = id;
}

extension CarroQueryWhereSort on QueryBuilder<Carro, Carro, QWhere> {
  QueryBuilder<Carro, Carro, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CarroQueryWhere on QueryBuilder<Carro, Carro, QWhereClause> {
  QueryBuilder<Carro, Carro, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Carro, Carro, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Carro, Carro, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CarroQueryFilter on QueryBuilder<Carro, Carro, QFilterCondition> {
  QueryBuilder<Carro, Carro, QAfterFilterCondition> anoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ano', value: value),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> anoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ano',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> anoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ano',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> anoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ano',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'imagemPath'),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'imagemPath'),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'imagemPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'imagemPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'imagemPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'imagemPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'imagemPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'imagemPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'imagemPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'imagemPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'imagemPath', value: ''),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> imagemPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'imagemPath', value: ''),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> marcaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'marca',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> marcaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'marca',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> marcaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'marca',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> marcaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'marca',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> marcaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'marca',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> marcaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'marca',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> marcaContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'marca',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> marcaMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'marca',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> marcaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'marca', value: ''),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> marcaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'marca', value: ''),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> modeloEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> modeloGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> modeloLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> modeloBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'modelo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> modeloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> modeloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> modeloContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> modeloMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'modelo',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> modeloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modelo', value: ''),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> modeloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'modelo', value: ''),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> placaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'placa',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> placaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'placa',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> placaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'placa',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> placaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'placa',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> placaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'placa',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> placaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'placa',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> placaContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'placa',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> placaMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'placa',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> placaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'placa', value: ''),
      );
    });
  }

  QueryBuilder<Carro, Carro, QAfterFilterCondition> placaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'placa', value: ''),
      );
    });
  }
}

extension CarroQueryObject on QueryBuilder<Carro, Carro, QFilterCondition> {}

extension CarroQueryLinks on QueryBuilder<Carro, Carro, QFilterCondition> {}

extension CarroQuerySortBy on QueryBuilder<Carro, Carro, QSortBy> {
  QueryBuilder<Carro, Carro, QAfterSortBy> sortByAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> sortByAnoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.desc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> sortByImagemPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagemPath', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> sortByImagemPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagemPath', Sort.desc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> sortByMarca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> sortByMarcaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.desc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> sortByModelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> sortByModeloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.desc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> sortByPlaca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placa', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> sortByPlacaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placa', Sort.desc);
    });
  }
}

extension CarroQuerySortThenBy on QueryBuilder<Carro, Carro, QSortThenBy> {
  QueryBuilder<Carro, Carro, QAfterSortBy> thenByAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenByAnoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.desc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenByImagemPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagemPath', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenByImagemPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagemPath', Sort.desc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenByMarca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenByMarcaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.desc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenByModelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenByModeloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.desc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenByPlaca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placa', Sort.asc);
    });
  }

  QueryBuilder<Carro, Carro, QAfterSortBy> thenByPlacaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placa', Sort.desc);
    });
  }
}

extension CarroQueryWhereDistinct on QueryBuilder<Carro, Carro, QDistinct> {
  QueryBuilder<Carro, Carro, QDistinct> distinctByAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ano');
    });
  }

  QueryBuilder<Carro, Carro, QDistinct> distinctByImagemPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagemPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Carro, Carro, QDistinct> distinctByMarca({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'marca', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Carro, Carro, QDistinct> distinctByModelo({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Carro, Carro, QDistinct> distinctByPlaca({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'placa', caseSensitive: caseSensitive);
    });
  }
}

extension CarroQueryProperty on QueryBuilder<Carro, Carro, QQueryProperty> {
  QueryBuilder<Carro, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Carro, int, QQueryOperations> anoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ano');
    });
  }

  QueryBuilder<Carro, String?, QQueryOperations> imagemPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagemPath');
    });
  }

  QueryBuilder<Carro, String, QQueryOperations> marcaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'marca');
    });
  }

  QueryBuilder<Carro, String, QQueryOperations> modeloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelo');
    });
  }

  QueryBuilder<Carro, String, QQueryOperations> placaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'placa');
    });
  }
}
