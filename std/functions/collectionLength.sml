# collectionLength equals the length of the collection of entity instances
# of type @E
function std::collectionLength<@E>

// Implementation is provided by the implementing engine
value Size

constraints {
	require @E entity
}
