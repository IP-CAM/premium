<style type="text/css">
div.asticker {
	display:none;
	position:absolute;
	z-index:<?php echo $settings["z_index"]; ?>;
}
</style>
<script type="text/javascript"><!--
function getAStickers() {
	var products_id = products_url_alias = '';
	var product_id = '<?php echo $product_id; ?>';
	var regexp = new RegExp (('<?php echo $settings["class_main_image"]; ?>').replace (/[\.\#]/g, ''));
	var astickers = $('<?php echo $settings["class"]; ?> a div[class*="astickers_"]');
	
	if (astickers.length) {
		astickers.each(function(index, element) {
			$(element).children('div.asticker').remove();
			$(element).children('img').unwrap();
		});
	}
	
	$('<?php echo $settings["class"]; ?> a img').each(function(index, element) {
		var a = $(element).parent('a');
		
		if (product_id && regexp.test(a.attr('class'))) {
			products_id += '&id[main]=' + product_id;
			
			$('<?php echo $settings["class"]; ?> a<?php echo $settings["class_main_image"]; ?> img').wrap('<div class="astickers_main" style="position:relative;"></div>');
		} else {
			var href = a.attr('href');
			
			if (href != null && href != 'undefined') {
				if (/product_id=[0-9]*/.test(href)) {
					var matches = href.match (/product_id=([0-9]*)/);
					
					if (matches != null && matches != 'undefined') {
						products_id += '&id[' + index + ']=' + matches[1];
						
						$(element).wrap('<div class="astickers_' + index + '" style="position:relative;"></div>');
					}
				} else if (/\/[a-zA-Zа-яА-ЯёЁ0-9\-\_\%]*[\.]{0,1}[a-zA-Z]{0,}\?|$/.test(href)) {
					var matches = href.match (/\/([a-zA-Zа-яА-ЯёЁ0-9\-\_\%]*)[\.]{0,1}[a-zA-Z]{0,}(?:\?|$)/);
					
					if (matches != null && matches != 'undefined') {
						products_url_alias += '&ua[' + index + ']=' + encodeURIComponent (matches[1]);
						
						$(element).wrap('<div class="astickers_' + index + '" style="position:relative;"></div>');
					}
				}
			}
		}
	});
	
	$.ajax({
		url: '<?php echo $request_url; ?>',
		type: 'POST',
		data: products_id + products_url_alias,
		dataType: 'json',
		cache: false,
		success: function(json) {
			var hidden_content = [], id = '';
			
			$('<?php echo $settings["class_tabs"]; ?> a').each(function(index, element) {
				id = $(element).attr('href');
				
				if ($(id).css('display') == 'none') {
					$(id).css({'display':'block'});
					
					hidden_content.push (id);
				}
			});
			
			$.each(json, function(index, data) {
				var image = $('<?php echo $settings["class"]; ?> a div.astickers_' + index + ' img');
				
				var image_width = parseInt (image.css('width'));
				var image_height = parseInt (image.css('height'));
				
				var width = image_width + parseInt (image.css('padding-left')) + parseInt (image.css('padding-right'));
				var height = image_height + parseInt (image.css('padding-top'))  + parseInt (image.css('padding-bottom'));
				
				var margin_top = parseInt (image.css('margin-top')) + parseInt (image.css('border-top-width'));
				
				if (image.css('text-align') == 'center') {
					var left = '50%';
					var margin_left = -(image_width / 2);
				} else {
					var left = 0;
					var margin_left = parseInt (image.css('margin-left')) + parseInt (image.css('border-left-width'));
				}
				
				if (data && image_width > '<?php echo $settings["min_width"]; ?>' && image_height > '<?php echo $settings["min_height"]; ?>') {
					image.before(data);
					
					var astickers = $('<?php echo $settings["class"]; ?> a div.astickers_' + index + ' div.asticker');
					
					astickers.css({'width':width, 'height':height, 'margin-top':margin_top, 'margin-left':margin_left, 'left':left});
					
					<!--<?php if ($settings["show_effect"]) { ?>-->
					<!--<?php if ($settings["show_effect"] == 'fadeIn') { ?>-->
					astickers.fadeIn(1000);
					<!--<?php } else { ?>-->
					astickers.show('<?php echo $settings["show_effect"]; ?>', {}, 1000);
					<!--<?php } ?>-->
					<!--<?php } else { ?>-->
					astickers.show();
					<!--<?php } ?>-->
					
					<!--<?php if ($settings["hide_hover"]) { ?>-->
					$('<?php echo $settings["class"]; ?> a div.astickers_' + index).hover(
						function() {
							astickers.hide();
						},
						function() {
							astickers.show();
						}
					);
					<!--<?php } ?>-->
				} else {
					image.unwrap();
				}
			});
			
			if (hidden_content.length) {
				$(hidden_content.join (', ')).css({'display':'none'});
			}
		}
	});
};

$(document).ready(function(e) {
	if (typeof doFilter != 'function') {
		setTimeout ('getAStickers()', 500);
	}
});
//--></script>