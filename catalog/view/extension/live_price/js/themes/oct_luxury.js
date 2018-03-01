
function liveprice_getCustomMethodsOfTheme( extension ) {
	
	var methods = {
		
		init : function() {

		},
		
		getContainer : function() {
			
		},
		
		getElementsToUpdatePriceOnClick : function() {
			return extension.getElement('#product .btn-plus, #product .btn-minus');
			
		},
		
		getElementsToAnimateOnPriceUpdate : function() {
			
		},
		
		setPriceHTML : function( json ) {
			extension.getElement('#product .price-ul').replaceWith(json.htmls.html);
		},
		
	};
	
	return methods;
}