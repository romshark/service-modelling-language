# resolvedPage equals a page of @T resolved from the page selector $page
function std::resolvedPage <@T> (
	$page      PageSelector<@T>,
	$predicate ?(@T) => Bool
	$order     ?Order
	$orderBy   ?(Selector<@T> or Array<Selector<@T>>)
) = $page as $p {
	Array<ID<@T>> then entities<@T>(
		($t) => id($t) in $p and $predicate($t),
		$order,
		$orderBy,
		$limit
	)

	struct {
		cursor ID<@T>
		limit  Int32
	} then match {
		$p.limit > 0 then entities<@T>(
			($t) => id($t) > $p.cursor and $predicate($t),
			$order,
			$orderBy,
			$limit,
		)
		$p.limit < 0 then entities<@T>(
			($t) => id($t) < $p.cursor and $predicate($t),
			$order,
			$orderBy,
			$limit,
		)
	}

	else []
}
