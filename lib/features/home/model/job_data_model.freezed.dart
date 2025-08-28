// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobDataModel _$JobDataModelFromJson(Map<String, dynamic> json) {
  return _JobDataModel.fromJson(json);
}

/// @nodoc
mixin _$JobDataModel {
  List<JobUser> get users => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get skip => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobDataModelCopyWith<JobDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobDataModelCopyWith<$Res> {
  factory $JobDataModelCopyWith(
          JobDataModel value, $Res Function(JobDataModel) then) =
      _$JobDataModelCopyWithImpl<$Res, JobDataModel>;
  @useResult
  $Res call({List<JobUser> users, int total, int skip, int limit});
}

/// @nodoc
class _$JobDataModelCopyWithImpl<$Res, $Val extends JobDataModel>
    implements $JobDataModelCopyWith<$Res> {
  _$JobDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<JobUser>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobDataModelImplCopyWith<$Res>
    implements $JobDataModelCopyWith<$Res> {
  factory _$$JobDataModelImplCopyWith(
          _$JobDataModelImpl value, $Res Function(_$JobDataModelImpl) then) =
      __$$JobDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<JobUser> users, int total, int skip, int limit});
}

/// @nodoc
class __$$JobDataModelImplCopyWithImpl<$Res>
    extends _$JobDataModelCopyWithImpl<$Res, _$JobDataModelImpl>
    implements _$$JobDataModelImplCopyWith<$Res> {
  __$$JobDataModelImplCopyWithImpl(
      _$JobDataModelImpl _value, $Res Function(_$JobDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
  }) {
    return _then(_$JobDataModelImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<JobUser>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobDataModelImpl extends _JobDataModel {
  const _$JobDataModelImpl(
      {required final List<JobUser> users,
      required this.total,
      required this.skip,
      required this.limit})
      : _users = users,
        super._();

  factory _$JobDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobDataModelImplFromJson(json);

  final List<JobUser> _users;
  @override
  List<JobUser> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final int total;
  @override
  final int skip;
  @override
  final int limit;

  @override
  String toString() {
    return 'JobDataModel(users: $users, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobDataModelImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_users), total, skip, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobDataModelImplCopyWith<_$JobDataModelImpl> get copyWith =>
      __$$JobDataModelImplCopyWithImpl<_$JobDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobDataModelImplToJson(
      this,
    );
  }
}

abstract class _JobDataModel extends JobDataModel {
  const factory _JobDataModel(
      {required final List<JobUser> users,
      required final int total,
      required final int skip,
      required final int limit}) = _$JobDataModelImpl;
  const _JobDataModel._() : super._();

  factory _JobDataModel.fromJson(Map<String, dynamic> json) =
      _$JobDataModelImpl.fromJson;

  @override
  List<JobUser> get users;
  @override
  int get total;
  @override
  int get skip;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$JobDataModelImplCopyWith<_$JobDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JobUser _$JobUserFromJson(Map<String, dynamic> json) {
  return _JobUser.fromJson(json);
}

/// @nodoc
mixin _$JobUser {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get firstName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get lastName =>
      throw _privateConstructorUsedError; // @HiveField(3) @Default('') String image,
  @HiveField(3)
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'company')
  Company? get company => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobUserCopyWith<JobUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobUserCopyWith<$Res> {
  factory $JobUserCopyWith(JobUser value, $Res Function(JobUser) then) =
      _$JobUserCopyWithImpl<$Res, JobUser>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String firstName,
      @HiveField(2) String lastName,
      @HiveField(3) @JsonKey(name: 'image') String image,
      @HiveField(4) @JsonKey(name: 'company') Company? company});

  $CompanyCopyWith<$Res>? get company;
}

/// @nodoc
class _$JobUserCopyWithImpl<$Res, $Val extends JobUser>
    implements $JobUserCopyWith<$Res> {
  _$JobUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? image = null,
    Object? company = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyCopyWith<$Res>? get company {
    if (_value.company == null) {
      return null;
    }

    return $CompanyCopyWith<$Res>(_value.company!, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JobUserImplCopyWith<$Res> implements $JobUserCopyWith<$Res> {
  factory _$$JobUserImplCopyWith(
          _$JobUserImpl value, $Res Function(_$JobUserImpl) then) =
      __$$JobUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String firstName,
      @HiveField(2) String lastName,
      @HiveField(3) @JsonKey(name: 'image') String image,
      @HiveField(4) @JsonKey(name: 'company') Company? company});

  @override
  $CompanyCopyWith<$Res>? get company;
}

/// @nodoc
class __$$JobUserImplCopyWithImpl<$Res>
    extends _$JobUserCopyWithImpl<$Res, _$JobUserImpl>
    implements _$$JobUserImplCopyWith<$Res> {
  __$$JobUserImplCopyWithImpl(
      _$JobUserImpl _value, $Res Function(_$JobUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? image = null,
    Object? company = freezed,
  }) {
    return _then(_$JobUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobUserImpl extends _JobUser {
  const _$JobUserImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) this.firstName = '',
      @HiveField(2) this.lastName = '',
      @HiveField(3) @JsonKey(name: 'image') this.image = '',
      @HiveField(4) @JsonKey(name: 'company') this.company})
      : super._();

  factory _$JobUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobUserImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @JsonKey()
  @HiveField(1)
  final String firstName;
  @override
  @JsonKey()
  @HiveField(2)
  final String lastName;
// @HiveField(3) @Default('') String image,
  @override
  @HiveField(3)
  @JsonKey(name: 'image')
  final String image;
  @override
  @HiveField(4)
  @JsonKey(name: 'company')
  final Company? company;

  @override
  String toString() {
    return 'JobUser(id: $id, firstName: $firstName, lastName: $lastName, image: $image, company: $company)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, image, company);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobUserImplCopyWith<_$JobUserImpl> get copyWith =>
      __$$JobUserImplCopyWithImpl<_$JobUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobUserImplToJson(
      this,
    );
  }
}

abstract class _JobUser extends JobUser {
  const factory _JobUser(
          {@HiveField(0) required final int id,
          @HiveField(1) final String firstName,
          @HiveField(2) final String lastName,
          @HiveField(3) @JsonKey(name: 'image') final String image,
          @HiveField(4) @JsonKey(name: 'company') final Company? company}) =
      _$JobUserImpl;
  const _JobUser._() : super._();

  factory _JobUser.fromJson(Map<String, dynamic> json) = _$JobUserImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get firstName;
  @override
  @HiveField(2)
  String get lastName;
  @override // @HiveField(3) @Default('') String image,
  @HiveField(3)
  @JsonKey(name: 'image')
  String get image;
  @override
  @HiveField(4)
  @JsonKey(name: 'company')
  Company? get company;
  @override
  @JsonKey(ignore: true)
  _$$JobUserImplCopyWith<_$JobUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return _Company.fromJson(json);
}

/// @nodoc
mixin _$Company {
  @HiveField(0)
  String get department => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyCopyWith<Company> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) then) =
      _$CompanyCopyWithImpl<$Res, Company>;
  @useResult
  $Res call(
      {@HiveField(0) String department,
      @HiveField(1) String name,
      @HiveField(2) String title});
}

/// @nodoc
class _$CompanyCopyWithImpl<$Res, $Val extends Company>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = null,
    Object? name = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyImplCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$$CompanyImplCopyWith(
          _$CompanyImpl value, $Res Function(_$CompanyImpl) then) =
      __$$CompanyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String department,
      @HiveField(1) String name,
      @HiveField(2) String title});
}

/// @nodoc
class __$$CompanyImplCopyWithImpl<$Res>
    extends _$CompanyCopyWithImpl<$Res, _$CompanyImpl>
    implements _$$CompanyImplCopyWith<$Res> {
  __$$CompanyImplCopyWithImpl(
      _$CompanyImpl _value, $Res Function(_$CompanyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = null,
    Object? name = null,
    Object? title = null,
  }) {
    return _then(_$CompanyImpl(
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyImpl implements _Company {
  const _$CompanyImpl(
      {@HiveField(0) this.department = '',
      @HiveField(1) this.name = '',
      @HiveField(2) this.title = ''});

  factory _$CompanyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final String department;
  @override
  @JsonKey()
  @HiveField(1)
  final String name;
  @override
  @JsonKey()
  @HiveField(2)
  final String title;

  @override
  String toString() {
    return 'Company(department: $department, name: $name, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyImpl &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, department, name, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      __$$CompanyImplCopyWithImpl<_$CompanyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyImplToJson(
      this,
    );
  }
}

abstract class _Company implements Company {
  const factory _Company(
      {@HiveField(0) final String department,
      @HiveField(1) final String name,
      @HiveField(2) final String title}) = _$CompanyImpl;

  factory _Company.fromJson(Map<String, dynamic> json) = _$CompanyImpl.fromJson;

  @override
  @HiveField(0)
  String get department;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
