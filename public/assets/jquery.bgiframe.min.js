/* Copyright (c) 2006 Brandon Aaron (http://brandonaaron.net)
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php) 
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *
 * $LastChangedDate: 2007-07-21 18:45:56 -0500 (Sat, 21 Jul 2007) $
 * $Rev: 2447 $
 *
 * Version 2.1.1
 */
!function(t){t.fn.bgIframe=t.fn.bgiframe=function(e){if(t.browser.msie&&/6.0/.test(navigator.userAgent)){e=t.extend({top:"auto",left:"auto",width:"auto",height:"auto",opacity:!0,src:"javascript:false;"},e||{});var i=function(t){return t&&t.constructor==Number?t+"px":t},n='<iframe class="bgiframe"frameborder="0"tabindex="-1"src="'+e.src+'"'+'style="display:block;position:absolute;z-index:-1;'+(e.opacity!==!1?"filter:Alpha(Opacity='0');":"")+"top:"+("auto"==e.top?"expression(((parseInt(this.parentNode.currentStyle.borderTopWidth)||0)*-1)+'px')":i(e.top))+";"+"left:"+("auto"==e.left?"expression(((parseInt(this.parentNode.currentStyle.borderLeftWidth)||0)*-1)+'px')":i(e.left))+";"+"width:"+("auto"==e.width?"expression(this.parentNode.offsetWidth+'px')":i(e.width))+";"+"height:"+("auto"==e.height?"expression(this.parentNode.offsetHeight+'px')":i(e.height))+";"+'"/>';return this.each(function(){0==t("> iframe.bgiframe",this).length&&this.insertBefore(document.createElement(n),this.firstChild)})}return this}}(jQuery);