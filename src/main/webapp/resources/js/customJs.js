$(function(){
		$( '#headerNavbar .navbar-light .navbar-nav a' ).on( 'click', function () {
                	$( '#headerNavbar .navbar-light .navbar-nav' ).find( 'li.active' ).removeClass( 'active' );
                	$( this ).parent( 'li' ).addClass( 'active' );
                });
                $('#headerNavbar .navbar-light .navbar-nav a').click(function(){
                			$(this).parent().addClass('active').siblings().removeClass('active')
                		})
		})



