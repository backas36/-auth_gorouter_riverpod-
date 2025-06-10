import 'package:auth_gorouter_riverpod/common/dtos/base_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_data.freezed.dart';
part 'token_data.g.dart';

@freezed
abstract class TokenData with _$TokenData {
  const factory TokenData({
    @JsonKey(name: 'accessToken') required String accessToken,
    @JsonKey(name: 'refreshToken') required String refreshToken,
  }) = _TokenData;

  factory TokenData.fromJson(Map<String, dynamic> json) =>
      _$TokenDataFromJson(json);
}

typedef TokenDataResponse = BaseResponse<TokenData>;
