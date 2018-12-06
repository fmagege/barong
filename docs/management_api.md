Barong
======
Management API for barong OAuth server 

**Version:** 2.0.8-alpha

### Security
---
**BearerToken**  

|jwt|*undefined*|
|---|---|
|Description|Bearer Token authentication|
|Name|Authorization|
|In|header|

### /labels/delete
---
##### ***POST***
**Description:** Delete a label with 'private' scope

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| user_uid | formData | User uid | Yes | string |
| key | formData | Label key. | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 201 | Delete a label with 'private' scope | [Label](#label) |

### /labels
---
##### ***PUT***
**Description:** Update a label with 'private' scope

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| user_uid | formData | User uid | Yes | string |
| key | formData | Label key. | Yes | string |
| value | formData | Label value. | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Update a label with 'private' scope | [Label](#label) |

##### ***POST***
**Description:** Create a label with 'private' scope and assigns to users

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| user_uid | formData | User uid | Yes | string |
| key | formData | Label key. | Yes | string |
| value | formData | Label value. | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 201 | Create a label with 'private' scope and assigns to users | [Label](#label) |

### /labels/list
---
##### ***POST***
**Description:** Get all labels assigned to users

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| user_uid | formData | User uid | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 201 | Get all labels assigned to users | [Label](#label) |

### /users/import
---
##### ***POST***
**Description:** Imports an existing user

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| email | formData | User Email | Yes | string |
| password_digest | formData | User Password Hash | Yes | string |
| phone | formData |  | No | string |
| first_name | formData |  | No | string |
| last_name | formData |  | No | string |
| dob | formData | Birthday date | No | date |
| address | formData |  | No | string |
| postcode | formData |  | No | string |
| city | formData |  | No | string |
| country | formData |  | No | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 201 | Imports an existing user | [UserWithProfile](#userwithprofile) |

### /users
---
##### ***POST***
**Description:** Creates new user

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| email | formData | User Email | Yes | string |
| password | formData | User Password | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 201 | Creates new user | [UserWithProfile](#userwithprofile) |

### /users/get
---
##### ***POST***
**Description:** Get users and profile information

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| uid | formData | User uid | Yes | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 201 | Get users and profile information | [UserWithProfile](#userwithprofile) |

### /timestamp
---
##### ***POST***
**Description:** Returns server time in seconds since Unix epoch.

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Returns server time in seconds since Unix epoch. |

### Models
---

### Label  

Get all labels assigned to users

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| key | string | Label key. [a-z0-9_-]+ should be used. Min - 3, max - 255 characters. | No |
| value | string | Label value. [A-Za-z0-9_-] should be used. Min - 3, max - 255 characters. | No |
| scope | string | Label scope: 'public' or 'private' | No |
| created_at | string |  | No |
| updated_at | string |  | No |

### UserWithProfile  

Get users and profile information

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