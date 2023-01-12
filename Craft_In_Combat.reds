// Meeflak
// Version 1.1
// Last update - Readability changes

// Craft_In_Combat

// This mod allows you to craft while in combat. the ammo system is restrictive on builds that require
// alot of ammo to use properly.
// Problem Solver and Soverign are good examples of guns that use alot of ammo and have no way to 
// replenish ammo stocks in combat.

// Because the game allows playstyes like this but punishes them through limited ammo carrying capacity, 
// I thought it may be helpful to be able to craft ammo while in combat to alleviate the issue. 

@replaceMethod(MenuHubGameController)
  private final func InitMenusData() -> Void {
    let emptyData: MenuData;
    let psmBlackboard: ref<IBlackboard> = this.m_player.GetPlayerStateMachineBlackboard();
    
    this.m_menusData = MenuDataBuilder.Make()
    .Add(HubMenuItems.Crafting, HubMenuItems.None, n"crafting_main", n"ico_cafting", n"Gameplay-RPG-Skills-CraftingName")
    .Add(HubMenuItems.Inventory, HubMenuItems.None, n"inventory_screen", n"ico_inventory", n"UI-PanelNames-INVENTORY")
    .Add(HubMenuItems.Map, HubMenuItems.None, n"world_map", n"ico_map", n"UI-PanelNames-MAP", null, Cast<Bool>(GameInstance.GetQuestsSystem(this.m_player.GetGame()).GetFact(n"map_blocked")))
    .Add(HubMenuItems.Character, HubMenuItems.None, n"perks_main", n"ico_character", n"UI-PanelNames-CHARACTER")
    .Add(HubMenuItems.Journal, HubMenuItems.None, n"quest_log", n"ico_journal", n"UI-PanelNames-JOURNAL")
    .Add(HubMenuItems.Stats, HubMenuItems.Character, n"temp_stats", n"ico_stats_hub", n"UI-PanelNames-STATS")
    .Add(HubMenuItems.Phone, HubMenuItems.Journal, n"phone", n"ico_phone", n"UI-PanelNames-PHONE")
    .Add(HubMenuItems.Codex, HubMenuItems.Journal, n"codex", n"ico_data", n"UI-PanelNames-CODEX", CodexUserData.Make(CodexDataSource.Codex))
    .Add(HubMenuItems.Tarot, HubMenuItems.Journal, n"tarot_main", n"ico_tarot_hub", n"UI-PanelNames-TAROT", null, !Cast<Bool>(GameInstance.GetQuestsSystem(this.m_player.GetGame()).GetFact(n"q101_done")))
    .Add(HubMenuItems.Shards, HubMenuItems.Journal, n"shards", n"ico_shards_hub", n"UI-PanelNames-SHARDS", CodexUserData.Make(CodexDataSource.Onscreen))
    .Add(HubMenuItems.Backpack, HubMenuItems.Inventory, n"backpack", n"ico_backpack", n"UI-PanelNames-BACKPACK")
    .Add(HubMenuItems.Cyberware, HubMenuItems.Inventory, n"cyberware_equip", n"ico_cyberware", n"UI-PanelNames-CYBERWARE");
    
    this.m_menuCtrl.SetMenusData(this.m_menusData, this.m_dataManager.GetAttributePoints(), this.m_dataManager.GetPerkPoints());
    emptyData = this.m_menusData.GetData(EnumInt(HubMenuItems.Inventory));
    this.m_subMenuCtrl.AddMenus(emptyData, this.m_menusData.GetMainMenus());
    this.m_subMenuCtrl.SetMenusData(this.m_menusData);
  }
