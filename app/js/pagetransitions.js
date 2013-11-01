var PageTransitions = (function() {

	var $main = $( '#pages' ),
		$pages = $main.children( 'section.page' ),
		$iterate = $( '#iterateEffects' ),
		animcursor = 1,
		pagesCount = $pages.length,
		current = 0,
		isAnimating = false,
		endCurrPage = false,
		endNextPage = false,
    target,
		animEndEventNames = {
			'WebkitAnimation' : 'webkitAnimationEnd',
			'OAnimation' : 'oAnimationEnd',
			'msAnimation' : 'MSAnimationEnd',
			'animation' : 'animationend'
		},
		// animation end event name
		animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
    container = document.getElementById("container"),
		// support css animations
		support = Modernizr.cssanimations;

	function init() {

		$pages.each( function() {
			var $page = $( this );
			$page.data( 'originalClassList', $page.attr( 'class' ) );
		} );

		$pages.eq( current ).addClass( 'pt-page-current' );

		$( '.mobile-menu' ).dlmenu( {
			animationClasses : { in : 'dl-animate-in-2', out : 'dl-animate-out-2' },
			onLinkClick : function( el, ev ) {
				ev.preventDefault();
				nextPage(el.data('animation'), el.data( 'target' ));
			}
		} );

		$iterate.on( 'click', function() {
			if( isAnimating ) {
				return false;
			}
			if( animcursor > 67 ) {
				animcursor = 1;
			}
			nextPage( animcursor );
			++animcursor;
		} );

	}

	function nextPage( animation, target ) {

		if( isAnimating ) {
			return false;
		}

		isAnimating = true;

		var $currPage = $('.pt-page-current');

		var $nextPage = $('.'+target ).addClass( 'pt-page-current' ),
			outClass = '', inClass = '';

			outClass = 'pt-page-fade';
			inClass = 'pt-page-moveFromTop pt-page-ontop';


		$currPage.addClass( outClass ).on( animEndEventName, function() {
			$currPage.off( animEndEventName );
			endCurrPage = true;
			if( endNextPage ) {
				onEndAnimation( $currPage, $nextPage );
			}
		});

		$nextPage.addClass( inClass ).on( animEndEventName, function() {
			$nextPage.off( animEndEventName );
			endNextPage = true;
			if( endCurrPage ) {
				onEndAnimation( $currPage, $nextPage );
			}
		});

		if( !support ) {
			onEndAnimation( $currPage, $nextPage );
		}

	}

	function onEndAnimation( $outpage, $inpage ) {
		endCurrPage = false;
		endNextPage = false;
		resetPage( $outpage, $inpage );
		isAnimating = false;
	}

	function resetPage( $outpage, $inpage ) {
		$outpage.attr( 'class', $outpage.data( 'originalClassList' ) );
		$inpage.attr( 'class', $inpage.data( 'originalClassList' ) + ' pt-page-current' );
    classie.remove(container, "mobile-menu-open");
	}

	init();

	return { init : init };

})();
