package haxe.ui.backend.hxwidgets.behaviours;

import haxe.ui.behaviours.DataBehaviour;
import haxe.ui.components.DropDown;
import haxe.ui.data.DataSource;
import haxe.ui.util.Variant;
import hx.widgets.Choice;

@:access(haxe.ui.backend.ComponentBase)
class ChoiceDataSource extends DataBehaviour {
    public override function validateData() {
        if (_component.window == null) {
            return;
        }

        var choice:Choice = cast(_component.window, Choice);
        choice.clear();
        
        if (_value.isNull) {
            return;
        }
        
        var ds:DataSource<Dynamic> = _value;
        for (n in 0...ds.size) {
            var item = ds.get(n);
            if (item.value != null) {
                choice.append(item.value);
            } else {
                choice.append(Std.string(item));
            }
        }

        var dropDown:DropDown = cast(_component, DropDown);
        choice.selection = dropDown.selectedIndex;
    }
}