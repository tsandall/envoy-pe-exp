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
# Allow if is public direct
# Return scope with regex path
# allow if path is public by regex
# Allow if token has scope
