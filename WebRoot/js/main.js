/*公告前闪烁“新”*/
function changeColor(){ 
	var color="yellow|white"; 
	color=color.split("|"); 
	/*document.getElementById("blink").style.color=color[parseInt(Math.random() * color.length)];*/ 
	$("[id='blink']").css("color",color[parseInt(Math.random() * color.length)]);
} 
setInterval("changeColor()",200);


$(document).ready(function(){
	
});
    /*$('.p2col .span6:even').addClass('no-margin-left');

    //prettyPhoto
    $('a[data-rel]').each(function() {
        $(this).attr('rel', $(this).data('rel'));
    });
    $("a[rel^='prettyPhoto']").prettyPhoto();


    $('.da-thumbs > li, .da-thumbs > article').hoverdir();

    //Menu
    jQuery('#menu > ul').superfish({ 
        delay:       1000,                           
        animation:   {opacity:'show', height:'show'}, 
        speed:       'fast',                          
        autoArrows:  true

    });
    $('.sf-sub-indicator').remove();
    (function() {
		var $menu = $('#menu ul'),
			optionsList = '<option value="" selected>Menu...</option>';

		$menu.find('li').each(function() {
			var $this   = $(this),
				$anchor = $this.children('a'),
				depth   = $this.parents('ul').length - 1,
				indent  = '';

			if( depth ) {
				while( depth > 0 ) {
					indent += ' - ';
					depth--;
				}
			}
			optionsList += '<option value="' + $anchor.attr('href') + '">' + indent + ' ' + $anchor.text() + '</option>';
		}).end()
		  .after('<select class="res-menu">' + optionsList + '</select>');

		$('.res-menu').on('change', function() {
			window.location = $(this).val();
		});
		
	})();
    
    $(".our-blog article").hover(function () {
    	$(this).find("img").stop(true, true).animate({ opacity: 0.7 }, 300);
    }, function() {
    	$(this).find("img").stop(true, true).animate({ opacity: 1 }, 300);
    });
    
    
    //Flickr Widget Footer
    $('#footer .flickr').jflickrfeed({
		limit: 6,
		qstrings: {
			id: '36621592@N06'
		},
		itemTemplate: '<li>'+
						'<a rel="prettyPhoto[flickr]" href="{{image}}" title="{{title}}">' +
							'<img src="{{image_s}}" alt="{{title}}" />' +
						'</a>' +
					  '</li>'
	}, function(data) {
		$("a[rel^='prettyPhoto']").prettyPhoto();

        $("#footer .flickr li").hover(function () {						 
    	   $(this).find("img").stop(true, true).animate({ opacity: 0.5 }, 800);
        }, function() {
    	   $(this).find("img").stop(true, true).animate({ opacity: 1.0 }, 800);
        });
	});


	//Flickr Widget Sidebar
    $('#sidebar .sidebar-flickr').jflickrfeed({
		limit: 8,
		qstrings: {
			id: '36621592@N06'
		},
		itemTemplate: '<li>'+
						'<a rel="prettyPhoto[flickr]" href="{{image}}" title="{{title}}">' +
							'<img src="{{image_s}}" alt="{{title}}" />' +
						'</a>' +
					  '</li>'
	}, function(data) {
		$("a[rel^='prettyPhoto']").prettyPhoto();

        $("#footer .flickr li").hover(function () {						 
    	   $(this).find("img").stop(true, true).animate({ opacity: 0.5 }, 800);
        }, function() {
    	   $(this).find("img").stop(true, true).animate({ opacity: 1.0 }, 800);
        });
	});


	//Portfolio
	var $portfolioClone = $(".filtrable").clone();
	$("#filtrable a").live('click', function(e){
		
		$("#filtrable li").removeClass("current");	
		
		var $filterClass = $(this).parent().attr("class");
        var $filteredPortfolio = $portfolioClone.find("article");

		if ( $filterClass == "all" ) {
			$filteredPortfolio = $portfolioClone.find("article");
		} else {
			$filteredPortfolio = $portfolioClone.find("article[data-type~=" + $filterClass + "]");
		}
	
		$(".filtrable").quicksand( $filteredPortfolio, { 
			duration: 800, 
			easing: 'easeOutQuint' 
		}, function(){
			
            $('.da-thumbs > li, .da-thumbs > article, .da-thumbs > div').hoverdir();
            
            $("a[rel^='prettyPhoto']").prettyPhoto();

		});

		$(this).parent().addClass("current");
        
		e.preventDefault();
	});

    // To Top Button
    $(function(){
        $().UItoTop({ easingType: 'easeOutQuart' });
    });

    // portfolio ie fix
    if ($.browser.msie && $.browser.version > "10") {
        $(function(){
            $('.hover-span').mouseenter(function(){
                alert('enter')
            });
            $('.hover-span').mouseleave(function(){
                alert('leave')
            });
        });
    }
    else {
    }



});

*/
/*$(window).load(function() {

	$("#mainslider").flexslider({
		animation: "slide",
		useCSS: false,
		controlNav: false,   
		animationLoop: false,
		smoothHeight: true
	});

    $(function () {
        $(".lightbox-image").append("<span></span>");
        $(".lightbox-image").hover(function () {
            $(this).find("img").stop().animate({opacity:0.5}, "normal")
        }, function () {
            $(this).find("img").stop().animate({opacity:1}, "normal")
        })
    });
});*/

/*分页函数*/
function page(address,pageNow,pageTotal){

	
	var First = '<li><a href="'+address+'1">First</a></li>';
	$("#pager").append(First);
	if(pageNow>5){
		var index = ( Math.floor( (pageNow-1)/5 )-1 )*5+1;
		var Prev = ' <li><a href="'+address+index+'">Prev</a></li>';
		$("#pager").append(Prev);
	}
	var pagelist = pageNum( address,Math.floor((pageNow-1)/5),pageTotal );
	$("#pager").append(pagelist);
	if( Math.floor( (pageNow-1)/5 )<Math.floor( (pageTotal-1)/5 ) ){
		var index = ( Math.floor( (pageNow-1)/5 )+1 )*5+1;
		var Next = '<li><a href="'+address+index+'">Next</a></li>';
		$("#pager").append(Next);
	}
	var Final = ' <li><a href="'+address+pageTotal+'">Final</a></li>';
	$("#pager").append(Final);
}

function pageNum (address,index,total){
	var str = "";
	var nums = 5;
	if(total<5) nums = total;
	index = index*5;
	for(i = 0;i<nums;i++){
		index = ++index;
		 str += '<li><a href="'+address+index+'">'+index+'</a></li>'
		 if(index==total)break;
	}
	return str;
}