///
//  Generated code. Do not modify.
//  source: apptest.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBWVtYWlsGAMgASgJUgVlbWFpbA==');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = const {
  '1': 'LoginResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSFAoFdG9rZW4YAiABKAlSBXRva2Vu');
@$core.Deprecated('Use logOutRequestDescriptor instead')
const LogOutRequest$json = const {
  '1': 'LogOutRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `LogOutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logOutRequestDescriptor = $convert.base64Decode(
    'Cg1Mb2dPdXRSZXF1ZXN0EhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIUCgV0b2tlbhgCIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use logOutResponseDescriptor instead')
const LogOutResponse$json = const {
  '1': 'LogOutResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `LogOutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logOutResponseDescriptor = $convert
    .base64Decode('Cg5Mb2dPdXRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use signUpRequestDescriptor instead')
const SignUpRequest$json = const {
  '1': 'SignUpRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'username', '3': 3, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `SignUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpRequestDescriptor = $convert.base64Decode(
    'Cg1TaWduVXBSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSFAoFZW1haWwYAiABKAlSBWVtYWlsEhoKCHVzZXJuYW1lGAMgASgJUgh1c2VybmFtZRIaCghwYXNzd29yZBgEIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use signUpResponseDescriptor instead')
const SignUpResponse$json = const {
  '1': 'SignUpResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SignUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpResponseDescriptor = $convert
    .base64Decode('Cg5TaWduVXBSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use textRequestDescriptor instead')
const TextRequest$json = const {
  '1': 'TextRequest',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

/// Descriptor for `TextRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textRequestDescriptor = $convert.base64Decode(
    'CgtUZXh0UmVxdWVzdBISCgR0ZXh0GAEgASgJUgR0ZXh0EhoKCHVzZXJuYW1lGAIgASgJUgh1c2VybmFtZRIcCgl0aW1lc3RhbXAYAyABKAlSCXRpbWVzdGFtcA==');
@$core.Deprecated('Use textResponseDescriptor instead')
const TextResponse$json = const {
  '1': 'TextResponse',
  '2': const [
    const {'1': 'accepted', '3': 1, '4': 1, '5': 8, '10': 'accepted'},
  ],
};

/// Descriptor for `TextResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textResponseDescriptor = $convert
    .base64Decode('CgxUZXh0UmVzcG9uc2USGgoIYWNjZXB0ZWQYASABKAhSCGFjY2VwdGVk');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'senderName', '3': 1, '4': 1, '5': 9, '10': 'senderName'},
    const {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEh4KCnNlbmRlck5hbWUYASABKAlSCnNlbmRlck5hbWUSGAoHY29udGVudBgCIAEoCVIHY29udGVudBIcCgl0aW1lc3RhbXAYAyABKAlSCXRpbWVzdGFtcA==');
@$core.Deprecated('Use selectFriendDescriptor instead')
const SelectFriend$json = const {
  '1': 'SelectFriend',
  '2': const [
    const {'1': 'friendname', '3': 1, '4': 1, '5': 9, '10': 'friendname'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `SelectFriend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectFriendDescriptor = $convert.base64Decode(
    'CgxTZWxlY3RGcmllbmQSHgoKZnJpZW5kbmFtZRgBIAEoCVIKZnJpZW5kbmFtZRIUCgV0b2tlbhgCIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use selectFriendResponseDescriptor instead')
const SelectFriendResponse$json = const {
  '1': 'SelectFriendResponse',
  '2': const [
    const {'1': 'auth', '3': 1, '4': 1, '5': 8, '10': 'auth'},
  ],
};

/// Descriptor for `SelectFriendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectFriendResponseDescriptor = $convert
    .base64Decode('ChRTZWxlY3RGcmllbmRSZXNwb25zZRISCgRhdXRoGAEgASgIUgRhdXRo');
@$core.Deprecated('Use getUsersRequestDescriptor instead')
const getUsersRequest$json = const {
  '1': 'getUsersRequest',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `getUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersRequestDescriptor = $convert
    .base64Decode('Cg9nZXRVc2Vyc1JlcXVlc3QSFAoFdG9rZW4YASABKAlSBXRva2Vu');
@$core.Deprecated('Use getUsersResponseDescriptor instead')
const getUsersResponse$json = const {
  '1': 'getUsersResponse',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.User', '10': 'user'},
  ],
};

/// Descriptor for `getUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersResponseDescriptor = $convert.base64Decode(
    'ChBnZXRVc2Vyc1Jlc3BvbnNlEhkKBHVzZXIYASABKAsyBS5Vc2VyUgR1c2Vy');
@$core.Deprecated('Use logRequestDescriptor instead')
const logRequest$json = const {
  '1': 'logRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'friendname', '3': 2, '4': 1, '5': 9, '10': 'friendname'},
    const {'1': 'friendid', '3': 3, '4': 1, '5': 9, '10': 'friendid'},
    const {'1': 'token', '3': 4, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `logRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logRequestDescriptor = $convert.base64Decode(
    'Cgpsb2dSZXF1ZXN0EhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIeCgpmcmllbmRuYW1lGAIgASgJUgpmcmllbmRuYW1lEhoKCGZyaWVuZGlkGAMgASgJUghmcmllbmRpZBIUCgV0b2tlbhgEIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use logResponseDescriptor instead')
const logResponse$json = const {
  '1': 'logResponse',
  '2': const [
    const {'1': 'senderName', '3': 1, '4': 1, '5': 9, '10': 'senderName'},
    const {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

/// Descriptor for `logResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logResponseDescriptor = $convert.base64Decode(
    'Cgtsb2dSZXNwb25zZRIeCgpzZW5kZXJOYW1lGAEgASgJUgpzZW5kZXJOYW1lEhgKB2NvbnRlbnQYAiABKAlSB2NvbnRlbnQSHAoJdGltZXN0YW1wGAMgASgJUgl0aW1lc3RhbXA=');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor =
    $convert.base64Decode('CgVFbXB0eQ==');
