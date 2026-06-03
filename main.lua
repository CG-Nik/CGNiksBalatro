CGNik = SMODS.current_mod
CGNik.path = SMODS.current_mod.path
CGNik.config = SMODS.current_mod.config

local folders = {
    {
        "misc/",
        {
            "miscMain",
            "menuCards",
            "attributes"
        }
    },
    {
        "items/",
        {
            "jokers",
            "legendaryJokers",
            "decks",
            "modifiers",
            "luaCards",
            "consumables",
            "boosters"
        }
    }
}

if JokerDisplay then
    table.insert(folders[1][2],"jokerDisplay")
end

if CardSleeves then
    table.insert(folders[2][2],"sleeves")
end

for i,v in ipairs(folders) do
    local folderPath = v[1]
    local files = v[2]
    for i,v in ipairs(files) do
        assert(SMODS.load_file(folderPath..v..".lua"))()
    end
end