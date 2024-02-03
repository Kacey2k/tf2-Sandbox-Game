// Clean up the DS list when the NPC is destroyed
if (ds_exists(wepOwnersList, ds_type_list)) {
    ds_list_destroy(wepOwnersList);
}
