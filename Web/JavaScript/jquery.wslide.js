/**
 * wSlide 0.1 - http://www.webinventif.fr/wslide-plugin/
 * 
 * Rendez vos sites glissant !
 *
 * Copyright (c) 2008 Julien Chauvin (webinventif.fr)
 * Licensed under the Creative Commons License:
 * http://creativecommons.org/licenses/by/3.0/
 *
 * Date: 2008-01-27
 */
(function($){$.fn.wslide=function(h){h=jQuery.extend({width:550,height:250,pos:1,col:1,effect:'swing',fade:false,horiz:false,autolink:true,duration:1500},h);function gogogo(g){g.each(function(i){var a=$(this);var e=a.attr('id');if(e==undefined){e='wslide'+i}$(this).wrap('<div class="wslide-wrap" id="'+e+'-wrap"></div>');a=$('#'+e+'-wrap');var b=a.find('ul li');var f=h.effect;if(jQuery.easing.easeInQuad==undefined&&(f!='swing'||f!='normal')){f='swing'}var g=h.width;var j=h.height;function resultante(a){var b=a;b=b.split('px');b=b[0];return Number(b)}var k=g-(resultante(b.css('padding-left'))+resultante(b.css('padding-right')));var l=j-(resultante(b.css('padding-top'))+resultante(b.css('padding-bottom')));var m=h.col;if(h.horiz){m=Number(b.length+1)}var n='';var o=Math.ceil(Number(b.length)/m);a.css('overflow','hidden').css('position','relative').css('text-align','left').css('height',j+'px').css('width',g+'px').css('margin','0').css('padding','0');a.find('ul').css('position','absolute').css('margin','0').css('padding','0').css('width',Number((m+0)*g)+'px').css('height',Number(o*j)+'px');b.css('display','block').css('overflow','hidden').css('float','left').css('height',l+'px').css('width',k+'px');b.each(function(i){var b=a.offset();var c=$(this).offset();$(this).attr('id',e+'-'+Number(i+1)).attr('rel',Number(c.left-b.left)+':'+Number(c.top-b.top));n+=' <a href="#'+e+'-'+Number(i+1)+'">'+'&nbsp;'+'</a>'});if(typeof h.autolink=='boolean'){if(h.autolink){a.after('<div class="wslide-menu" id="'+e+'-menu">'+n+'</div>')}}else if(typeof h.autolink=='string'){if($('#'+h.autolink).length){$('#'+h.autolink).html(n)}else{a.after('<div id="#'+h.autolink+'">'+n+'</div>')}}var p='#'+e+'-';var q="";$('a[href*="'+p+'"]').click(function(){$('a[href*="'+q+'"]').removeClass("wactive");$(this).addClass("wactive");var b=$(this).attr('href');b=b.split('#');b='#'+b[1];q=b;var c=$(b).attr('rel');c=c.split(':');var d=c[1];d=-d;c=c[0];c=-c;if(h.fade){a.find('ul').animate({opacity:0},h.duration/2,f,function(){$(this).css('top',d+'px').css('left',c+'px');$(this).animate({opacity:1},h.duration/2,f)})}else{a.find('ul').animate({top:d+'px',left:c+'px'},h.duration,f)}return false});if(h.pos<=0){h.pos=1}$('a[href$="'+p+h.pos+'"]').addClass("wactive");var r=$('a[href*="'+p+'"]:eq('+Number(h.pos-1)+')').attr('href');r=r.split('#');r='#'+r[1];q=r;var s=$(r).attr('rel');s=s.split(':');var t=s[1];t=-t;s=s[0];s=-s;a.find('ul').css('top',t+'px').css('left',s+'px')})}gogogo(this);return this}})(jQuery);