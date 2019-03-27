# 3Bot login
3Bot login is a passwordless 2FA authenticator.
By using 3Bot login you can ensure that a user is who (s)he says (s)he is.

## How does this work?
As seen in the flowchart below, a 3th party app needs to redirect to the 3botlogin with *state* and *redirecturl* as query parameter. When the authentication is successfully finished, the user is being reidrected to the *redirecturl* with *username* and *signedhas* as query parameter.
Then it's up to the 3th party site to verify if it was a valid loging. This can be done by an POST call to */API/verify* with *username*, *signedhash* and *hash* in the body. 

### Example
Example.com wants to verify a user.
1) User is being redirect to `https://3botlog.in?state=abc123&redirecturl=https%3A%2F%2Fexample.com%2Fcallback`
2) The user needs to register/login
3) The user is being redirected to `https://example.com/callback?username=exampleman&signedhash=abc123+`
4) To verify the login example.com makes a POST call to `https://3botlog.in/api/verify` with following body `{ username:'exampleman', signedhash:'abc123+', hash: 'abc123'}`
5) The user is signed in

> 3botlog.in and example.com are example urls. 

### Flow
![Auth flow](https://github.com/3botlogin/3botlogin/blob/master/docs/images/Scheme.png)
