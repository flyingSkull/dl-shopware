/**
 * Shopware 4.0
 * Copyright © 2012 shopware AG
 *
 * According to our dual licensing model, this program can be used either
 * under the terms of the GNU Affero General Public License, version 3,
 * or under a proprietary license.
 *
 * The texts of the GNU Affero General Public License with an additional
 * permission and of our proprietary license can be found at and
 * in the LICENSE file you have received along with this program.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * "Shopware" is a registered trademark of shopware AG.
 * The licensing of the program under the AGPLv3 does not imply a
 * trademark license. Therefore any rights, title and interest in
 * our trademarks remain entirely with us.
 *
 * @category   Shopware
 * @package    ProductFeed
 * @subpackage Controller
 * @copyright  Copyright (c) 2012, shopware AG (http://www.shopware.de)
 * @version    $Id$
 * @author shopware AG
 */

//{namespace name=backend/product_feed/view/feed}

/**
 * Shopware Controller - ProductFeed backend module
 *
 * This is the ExtJs feed controller.
 * The Controller managed all product feed depending events and functions.
 */
//{block name="backend/product_feed/controller/feed"}
Ext.define('Shopware.apps.ProductFeed.controller.Feed', {
    /**
     * Extend from the standard ExtJS 4
     * @string
     */
    extend:'Ext.app.Controller',

    /**
     * Required sub-controller for this controller
     */
    requires: [
        'Shopware.apps.ProductFeed.controller.Main'
    ],

    /**
     * all references to get the elements by the applicable selector
     */
    refs:[
        { ref:'productFeedWindow', selector:'product_feed-feed-window' },
        { ref:'categoryTree', selector : 'product_feed-feed-tab-category treepanel' }
    ],

    /**
     * Contains all snippets for the controller
     */
    snippets: {
        //save changes
        onSaveChangesSuccess: '{s name=message/on_save_changes_success}Changes have been saved successfully.{/s}',
        onSaveChangesError: '{s name=message/on_save_changes_error}An error has occurred while saving your changes.{/s}',
        confirmDeleteSingleItem: '{s name=message/confirm_delete_single_item}Delete this article{/s}',
        confirmDeleteSingle: '{s name=message/confirm_delete_single}Are you sure you want to delete this article? ([0]){/s}',
        deleteSingleItemSuccess: '{s name=message/confirm_delete_single_success}The article has been deleted successfully.{/s}',
        deleteSingleItemError: '{s name=message/confirm_delete_single_error}An error has occurred while deleting the selected article: {/s}',
		growlMessage: '{s name=window/main_title}{/s}'
    },

    /**
     * Creates the necessary event listener for this
     * specific controller and opens a new Ext.window.Window
     * to display the sub-application
     *
     * @return void
     */
    init:function () {
        var me = this;

        me.control({
            'product_feed-feed-list': {
                deleteColumn: me.onDeleteSingleItem,
                editColumn: me.onEditItem,
                duplicateColumn: me.onDuplicateItem,
                executeFeed: me.onExecuteFeed
            },
            'product_feed-feed-list button[action=add]':{
                click:me.onCreateFeed
            },
            'product_feed-feed-tab-supplier textfield[action=searchSupplier]':{
                change:me.onSearchSupplier
            },
            'product_feed-feed-tab-article textfield[action=searchArticles]':{
                change:me.onSearchArticle
            },
            'product_feed-feed-window button[action=save]':{
                click:me.onSave
            },
            'product_feed-feed-window':{
                scope:me,
                beforeclose:me.onBeforeCloseWindow
            },
            'product_feed-feed-tab-category treepanel':{
                afterrender: me.onCategoryTreeAfterRender
            }
        });
    },
    
    /**
     * Opens the Ext.window.window which displays
     * the Ext.form.Panel to create a new feed
     *
     * @param [object] store - the feed detail store
     * @return void
     */
    onCreateFeed:function () {

        var me = this,
            model = Ext.create('Shopware.apps.ProductFeed.model.Detail');

        //reset the detail Record
        me.detailRecord = null;

        model.set("hash",me.createRandomHash());
        me.getView('feed.Window').create({
            record: model,
            supplierStore: me.subApplication.supplierStore,
            shopStore: me.subApplication.shopStore,
            articleStore: me.subApplication.articleStore,
            availableCategoriesTree: me.subApplication.availableCategoriesTree,
            comboTreeCategoryStore: me.subApplication.comboTreeCategoryStore
        });

    },
    /**
     * Opens the Ext.window.window which displays
     * the Ext.form.Panel to modify an existing feed
     *
     * @param [object]  view - The view. Is needed to get the right f
     * @param [object]  item - The row which is affected
     * @param [integer] rowIndex - The row number
     * @return void
     */
    onEditItem:function (view, rowIndex) {
        var me = this,
            store = me.subApplication.detailStore,
            record = me.subApplication.listStore.getAt(rowIndex);

        store.getProxy().extraParams = {
            feedId:record.get("id")
        };
        store.load({
            scope:this,
            callback:function (records) {
                me.detailRecord = records[0];
                me.getView('feed.Window').create({
                    record: me.detailRecord,
                    supplierStore: me.subApplication.supplierStore,
                    shopStore: me.subApplication.shopStore,
                    articleStore: me.subApplication.articleStore,
                    availableCategoriesTree: me.subApplication.availableCategoriesTree,
                    comboTreeCategoryStore: me.subApplication.comboTreeCategoryStore
                });
            }
        });
    },

    /**
     * Executes the Link to the Product Feed
     *
     * @param [object]  view - The view. Is needed to get the right f
     * @param [object]  item - The row which is affected
     * @param [integer] rowIndex - The row number
     * @return void
     */
    onExecuteFeed:function (view, rowIndex) {
        var me = this,
            record = me.getStore('List').getAt(rowIndex);
            window.open(
                    '{url controller=export}' + '/index/'+record.get('fileName')
                            +'?feedID='+record.get('id')
                            +'&hash='+ record.get('hash')
            );
    },

    /**
     * Opens the Ext.window.window which displays
     * the Ext.form.Panel to duplicate an existing feed
     *
     * @param [object]  view - The view. Is needed to get the right f
     * @param [object]  item - The row which is affected
     * @param [integer] rowIndex - The row number
     * @return void
     */
    onDuplicateItem:function (view, rowIndex) {
        var me = this,
                store = me.subApplication.detailStore,
                record = me.subApplication.listStore.getAt(rowIndex);

        store.getProxy().extraParams = {
            feedId:record.get("id")
        };
        store.load({
            scope:this,
            callback:function (records) {
                me.detailRecord = records[0];
                me.detailRecord.set("hash",me.createRandomHash());
                me.detailRecord.data.id = '';
                //reset the id
                store.getProxy().extraParams = {};
                me.getView('feed.Window').create({
                    record: me.detailRecord,
                    supplierStore: me.subApplication.supplierStore,
                    shopStore: me.subApplication.shopStore,
                    articleStore: me.subApplication.articleStore,
                    availableCategoriesTree: me.subApplication.availableCategoriesTree,
                    comboTreeCategoryStore: me.subApplication.comboTreeCategoryStore
                });
            }
        });
    },
    /**
     * Event listener which deletes a single feed based on the passed
     * grid (e.g. the grid store) and the row index
     *
     * @param [object] grid - The grid on which the event has been fired
     * @param [integer] rowIndex - Position of the event
     * @return void
     */
    onDeleteSingleItem:function (grid, rowIndex) {
        var me = this,
            store = grid.getStore(),
            record = store.getAt(rowIndex);
        // we do not just delete - we are polite and ask the user if he is sure.
        Ext.MessageBox.confirm(
            me.snippets.confirmDeleteSingleItem,
            Ext.String.format(me.snippets.confirmDeleteSingle, record.get('name')), function (response) {
            if (response !== 'yes') {
                return false;
            }
            store.remove(record);
            store.save({
                callback: function (self,operation) {
                    if (operation.success) {
                        store.load();
                        Shopware.Notification.createGrowlMessage('',me.snippets.deleteSingleItemSuccess, me.snippets.growlMessage);
                        me.getProductFeedWindow().destroy();
                    } else {
                        Shopware.Notification.createGrowlMessage('',me.snippets.deleteSingleItemError, me.snippets.growlMessage);
                    }
                }
            });
        });

    },

    /**
     * Filters the tab supplier grid with the passed search value to find the right supplier
     *
     * @param field
     * @param value
     * @return void
     */
    onSearchSupplier:function (field, value) {
        var me = this,
            searchString = Ext.String.trim(value),
            store = me.getStore('Supplier');
        store.filters.clear();
        store.filter('filter', searchString);
    },

    /**
     * Filters the tab article grid with the passed search value to find the right articles
     *
     * @param field
     * @param value
     * @return void
     */
    onSearchArticle:function (field, value) {
        var me = this,
            searchString = Ext.String.trim(value),
            store = me.getStore('Article');
        store.filters.clear();
        store.filter('filter', searchString);
    },

    
    /**
     * Event listener method which will be fired when the user
     * clicks the "save"-button in the edit-window.
     *
     * @event click
     * @param [object] btn - pressed Ext.button.Button
     * @return void
     */
    onSave: function (btn) {
        var me = this,
            formPanel = me.getProductFeedWindow().formPanel,
            form = formPanel.getForm(),
            listStore = me.subApplication.getStore('List'),
            record = form.getRecord();

        //check if all required fields are valid
        if (!form.isValid()) {
            return;
        }
        form.updateRecord(record);

        var tree = me.getCategoryTree(),
        checked = tree.getChecked(),
        categories = record.getCategories();

        categories.removeAll();
        categories.add(checked);

        record.save({
            callback: function (self,operation) {
                if (operation.success) {
                    listStore.load();
                    Shopware.Notification.createGrowlMessage('',me.snippets.onSaveChangesSuccess, me.snippets.growlMessage);
                    me.getProductFeedWindow().destroy();
                } else {
                    Shopware.Notification.createGrowlMessage('',me.snippets.onSaveChangesError, me.snippets.growlMessage);
                }
            }
        });
    },
    /**
     * Detects and expand all previous selected categories
     *
     * @param tree
     * @return void
     */
    onCategoryTreeAfterRender : function(tree) {
        var me = this,
            ids = [];
        if(me.detailRecord) {
            var lockedCategoriesStore =  me.detailRecord.getCategories();
            lockedCategoriesStore.each(function(element) {
                ids.push(element.get('id'));
            });
        }
        else {
            ids.push('1');
        }
        //expand tree
        Ext.Ajax.request({
            url:'{url controller="Category" action="getIdPath"}',
            params: { 'categoryIds[]': ids },
            success: function(result){
                if(!result.responseText) {
                    return ;
                }
                result =  Ext.JSON.decode(result.responseText);
                for(var i = 0; i < result.data.length; i++ ) {
                    tree.expandPath(result.data[i]);
                }
            }
        });
    },

    /**
     * just reloads the grid to keep it up to date after closing the detail window
     *
     * @event click
     * @param [object] btn - pressed Ext.button.Button
     * @return void
     */
    onBeforeCloseWindow:function () {
        this.getStore("List").load();
    },

    /**
     * Creates a Random Hash for the unique link
     * 
     * @return string
     */
    createRandomHash:function () {
        var chars = "abcdef1234567890",
            pass = "";
        for (var x = 0; x < 32; x++) {
            pass += chars.charAt(Math.floor((Math.random()*chars.length)));
        }
        return pass;
    }
});
//{/block}