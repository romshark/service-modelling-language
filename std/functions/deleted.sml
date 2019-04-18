// Implementation is provided by the implementing engine

# deleted equals true if $entity was permanently deleted,
# false if no entity was deleted or an error if the deletion fails.
#
# This is a mutating operation, it atomically mutates the state
# of the underlying database
function std::deleted ($entity (entity or ID<entity>)) -> (Error or Bool)
