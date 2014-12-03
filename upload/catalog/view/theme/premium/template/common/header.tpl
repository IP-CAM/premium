<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="no">
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/premium/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/theme/premium/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/premium/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/premium/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/theme/premium/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/premium/javascript/jquery/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/theme/premium/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/theme/premium/javascript/common.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/premium/stylesheet/carousel.css" media="screen" />
<script type="text/javascript" src="catalog/view/theme/premium/javascript/jquery/jquery.jcarousel.min.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/premium/stylesheet/ie7.css" />
<![endif]-->
<!--[if !IE]><!-->
<script>if(/*@cc_on!@*/false){document.documentElement.className+=' ie10';}</script>
<!--<![endif]-->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/premium/stylesheet/ie10.css" />



<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/premium/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php echo $google_analytics; ?>
<script src='catalog/view/theme/premium/javascript/jquery/jquery.elevateZoom-2.5.5.min.js'></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
</head>
<body
    <?php if (!isset($this->request->get['route']) || (isset($this->request->get['route']) && $this->request->get['route'] == 'common/home')) { ?>
id="line"
<?php } else { ?>
id="line-home"
<?php } ?>
>

<div class="menu-top">
	<div class="menu-top-content">	
	</div>
</div>
<div class="menu-top2">
	<div class="menu-top-content2">
	<div class="social">
	<img src="/catalog/view/theme/premium/image/vk.png"><img src="/catalog/view/theme/premium/image/facebook.png"><img src="/catalog/view/theme/premium/image/twitter.png">
	</div>
	<div class="phone">(044) 123-46-67</div>
	</div>
</div>
<div class="menu-main">
</div>
<div class="line-main">



    <div class="menu-top-content3">
    <?php if ($categories) { ?>
    <div id="menu">
      <ul>
        <?php foreach ($categories as $category) { ?>
        <li><?php if ($category['active']) { ?>
    	<a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
    	<?php } else { ?>
    	<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
    	<?php } ?>
    
          <?php if ($category['children']) { ?>
          <div>
            <?php for ($i = 0; $i < count($category['children']);) { ?>
            <ul>
              <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
              <?php for (; $i < $j; $i++) { ?>
              <?php if (isset($category['children'][$i])) { ?>
              <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
              
              
              <?php } ?>
              <?php } ?>
               <div class="clear"></div>
            </ul>
            <?php } ?>
          </div>
          <?php } ?>
        </li>
        <?php } ?>
      </ul> 
    </div>
    
   
    <?php } ?>
    </div>




</div>



<div class="content-n">
    <div class="content-vn">
    
    



<div id="container">
<div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?php echo $currency; ?>
  <?php echo $cart; ?>
<?php echo $language; ?>
  <div id="search">
    <div class="button-search"></div>
    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>

    <div class="clear"></div>
</div>
<div id="notification"></div>
