# update equals the updated version of $entity.
#
# This is a mutating function, it atomically mutates the state
# of the underlying database.
#
# Applying f.update to $entity multiple times within the scope of a
# transaction will cause an engine panic
function std::update {
	$entity  @E
	$mutator Mutator<@E>
}

// Implementation is provided by the implementing engine
value @E

constraints {
	require @E entity
}
