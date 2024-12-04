// Copyright 2015 The gRPC Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// The canonical version of this proto can be found at
// https://github.com/grpc/grpc-proto/blob/master/grpc/health/v1/health.proto

// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the gRPC Swift generator plugin for the protocol buffer compiler.
// Source: health.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/grpc/grpc-swift

package import GRPCCore
internal import GRPCProtobuf
package import SwiftProtobuf

// MARK: - grpc.health.v1.Health

/// Namespace containing generated types for the "grpc.health.v1.Health" service.
package enum Grpc_Health_V1_Health {
    /// Service descriptor for the "grpc.health.v1.Health" service.
    package static let descriptor = GRPCCore.ServiceDescriptor(fullyQualifiedService: "grpc.health.v1.Health")
    /// Namespace for method metadata.
    package enum Method {
        /// Namespace for "Check" metadata.
        package enum Check {
            /// Request type for "Check".
            package typealias Input = Grpc_Health_V1_HealthCheckRequest
            /// Response type for "Check".
            package typealias Output = Grpc_Health_V1_HealthCheckResponse
            /// Descriptor for "Check".
            package static let descriptor = GRPCCore.MethodDescriptor(
                service: GRPCCore.ServiceDescriptor(fullyQualifiedService: "grpc.health.v1.Health"),
                method: "Check"
            )
        }
        /// Namespace for "Watch" metadata.
        package enum Watch {
            /// Request type for "Watch".
            package typealias Input = Grpc_Health_V1_HealthCheckRequest
            /// Response type for "Watch".
            package typealias Output = Grpc_Health_V1_HealthCheckResponse
            /// Descriptor for "Watch".
            package static let descriptor = GRPCCore.MethodDescriptor(
                service: GRPCCore.ServiceDescriptor(fullyQualifiedService: "grpc.health.v1.Health"),
                method: "Watch"
            )
        }
        /// Descriptors for all methods in the "grpc.health.v1.Health" service.
        package static let descriptors: [GRPCCore.MethodDescriptor] = [
            Check.descriptor,
            Watch.descriptor
        ]
    }
}

extension GRPCCore.ServiceDescriptor {
    /// Service descriptor for the "grpc.health.v1.Health" service.
    package static let grpc_health_v1_Health = GRPCCore.ServiceDescriptor(fullyQualifiedService: "grpc.health.v1.Health")
}

// MARK: grpc.health.v1.Health (server)

extension Grpc_Health_V1_Health {
    /// Streaming variant of the service protocol for the "grpc.health.v1.Health" service.
    ///
    /// This protocol is the lowest-level of the service protocols generated for this service
    /// giving you the most flexibility over the implementation of your service. This comes at
    /// the cost of more verbose and less strict APIs. Each RPC requires you to implement it in
    /// terms of a request stream and response stream. Where only a single request or response
    /// message is expected, you are responsible for enforcing this invariant is maintained.
    ///
    /// Where possible, prefer using the stricter, less-verbose ``ServiceProtocol``
    /// or ``SimpleServiceProtocol`` instead.
    ///
    /// > Source IDL Documentation:
    /// >
    /// > Health is gRPC's mechanism for checking whether a server is able to handle
    /// > RPCs. Its semantics are documented in
    /// > https://github.com/grpc/grpc/blob/master/doc/health-checking.md.
    package protocol StreamingServiceProtocol: GRPCCore.RegistrableRPCService {
        /// Handle the "Check" method.
        ///
        /// > Source IDL Documentation:
        /// >
        /// > Check gets the health of the specified service. If the requested service
        /// > is unknown, the call will fail with status NOT_FOUND. If the caller does
        /// > not specify a service name, the server should respond with its overall
        /// > health status.
        /// > 
        /// > Clients should set a deadline when calling Check, and can declare the
        /// > server unhealthy if they do not receive a timely response.
        /// > 
        /// > Check implementations should be idempotent and side effect free.
        ///
        /// - Parameters:
        ///   - request: A streaming request of `Grpc_Health_V1_HealthCheckRequest` messages.
        ///   - context: Context providing information about the RPC.
        /// - Throws: Any error which occurred during the processing of the request. Thrown errors
        ///     of type `RPCError` are mapped to appropriate statuses. All other errors are converted
        ///     to an internal error.
        /// - Returns: A streaming response of `Grpc_Health_V1_HealthCheckResponse` messages.
        func check(
            request: GRPCCore.StreamingServerRequest<Grpc_Health_V1_HealthCheckRequest>,
            context: GRPCCore.ServerContext
        ) async throws -> GRPCCore.StreamingServerResponse<Grpc_Health_V1_HealthCheckResponse>

        /// Handle the "Watch" method.
        ///
        /// > Source IDL Documentation:
        /// >
        /// > Performs a watch for the serving status of the requested service.
        /// > The server will immediately send back a message indicating the current
        /// > serving status.  It will then subsequently send a new message whenever
        /// > the service's serving status changes.
        /// > 
        /// > If the requested service is unknown when the call is received, the
        /// > server will send a message setting the serving status to
        /// > SERVICE_UNKNOWN but will *not* terminate the call.  If at some
        /// > future point, the serving status of the service becomes known, the
        /// > server will send a new message with the service's serving status.
        /// > 
        /// > If the call terminates with status UNIMPLEMENTED, then clients
        /// > should assume this method is not supported and should not retry the
        /// > call.  If the call terminates with any other status (including OK),
        /// > clients should retry the call with appropriate exponential backoff.
        ///
        /// - Parameters:
        ///   - request: A streaming request of `Grpc_Health_V1_HealthCheckRequest` messages.
        ///   - context: Context providing information about the RPC.
        /// - Throws: Any error which occurred during the processing of the request. Thrown errors
        ///     of type `RPCError` are mapped to appropriate statuses. All other errors are converted
        ///     to an internal error.
        /// - Returns: A streaming response of `Grpc_Health_V1_HealthCheckResponse` messages.
        func watch(
            request: GRPCCore.StreamingServerRequest<Grpc_Health_V1_HealthCheckRequest>,
            context: GRPCCore.ServerContext
        ) async throws -> GRPCCore.StreamingServerResponse<Grpc_Health_V1_HealthCheckResponse>
    }

    /// Service protocol for the "grpc.health.v1.Health" service.
    ///
    /// This protocol is higher level than ``StreamingServiceProtocol`` but lower level than
    /// the ``SimpleServiceProtocol``, it provides access to request and response metadata and
    /// trailing response metadata. If you don't need these then consider using
    /// the ``SimpleServiceProtocol``. If you need fine grained control over your RPCs then
    /// use ``StreamingServiceProtocol``.
    ///
    /// > Source IDL Documentation:
    /// >
    /// > Health is gRPC's mechanism for checking whether a server is able to handle
    /// > RPCs. Its semantics are documented in
    /// > https://github.com/grpc/grpc/blob/master/doc/health-checking.md.
    package protocol ServiceProtocol: Grpc_Health_V1_Health.StreamingServiceProtocol {
        /// Handle the "Check" method.
        ///
        /// > Source IDL Documentation:
        /// >
        /// > Check gets the health of the specified service. If the requested service
        /// > is unknown, the call will fail with status NOT_FOUND. If the caller does
        /// > not specify a service name, the server should respond with its overall
        /// > health status.
        /// > 
        /// > Clients should set a deadline when calling Check, and can declare the
        /// > server unhealthy if they do not receive a timely response.
        /// > 
        /// > Check implementations should be idempotent and side effect free.
        ///
        /// - Parameters:
        ///   - request: A request containing a single `Grpc_Health_V1_HealthCheckRequest` message.
        ///   - context: Context providing information about the RPC.
        /// - Throws: Any error which occurred during the processing of the request. Thrown errors
        ///     of type `RPCError` are mapped to appropriate statuses. All other errors are converted
        ///     to an internal error.
        /// - Returns: A response containing a single `Grpc_Health_V1_HealthCheckResponse` message.
        func check(
            request: GRPCCore.ServerRequest<Grpc_Health_V1_HealthCheckRequest>,
            context: GRPCCore.ServerContext
        ) async throws -> GRPCCore.ServerResponse<Grpc_Health_V1_HealthCheckResponse>

        /// Handle the "Watch" method.
        ///
        /// > Source IDL Documentation:
        /// >
        /// > Performs a watch for the serving status of the requested service.
        /// > The server will immediately send back a message indicating the current
        /// > serving status.  It will then subsequently send a new message whenever
        /// > the service's serving status changes.
        /// > 
        /// > If the requested service is unknown when the call is received, the
        /// > server will send a message setting the serving status to
        /// > SERVICE_UNKNOWN but will *not* terminate the call.  If at some
        /// > future point, the serving status of the service becomes known, the
        /// > server will send a new message with the service's serving status.
        /// > 
        /// > If the call terminates with status UNIMPLEMENTED, then clients
        /// > should assume this method is not supported and should not retry the
        /// > call.  If the call terminates with any other status (including OK),
        /// > clients should retry the call with appropriate exponential backoff.
        ///
        /// - Parameters:
        ///   - request: A request containing a single `Grpc_Health_V1_HealthCheckRequest` message.
        ///   - context: Context providing information about the RPC.
        /// - Throws: Any error which occurred during the processing of the request. Thrown errors
        ///     of type `RPCError` are mapped to appropriate statuses. All other errors are converted
        ///     to an internal error.
        /// - Returns: A streaming response of `Grpc_Health_V1_HealthCheckResponse` messages.
        func watch(
            request: GRPCCore.ServerRequest<Grpc_Health_V1_HealthCheckRequest>,
            context: GRPCCore.ServerContext
        ) async throws -> GRPCCore.StreamingServerResponse<Grpc_Health_V1_HealthCheckResponse>
    }

    /// Simple service protocol for the "grpc.health.v1.Health" service.
    ///
    /// This is the highest level protocol for the service. The API is the easiest to use but
    /// doesn't provide access to request or response metadata. If you need access to these
    /// then use ``ServiceProtocol`` instead.
    ///
    /// > Source IDL Documentation:
    /// >
    /// > Health is gRPC's mechanism for checking whether a server is able to handle
    /// > RPCs. Its semantics are documented in
    /// > https://github.com/grpc/grpc/blob/master/doc/health-checking.md.
    package protocol SimpleServiceProtocol: Grpc_Health_V1_Health.ServiceProtocol {
        /// Handle the "Check" method.
        ///
        /// > Source IDL Documentation:
        /// >
        /// > Check gets the health of the specified service. If the requested service
        /// > is unknown, the call will fail with status NOT_FOUND. If the caller does
        /// > not specify a service name, the server should respond with its overall
        /// > health status.
        /// > 
        /// > Clients should set a deadline when calling Check, and can declare the
        /// > server unhealthy if they do not receive a timely response.
        /// > 
        /// > Check implementations should be idempotent and side effect free.
        ///
        /// - Parameters:
        ///   - request: A `Grpc_Health_V1_HealthCheckRequest` message.
        ///   - context: Context providing information about the RPC.
        /// - Throws: Any error which occurred during the processing of the request. Thrown errors
        ///     of type `RPCError` are mapped to appropriate statuses. All other errors are converted
        ///     to an internal error.
        /// - Returns: A `Grpc_Health_V1_HealthCheckResponse` to respond with.
        func check(
            request: Grpc_Health_V1_HealthCheckRequest,
            context: GRPCCore.ServerContext
        ) async throws -> Grpc_Health_V1_HealthCheckResponse

        /// Handle the "Watch" method.
        ///
        /// > Source IDL Documentation:
        /// >
        /// > Performs a watch for the serving status of the requested service.
        /// > The server will immediately send back a message indicating the current
        /// > serving status.  It will then subsequently send a new message whenever
        /// > the service's serving status changes.
        /// > 
        /// > If the requested service is unknown when the call is received, the
        /// > server will send a message setting the serving status to
        /// > SERVICE_UNKNOWN but will *not* terminate the call.  If at some
        /// > future point, the serving status of the service becomes known, the
        /// > server will send a new message with the service's serving status.
        /// > 
        /// > If the call terminates with status UNIMPLEMENTED, then clients
        /// > should assume this method is not supported and should not retry the
        /// > call.  If the call terminates with any other status (including OK),
        /// > clients should retry the call with appropriate exponential backoff.
        ///
        /// - Parameters:
        ///   - request: A `Grpc_Health_V1_HealthCheckRequest` message.
        ///   - response: A response stream of `Grpc_Health_V1_HealthCheckResponse` messages.
        ///   - context: Context providing information about the RPC.
        /// - Throws: Any error which occurred during the processing of the request. Thrown errors
        ///     of type `RPCError` are mapped to appropriate statuses. All other errors are converted
        ///     to an internal error.
        func watch(
            request: Grpc_Health_V1_HealthCheckRequest,
            response: GRPCCore.RPCWriter<Grpc_Health_V1_HealthCheckResponse>,
            context: GRPCCore.ServerContext
        ) async throws
    }
}

// Default implementation of 'registerMethods(with:)'.
extension Grpc_Health_V1_Health.StreamingServiceProtocol {
    package func registerMethods(with router: inout GRPCCore.RPCRouter) {
        router.registerHandler(
            forMethod: Grpc_Health_V1_Health.Method.Check.descriptor,
            deserializer: GRPCProtobuf.ProtobufDeserializer<Grpc_Health_V1_HealthCheckRequest>(),
            serializer: GRPCProtobuf.ProtobufSerializer<Grpc_Health_V1_HealthCheckResponse>(),
            handler: { request, context in
                try await self.check(
                    request: request,
                    context: context
                )
            }
        )
        router.registerHandler(
            forMethod: Grpc_Health_V1_Health.Method.Watch.descriptor,
            deserializer: GRPCProtobuf.ProtobufDeserializer<Grpc_Health_V1_HealthCheckRequest>(),
            serializer: GRPCProtobuf.ProtobufSerializer<Grpc_Health_V1_HealthCheckResponse>(),
            handler: { request, context in
                try await self.watch(
                    request: request,
                    context: context
                )
            }
        )
    }
}

// Default implementation of streaming methods from 'StreamingServiceProtocol'.
extension Grpc_Health_V1_Health.ServiceProtocol {
    package func check(
        request: GRPCCore.StreamingServerRequest<Grpc_Health_V1_HealthCheckRequest>,
        context: GRPCCore.ServerContext
    ) async throws -> GRPCCore.StreamingServerResponse<Grpc_Health_V1_HealthCheckResponse> {
        let response = try await self.check(
            request: GRPCCore.ServerRequest(stream: request),
            context: context
        )
        return GRPCCore.StreamingServerResponse(single: response)
    }

    package func watch(
        request: GRPCCore.StreamingServerRequest<Grpc_Health_V1_HealthCheckRequest>,
        context: GRPCCore.ServerContext
    ) async throws -> GRPCCore.StreamingServerResponse<Grpc_Health_V1_HealthCheckResponse> {
        let response = try await self.watch(
            request: GRPCCore.ServerRequest(stream: request),
            context: context
        )
        return response
    }
}

// Default implementation of methods from 'ServiceProtocol'.
extension Grpc_Health_V1_Health.SimpleServiceProtocol {
    package func check(
        request: GRPCCore.ServerRequest<Grpc_Health_V1_HealthCheckRequest>,
        context: GRPCCore.ServerContext
    ) async throws -> GRPCCore.ServerResponse<Grpc_Health_V1_HealthCheckResponse> {
        return GRPCCore.ServerResponse<Grpc_Health_V1_HealthCheckResponse>(
            message: try await self.check(
                request: request.message,
                context: context
            ),
            metadata: [:]
        )
    }

    package func watch(
        request: GRPCCore.ServerRequest<Grpc_Health_V1_HealthCheckRequest>,
        context: GRPCCore.ServerContext
    ) async throws -> GRPCCore.StreamingServerResponse<Grpc_Health_V1_HealthCheckResponse> {
        return GRPCCore.StreamingServerResponse<Grpc_Health_V1_HealthCheckResponse>(
            metadata: [:],
            producer: { writer in
                try await self.watch(
                    request: request.message,
                    response: writer,
                    context: context
                )
                return [:]
            }
        )
    }
}

// MARK: grpc.health.v1.Health (client)

extension Grpc_Health_V1_Health {
    /// Generated client protocol for the "grpc.health.v1.Health" service.
    ///
    /// You don't need to implement this protocol directly, use the generated
    /// implementation, ``Client``.
    ///
    /// > Source IDL Documentation:
    /// >
    /// > Health is gRPC's mechanism for checking whether a server is able to handle
    /// > RPCs. Its semantics are documented in
    /// > https://github.com/grpc/grpc/blob/master/doc/health-checking.md.
    package protocol ClientProtocol: Sendable {
        /// Call the "Check" method.
        ///
        /// > Source IDL Documentation:
        /// >
        /// > Check gets the health of the specified service. If the requested service
        /// > is unknown, the call will fail with status NOT_FOUND. If the caller does
        /// > not specify a service name, the server should respond with its overall
        /// > health status.
        /// > 
        /// > Clients should set a deadline when calling Check, and can declare the
        /// > server unhealthy if they do not receive a timely response.
        /// > 
        /// > Check implementations should be idempotent and side effect free.
        ///
        /// - Parameters:
        ///   - request: A request containing a single `Grpc_Health_V1_HealthCheckRequest` message.
        ///   - serializer: A serializer for `Grpc_Health_V1_HealthCheckRequest` messages.
        ///   - deserializer: A deserializer for `Grpc_Health_V1_HealthCheckResponse` messages.
        ///   - options: Options to apply to this RPC.
        ///   - handleResponse: A closure which handles the response, the result of which is
        ///       returned to the caller. Returning from the closure will cancel the RPC if it
        ///       hasn't already finished.
        /// - Returns: The result of `handleResponse`.
        func check<Result>(
            request: GRPCCore.ClientRequest<Grpc_Health_V1_HealthCheckRequest>,
            serializer: some GRPCCore.MessageSerializer<Grpc_Health_V1_HealthCheckRequest>,
            deserializer: some GRPCCore.MessageDeserializer<Grpc_Health_V1_HealthCheckResponse>,
            options: GRPCCore.CallOptions,
            onResponse handleResponse: @Sendable @escaping (GRPCCore.ClientResponse<Grpc_Health_V1_HealthCheckResponse>) async throws -> Result
        ) async throws -> Result where Result: Sendable

        /// Call the "Watch" method.
        ///
        /// > Source IDL Documentation:
        /// >
        /// > Performs a watch for the serving status of the requested service.
        /// > The server will immediately send back a message indicating the current
        /// > serving status.  It will then subsequently send a new message whenever
        /// > the service's serving status changes.
        /// > 
        /// > If the requested service is unknown when the call is received, the
        /// > server will send a message setting the serving status to
        /// > SERVICE_UNKNOWN but will *not* terminate the call.  If at some
        /// > future point, the serving status of the service becomes known, the
        /// > server will send a new message with the service's serving status.
        /// > 
        /// > If the call terminates with status UNIMPLEMENTED, then clients
        /// > should assume this method is not supported and should not retry the
        /// > call.  If the call terminates with any other status (including OK),
        /// > clients should retry the call with appropriate exponential backoff.
        ///
        /// - Parameters:
        ///   - request: A request containing a single `Grpc_Health_V1_HealthCheckRequest` message.
        ///   - serializer: A serializer for `Grpc_Health_V1_HealthCheckRequest` messages.
        ///   - deserializer: A deserializer for `Grpc_Health_V1_HealthCheckResponse` messages.
        ///   - options: Options to apply to this RPC.
        ///   - handleResponse: A closure which handles the response, the result of which is
        ///       returned to the caller. Returning from the closure will cancel the RPC if it
        ///       hasn't already finished.
        /// - Returns: The result of `handleResponse`.
        func watch<Result>(
            request: GRPCCore.ClientRequest<Grpc_Health_V1_HealthCheckRequest>,
            serializer: some GRPCCore.MessageSerializer<Grpc_Health_V1_HealthCheckRequest>,
            deserializer: some GRPCCore.MessageDeserializer<Grpc_Health_V1_HealthCheckResponse>,
            options: GRPCCore.CallOptions,
            onResponse handleResponse: @Sendable @escaping (GRPCCore.StreamingClientResponse<Grpc_Health_V1_HealthCheckResponse>) async throws -> Result
        ) async throws -> Result where Result: Sendable
    }

    /// Generated client for the "grpc.health.v1.Health" service.
    ///
    /// The ``Client`` provides an implementation of ``ClientProtocol`` which wraps
    /// a `GRPCCore.GRPCCClient`. The underlying `GRPCClient` provides the long-lived
    /// means of communication with the remote peer.
    ///
    /// > Source IDL Documentation:
    /// >
    /// > Health is gRPC's mechanism for checking whether a server is able to handle
    /// > RPCs. Its semantics are documented in
    /// > https://github.com/grpc/grpc/blob/master/doc/health-checking.md.
    package struct Client: ClientProtocol {
        private let client: GRPCCore.GRPCClient

        /// Creates a new client wrapping the provided `GRPCCore.GRPCClient`.
        ///
        /// - Parameters:
        ///   - client: A `GRPCCore.GRPCClient` providing a communication channel to the service.
        package init(wrapping client: GRPCCore.GRPCClient) {
            self.client = client
        }

        /// Call the "Check" method.
        ///
        /// > Source IDL Documentation:
        /// >
        /// > Check gets the health of the specified service. If the requested service
        /// > is unknown, the call will fail with status NOT_FOUND. If the caller does
        /// > not specify a service name, the server should respond with its overall
        /// > health status.
        /// > 
        /// > Clients should set a deadline when calling Check, and can declare the
        /// > server unhealthy if they do not receive a timely response.
        /// > 
        /// > Check implementations should be idempotent and side effect free.
        ///
        /// - Parameters:
        ///   - request: A request containing a single `Grpc_Health_V1_HealthCheckRequest` message.
        ///   - serializer: A serializer for `Grpc_Health_V1_HealthCheckRequest` messages.
        ///   - deserializer: A deserializer for `Grpc_Health_V1_HealthCheckResponse` messages.
        ///   - options: Options to apply to this RPC.
        ///   - handleResponse: A closure which handles the response, the result of which is
        ///       returned to the caller. Returning from the closure will cancel the RPC if it
        ///       hasn't already finished.
        /// - Returns: The result of `handleResponse`.
        package func check<Result>(
            request: GRPCCore.ClientRequest<Grpc_Health_V1_HealthCheckRequest>,
            serializer: some GRPCCore.MessageSerializer<Grpc_Health_V1_HealthCheckRequest>,
            deserializer: some GRPCCore.MessageDeserializer<Grpc_Health_V1_HealthCheckResponse>,
            options: GRPCCore.CallOptions = .defaults,
            onResponse handleResponse: @Sendable @escaping (GRPCCore.ClientResponse<Grpc_Health_V1_HealthCheckResponse>) async throws -> Result = { response in
                try response.message
            }
        ) async throws -> Result where Result: Sendable {
            try await self.client.unary(
                request: request,
                descriptor: Grpc_Health_V1_Health.Method.Check.descriptor,
                serializer: serializer,
                deserializer: deserializer,
                options: options,
                onResponse: handleResponse
            )
        }

        /// Call the "Watch" method.
        ///
        /// > Source IDL Documentation:
        /// >
        /// > Performs a watch for the serving status of the requested service.
        /// > The server will immediately send back a message indicating the current
        /// > serving status.  It will then subsequently send a new message whenever
        /// > the service's serving status changes.
        /// > 
        /// > If the requested service is unknown when the call is received, the
        /// > server will send a message setting the serving status to
        /// > SERVICE_UNKNOWN but will *not* terminate the call.  If at some
        /// > future point, the serving status of the service becomes known, the
        /// > server will send a new message with the service's serving status.
        /// > 
        /// > If the call terminates with status UNIMPLEMENTED, then clients
        /// > should assume this method is not supported and should not retry the
        /// > call.  If the call terminates with any other status (including OK),
        /// > clients should retry the call with appropriate exponential backoff.
        ///
        /// - Parameters:
        ///   - request: A request containing a single `Grpc_Health_V1_HealthCheckRequest` message.
        ///   - serializer: A serializer for `Grpc_Health_V1_HealthCheckRequest` messages.
        ///   - deserializer: A deserializer for `Grpc_Health_V1_HealthCheckResponse` messages.
        ///   - options: Options to apply to this RPC.
        ///   - handleResponse: A closure which handles the response, the result of which is
        ///       returned to the caller. Returning from the closure will cancel the RPC if it
        ///       hasn't already finished.
        /// - Returns: The result of `handleResponse`.
        package func watch<Result>(
            request: GRPCCore.ClientRequest<Grpc_Health_V1_HealthCheckRequest>,
            serializer: some GRPCCore.MessageSerializer<Grpc_Health_V1_HealthCheckRequest>,
            deserializer: some GRPCCore.MessageDeserializer<Grpc_Health_V1_HealthCheckResponse>,
            options: GRPCCore.CallOptions = .defaults,
            onResponse handleResponse: @Sendable @escaping (GRPCCore.StreamingClientResponse<Grpc_Health_V1_HealthCheckResponse>) async throws -> Result
        ) async throws -> Result where Result: Sendable {
            try await self.client.serverStreaming(
                request: request,
                descriptor: Grpc_Health_V1_Health.Method.Watch.descriptor,
                serializer: serializer,
                deserializer: deserializer,
                options: options,
                onResponse: handleResponse
            )
        }
    }
}

// Helpers providing default arguments to 'ClientProtocol' methods.
extension Grpc_Health_V1_Health.ClientProtocol {
    /// Call the "Check" method.
    ///
    /// > Source IDL Documentation:
    /// >
    /// > Check gets the health of the specified service. If the requested service
    /// > is unknown, the call will fail with status NOT_FOUND. If the caller does
    /// > not specify a service name, the server should respond with its overall
    /// > health status.
    /// > 
    /// > Clients should set a deadline when calling Check, and can declare the
    /// > server unhealthy if they do not receive a timely response.
    /// > 
    /// > Check implementations should be idempotent and side effect free.
    ///
    /// - Parameters:
    ///   - request: A request containing a single `Grpc_Health_V1_HealthCheckRequest` message.
    ///   - options: Options to apply to this RPC.
    ///   - handleResponse: A closure which handles the response, the result of which is
    ///       returned to the caller. Returning from the closure will cancel the RPC if it
    ///       hasn't already finished.
    /// - Returns: The result of `handleResponse`.
    package func check<Result>(
        request: GRPCCore.ClientRequest<Grpc_Health_V1_HealthCheckRequest>,
        options: GRPCCore.CallOptions = .defaults,
        onResponse handleResponse: @Sendable @escaping (GRPCCore.ClientResponse<Grpc_Health_V1_HealthCheckResponse>) async throws -> Result = { response in
            try response.message
        }
    ) async throws -> Result where Result: Sendable {
        try await self.check(
            request: request,
            serializer: GRPCProtobuf.ProtobufSerializer<Grpc_Health_V1_HealthCheckRequest>(),
            deserializer: GRPCProtobuf.ProtobufDeserializer<Grpc_Health_V1_HealthCheckResponse>(),
            options: options,
            onResponse: handleResponse
        )
    }

    /// Call the "Watch" method.
    ///
    /// > Source IDL Documentation:
    /// >
    /// > Performs a watch for the serving status of the requested service.
    /// > The server will immediately send back a message indicating the current
    /// > serving status.  It will then subsequently send a new message whenever
    /// > the service's serving status changes.
    /// > 
    /// > If the requested service is unknown when the call is received, the
    /// > server will send a message setting the serving status to
    /// > SERVICE_UNKNOWN but will *not* terminate the call.  If at some
    /// > future point, the serving status of the service becomes known, the
    /// > server will send a new message with the service's serving status.
    /// > 
    /// > If the call terminates with status UNIMPLEMENTED, then clients
    /// > should assume this method is not supported and should not retry the
    /// > call.  If the call terminates with any other status (including OK),
    /// > clients should retry the call with appropriate exponential backoff.
    ///
    /// - Parameters:
    ///   - request: A request containing a single `Grpc_Health_V1_HealthCheckRequest` message.
    ///   - options: Options to apply to this RPC.
    ///   - handleResponse: A closure which handles the response, the result of which is
    ///       returned to the caller. Returning from the closure will cancel the RPC if it
    ///       hasn't already finished.
    /// - Returns: The result of `handleResponse`.
    package func watch<Result>(
        request: GRPCCore.ClientRequest<Grpc_Health_V1_HealthCheckRequest>,
        options: GRPCCore.CallOptions = .defaults,
        onResponse handleResponse: @Sendable @escaping (GRPCCore.StreamingClientResponse<Grpc_Health_V1_HealthCheckResponse>) async throws -> Result
    ) async throws -> Result where Result: Sendable {
        try await self.watch(
            request: request,
            serializer: GRPCProtobuf.ProtobufSerializer<Grpc_Health_V1_HealthCheckRequest>(),
            deserializer: GRPCProtobuf.ProtobufDeserializer<Grpc_Health_V1_HealthCheckResponse>(),
            options: options,
            onResponse: handleResponse
        )
    }
}

// Helpers providing sugared APIs for 'ClientProtocol' methods.
extension Grpc_Health_V1_Health.ClientProtocol {
    /// Call the "Check" method.
    ///
    /// > Source IDL Documentation:
    /// >
    /// > Check gets the health of the specified service. If the requested service
    /// > is unknown, the call will fail with status NOT_FOUND. If the caller does
    /// > not specify a service name, the server should respond with its overall
    /// > health status.
    /// > 
    /// > Clients should set a deadline when calling Check, and can declare the
    /// > server unhealthy if they do not receive a timely response.
    /// > 
    /// > Check implementations should be idempotent and side effect free.
    ///
    /// - Parameters:
    ///   - message: request message to send.
    ///   - metadata: Additional metadata to send, defaults to empty.
    ///   - options: Options to apply to this RPC, defaults to `.defaults`.
    ///   - handleResponse: A closure which handles the response, the result of which is
    ///       returned to the caller. Returning from the closure will cancel the RPC if it
    ///       hasn't already finished.
    /// - Returns: The result of `handleResponse`.
    package func check<Result>(
        _ message: Grpc_Health_V1_HealthCheckRequest,
        metadata: GRPCCore.Metadata = [:],
        options: GRPCCore.CallOptions = .defaults,
        onResponse handleResponse: @Sendable @escaping (GRPCCore.ClientResponse<Grpc_Health_V1_HealthCheckResponse>) async throws -> Result = { response in
            try response.message
        }
    ) async throws -> Result where Result: Sendable {
        let request = GRPCCore.ClientRequest<Grpc_Health_V1_HealthCheckRequest>(
            message: message,
            metadata: metadata
        )
        return try await self.check(
            request: request,
            options: options,
            onResponse: handleResponse
        )
    }

    /// Call the "Watch" method.
    ///
    /// > Source IDL Documentation:
    /// >
    /// > Performs a watch for the serving status of the requested service.
    /// > The server will immediately send back a message indicating the current
    /// > serving status.  It will then subsequently send a new message whenever
    /// > the service's serving status changes.
    /// > 
    /// > If the requested service is unknown when the call is received, the
    /// > server will send a message setting the serving status to
    /// > SERVICE_UNKNOWN but will *not* terminate the call.  If at some
    /// > future point, the serving status of the service becomes known, the
    /// > server will send a new message with the service's serving status.
    /// > 
    /// > If the call terminates with status UNIMPLEMENTED, then clients
    /// > should assume this method is not supported and should not retry the
    /// > call.  If the call terminates with any other status (including OK),
    /// > clients should retry the call with appropriate exponential backoff.
    ///
    /// - Parameters:
    ///   - message: request message to send.
    ///   - metadata: Additional metadata to send, defaults to empty.
    ///   - options: Options to apply to this RPC, defaults to `.defaults`.
    ///   - handleResponse: A closure which handles the response, the result of which is
    ///       returned to the caller. Returning from the closure will cancel the RPC if it
    ///       hasn't already finished.
    /// - Returns: The result of `handleResponse`.
    package func watch<Result>(
        _ message: Grpc_Health_V1_HealthCheckRequest,
        metadata: GRPCCore.Metadata = [:],
        options: GRPCCore.CallOptions = .defaults,
        onResponse handleResponse: @Sendable @escaping (GRPCCore.StreamingClientResponse<Grpc_Health_V1_HealthCheckResponse>) async throws -> Result
    ) async throws -> Result where Result: Sendable {
        let request = GRPCCore.ClientRequest<Grpc_Health_V1_HealthCheckRequest>(
            message: message,
            metadata: metadata
        )
        return try await self.watch(
            request: request,
            options: options,
            onResponse: handleResponse
        )
    }
}