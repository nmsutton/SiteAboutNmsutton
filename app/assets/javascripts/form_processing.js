/* Nate Sutton
 * Copyright 2013
 * 
 * A general purpose form value setter and submitter.  Hidden html input are able to
 * be dynamically updated this way based on results obtained from operations.
 */
function processTagLink(TagName) {
	$("#parameterName").val(TagName);
	document.forms['generalForm'].submit();
}