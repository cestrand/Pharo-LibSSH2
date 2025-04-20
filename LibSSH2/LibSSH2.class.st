"
https://libssh2.org/docs.html
"
Class {
	#name : 'LibSSH2',
	#superclass : 'Object',
	#category : 'LibSSH2-Bindings',
	#package : 'LibSSH2',
	#tag : 'Bindings'
}

{ #category : 'as yet unclassified' }
LibSSH2 class >> agentConnect: agent [
	^ self ffiCall: #( int libssh2_agent_connect(LIBSSH2_AGENT* agent) )
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> agentDisconnect: agent [
	^ self ffiCall: #( int libssh2_agent_disconnect(LIBSSH2_AGENT* agent) )
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> agentFree: agent [
	^ self ffiCall: #(void libssh2_agent_free(LIBSSH2_AGENT* agent) )
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> agentGetIdentity: agent store: store prev: prev [
	^ self ffiCall: #(int libssh2_agent_get_identity(LIBSSH2_AGENT* agent, struct libssh2_agent_publickey** store, struct libssh2_agent_publickey* prev) )
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> agentGetIdentityPath: agent [
	^ self ffiCall: #(String libssh2_agent_get_identity_path(LIBSSH2_AGENT* agent) )
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> agentInit: session [
	^ self ffiCall: #(LIBSSH2_AGENT* libssh2_agent_init(LIBSSH2_SESSION *session))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> agentListIdentities: agent [
	^ self ffiCall: #(int libssh2_agent_list_identities(LIBSSH2_AGENT* agent))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> agentSetIdentity: agent path: path [
	^ self ffiCall: #(void libssh2_agent_set_identity_path(LIBSSH2_AGENT* agent, String path))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> agentUserAuth: agent username: username identity: identity [
	^ self ffiCall: #(int libssh2_agent_userauth(LIBSSH2_AGENT* agent, String username, struct libssh2_agent_publickey* identity))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> channelClose: channel [
	^ self ffiCall: #(int libssh2_channel_close(LIBSSH2_CHANNEL* channel))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> channelExec: aChannel command: aCommand [
	| request |
	request := 'exec'.
	^ self channelProcessStartup: aChannel request: request requestLen: (request size) message: aCommand messageLen: (aCommand size)
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> channelFree: channel [
	^ self ffiCall: #(int libssh2_channel_free(LIBSSH2_CHANNEL* channel))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> channelOpenEx: aSession type: aType typeLen: aTypeLen windowSize: aWindowSize packetSize: aPacketSize message: aMessage messageLen: aMessageLen [
	^ self ffiCall: #( LIBSSH2_CHANNEL* libssh2_channel_open_ex(LIBSSH2_SESSION* aSession, String aType, uint aTypeLen, uint aWindowSize, uint aPacketSize, String aMessage, uint aMessageLen))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> channelOpenSession: session [
	| type windowSize packetSize |
	type := 'session'.
	windowSize := (2*1024*1024).
	packetSize := 32768.
	^ self channelOpenEx: session type: type typeLen: (type size) windowSize: windowSize packetSize: packetSize message: nil messageLen: 0
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> channelProcessStartup: aChannel request: aRequest requestLen: aRequestLen message: aMessage messageLen: aMessageLen [
	^ self ffiCall: #( int libssh2_channel_process_startup(LIBSSH2_CHANNEL* aChannel, String aRequest, uint aRequestLen, String aMessage, uint aMessageLen) )
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> channelRead: channel buf: buf buflen: buflen [
	^ self ffiCall: #(long libssh2_channel_read_ex(LIBSSH2_CHANNEL* channel, int 0, char* buf, ulong buflen))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> channelRead: aChannel buffer: aBuffer bufferLen: aBufferLen [
	^ self channelReadEx: aChannel streamId: 0 buffer: aBuffer bufferLen: (aBuffer size)
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> channelReadEx: channel streamId: aStreamId buffer: aBuffer bufferLen: aBufferLen [
	^ self ffiCall: #( long libssh2_channel_read_ex(LIBSSH2_CHANNEL* channel, int aStreamId, char* aBuffer, ulong aBufferLen) )
]

{ #category : 'private' }
LibSSH2 class >> exit [
	^ self ffiCall: #(void libssh2_exit())
]

{ #category : 'library path' }
LibSSH2 class >> ffiLibraryName [ 
	^ 'libssh2-1.dll'
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> init: flags [
	^ self ffiCall: #(int libssh2_init(int flags))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> sessionDisconnect: session description: description [
	^ self ffiCall: #(int libssh2_session_disconnect_ex(LIBSSH2_SESSION* session, int 11, String description, String ''))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> sessionFree: session [
	^ self ffiCall: #(int libssh2_session_free(LIBSSH2_SESSION* session))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> sessionHandshake: session socket: socket [
	^ self ffiCall: #(int libssh2_session_handshake(LIBSSH2_SESSION* session, ulong socket))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> sessionInit [
	^ self ffiCall: #(LIBSSH2_SESSION* libssh2_session_init_ex(NULL, NULL, NULL, NULL))
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> userAuthAuthenticated: session [
	^ self ffiCall: #( int libssh2_userauth_authenticated(LIBSSH2_SESSION* session) )
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> userauthPassword: session username: username password: password [
	| usernameLen passwordLen |
	usernameLen := username size.
	passwordLen := password size.
	^ self userauthPasswordEx: session username: username usernameLen: usernameLen password: password passwordLen: passwordLen
]

{ #category : 'as yet unclassified' }
LibSSH2 class >> userauthPasswordEx: session username: username usernameLen: usernameLen password: password passwordLen: passwordLen [
	^ self ffiCall: #( int libssh2_userauth_password_ex(LIBSSH2_SESSION* session, String username, uint usernameLen, String password, uint passwordLen, NULL) )
]

{ #category : 'library path' }
LibSSH2 class >> version: requiredVersion [
	^ self ffiCall: #(String libssh2_version(int requiredVersion))
]
