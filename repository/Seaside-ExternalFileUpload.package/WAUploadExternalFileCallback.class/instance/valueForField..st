converting
valueForField: anObject
	| postFields filename filetype location |
	postFields := self requestContext request postFields.
	filename := postFields at: key,'.name' ifAbsent:[nil].
	filetype := WAMimeType fromString:(postFields at: key,'.content_type' ifAbsent:[nil]).
	location := postFields at: key,'.path' ifAbsent:[nil].
	^ WAExternalFile new
		fileName: filename;
		contentType: filetype;
		filePath: location