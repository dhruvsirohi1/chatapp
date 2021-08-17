///
//  Generated code. Do not modify.
//  source: apptest.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'apptest.pb.dart' as $0;
export 'apptest.pb.dart';

class ChatServiceClient extends $grpc.Client {
  static final _$register =
      $grpc.ClientMethod<$0.SignUpRequest, $0.SignUpResponse>(
          '/ChatService/Register',
          ($0.SignUpRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SignUpResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/ChatService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$logOut =
      $grpc.ClientMethod<$0.LogOutRequest, $0.LogOutResponse>(
          '/ChatService/LogOut',
          ($0.LogOutRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.LogOutResponse.fromBuffer(value));
  static final _$text = $grpc.ClientMethod<$0.TextRequest, $0.TextResponse>(
      '/ChatService/Text',
      ($0.TextRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TextResponse.fromBuffer(value));
  static final _$chatStream = $grpc.ClientMethod<$0.Empty, $0.Message>(
      '/ChatService/ChatStream',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));
  static final _$fetchUsers =
      $grpc.ClientMethod<$0.getUsersRequest, $0.getUsersResponse>(
          '/ChatService/FetchUsers',
          ($0.getUsersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.getUsersResponse.fromBuffer(value));
  static final _$fetchLog = $grpc.ClientMethod<$0.logRequest, $0.logResponse>(
      '/ChatService/fetchLog',
      ($0.logRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.logResponse.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.SignUpResponse> register($0.SignUpRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.LogOutResponse> logOut($0.LogOutRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logOut, request, options: options);
  }

  $grpc.ResponseFuture<$0.TextResponse> text($0.TextRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$text, request, options: options);
  }

  $grpc.ResponseStream<$0.Message> chatStream($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$chatStream, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.getUsersResponse> fetchUsers(
      $0.getUsersRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$fetchUsers, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.logResponse> fetchLog($0.logRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$fetchLog, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SignUpRequest, $0.SignUpResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignUpRequest.fromBuffer(value),
        ($0.SignUpResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogOutRequest, $0.LogOutResponse>(
        'LogOut',
        logOut_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogOutRequest.fromBuffer(value),
        ($0.LogOutResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TextRequest, $0.TextResponse>(
        'Text',
        text_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TextRequest.fromBuffer(value),
        ($0.TextResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Message>(
        'ChatStream',
        chatStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.getUsersRequest, $0.getUsersResponse>(
        'FetchUsers',
        fetchUsers_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.getUsersRequest.fromBuffer(value),
        ($0.getUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.logRequest, $0.logResponse>(
        'fetchLog',
        fetchLog_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.logRequest.fromBuffer(value),
        ($0.logResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SignUpResponse> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignUpRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.LogOutResponse> logOut_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LogOutRequest> request) async {
    return logOut(call, await request);
  }

  $async.Future<$0.TextResponse> text_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TextRequest> request) async {
    return text(call, await request);
  }

  $async.Stream<$0.Message> chatStream_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* chatStream(call, await request);
  }

  $async.Stream<$0.getUsersResponse> fetchUsers_Pre($grpc.ServiceCall call,
      $async.Future<$0.getUsersRequest> request) async* {
    yield* fetchUsers(call, await request);
  }

  $async.Stream<$0.logResponse> fetchLog_Pre(
      $grpc.ServiceCall call, $async.Future<$0.logRequest> request) async* {
    yield* fetchLog(call, await request);
  }

  $async.Future<$0.SignUpResponse> register(
      $grpc.ServiceCall call, $0.SignUpRequest request);
  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.LogOutResponse> logOut(
      $grpc.ServiceCall call, $0.LogOutRequest request);
  $async.Future<$0.TextResponse> text(
      $grpc.ServiceCall call, $0.TextRequest request);
  $async.Stream<$0.Message> chatStream(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Stream<$0.getUsersResponse> fetchUsers(
      $grpc.ServiceCall call, $0.getUsersRequest request);
  $async.Stream<$0.logResponse> fetchLog(
      $grpc.ServiceCall call, $0.logRequest request);
}
