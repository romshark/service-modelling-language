# SML example: SocialNetwork

**SocialNetwork** is a sophisticated example of an API service designed in SML. It demonstrating the use of:

- entity types
- pure structure types
- linked structure types
- enumeration types
- union types
- custom scalar types
- optional types
- various link- and relation types
  - bidirectional
  - unidirectional
  - plural
- functional expressions
- boolean expressions
- built-in functions
  - filter
  - sort
  - intersection
  - the + operator
  - the - operator
- hidden properties
- complex graph access permissions
- transactions
- transaction errors
- conditional transaction errors

## Query Examples
### Fetching a User Profile
Querying basic profile information of a user, where `$userId` is the id of the user:
```
query($userId ID<User>) {
	users[$userId] {
		name {
			firstName
			lastName
		}
		gender
		email
		birthDate
		avatar {
			file
		}
	}
}
```

### Fetching Multiple User Profiles (Querying Multiple Relations)
Querying the email addresses of multiple users, where `$userIds` is the list of ids of the users:
```
query($userIds []ID<User>) {
	users[$userIds] {
		name {
			firstName
			lastName
		}
	}
}
```

Alternativelly, we can also pass multiple ids as individual variables and query the `users` graph root node using multiple keys:
```
query(
	$user1Id ID<User>
	$user2Id ID<User>
	$user3Id ID<User>
) {
	users[$user1Id, $user2Id, $user3Id] {
		name {
			firstName
			lastName
		}
	}
}
```

### Finding Friends (Querying Relations)
Querying basic information (email, gender and name) about a user's friends, where `$userId` is the id of the user:
```
query($userId ID<User>) {
	users[$userId] {
		friends {
			name {
				firstName
				lastName
			}
			gender
			email
		}
	}
}
```

### Finding Number of Friends (Querying Hidden Fields)
Querying the number of friends of a user, where `$userId` is the id of the user:
```
query($userId ID<User>) {
	users[$userId] {
		friends:length
	}
}
```
`:length` is a hidden field that represents the number of relations represented by the field `friends` of type `[]User`.

### Fetching a Slice of Friends (Using Builtin Pagination)
Querying the emails of `$n` first friends, where `$userId` is the id of the user:
```
query(
	$userId ID<User>
	$n      Uint32
) {
	users[$userId] {
		friends[:$n] {
			email
		}
		friends:version
	}
}
```

Querying the emails of the next `$n` friends after the last `$after` cursor:
```
query(
	$userId ID<User>
	$n      Uint32
	$after  ID<User>
) {
	users[$userId] {
		friends[$after:$n] {
			email
		}
		friends:version
	}
}
```

Notice that we're also fetching `friends:version` which represents the version of the list of `friends`. This field helps invalidating cached pages. It must be compared to the previously fetched version and if it changed all previously fetched slices should be dropped and in case of infinite scroll the could be refeched relative to the currently fetched one.

### Creating a Post (Calling a Transaction)
Publishing a new post **visible publicly** on behalf of a user, where `$userId` is the id of the user and `$contents` is the UTF-8 encoded textual content:
```
query(
	$userId   ID<User>
	$contents Text
) {
	PublishPost (
		author  $userId
		content $contents
		access 	Visibility::public
	)
}
```

Creating a private post that's **not visible to anyone but the owner**, where `$userId` is the id of the user and `$contents` is the UTF-8 encoded textual content:
```
query(
	$userId   ID<User>
	$contents Text
) {
	PublishPost (
		author  $userId
		content $contents
		access 	Visibility(Private)
	)
}
```

Creating a post that's **not visible to blacklisted friends**, where `$userId` is the id of the user and `$contents` is the UTF-8 encoded textual content while `$blacklistedUserIds` is the list of blacklisted user ids:
```
query(
	$userId             ID<User>
	$contents           Text
	$blacklistedUserIds []ID<User>
) {
	PublishPost (
		author  $userId
		content $contents
		access 	VisibilityBlacklistForm {
			users $blacklistedUserIds
		}
	)
}
```

Creating a post that's **only visible to whitelisted friends**, where `$userId` is the id of the user and `$contents` is the UTF-8 encoded textual content while `$whitelistedUserIds` is the list of whitelisted user ids:
```
query(
	$userId             ID<User>
	$contents           Text
	$whitelistedUserIds []ID<User>
) {
	PublishPost (
		author  $userId
		content $contents
		access 	VisibilityWhitelistForm {
			users $whitelistedUserIds
		}
	)
}
```
