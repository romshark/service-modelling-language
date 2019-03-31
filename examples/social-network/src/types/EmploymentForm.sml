type socialNetwork::EmploymentForm

use {
	"std/time" 1.0
}

value struct {
	organization Organization
	begin        Time
	end          ?Time
	position     ?Text
}
