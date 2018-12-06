Barong
======
Protected API for barong OAuth server 

**Version:** 2.0.8-alpha

### Security
---
**BearerToken**  

|jwt|*undefined*|
|---|---|
|Description|Bearer Token authentication|
|Name|Authorization|
|In|header|

### /users/activity/{topic}
---
##### ***GET***
**Description:** Returns user activity

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| topic | path | Topic of user activity. Allowed: [all, password, session, otp] | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Returns user activity |

### /users/me
---
##### ***GET***
**Description:** Returns current user

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Returns current user |

### /profiles
---
##### ***POST***
**Description:** Create a profile for current_user

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| first_name | formData |  | Yes | string |
| last_name | formData |  | Yes | string |
| dob | formData |  | Yes | date |
| address | formData |  | Yes | string |
| postcode | formData |  | Yes | string |
| city | formData |  | Yes | string |
| country | formData |  | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Create a profile for current_user |
| 400 | Required params are empty |
| 401 | Invalid bearer token |
| 409 | Profile already exists |
| 422 | Validation errors |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### /profiles/me
---
##### ***GET***
**Description:** Return profile of current resource owner

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Return profile of current resource owner |
| 401 | Invalid bearer token |
| 404 | User has no profile |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### /documents
---
##### ***POST***
**Description:** Upload a new document for current user

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| doc_expire | formData | Document expiration date | Yes | date |
| doc_type | formData | Document type | Yes | string |
| doc_number | formData | Document number | Yes | string |
| upload | formData | Uploaded file | Yes | file |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Document is uploaded |
| 400 | Required params are empty |
| 401 | Invalid bearer token |
| 422 | Validation errors |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

##### ***GET***
**Description:** Return current user documents list

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Return current user documents list |
| 401 | Invalid bearer token |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### /phones/verify
---
##### ***POST***
**Description:** Verify a phone

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| phone_number | formData | Phone number with country code | Yes | string |
| verification_code | formData | Verification code from sms | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Verify a phone |
| 400 | Required params are empty |
| 401 | Invalid bearer token |
| 404 | Record is not found |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### /phones/send_code
---
##### ***POST***
**Description:** Resend activation code

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| phone_number | formData | Phone number with country code | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Resend activation code |
| 400 | Required params are empty |
| 401 | Invalid bearer token |
| 404 | Record is not found |
| 422 | Validation errors |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### /phones
---
##### ***POST***
**Description:** Add new phone

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| phone_number | formData | Phone number with country code | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Add new phone |
| 400 | Required params are empty |
| 401 | Invalid bearer token |
| 404 | Record is not found |
| 422 | Validation errors |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### /otp/verify
---
##### ***POST***
**Description:** Verify 2FA code

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| code | formData | Code from Google Authenticator | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Verify 2FA code |
| 400 | 2FA has not been enabled for this account or code is missing |
| 401 | Invalid bearer token |
| 422 | Validation errors |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### /otp/enable
---
##### ***POST***
**Description:** Enable 2FA

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| code | formData | Code from Google Authenticator | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Enable 2FA |
| 400 | 2FA has been enabled for this account or code is missing |
| 401 | Invalid bearer token |
| 422 | Validation errors |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### /otp/generate_qrcode
---
##### ***POST***
**Description:** Generate qr code for 2FA

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Generate qr code for 2FA |
| 400 | 2FA has been enabled for this account |
| 401 | Invalid bearer token |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### /api_keys
---
##### ***GET***
**Description:** List all api keys for current account.

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| totp_code | query | Code from Google Authenticator | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | List all api keys for current account. |
| 400 | Require 2FA and totp code |
| 401 | Invalid bearer token |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

##### ***POST***
**Description:** Create an api key

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| algorithm | formData |  | Yes | string |
| kid | formData |  | No | string |
| scope | formData | comma separated scopes | No | string |
| totp_code | formData | Code from Google Authenticator | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Create an api key |
| 400 | Required params are empty |
| 401 | Invalid bearer token |
| 422 | Validation errors |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### /api_keys/{kid}
---
##### ***DELETE***
**Description:** Delete an api key

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| kid | path |  | Yes | string |
| totp_code | query | Code from Google Authenticator | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 204 | Succefully deleted |
| 400 | Required params are empty |
| 401 | Invalid bearer token |
| 404 | Record is not found |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

##### ***PATCH***
**Description:** Updates an api key

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| kid | path |  | Yes | string |
| scope | formData | comma separated scopes | No | string |
| state | formData | State of API Key. "active" state means key is active and can be used for auth | No | string |
| totp_code | formData | Code from Google Authenticator | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Updates an api key |
| 400 | Required params are empty |
| 401 | Invalid bearer token |
| 404 | Record is not found |
| 422 | Validation errors |

**Security**

| Security Schema | Scopes |
| --- | --- |
| BearerToken | |

### Models
---

### Label  

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| key | string | Label key. [a-z0-9_-]+ should be used. Min - 3, max - 255 characters. | No |
| value | string | Label value. [A-Za-z0-9_-] should be used. Min - 3, max - 255 characters. | No |
| scope | string | Label scope: 'public' or 'private' | No |
| created_at | string |  | No |
| updated_at | string |  | No |

### APIKey  

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| kid | string | jwt public key | No |
| algorithm | string | cryptographic hash function type | No |
| scope | string | serialized array of scopes | No |
| state | string | active/non-active state of key | No |
| secret | string |  | No |
| created_at | string |  | No |
| updated_at | string |  | No |

### Profile  

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| first_name | string |  | No |
| last_name | string |  | No |
| dob | date | Birthday date | No |
| address | string |  | No |
| postcode | string |  | No |
| city | string |  | No |
| country | string |  | No |
| metadata | object | Profile additional fields | No |

### UserWithProfile  

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| email | string |  | No |
| uid | string |  | No |
| role | string |  | No |
| level | integer |  | No |
| otp | boolean | is 2FA enabled for account | No |
| state | string |  | No |
| profile | [Profile](#profile) |  | No |
| created_at | string |  | No |
| updated_at | string |  | No |