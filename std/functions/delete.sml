# delete equals true if $entity was permanently deleted.
# It will equal false if $entity is of type ID<@E>
# and no actual entity instance is identified by it.
#
# This is a mutating function, it atomically mutates the state
# of the underlying database
function std::delete {
	$entity (entity or ID<entity>)
}

// Implementation is provided by the implementing engine
value Bool
