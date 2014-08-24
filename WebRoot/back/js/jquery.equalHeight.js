(function($){
    $.fn.equalHeight = function() {

        tallest = 0;
        this.each(function(){
            thisHeight = $(this).height();
            if( thisHeight > tallest)
                tallest = thisHeight;
        });

        // set each items height to use the tallest value found
        this.each(function(){
            $(this).height(tallest);
        });
    }
})(jQuery);