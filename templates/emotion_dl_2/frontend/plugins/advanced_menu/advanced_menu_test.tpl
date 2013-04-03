{function name=categories_top level=0}
        <ul class="dropdown">
            {foreach from=$categories item=category}
                <li>
                    <a href="{$category.link}" class="{if !empty($category.flag)} active{/if}">{$category.name}</a>
                    {if $category.sub}
                        {call name=categories_top categories=$category.sub level=$level+1}
                    {/if}
                </li>
            {/foreach}
        </ul>
{/function}

<div id="nav">
   {* <li class="{if $sCategoryCurrent eq $sCategoryStart} active{/if}">
        <a href="{url controller='index'}" title="{s name='IndexLinkHome'}{/s}" class="first{if $sCategoryCurrent eq $sCategoryStart} active{/if}">
			<span></span><!-- {se name='IndexLinkHome'}X{/se}-->
        </a>
    </li>*}
	<ul class="main">
	    {foreach from=$sAdvancedMenu item=sCategory}
            {if !$sCategory.hidetop}
			<li class="main">
                <div id="dd" class="wrapper-dropdown">
                    <a href="{$sCategory.link}" title="{$sCategory.description}" {if !empty($sCategory.flag)} class="active"{/if}>
                        <span>{$sCategory.description}</span>
                    </a>

                    {if $sCategory.sub}
                        {call name=categories_top categories=$sCategory.sub}
                    {/if}
                </div>
	        </li>
            {/if}
		{/foreach}
	</ul>
</div>