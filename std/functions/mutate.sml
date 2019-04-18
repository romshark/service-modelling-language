// Implementation is provided by the implementing engine

# mutate equals the mutated version of $entity.
#
# This is a mutating function, it atomically mutates the state
# of the underlying database.
#
# Applying f.mutate to $entity multiple times within the scope of a
# transaction will cause an engine panic
function std::mutate (
	$entity  @E,
	$mutator Mutator<@E>,
) -> @E

constraints {
	require @E entity
}
