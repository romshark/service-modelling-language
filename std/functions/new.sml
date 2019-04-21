// Implementation is provided by the implementing engine

# new equals either a newly created entity instance of type @E or an error
# if the creation fails.
#
# This operation atomically mutates the state of the underlying database.
function std::new <@E> ($constructor Constructor<@E>) -> (Error or @E)

constraints {
	require @E entity
}
