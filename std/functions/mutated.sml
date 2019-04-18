// Implementation is provided by the implementing engine

# mutated equals the mutated version of $entity.
#
# This is a mutating function, it atomically mutates the state
# of the underlying database.
#
# Applying f.mutated to $entity multiple times within the scope of a
# transaction will cause an engine panic
function std::mutated (
	$entity  @E,
	$mutator Mutator<@E>,
) -> @E

constraints {
	require @E entity
}
