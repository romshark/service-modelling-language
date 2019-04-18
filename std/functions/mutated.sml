// Implementation is provided by the implementing engine

# mutated equals either the mutated version of $entity or an error if the
# mutation fails.
#
# This operation atomically mutates the state of the underlying database.
#
# Applying f.mutated to $entity multiple times within the scope of a
# transaction will cause an engine panic
function std::mutated (
	$entity  @E,
	$mutator Mutator<@E>,
) -> (Error or @E)

constraints {
	require @E entity
}
