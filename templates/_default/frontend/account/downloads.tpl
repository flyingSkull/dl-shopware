{extends file='frontend/account/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' append}
	{$sBreadcrumb[] = ['name'=>"{s name='MyDownloadsTitle'}{/s}", 'link'=>{url}]}
{/block}

{* Main content *}
{block name='frontend_index_content'}
<div class="grid_16 downloads" id="center">

	{* Downloads *}
	<div>
	        	
	    <h1>{se name="DownloadsHeader"}{/se}</h1>
	    
	  	{block name="frontend_account_downloads_error_messages"}
	    {if $sErrorCode}
			<div class="notice bold center">
			{if $sErrorCode==1}
				{se name="DownloadsInfoAccessDenied"}{/se}
			{else}
				{se name="DownloadsInfoNotFound"}{/se}
			{/if}
			</div>
	    {/if}
		{/block}
		
		{* Missing ESD articles *}
		{if !$sDownloads}
			{block name='frontend_account_downloads_info_empty'}
			<div class="notice bold center">
				{se name="DownloadsInfoEmpty"}{/se}
			</div>
			{/block}
	    {else}
	    	<div class="table grid_16"> <!-- TABLE START -->
		    {block name="frontend_account_downloads_table_head"}
			    <div class="table_head">
			    	<div class="grid_3">
			    		{se name="DownloadsColumnDate"}{/se}
			    	</div>
			    	
			    	<div class="grid_7">
			    		{se name="DownloadsColumnName"}{/se}
			    	</div>
			    	
			    	<div class="grid_5 center">
			    		{se name="DownloadsColumnLink"}{/se}
			    	</div>
			    	<div class="clear">&nbsp;</div>
			    </div>
		    {/block}
		    
		    {foreach from=$sDownloads item=offerPosition}
			    {foreach name=offerdetails from=$offerPosition.details item=article}
				    {if $article.esdarticle}
				    	
				    	{block name="frontend_account_downloads_table_row"}
				    	<div class="table_row{if $smarty.foreach.offerdetails.last} lastrow{/if}">
				    		<div class="grid_3">
				    			{block name="frontend_account_downloads_date"}
				    			{$offerPosition.datum|date}
				    			{/block}
				    		</div>
				    		
							<div class="grid_7">
								{block name='frontend_account_downloads_name'}
				    			<strong>{$article.name}</strong>
				    			{/block}
				    			{block name='frontend_account_downloads_serial'}
				    			{if $article.serial}
				                <p>
				                	{se name="DownloadsSerialnumber"}{/se} <strong>{$article.serial}</strong>
				                </p>
				                {/if}
				                {/block}
				    		</div>
	
				    		<div class="grid_5">
				    			{block name='frontend_account_downloads_link'}
				    			{if $article.esdarticle}
				    				<div class="center">
					    			<a href="{$article.esdLink}" title="{s name='DownloadsLink'}{/s} {$article.name}" class="button-right small_right">
					    				{se name="DownloadsLink"}{/se}
					    			</a>
					    			</div>
				    			{/if}
				    			{/block}
				    		</div>
				    	</div>
				    	{/block}	
				    {/if}
			    {/foreach}
		    {/foreach}
		    </div> <!-- TABLE END -->
	    {/if}
	</div>
</div>
{/block}