function processTagLink(TagName) {
	$("#parameterName").val(TagName);
	document.forms['generalForm'].submit();
}