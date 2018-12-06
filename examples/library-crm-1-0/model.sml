# LibraryCRM defines the model of a library CRM service
model LibraryCRM {
	smlVersion: 1.0
	homepage:   github.com/qbeon/service-modelling-language
	authors:
		Roman Sharkov <roman.sharkov@qbeon.com>
		Some Person <some@company.org>
}

root books [Book]
root customers [Customer]
root managers [Manager]

root book(id *Book) Book? // Returns null if non is found
root bookCopy(id *BookCopy) BookCopy?
root customer(id *Customer) Customer?
root manager(id *Manager) Manager?

// Define access permissions to all graph nodes recursively
access root {
	// All primary administrators are allowed to access all nodes of the graph
	PrimaryAdmin
}