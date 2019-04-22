# reducedCollection represents a paginable collection of entity instances
# reduced to a specific type
template std::reducedCollection<@E, @T> (
	*predicate ?(@E) => Bool
	*order     ?Order
	*orderBy   ?(Selector<@E> or Array<Selector<@E>>)
	*reducer   (@E) => @T
)

parameters {
	$page PageSelector<@T>
}

value -> struct {
	totalLength Uint64
	version     Version
	items       Array<@T>
} = struct {
	totalLength Uint64 = collectionLength<@E>()
	version     Version = collectionVersion<@E>()

	items Array<@T> = map(resolvedPage<@T>(
		$page,
		$predicate,
		$order,
		$orderBy,
	), ($e) => *reducer($e))
}

constraints {
	require @E entity
}
