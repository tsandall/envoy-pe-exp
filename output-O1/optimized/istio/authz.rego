package istio.authz

default allow = false

allow {
	__local17__5 = input.attributes.request.http.method
	lower(__local17__5, __local7__5)
	"get" = __local7__5
	"/api/java-test-ms/v1/auth" = input.attributes.request.http.path
}

allow {
	__local17__5 = input.attributes.request.http.method
	lower(__local17__5, __local7__5)
	"get" = __local7__5
	"/api/java-test-ms/v1/health" = input.attributes.request.http.path
}

allow {
	__local17__5 = input.attributes.request.http.method
	lower(__local17__5, __local7__5)
	"get" = __local7__5
	"/api/java-test-ms/v1/mobile/{celular}" = input.attributes.request.http.path
}

allow {
	__local17__5 = input.attributes.request.http.method
	lower(__local17__5, __local7__5)
	"get" = __local7__5
	"/api/java-test-ms/v1/public" = input.attributes.request.http.path
}

allow {
	__local17__5 = input.attributes.request.http.method
	lower(__local17__5, __local7__5)
	"post" = __local7__5
	"/api/java-test-ms/v1/auth" = input.attributes.request.http.path
}

allow {
	__local17__5 = input.attributes.request.http.method
	lower(__local17__5, __local7__5)
	"post" = __local7__5
	"/api/java-test-ms/v1/auth/{param}" = input.attributes.request.http.path
}

allow {
	__local21__7 = input.attributes.request.http.method
	lower(__local21__7, __local9__7)
	"get" = __local9__7
	__local23__7 = input.attributes.request.http.path
	regex.match("^\\/api\\/java-test-ms\\/v1\\/mobile\\/([^\\/]+)\\/?(\\?.*$|$)", __local23__7)
}

allow {
	__local21__7 = input.attributes.request.http.method
	lower(__local21__7, __local9__7)
	"post" = __local9__7
	__local23__7 = input.attributes.request.http.path
	regex.match("^\\/api\\/java-test-ms\\/v1\\/auth\\/([^\\/]+)\\/?$", __local23__7)
}

allow {
	data.istio.authz.request_role[_] = data.istio.authz.token_scopes[_]
}

request_role["java-test-ms:auth-with-param-value"] {
	__local16__2 = input.attributes.request.http.method
	lower(__local16__2, __local6__2)
	"get" = __local6__2
	"/api/java-test-ms/v1/auth/{param}/valor" = input.attributes.request.http.path
}

request_role["java-test-ms:auth-with-param-value"] {
	__local18__4 = input.attributes.request.http.method
	lower(__local18__4, __local8__4)
	"get" = __local8__4
	__local20__4 = input.attributes.request.http.path
	regex.match("^\\/api\\/java-test-ms\\/v1\\/auth\\/([^\\/]+)\\/valor\\/?(\\?.*|$)$", __local20__4)
}

request_role["java-test-ms:auth-with-values"] {
	__local16__2 = input.attributes.request.http.method
	lower(__local16__2, __local6__2)
	"get" = __local6__2
	"/api/java-test-ms/v1/auth/{param}" = input.attributes.request.http.path
}

request_role["java-test-ms:auth-with-values"] {
	__local18__4 = input.attributes.request.http.method
	lower(__local18__4, __local8__4)
	"get" = __local8__4
	__local20__4 = input.attributes.request.http.path
	regex.match("^\\/api\\/java-test-ms\\/v1\\/auth\\/([^\\/]+)\\/?$", __local20__4)
}
