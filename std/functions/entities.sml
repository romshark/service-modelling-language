// Implementation is provided by the implementing engine

# entities equals an array of entity instances which match $predicate.
# It equals an empty array if no entity instances match $predicate
function std::entities <@T> (
	# $predicate is applied to the collection of stored entity instances.
	# Any instance where $predicate(instance) matches true is included.
	# If $predicate equals nil it's counted as false
	$predicate ?(@T) => ?Bool,

	$order     ?Order,
	$orderBy   ?(Selector<@T> or Array<Selector<@T>>),
	$limit     Size,
) -> Array<@T>

constraints {
	require @T entity
}
