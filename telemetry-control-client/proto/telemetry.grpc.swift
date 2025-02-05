//
// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the protocol buffer compiler.
// Source: telemetry.proto
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Usage: instantiate `Telemetry_TelemetryControlServiceClient`, then call methods of this protocol to make API calls.
internal protocol Telemetry_TelemetryControlServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol? { get }

  func read(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Telemetry_TagRequest, Telemetry_MultiTagResponse>

  func subscribe(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions?,
    handler: @escaping (Telemetry_TagResponse) -> Void
  ) -> ServerStreamingCall<Telemetry_TagRequest, Telemetry_TagResponse>

  func write(
    _ request: Telemetry_WriteTagRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Telemetry_WriteTagRequest, Telemetry_WriteTagResponse>

  func readHistory(
    _ request: Telemetry_HistoryReadTagRequest,
    callOptions: CallOptions?,
    handler: @escaping (Telemetry_HistoryReadTagResponse) -> Void
  ) -> ServerStreamingCall<Telemetry_HistoryReadTagRequest, Telemetry_HistoryReadTagResponse>

  func subscribeEvents(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions?,
    handler: @escaping (Telemetry_EventResponse) -> Void
  ) -> ServerStreamingCall<Telemetry_TagRequest, Telemetry_EventResponse>

  func subscribeAlarms(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions?,
    handler: @escaping (Telemetry_AlarmResponse) -> Void
  ) -> ServerStreamingCall<Telemetry_TagRequest, Telemetry_AlarmResponse>

  func acknowledgeAlarm(
    _ request: Telemetry_AcknowledgeAlarmRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Telemetry_AcknowledgeAlarmRequest, Telemetry_AcknowledgeAlarmResponse>
}

extension Telemetry_TelemetryControlServiceClientProtocol {
  internal var serviceName: String {
    return "telemetry.TelemetryControlService"
  }

  /// Unary call to Read
  ///
  /// - Parameters:
  ///   - request: Request to send to Read.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func read(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Telemetry_TagRequest, Telemetry_MultiTagResponse> {
    return self.makeUnaryCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.read.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeReadInterceptors() ?? []
    )
  }

  /// Server streaming call to Subscribe
  ///
  /// - Parameters:
  ///   - request: Request to send to Subscribe.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  internal func subscribe(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil,
    handler: @escaping (Telemetry_TagResponse) -> Void
  ) -> ServerStreamingCall<Telemetry_TagRequest, Telemetry_TagResponse> {
    return self.makeServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribe.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeInterceptors() ?? [],
      handler: handler
    )
  }

  /// Unary call to Write
  ///
  /// - Parameters:
  ///   - request: Request to send to Write.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func write(
    _ request: Telemetry_WriteTagRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Telemetry_WriteTagRequest, Telemetry_WriteTagResponse> {
    return self.makeUnaryCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.write.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeWriteInterceptors() ?? []
    )
  }

  /// Server streaming call to ReadHistory
  ///
  /// - Parameters:
  ///   - request: Request to send to ReadHistory.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  internal func readHistory(
    _ request: Telemetry_HistoryReadTagRequest,
    callOptions: CallOptions? = nil,
    handler: @escaping (Telemetry_HistoryReadTagResponse) -> Void
  ) -> ServerStreamingCall<Telemetry_HistoryReadTagRequest, Telemetry_HistoryReadTagResponse> {
    return self.makeServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.readHistory.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeReadHistoryInterceptors() ?? [],
      handler: handler
    )
  }

  /// Server streaming call to SubscribeEvents
  ///
  /// - Parameters:
  ///   - request: Request to send to SubscribeEvents.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  internal func subscribeEvents(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil,
    handler: @escaping (Telemetry_EventResponse) -> Void
  ) -> ServerStreamingCall<Telemetry_TagRequest, Telemetry_EventResponse> {
    return self.makeServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribeEvents.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeEventsInterceptors() ?? [],
      handler: handler
    )
  }

  /// New method for subscribing to alarms
  ///
  /// - Parameters:
  ///   - request: Request to send to SubscribeAlarms.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  internal func subscribeAlarms(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil,
    handler: @escaping (Telemetry_AlarmResponse) -> Void
  ) -> ServerStreamingCall<Telemetry_TagRequest, Telemetry_AlarmResponse> {
    return self.makeServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribeAlarms.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeAlarmsInterceptors() ?? [],
      handler: handler
    )
  }

  /// New method for acknowledging alarms
  ///
  /// - Parameters:
  ///   - request: Request to send to AcknowledgeAlarm.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func acknowledgeAlarm(
    _ request: Telemetry_AcknowledgeAlarmRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Telemetry_AcknowledgeAlarmRequest, Telemetry_AcknowledgeAlarmResponse> {
    return self.makeUnaryCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.acknowledgeAlarm.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAcknowledgeAlarmInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Telemetry_TelemetryControlServiceClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Telemetry_TelemetryControlServiceNIOClient")
internal final class Telemetry_TelemetryControlServiceClient: Telemetry_TelemetryControlServiceClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the telemetry.TelemetryControlService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Telemetry_TelemetryControlServiceNIOClient: Telemetry_TelemetryControlServiceClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the telemetry.TelemetryControlService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Telemetry_TelemetryControlServiceAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol? { get }

  func makeReadCall(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Telemetry_TagRequest, Telemetry_MultiTagResponse>

  func makeSubscribeCall(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncServerStreamingCall<Telemetry_TagRequest, Telemetry_TagResponse>

  func makeWriteCall(
    _ request: Telemetry_WriteTagRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Telemetry_WriteTagRequest, Telemetry_WriteTagResponse>

  func makeReadHistoryCall(
    _ request: Telemetry_HistoryReadTagRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncServerStreamingCall<Telemetry_HistoryReadTagRequest, Telemetry_HistoryReadTagResponse>

  func makeSubscribeEventsCall(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncServerStreamingCall<Telemetry_TagRequest, Telemetry_EventResponse>

  func makeSubscribeAlarmsCall(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncServerStreamingCall<Telemetry_TagRequest, Telemetry_AlarmResponse>

  func makeAcknowledgeAlarmCall(
    _ request: Telemetry_AcknowledgeAlarmRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Telemetry_AcknowledgeAlarmRequest, Telemetry_AcknowledgeAlarmResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Telemetry_TelemetryControlServiceAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Telemetry_TelemetryControlServiceClientMetadata.serviceDescriptor
  }

  internal var interceptors: Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeReadCall(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Telemetry_TagRequest, Telemetry_MultiTagResponse> {
    return self.makeAsyncUnaryCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.read.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeReadInterceptors() ?? []
    )
  }

  internal func makeSubscribeCall(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncServerStreamingCall<Telemetry_TagRequest, Telemetry_TagResponse> {
    return self.makeAsyncServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribe.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeInterceptors() ?? []
    )
  }

  internal func makeWriteCall(
    _ request: Telemetry_WriteTagRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Telemetry_WriteTagRequest, Telemetry_WriteTagResponse> {
    return self.makeAsyncUnaryCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.write.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeWriteInterceptors() ?? []
    )
  }

  internal func makeReadHistoryCall(
    _ request: Telemetry_HistoryReadTagRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncServerStreamingCall<Telemetry_HistoryReadTagRequest, Telemetry_HistoryReadTagResponse> {
    return self.makeAsyncServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.readHistory.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeReadHistoryInterceptors() ?? []
    )
  }

  internal func makeSubscribeEventsCall(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncServerStreamingCall<Telemetry_TagRequest, Telemetry_EventResponse> {
    return self.makeAsyncServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribeEvents.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeEventsInterceptors() ?? []
    )
  }

  internal func makeSubscribeAlarmsCall(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncServerStreamingCall<Telemetry_TagRequest, Telemetry_AlarmResponse> {
    return self.makeAsyncServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribeAlarms.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeAlarmsInterceptors() ?? []
    )
  }

  internal func makeAcknowledgeAlarmCall(
    _ request: Telemetry_AcknowledgeAlarmRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Telemetry_AcknowledgeAlarmRequest, Telemetry_AcknowledgeAlarmResponse> {
    return self.makeAsyncUnaryCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.acknowledgeAlarm.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAcknowledgeAlarmInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Telemetry_TelemetryControlServiceAsyncClientProtocol {
  internal func read(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Telemetry_MultiTagResponse {
    return try await self.performAsyncUnaryCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.read.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeReadInterceptors() ?? []
    )
  }

  internal func subscribe(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncResponseStream<Telemetry_TagResponse> {
    return self.performAsyncServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribe.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeInterceptors() ?? []
    )
  }

  internal func write(
    _ request: Telemetry_WriteTagRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Telemetry_WriteTagResponse {
    return try await self.performAsyncUnaryCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.write.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeWriteInterceptors() ?? []
    )
  }

  internal func readHistory(
    _ request: Telemetry_HistoryReadTagRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncResponseStream<Telemetry_HistoryReadTagResponse> {
    return self.performAsyncServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.readHistory.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeReadHistoryInterceptors() ?? []
    )
  }

  internal func subscribeEvents(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncResponseStream<Telemetry_EventResponse> {
    return self.performAsyncServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribeEvents.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeEventsInterceptors() ?? []
    )
  }

  internal func subscribeAlarms(
    _ request: Telemetry_TagRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncResponseStream<Telemetry_AlarmResponse> {
    return self.performAsyncServerStreamingCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribeAlarms.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeAlarmsInterceptors() ?? []
    )
  }

  internal func acknowledgeAlarm(
    _ request: Telemetry_AcknowledgeAlarmRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Telemetry_AcknowledgeAlarmResponse {
    return try await self.performAsyncUnaryCall(
      path: Telemetry_TelemetryControlServiceClientMetadata.Methods.acknowledgeAlarm.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAcknowledgeAlarmInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Telemetry_TelemetryControlServiceAsyncClient: Telemetry_TelemetryControlServiceAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Telemetry_TelemetryControlServiceClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'read'.
  func makeReadInterceptors() -> [ClientInterceptor<Telemetry_TagRequest, Telemetry_MultiTagResponse>]

  /// - Returns: Interceptors to use when invoking 'subscribe'.
  func makeSubscribeInterceptors() -> [ClientInterceptor<Telemetry_TagRequest, Telemetry_TagResponse>]

  /// - Returns: Interceptors to use when invoking 'write'.
  func makeWriteInterceptors() -> [ClientInterceptor<Telemetry_WriteTagRequest, Telemetry_WriteTagResponse>]

  /// - Returns: Interceptors to use when invoking 'readHistory'.
  func makeReadHistoryInterceptors() -> [ClientInterceptor<Telemetry_HistoryReadTagRequest, Telemetry_HistoryReadTagResponse>]

  /// - Returns: Interceptors to use when invoking 'subscribeEvents'.
  func makeSubscribeEventsInterceptors() -> [ClientInterceptor<Telemetry_TagRequest, Telemetry_EventResponse>]

  /// - Returns: Interceptors to use when invoking 'subscribeAlarms'.
  func makeSubscribeAlarmsInterceptors() -> [ClientInterceptor<Telemetry_TagRequest, Telemetry_AlarmResponse>]

  /// - Returns: Interceptors to use when invoking 'acknowledgeAlarm'.
  func makeAcknowledgeAlarmInterceptors() -> [ClientInterceptor<Telemetry_AcknowledgeAlarmRequest, Telemetry_AcknowledgeAlarmResponse>]
}

internal enum Telemetry_TelemetryControlServiceClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "TelemetryControlService",
    fullName: "telemetry.TelemetryControlService",
    methods: [
      Telemetry_TelemetryControlServiceClientMetadata.Methods.read,
      Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribe,
      Telemetry_TelemetryControlServiceClientMetadata.Methods.write,
      Telemetry_TelemetryControlServiceClientMetadata.Methods.readHistory,
      Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribeEvents,
      Telemetry_TelemetryControlServiceClientMetadata.Methods.subscribeAlarms,
      Telemetry_TelemetryControlServiceClientMetadata.Methods.acknowledgeAlarm,
    ]
  )

  internal enum Methods {
    internal static let read = GRPCMethodDescriptor(
      name: "Read",
      path: "/telemetry.TelemetryControlService/Read",
      type: GRPCCallType.unary
    )

    internal static let subscribe = GRPCMethodDescriptor(
      name: "Subscribe",
      path: "/telemetry.TelemetryControlService/Subscribe",
      type: GRPCCallType.serverStreaming
    )

    internal static let write = GRPCMethodDescriptor(
      name: "Write",
      path: "/telemetry.TelemetryControlService/Write",
      type: GRPCCallType.unary
    )

    internal static let readHistory = GRPCMethodDescriptor(
      name: "ReadHistory",
      path: "/telemetry.TelemetryControlService/ReadHistory",
      type: GRPCCallType.serverStreaming
    )

    internal static let subscribeEvents = GRPCMethodDescriptor(
      name: "SubscribeEvents",
      path: "/telemetry.TelemetryControlService/SubscribeEvents",
      type: GRPCCallType.serverStreaming
    )

    internal static let subscribeAlarms = GRPCMethodDescriptor(
      name: "SubscribeAlarms",
      path: "/telemetry.TelemetryControlService/SubscribeAlarms",
      type: GRPCCallType.serverStreaming
    )

    internal static let acknowledgeAlarm = GRPCMethodDescriptor(
      name: "AcknowledgeAlarm",
      path: "/telemetry.TelemetryControlService/AcknowledgeAlarm",
      type: GRPCCallType.unary
    )
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Telemetry_TelemetryControlServiceProvider: CallHandlerProvider {
  var interceptors: Telemetry_TelemetryControlServiceServerInterceptorFactoryProtocol? { get }

  func read(request: Telemetry_TagRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Telemetry_MultiTagResponse>

  func subscribe(request: Telemetry_TagRequest, context: StreamingResponseCallContext<Telemetry_TagResponse>) -> EventLoopFuture<GRPCStatus>

  func write(request: Telemetry_WriteTagRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Telemetry_WriteTagResponse>

  func readHistory(request: Telemetry_HistoryReadTagRequest, context: StreamingResponseCallContext<Telemetry_HistoryReadTagResponse>) -> EventLoopFuture<GRPCStatus>

  func subscribeEvents(request: Telemetry_TagRequest, context: StreamingResponseCallContext<Telemetry_EventResponse>) -> EventLoopFuture<GRPCStatus>

  /// New method for subscribing to alarms
  func subscribeAlarms(request: Telemetry_TagRequest, context: StreamingResponseCallContext<Telemetry_AlarmResponse>) -> EventLoopFuture<GRPCStatus>

  /// New method for acknowledging alarms
  func acknowledgeAlarm(request: Telemetry_AcknowledgeAlarmRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Telemetry_AcknowledgeAlarmResponse>
}

extension Telemetry_TelemetryControlServiceProvider {
  internal var serviceName: Substring {
    return Telemetry_TelemetryControlServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Read":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_TagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_MultiTagResponse>(),
        interceptors: self.interceptors?.makeReadInterceptors() ?? [],
        userFunction: self.read(request:context:)
      )

    case "Subscribe":
      return ServerStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_TagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_TagResponse>(),
        interceptors: self.interceptors?.makeSubscribeInterceptors() ?? [],
        userFunction: self.subscribe(request:context:)
      )

    case "Write":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_WriteTagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_WriteTagResponse>(),
        interceptors: self.interceptors?.makeWriteInterceptors() ?? [],
        userFunction: self.write(request:context:)
      )

    case "ReadHistory":
      return ServerStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_HistoryReadTagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_HistoryReadTagResponse>(),
        interceptors: self.interceptors?.makeReadHistoryInterceptors() ?? [],
        userFunction: self.readHistory(request:context:)
      )

    case "SubscribeEvents":
      return ServerStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_TagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_EventResponse>(),
        interceptors: self.interceptors?.makeSubscribeEventsInterceptors() ?? [],
        userFunction: self.subscribeEvents(request:context:)
      )

    case "SubscribeAlarms":
      return ServerStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_TagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_AlarmResponse>(),
        interceptors: self.interceptors?.makeSubscribeAlarmsInterceptors() ?? [],
        userFunction: self.subscribeAlarms(request:context:)
      )

    case "AcknowledgeAlarm":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_AcknowledgeAlarmRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_AcknowledgeAlarmResponse>(),
        interceptors: self.interceptors?.makeAcknowledgeAlarmInterceptors() ?? [],
        userFunction: self.acknowledgeAlarm(request:context:)
      )

    default:
      return nil
    }
  }
}

/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Telemetry_TelemetryControlServiceAsyncProvider: CallHandlerProvider, Sendable {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Telemetry_TelemetryControlServiceServerInterceptorFactoryProtocol? { get }

  func read(
    request: Telemetry_TagRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Telemetry_MultiTagResponse

  func subscribe(
    request: Telemetry_TagRequest,
    responseStream: GRPCAsyncResponseStreamWriter<Telemetry_TagResponse>,
    context: GRPCAsyncServerCallContext
  ) async throws

  func write(
    request: Telemetry_WriteTagRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Telemetry_WriteTagResponse

  func readHistory(
    request: Telemetry_HistoryReadTagRequest,
    responseStream: GRPCAsyncResponseStreamWriter<Telemetry_HistoryReadTagResponse>,
    context: GRPCAsyncServerCallContext
  ) async throws

  func subscribeEvents(
    request: Telemetry_TagRequest,
    responseStream: GRPCAsyncResponseStreamWriter<Telemetry_EventResponse>,
    context: GRPCAsyncServerCallContext
  ) async throws

  /// New method for subscribing to alarms
  func subscribeAlarms(
    request: Telemetry_TagRequest,
    responseStream: GRPCAsyncResponseStreamWriter<Telemetry_AlarmResponse>,
    context: GRPCAsyncServerCallContext
  ) async throws

  /// New method for acknowledging alarms
  func acknowledgeAlarm(
    request: Telemetry_AcknowledgeAlarmRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Telemetry_AcknowledgeAlarmResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Telemetry_TelemetryControlServiceAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Telemetry_TelemetryControlServiceServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Telemetry_TelemetryControlServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Telemetry_TelemetryControlServiceServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Read":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_TagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_MultiTagResponse>(),
        interceptors: self.interceptors?.makeReadInterceptors() ?? [],
        wrapping: { try await self.read(request: $0, context: $1) }
      )

    case "Subscribe":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_TagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_TagResponse>(),
        interceptors: self.interceptors?.makeSubscribeInterceptors() ?? [],
        wrapping: { try await self.subscribe(request: $0, responseStream: $1, context: $2) }
      )

    case "Write":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_WriteTagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_WriteTagResponse>(),
        interceptors: self.interceptors?.makeWriteInterceptors() ?? [],
        wrapping: { try await self.write(request: $0, context: $1) }
      )

    case "ReadHistory":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_HistoryReadTagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_HistoryReadTagResponse>(),
        interceptors: self.interceptors?.makeReadHistoryInterceptors() ?? [],
        wrapping: { try await self.readHistory(request: $0, responseStream: $1, context: $2) }
      )

    case "SubscribeEvents":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_TagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_EventResponse>(),
        interceptors: self.interceptors?.makeSubscribeEventsInterceptors() ?? [],
        wrapping: { try await self.subscribeEvents(request: $0, responseStream: $1, context: $2) }
      )

    case "SubscribeAlarms":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_TagRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_AlarmResponse>(),
        interceptors: self.interceptors?.makeSubscribeAlarmsInterceptors() ?? [],
        wrapping: { try await self.subscribeAlarms(request: $0, responseStream: $1, context: $2) }
      )

    case "AcknowledgeAlarm":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Telemetry_AcknowledgeAlarmRequest>(),
        responseSerializer: ProtobufSerializer<Telemetry_AcknowledgeAlarmResponse>(),
        interceptors: self.interceptors?.makeAcknowledgeAlarmInterceptors() ?? [],
        wrapping: { try await self.acknowledgeAlarm(request: $0, context: $1) }
      )

    default:
      return nil
    }
  }
}

internal protocol Telemetry_TelemetryControlServiceServerInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when handling 'read'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeReadInterceptors() -> [ServerInterceptor<Telemetry_TagRequest, Telemetry_MultiTagResponse>]

  /// - Returns: Interceptors to use when handling 'subscribe'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSubscribeInterceptors() -> [ServerInterceptor<Telemetry_TagRequest, Telemetry_TagResponse>]

  /// - Returns: Interceptors to use when handling 'write'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeWriteInterceptors() -> [ServerInterceptor<Telemetry_WriteTagRequest, Telemetry_WriteTagResponse>]

  /// - Returns: Interceptors to use when handling 'readHistory'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeReadHistoryInterceptors() -> [ServerInterceptor<Telemetry_HistoryReadTagRequest, Telemetry_HistoryReadTagResponse>]

  /// - Returns: Interceptors to use when handling 'subscribeEvents'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSubscribeEventsInterceptors() -> [ServerInterceptor<Telemetry_TagRequest, Telemetry_EventResponse>]

  /// - Returns: Interceptors to use when handling 'subscribeAlarms'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSubscribeAlarmsInterceptors() -> [ServerInterceptor<Telemetry_TagRequest, Telemetry_AlarmResponse>]

  /// - Returns: Interceptors to use when handling 'acknowledgeAlarm'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeAcknowledgeAlarmInterceptors() -> [ServerInterceptor<Telemetry_AcknowledgeAlarmRequest, Telemetry_AcknowledgeAlarmResponse>]
}

internal enum Telemetry_TelemetryControlServiceServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "TelemetryControlService",
    fullName: "telemetry.TelemetryControlService",
    methods: [
      Telemetry_TelemetryControlServiceServerMetadata.Methods.read,
      Telemetry_TelemetryControlServiceServerMetadata.Methods.subscribe,
      Telemetry_TelemetryControlServiceServerMetadata.Methods.write,
      Telemetry_TelemetryControlServiceServerMetadata.Methods.readHistory,
      Telemetry_TelemetryControlServiceServerMetadata.Methods.subscribeEvents,
      Telemetry_TelemetryControlServiceServerMetadata.Methods.subscribeAlarms,
      Telemetry_TelemetryControlServiceServerMetadata.Methods.acknowledgeAlarm,
    ]
  )

  internal enum Methods {
    internal static let read = GRPCMethodDescriptor(
      name: "Read",
      path: "/telemetry.TelemetryControlService/Read",
      type: GRPCCallType.unary
    )

    internal static let subscribe = GRPCMethodDescriptor(
      name: "Subscribe",
      path: "/telemetry.TelemetryControlService/Subscribe",
      type: GRPCCallType.serverStreaming
    )

    internal static let write = GRPCMethodDescriptor(
      name: "Write",
      path: "/telemetry.TelemetryControlService/Write",
      type: GRPCCallType.unary
    )

    internal static let readHistory = GRPCMethodDescriptor(
      name: "ReadHistory",
      path: "/telemetry.TelemetryControlService/ReadHistory",
      type: GRPCCallType.serverStreaming
    )

    internal static let subscribeEvents = GRPCMethodDescriptor(
      name: "SubscribeEvents",
      path: "/telemetry.TelemetryControlService/SubscribeEvents",
      type: GRPCCallType.serverStreaming
    )

    internal static let subscribeAlarms = GRPCMethodDescriptor(
      name: "SubscribeAlarms",
      path: "/telemetry.TelemetryControlService/SubscribeAlarms",
      type: GRPCCallType.serverStreaming
    )

    internal static let acknowledgeAlarm = GRPCMethodDescriptor(
      name: "AcknowledgeAlarm",
      path: "/telemetry.TelemetryControlService/AcknowledgeAlarm",
      type: GRPCCallType.unary
    )
  }
}
