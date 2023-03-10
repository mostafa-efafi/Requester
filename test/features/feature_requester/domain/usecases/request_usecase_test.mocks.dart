// Mocks generated by Mockito 5.3.2 from annotations
// in requester/test/features/feature_requester/domain/usecases/request_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:requester/core/resource/data_state.dart' as _i3;
import 'package:requester/features/feature_requester/data/data_source/remote/api_provider.dart'
    as _i2;
import 'package:requester/features/feature_requester/data/repositories/request_repository_impl.dart'
    as _i4;
import 'package:requester/features/feature_requester/domain/entities/request_reponse_entity.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApiProvider_0 extends _i1.SmartFake implements _i2.ApiProvider {
  _FakeApiProvider_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataState_1<T> extends _i1.SmartFake implements _i3.DataState<T> {
  _FakeDataState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RequestRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockRequestRepositoryImpl extends _i1.Mock
    implements _i4.RequestRepositoryImpl {
  MockRequestRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ApiProvider get apiProvider => (super.noSuchMethod(
        Invocation.getter(#apiProvider),
        returnValue: _FakeApiProvider_0(
          this,
          Invocation.getter(#apiProvider),
        ),
      ) as _i2.ApiProvider);
  @override
  _i5.Future<_i3.DataState<_i6.RequestResponsEntity>> fetchGetMethod(
          String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchGetMethod,
          [url],
        ),
        returnValue: _i5.Future<_i3.DataState<_i6.RequestResponsEntity>>.value(
            _FakeDataState_1<_i6.RequestResponsEntity>(
          this,
          Invocation.method(
            #fetchGetMethod,
            [url],
          ),
        )),
      ) as _i5.Future<_i3.DataState<_i6.RequestResponsEntity>>);
  @override
  _i5.Future<_i3.DataState<_i6.RequestResponsEntity>> fetchPostMethod({
    required String? url,
    Map<String, dynamic>? body,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchPostMethod,
          [],
          {
            #url: url,
            #body: body,
          },
        ),
        returnValue: _i5.Future<_i3.DataState<_i6.RequestResponsEntity>>.value(
            _FakeDataState_1<_i6.RequestResponsEntity>(
          this,
          Invocation.method(
            #fetchPostMethod,
            [],
            {
              #url: url,
              #body: body,
            },
          ),
        )),
      ) as _i5.Future<_i3.DataState<_i6.RequestResponsEntity>>);
}
