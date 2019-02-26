# String represents a 7-bit ASCII string
type std::String

attributes {
	*regex     ?RegExp
	*minLength Size
	*maxLength Size
}

// Implementation is provided by the implementing engine
value String
