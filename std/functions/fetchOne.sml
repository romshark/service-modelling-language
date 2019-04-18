// Implementation is provided by the implementing engine

# fetchOne equals an optional entity instances which matches $predicate.
# It equals nil if no entity instances matches $predicate.
#
# If $predicate equals nil it's counted as false
function std::fetchOne <@T> ($predicate ?(@T) => ?Bool) -> ?@T

constraints {
	require @T entity
}
