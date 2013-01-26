
var agg, ytot = 0;

if (argument_count == 1) {
    agg = argument[0];
} else {
    show_error("Improper number of arguments to ForceAggregator_Add_Y", true);
}

for (var i = 0; i < ds_list_size(agg.force_list); ++i) {
    ytot += ds_list_find_value(agg.force_list, i).y;
}

return ytot;
