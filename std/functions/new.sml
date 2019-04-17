# new equals a newly created entity instance of type @E.
#
# This is a mutating function, it atomically mutates the state
# of the underlying database
function std::new <@E> ($constructor Constructor<@E>)

// Implementation is provided by the implementing engine
value @E

constraints {
	require @E entity
}
