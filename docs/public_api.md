Barong
======
Public API for barong OAuth server 

**Version:** 2.0.8-alpha

### /sessions
---
##### ***DELETE***
**Description:** Destroy current session

**Responses**

| Code | Description |
| ---- | ----------- |
| 204 | Destroy current session |
| 400 | Required params are empty |
| 404 | Record is not found |

##### ***POST***
**Description:** Start a new session

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| email | formData |  | Yes | string |
| password | formData |  | Yes | string |
| recaptcha_response | formData | Response from Recaptcha widget | No | string |
| otp_code | formData | Code from Google Authenticator | No | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Start a new session |
| 400 | Required params are empty |
| 404 | Record is not found |

### /sessions/authorize/(*{path})
---
##### ***PUT***
**Description:** Traffic Authorizer EndPoint

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| path | path |  | Yes | string |
| splat | formData |  | Yes | integer |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Traffic Authorizer EndPoint |
| 400 | Request is invalid |
| 404 | Destination endpoint is not found |

##### ***POST***
**Description:** Traffic Authorizer EndPoint

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| path | path |  | Yes | string |
| splat | formData |  | Yes | integer |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Traffic Authorizer EndPoint |
| 400 | Request is invalid |
| 404 | Destination endpoint is not found |

##### ***GET***
**Description:** Traffic Authorizer EndPoint

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| path | path |  | Yes | string |
| splat | query |  | Yes | integer |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Traffic Authorizer EndPoint |
| 400 | Request is invalid |
| 404 | Destination endpoint is not found |

### /sessions/authorize/api/v2/barong/identity/(*{path})
---
##### ***DELETE***
**Description:** Traffic Authorizer EndPoint

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| path | path |  | Yes | string |
| splat | query |  | Yes | integer |

**Responses**

| Code | Description |
| ---- | ----------- |
| 204 | Traffic Authorizer EndPoint |
| 400 | Request is invalid |
| 404 | Destination endpoint is not found |

##### ***PUT***
**Description:** Traffic Authorizer EndPoint

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| path | path |  | Yes | string |
| splat | formData |  | Yes | integer |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Traffic Authorizer EndPoint |
| 400 | Request is invalid |
| 404 | Destination endpoint is not found |

##### ***POST***
**Description:** Traffic Authorizer EndPoint

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| path | path |  | Yes | string |
| splat | formData |  | Yes | integer |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Traffic Authorizer EndPoint |
| 400 | Request is invalid |
| 404 | Destination endpoint is not found |

##### ***GET***
**Description:** Traffic Authorizer EndPoint

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| path | path |  | Yes | string |
| splat | query |  | Yes | integer |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Traffic Authorizer EndPoint |
| 400 | Request is invalid |
| 404 | Destination endpoint is not found |

### /users
---
##### ***POST***
**Description:** Creates new user

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| email | formData | User Email | Yes | string |
| password | formData | User Password | Yes | string |
| recaptcha_response | formData | Response from Recaptcha widget | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Creates new user |
| 400 | Required params are missing |
| 422 | Validation errors |

### /users/email/confirm_code
---
##### ***POST***
**Description:** Confirms an account

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| token | formData | Token from email | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Confirms an account |
| 400 | Required params are missing |
| 422 | Validation errors |

### /users/email/generate_code
---
##### ***POST***
**Description:** Send confirmations instructions

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| email | formData | Account email | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Generated verification code |
| 400 | Required params are missing |
| 422 | Validation errors |

### /users/password/confirm_code
---
##### ***POST***
**Description:** Sets new account password

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| reset_password_token | formData | Token from email | Yes | string |
| password | formData | User password | Yes | string |
| confirm_password | formData | User password | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Resets password |
| 400 | Required params are empty |
| 404 | Record is not found |
| 422 | Validation errors |

### /users/password/generate_code
---
##### ***POST***
**Description:** Send password reset instructions

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| email | formData | Account email | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Generated password reset code |
| 400 | Required params are missing |
| 404 | User doesn't exist |
| 422 | Validation errors |

### /ping
---
##### ***GET***
**Description:** Test connectivity

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Test connectivity |

### /time
---
##### ***GET***
**Description:** Get server current unix timestamp.

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Get server current unix timestamp. |
