# SendMessage sends a message to the receiver user from the sender user
transaction SocialNetwork::SendMessage

use {
	"std" 1.0
}

parameters {
	$sender   ID<User>
	$receiver ID<User>
	$contents Text
}

results {
	sentMessage Message
}

# Allow sending messages to users only on their own behalf
access SendMessage {
	allow User as $accessor if $accessor.activation != nil &&
		$accessor == $sender &&
		$accessor in $receiver.friends
}
