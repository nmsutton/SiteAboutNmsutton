/*
 * This function allows an iframe content container to automatically
 * resize based on its content.  It eliminates the need for scrolling 
 * in the iframe instead of in the whole page.
 */
function resizeIframe(obj) {
	obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
}