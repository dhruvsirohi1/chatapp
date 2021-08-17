# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

import apptest_pb2 as apptest__pb2


class ChatServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.Register = channel.unary_unary(
                '/ChatService/Register',
                request_serializer=apptest__pb2.SignUpRequest.SerializeToString,
                response_deserializer=apptest__pb2.SignUpResponse.FromString,
                )
        self.Login = channel.unary_unary(
                '/ChatService/Login',
                request_serializer=apptest__pb2.LoginRequest.SerializeToString,
                response_deserializer=apptest__pb2.LoginResponse.FromString,
                )
        self.LogOut = channel.unary_unary(
                '/ChatService/LogOut',
                request_serializer=apptest__pb2.LogOutRequest.SerializeToString,
                response_deserializer=apptest__pb2.LogOutResponse.FromString,
                )
        self.Text = channel.unary_unary(
                '/ChatService/Text',
                request_serializer=apptest__pb2.TextRequest.SerializeToString,
                response_deserializer=apptest__pb2.TextResponse.FromString,
                )
        self.ChatStream = channel.unary_stream(
                '/ChatService/ChatStream',
                request_serializer=apptest__pb2.Empty.SerializeToString,
                response_deserializer=apptest__pb2.Message.FromString,
                )
        self.FetchUsers = channel.unary_stream(
                '/ChatService/FetchUsers',
                request_serializer=apptest__pb2.getUsersRequest.SerializeToString,
                response_deserializer=apptest__pb2.getUsersResponse.FromString,
                )
        self.fetchLog = channel.unary_stream(
                '/ChatService/fetchLog',
                request_serializer=apptest__pb2.logRequest.SerializeToString,
                response_deserializer=apptest__pb2.logResponse.FromString,
                )


class ChatServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def Register(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def Login(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def LogOut(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def Text(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def ChatStream(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def FetchUsers(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def fetchLog(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_ChatServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'Register': grpc.unary_unary_rpc_method_handler(
                    servicer.Register,
                    request_deserializer=apptest__pb2.SignUpRequest.FromString,
                    response_serializer=apptest__pb2.SignUpResponse.SerializeToString,
            ),
            'Login': grpc.unary_unary_rpc_method_handler(
                    servicer.Login,
                    request_deserializer=apptest__pb2.LoginRequest.FromString,
                    response_serializer=apptest__pb2.LoginResponse.SerializeToString,
            ),
            'LogOut': grpc.unary_unary_rpc_method_handler(
                    servicer.LogOut,
                    request_deserializer=apptest__pb2.LogOutRequest.FromString,
                    response_serializer=apptest__pb2.LogOutResponse.SerializeToString,
            ),
            'Text': grpc.unary_unary_rpc_method_handler(
                    servicer.Text,
                    request_deserializer=apptest__pb2.TextRequest.FromString,
                    response_serializer=apptest__pb2.TextResponse.SerializeToString,
            ),
            'ChatStream': grpc.unary_stream_rpc_method_handler(
                    servicer.ChatStream,
                    request_deserializer=apptest__pb2.Empty.FromString,
                    response_serializer=apptest__pb2.Message.SerializeToString,
            ),
            'FetchUsers': grpc.unary_stream_rpc_method_handler(
                    servicer.FetchUsers,
                    request_deserializer=apptest__pb2.getUsersRequest.FromString,
                    response_serializer=apptest__pb2.getUsersResponse.SerializeToString,
            ),
            'fetchLog': grpc.unary_stream_rpc_method_handler(
                    servicer.fetchLog,
                    request_deserializer=apptest__pb2.logRequest.FromString,
                    response_serializer=apptest__pb2.logResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'ChatService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class ChatService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def Register(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/ChatService/Register',
            apptest__pb2.SignUpRequest.SerializeToString,
            apptest__pb2.SignUpResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def Login(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/ChatService/Login',
            apptest__pb2.LoginRequest.SerializeToString,
            apptest__pb2.LoginResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def LogOut(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/ChatService/LogOut',
            apptest__pb2.LogOutRequest.SerializeToString,
            apptest__pb2.LogOutResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def Text(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/ChatService/Text',
            apptest__pb2.TextRequest.SerializeToString,
            apptest__pb2.TextResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def ChatStream(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_stream(request, target, '/ChatService/ChatStream',
            apptest__pb2.Empty.SerializeToString,
            apptest__pb2.Message.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def FetchUsers(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_stream(request, target, '/ChatService/FetchUsers',
            apptest__pb2.getUsersRequest.SerializeToString,
            apptest__pb2.getUsersResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def fetchLog(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_stream(request, target, '/ChatService/fetchLog',
            apptest__pb2.logRequest.SerializeToString,
            apptest__pb2.logResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
