package mx.controls.dataGridClasses
{
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import flash.display.Sprite;
   
   public class DataGridHeaderBase extends UIComponent
   {
       
      
      mx_internal var headerItemsChanged:Boolean = false;
      
      mx_internal var selectionLayer:Sprite;
      
      mx_internal var visibleColumns:Array;
      
      public function DataGridHeaderBase()
      {
         super();
      }
      
      mx_internal function clearSelectionLayer() : void
      {
      }
   }
}
