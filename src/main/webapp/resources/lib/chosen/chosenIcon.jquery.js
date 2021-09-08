;
(function ($) {

    $.getCSSValue = function (classname, property, pseudo) {

        var pseudo = pseudo || null
            , classReaplce = classname.replace('.', '')
            , element = document.createElement('div');
        console.log(classReaplce);
        element.className = classReaplce;
        document.body.appendChild(element);

        var value = getComputedStyle(
            document.querySelector(classname), pseudo
        ).getPropertyValue(property);

        document.body.removeChild(element);
        console.log(value.replace(/\"/g,''));
        return value.replace(/\"/g,'');
    }


    $.fn.chosenIcon = function (options) {

        return this.each(function () {

            var $select = $(this),
                iconMap = {};

            // 1. Retrieve icon class from data attribute and build object for each list item
            $select.find('option').filter(function () {
                return $(this).text();
            }).each(function (i) {
                    var iconSrc = $(this).attr('data-color');
                    iconMap[i] = $.trim(iconSrc);
                });


            // 2. Execute chosen plugin
            $select.chosen(options);


            // 2.1 add Class for specific styling
            $chosen = $select.next().addClass('chosenIcon-container');


            // 3. add data in lis with icon name
            $select.on('chosen:showing_dropdown chosen:activate', function () {
                setTimeout(function () {
                    $chosen.find('.chosen-results li').each(function (i) {
                    	var iconClassName = iconMap[i];
                        $('.chosen-results li:nth-child('+(i+1)+')').addClass(iconClassName);
                    });
                }, 0);
            });
            
            $(".chosen-search-input").on("keyup kedown", function(){
            	setTimeout(function () {
                    $chosen.find('.chosen-results li').each(function (i) {
                    	var index = $(this).attr("data-option-array-index");
                        var iconClassName = iconMap[index];
                        $('.chosen-results li:nth-child('+(i+1)+')').addClass(iconClassName);
                    });
                }, 0);
            });
            
            $select.trigger('change');

        });
    }

})(jQuery);
