if (ds_exists(wepOwnersList, ds_type_list)) {
    ds_list_destroy(wepOwnersList);
}

if (ds_exists(pocketlist, ds_type_list)) {
	ds_list_destroy(pocketlist);
}