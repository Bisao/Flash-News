package mx.controls
{
   import mx.core.IDataRenderer;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.mx_internal;
   import mx.controls.listClasses.BaseListData;
   import flash.events.Event;
   import flash.display.DisplayObject;
   import mx.events.FlexEvent;
   
   use namespace mx_internal;
   
   public class Image extends SWFLoader implements IDataRenderer, IDropInListItemRenderer, IListItemRenderer
   {
      
      mx_internal static const VERSION:String = "3.6.0.21751";
       
      
      private var _listData:BaseListData;
      
      private var sourceSet:Boolean;
      
      private var _data:Object;
      
      private var settingBrokenImage:Boolean;
      
      private var makeContentVisible:Boolean = false;
      
      public function Image()
      {
         super();
         tabChildren = false;
         tabEnabled = true;
         showInAutomationHierarchy = true;
      }
      
      override mx_internal function contentLoaderInfo_completeEventHandler(param1:Event) : void
      {
         var _loc2_:DisplayObject = DisplayObject(param1.target.loader);
         super.contentLoaderInfo_completeEventHandler(param1);
         _loc2_.visible = false;
         makeContentVisible = true;
         invalidateDisplayList();
      }
      
      [Bindable("dataChange")]
      public function get listData() : BaseListData
      {
         return _listData;
      }
      
      public function set listData(param1:BaseListData) : void
      {
         _listData = param1;
      }
      
      [Bindable("dataChange")]
      public function get data() : Object
      {
         return _data;
      }
      
      public function set data(param1:Object) : void
      {
         _data = param1;
         if(!sourceSet)
         {
            source = !!listData?listData.label:data;
            sourceSet = false;
         }
         dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
      }
      
      override public function invalidateSize() : void
      {
         if(data && settingBrokenImage)
         {
            return;
         }
         super.invalidateSize();
      }
      
      [Bindable("sourceChanged")]
      override public function set source(param1:Object) : void
      {
         settingBrokenImage = param1 == getStyle("brokenImageSkin");
         sourceSet = !settingBrokenImage;
         super.source = param1;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(makeContentVisible && contentHolder)
         {
            contentHolder.visible = true;
            makeContentVisible = false;
         }
      }
   }
}
