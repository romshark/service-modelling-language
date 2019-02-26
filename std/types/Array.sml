# Array represents an array of arbitrary items of the same type
type std::Array<@T>

attributes {
	*minLength Size
	*maxLength Size
}

// Implementation is provided by the implementing engine
value Array<@T>
