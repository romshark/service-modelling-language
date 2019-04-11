use {
	"std/time" 1.0
}

type socialNetwork::EmploymentForm = struct {
	organization Organization
	begin        Time
	end          ?Time
	position     ?Text
}
