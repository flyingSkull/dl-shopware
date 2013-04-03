<div class="artbox{if $lastitem} last{/if}{if $firstitem} first{/if}">
    <div class="inner">

        {* Top *}
        {block name='frontend_listing_box_article_hint'}
           {* {if $sArticle.highlight}
                <div class="ico_tipp">{se name='ListingBoxTip'}{/se}</div>
            {/if}*}
        {/block}

        {* New *}
        {block name='frontend_listing_box_article_new'}
           {* {if $sArticle.newArticle}
                <div class="ico_new" {if $sArticle.pseudoprice}style="top:50px;"{/if}>{se name='ListingBoxNew'}{/se}</div>
            {/if}*}
        {/block}

        {* Article picture *}
        {block name='frontend_listing_box_article_picture'}
            {if isset($sArticle.image.src)}
                <a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}" title="{$sArticle.articleName}">
                    <img src="{$sArticle.image.src.4}" style="no-repeat center center"/>
                </a>
            {else}
                <img src="{link file='frontend/_resources/images/no_picture.jpg'}" alt="{s name='ListingBoxNoPicture'}{/s}"/>
            {/if}
        {/block}

        <div class="mask">

            {* Description *}
            {block name='frontend_listing_box_article_description'}
            {*    {if $sTemplate eq 'listing-1col'}
                    {assign var=size value=270}
                    {else}
                    {assign var=size value=60}
                {/if}
            <p class="desc">
                {if $sTemplate}
                        {$sArticle.description_long|strip_tags|truncate:$size}
                    {/if}
            </p>*}
            {/block}

            {* Article name *}
            {block name='frontend_listing_box_article_name'}
                <a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}" class="title" title="{$sArticle.articleName}">{$sArticle.articleName|truncate:47}</a>
                {*<h3>{$sArticle.articleName|truncate:47}</h3>*}
            {/block}

            {* Unit price *}
            {block name='frontend_listing_box_article_unit'}{/block}

            {* Article Price *}
            {block name='frontend_listing_box_article_price'}
                <a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}" title="{$sArticle.articleName}">
                    <p class="{if $sArticle.pseudoprice}pseudoprice{else}price{/if}{if $sArticle.purchaseunit != $sArticle.referenceunit && !$sArticle.pseudoprice} both{/if}">
                        {if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt'}{/s} {/if}{$sArticle.price|currency} {s name="Star"}*{/s}
                    </p>
                </a>
            {/block}

            {block name='frontend_listing_box_article_actions'}
            {*<div class="actions">

                {block name='frontend_listing_box_article_actions_buy_now'}
                *}{* Buy now button *}{*
                    {if !$sArticle.sConfigurator && !$sArticle.variants && !$sArticle.sVariantArticle && !$sArticle.laststock == 1 && !($sArticle.notification == 1 && {config name="deactivatebasketonnotification"} == 1)}
                        <a href="{url controller='checkout' action='addArticle' sAdd=$sArticle.ordernumber}"
                           title="{s name='ListingBoxLinkBuy'}{/s}" class="buynow">{s name='ListingBoxLinkBuy'}{/s}</a>
                    {/if}
                {/block}

                {block name='frontend_listing_box_article_actions_inline'}
                *}{* More informations button *}{*
                *}{*<a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}" title="{$sArticle.articleName}" class="more">{s name='ListingBoxLinkDetails'}{/s}</a>*}{*
                {/block}
            </div>

                {if $sArticle.pseudoprice}
                <div class="pseudo_percent">%</div>
                {/if}

            *}{*Image-Overlay*}{*
            <span class="overlay">
                    <a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}" title="{$sArticle.articleName}"
                       class="image_overlay">

                    </a>
                </span>*}
            {/block}
        </div>
    </div>
</div>