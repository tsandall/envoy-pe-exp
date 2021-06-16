package istio.authz

import input.attributes.request.http as http_request

jwt_string := http_request.headers["x-phanton-token"]

# Decode Token
parsed_token = token {
	[header, payload, sig] := io.jwt.decode(jwt_string)
	token = {
		"header": header,
		"payload": payload,
		"sig": sig,
	}
}

token_scopes = parsed_token.payload.scope

named_policies := data.named_policies

public_rules := data.public_rules

path = http_request.path

# Return scope with plain path
request_role[role] {
	pol := named_policies[role]
	pol[_].method == lower(http_request.method)
	pol[_].paths[_].path == http_request.path
}

# Allow if is public direct

# Return scope with regex path
request_role[role] {
	pol := named_policies[role]
	pol[_].method == lower(http_request.method)
	regex.match(pol[_].paths[_].path_re2, http_request.path)
}

# allow if path is public by regex
# Allow if token has scope
