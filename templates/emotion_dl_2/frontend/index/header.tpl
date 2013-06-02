{extends file='parent:frontend/index/header.tpl'}

{block name="frontend_index_header_css_screen" append}
	<link type="text/css" media="screen, projection" rel="stylesheet" href="{link file='frontend/_resources/styles/emotion_dl.css'}" />
	<link type="text/css" media="screen, projection" rel="stylesheet" href="{link file='frontend/_resources/styles/mainNavigation.css'}" />
	<link type="text/css" media="screen, projection" rel="stylesheet" href="{link file='frontend/_resources/styles/sidebarLeft.css'}" />
	<link type="text/css" media="screen, projection" rel="stylesheet" href="{link file='frontend/_resources/styles/articleListing2.css'}" />
	<link type="text/css" media="screen, projection" rel="stylesheet" href="{link file='frontend/_resources/styles/articleDetail.css'}" />
	<link type="text/css" media="screen, projection" rel="stylesheet" href="{link file='frontend/_resources/styles/checkout.css'}" />
{/block}

{block name="frontend_index_header_javascript_jquery_lib"}

{* Grab Google CDN's jQuery, with a protocol relative URL *}
    <script src="{link file='frontend/_resources/javascript/jquery-1.7.2.min.js'}"></script>
{/block}


{block name="frontend_index_header_javascript" append}
    <script type="text/javascript" src="{link file='frontend/_resources/javascript/dropdown.js'}"></script>
{/block}

