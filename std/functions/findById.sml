# findById equals an optional entity instance which is identified by $id.
# It equals nil if no entity instance is identified by $id
function std::findById

parameters {
	$id ID<@T>
}

value ?@T = findOne<@T>(filter: ($x) => $x:id == $id)

constraints {
	require @T entity
}
