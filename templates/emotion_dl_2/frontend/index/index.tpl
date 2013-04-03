{extends file='parent:frontend/index/index.tpl'}


<div id="top">
{* Remove the checkout actions here... *}
    {block name='frontend_index_checkout_actions'}{/block}
</div>

{* Shop header *}
{block name='frontend_index_navigation'}
<div id="top_opinion">
    {action module=widgets controller=checkout action=info}
</div>
<div id="header">

    <div class="inner">

    {* Trusted Shops *}
        {if {config name=TSID}}
            <div class="trusted_shops_top">
                <a href="https://www.trustedshops.com/shop/certificate.php?shop_id={config name=TSID}"
                   title="{s name='WidgetsTrustedLogo' namespace='frontend/plugins/trusted_shops/logo'}{/s}"
                   target="_blank">
                    <img src="{link file='frontend/_resources/images/logo_trusted_shop_top.png'}"
                         alt="{s name='WidgetsTrustedLogo' namespace='frontend/plugins/trusted_shops/logo'}{/s}"/>

                    <p>{s name='WidgetsTrustedLogoText2'}<span><strong>Sicher</strong> einkaufen</span><br/>Trusted
                        Shops zertifiziert{/s}</p>
                </a>
            </div>
        {/if}

    {* Warenkorb - MeinKonto - Merkzettel (siehe frontend/index/checkout_actions.tpl) *}
    {* Please note that we're using the new action plugin to support esi *}
    {* {action module=widgets controller=checkout action=info}*}

    {* Search *}
        {block name='frontend_index_search'}
            {include file="frontend/index/search.tpl"}
        {/block}

    {* Language and Currency bar *}
        {block name='frontend_index_actions'}{/block}

    {* Shop logo *}
        {block name='frontend_index_logo'}
            <div id="logo" class="grid_5">
                <a href="{url controller='index'}"
                   title="{$sShopname} - {s name='IndexLinkDefault'}{/s}">{$sShopname}</a>
            </div>
        {/block}

    {* Shop navigation *}
        {block name='frontend_index_checkout_actions'}
            {action module=widgets controller=checkout action=info}
        {/block}

        {block name='frontend_index_navigation_inline'}
            {if $sCompareShow}
                <div id="compareContainerAjax">
                    {action module=widgets controller=compare}
                </div>
            {/if}
        {/block}

    {* Maincategories navigation top *}
        {block name='frontend_index_navigation_categories_top'}
           {include file='frontend/index/categories_top.tpl'}
        {/block}

    </div>
</div>

<div id="wrapper">
    <div class="wrap_top"></div>
<div class="wrap_inner">

{/block}

    <div class="container_20">
    {* Breadcrumb *}
    {block name='frontend_index_breadcrumb'}
        {*{include file='frontend/index/breadcrumb.tpl'}*}
    {/block}

    {* Content section *}
        <div id="content">
            <div class="inner">

            {* Content top container *}
            {block name="frontend_index_content_top"}{/block}

            {* Sidebar left *}
            {block name='frontend_index_content_left'}
                {include file='frontend/index/left.tpl'}
            {/block}

            {* Main content *}
            {block name='frontend_index_content'}{/block}

            {* Sidebar right *}
            {block name='frontend_index_content_right'}{/block}

                <div class="clear">&nbsp;</div>
            </div>
        </div>
    {* Footer *}
    {block name="frontend_index_footer"}
        {if $sLastArticlesShow}
            {action module=widgets controller=lastArticles}
        {/if}
    {/block}
    </div>

{block name="frontend_index_shopware_footer"}
</div>
    <div class="wrap_cap"></div>
</div>

{* FOOTER *}
<div id="footer_wrapper">
    <div class="footer_inner">
        <div class="clear"></div>
    {include file='frontend/index/footer.tpl'}
    </div>

    <div class="shopware_footer">
        <a href="http://www.shopware.de" target="_blank" title="Shopware">{s name="IndexRealizedShopsystem"}
            Shopware{/s}</a>

        <div class="clear"></div>
    </div>

    <div class="clear"></div>

</div>
{/block}

{block name='frontend_index_body_inline'}{/block}
</body>
</html>