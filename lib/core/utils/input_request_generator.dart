import 'package:flutter/widgets.dart';
import 'package:requester/core/params/input_fragment_cubit_param.dart';
import 'package:requester/core/utils/text_tools.dart';
import 'package:requester/features/feature_requester/presentation/bloc/auth_all_fragments_cubit/auth_all_fragments_cubit.dart';

class InputRequestGenerator {
  List<Map<String, dynamic>> generate(InputFragmentCubitParam? inputCubits) {
    Map<String, dynamic> query = <String, dynamic>{};
    Map<String, dynamic> header = <String, dynamic>{};
    Map<String, dynamic>? auth = <String, dynamic>{};

    /// clean [null] or [empty] value
    _cleanNullValues(inputCubits);
    auth = _authJsonMaker(inputCubits?.auth);
    try {
      inputCubits?.query?.state.queryParamsList?.forEach((e) {
        query[e.parameter!] = e.value;
      });
      inputCubits?.header?.state.headerParamsList?.forEach((e) {
        header[e.parameter!] = e.value;
      });

      /// added [auths] to [headers]
      if (auth != null) {
        header.addAll(auth);
      }
      return [query, header];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  void _cleanNullValues(InputFragmentCubitParam? inputCubits) {
    /// Query
    inputCubits?.query?.state.queryParamsList!.removeWhere((e) =>
        e.parameter == null ||
        e.value == null ||
        e.parameter == '' ||
        e.value == '');
    // Header
    inputCubits?.header?.state.headerParamsList!.removeWhere((e) =>
        e.parameter == null ||
        e.value == null ||
        e.parameter == '' ||
        e.value == '');
  }

  Map<String, dynamic>? _authJsonMaker(AuthAllFragmentsCubit? authCubit) {
    // Map<String, dynamic> result = <String, dynamic>{};
    /// [basic] auth
    try {
      String? result;
      if (authCubit?.state.basicAuth != null) {
        result =
            'Basic ${TextTools.stringToBase64(authCubit!.state.basicAuth!)}';
      }

      /// [bearer] auth
      if (authCubit?.state.bearerAuth != null) {
        result = 'Bearer ${authCubit!.state.bearerAuth!}';
      }
      return result != null ? {'Authorization': result} : null;
    } catch (e) {
      return null;
    }
  }
}
