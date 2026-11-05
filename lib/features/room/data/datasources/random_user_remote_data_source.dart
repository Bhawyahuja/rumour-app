import 'package:dio/dio.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../dtos/random_user_dto.dart';

/// Talks to the Random User Generator API (https://randomuser.me).
abstract interface class RandomUserRemoteDataSource {
  /// `GET /api/` — one random user.
  Future<RandomUserDto> fetchRandomUser();
}

class RandomUserRemoteDataSourceImpl implements RandomUserRemoteDataSource {
  const RandomUserRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<RandomUserDto> fetchRandomUser() async {
    final response = await _dio.get<Map<String, dynamic>>(
      AppConstants.randomUserPath,
      queryParameters: const <String, dynamic>{
        // Only what we use — smaller payload, nothing sensitive stored.
        'inc': 'name,login',
        // Latin-script nationalities so names render in the design fonts.
        'nat': AppConstants.randomUserNationalities,
        'noinfo': '',
      },
    );

    final body = response.data;
    if (body == null) throw const ParsingException();

    final RandomUserResponseDto parsed;
    try {
      parsed = RandomUserResponseDto.fromJson(body);
    } on Object {
      throw const ParsingException();
    }
    if (parsed.results.isEmpty) throw const ParsingException();
    return parsed.results.first;
  }
}
