# Text represents UTF-8 encoded text
type std::Text

attributes {
	*regex     ?RegExp
	*minLength Size
	*maxLength Size
}

// Implementation is provided by the implementing engine
value Text
