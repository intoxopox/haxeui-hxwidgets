package haxe.ui.backend.hxwidgets.behaviours;

import haxe.ui.behaviours.DataBehaviour;
import haxe.ui.components.DropDown;
import haxe.ui.containers.ListView;
import haxe.ui.core.IDataComponent;

class DataComponentSelectedItem extends DataBehaviour {
    public override function getDynamic():Dynamic {
        if (Std.is(_component, IDataComponent) == false) {
            return false;
        }
        
        var dataComponent:IDataComponent = cast(_component, IDataComponent);
        var ds = dataComponent.dataSource;
        var selectedItem = null;
        if (Std.is(_component, DropDown)) {
            var dropDown = cast(_component, DropDown);
            if (dropDown.selectedIndex > -1) {
                selectedItem = ds.get(dropDown.selectedIndex);
            }
        } else if (Std.is(_component, ListView)) {
            var listview = cast(_component, ListView);
            if (listview.selectedIndex > -1) {
                selectedItem = ds.get(listview.selectedIndex);
            }
        }
        
        return selectedItem;
    }
}