package istio.authz

default allow = false

allow {
	__local16__2 = input.attributes.request.http.method
	lower(__local16__2, __local6__2)
	"get" = __local6__2
	"/api/java-test-ms/v1/auth/{param}" = input.attributes.request.http.path
	__local10__6 = input.attributes.request.http.headers["x-phanton-token"]

	__local10__6 = __local15__5
	io.jwt.decode(__local15__5, __local5__5)
	[__local0__5, __local1__5, __local2__5] = __local5__5

	__local1__5 = _ref_04
	_ref_04.scope = __local11__4

	__local11__4 = _ref_01
	_ref_01[_91] = "java-test-ms:auth-with-values"
}

allow {
	__local16__2 = input.attributes.request.http.method
	lower(__local16__2, __local6__2)
	"get" = __local6__2
	"/api/java-test-ms/v1/auth/{param}/valor" = input.attributes.request.http.path
	__local10__9 = input.attributes.request.http.headers["x-phanton-token"]

	__local10__9 = __local15__8
	io.jwt.decode(__local15__8, __local5__8)
	[__local0__8, __local1__8, __local2__8] = __local5__8

	__local1__8 = _ref_17
	_ref_17.scope = __local11__7

	__local11__7 = _ref_11
	_ref_11[_91] = "java-test-ms:auth-with-param-value"
}

allow {
	__local18__10 = input.attributes.request.http.method
	lower(__local18__10, __local8__10)
	"get" = __local8__10
	__local20__10 = input.attributes.request.http.path
	regex.match("^\\/api\\/java-test-ms\\/v1\\/auth\\/([^\\/]+)\\/?$", __local20__10)
	__local10__13 = input.attributes.request.http.headers["x-phanton-token"]

	__local10__13 = __local15__12
	io.jwt.decode(__local15__12, __local5__12)
	[__local0__12, __local1__12, __local2__12] = __local5__12

	__local1__12 = _ref_211
	_ref_211.scope = __local11__11

	__local11__11 = _ref_21
	_ref_21[_91] = "java-test-ms:auth-with-values"
}

allow {
	__local18__10 = input.attributes.request.http.method
	lower(__local18__10, __local8__10)
	"get" = __local8__10
	__local20__10 = input.attributes.request.http.path
	regex.match("^\\/api\\/java-test-ms\\/v1\\/auth\\/([^\\/]+)\\/valor\\/?(\\?.*|$)$", __local20__10)
	__local10__16 = input.attributes.request.http.headers["x-phanton-token"]

	__local10__16 = __local15__15
	io.jwt.decode(__local15__15, __local5__15)
	[__local0__15, __local1__15, __local2__15] = __local5__15

	__local1__15 = _ref_314
	_ref_314.scope = __local11__14

	__local11__14 = _ref_31
	_ref_31[_91] = "java-test-ms:auth-with-param-value"
}

allow {
	lower(input.attributes.request.http.method, "get")
	"/api/java-test-ms/v1/auth" = input.attributes.request.http.path
}

allow {
	lower(input.attributes.request.http.method, "get")
	"/api/java-test-ms/v1/health" = input.attributes.request.http.path
}

allow {
	lower(input.attributes.request.http.method, "get")
	"/api/java-test-ms/v1/mobile/{celular}" = input.attributes.request.http.path
}

allow {
	lower(input.attributes.request.http.method, "get")
	"/api/java-test-ms/v1/public" = input.attributes.request.http.path
}

allow {
	lower(input.attributes.request.http.method, "get")
	regex.match("^\\/api\\/java-test-ms\\/v1\\/mobile\\/([^\\/]+)\\/?(\\?.*$|$)", input.attributes.request.http.path)
}

allow {
	lower(input.attributes.request.http.method, "post")
	"/api/java-test-ms/v1/auth" = input.attributes.request.http.path
}

allow {
	lower(input.attributes.request.http.method, "post")
	"/api/java-test-ms/v1/auth/{param}" = input.attributes.request.http.path
}

allow {
	lower(input.attributes.request.http.method, "post")
	regex.match("^\\/api\\/java-test-ms\\/v1\\/auth\\/([^\\/]+)\\/?$", input.attributes.request.http.path)
}
