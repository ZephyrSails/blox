// Navigation Scripts to Show Header on Scroll-Up

jQuery(document).ready(function($) {
    var MQL = 767;

    //primary navigation slide-in effect
    if ($(window).width() > MQL) {
      console.log("what?");

        var headerHeight = $('.navbar-custom').height();
        $(window).on('scroll', {
                previousTop: 0
            },
            function() {
                var currentTop = $(window).scrollTop();
                //check if user is scrolling up
                if (currentTop < this.previousTop) {
                    //if scrolling up...
                    if (currentTop > 0 && $('.navbar-custom').hasClass('is-fixed')) {
                        $('.navbar-custom').addClass('is-visible');
                        console.log("what?");
                    } else {
                        $('.navbar-custom').removeClass('is-visible is-fixed');
                        // console.log("what?");
                    }
                } else {
                    //if scrolling down...
                    $('.navbar-custom').removeClass('is-visible');
                    if (currentTop > headerHeight && !$('.navbar-custom').hasClass('is-fixed')) $('.navbar-custom').addClass('is-fixed');
                }
                this.previousTop = currentTop;
            });
    }
});
